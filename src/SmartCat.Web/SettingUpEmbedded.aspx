<%@ Page Title="SmartCat | Setting up embedded cassandra on spring project" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <div class="page-title">
            <div class="wrapper">
                <h1>Blog</h1>
            </div>
        </div>
        
        <div class="content">
            <div class="wrapper o-visible">
                <div class="main article">
                    <div class="title">
                        <h2>Setting up embedded cassandra on spring project</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">27/07/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/setting-up-embedded-cassandra-with-spring.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            When we first started using cassandra, we immediately realized there would be a long period of development and prototyping until we reach the stable repository classes we would use. It was a new technology, client demands were changing constantly (in cassandra you do query based modeling which means our repository classes changed as well) and we needed to build up confidence that we are doing right thing. We needed a tool which will give us fast feedback using production-like database setup without starting server, doing API triggers and checking what had landed in our database.  
                        </p>
                        <p>
                            <a href="https://github.com/jsevellec/cassandra-unit" target="_blank">Cassandra unit</a>  gave us exactly what we needed, which was a java utility test tool providing us with an ability to test drive our repository and schema models according to the requirements. Basically, it starts embedded cassandra before test methods, has the ability to create structure and allows the developer to run cql queries against production-like database without constantly starting the application, and without the need to have full API designed. We have decided to go with Datastax driver, so Cassandra Unit enabled us to explore driver API in TDD manner. We receive the requirement, write the integration test using connected Session to Embedded Cassandra and start implementing until we see it turn green. 
                        </p>
                        <p>
                            Setup in spring project and cleaning up the database between tests took quite an effort. We did this in a couple of steps. First, we created <em>TestCassandraConfiguration</em> which is plain Spring configuration class for active profile tests, and it creates the necessary beans and initializes Embedded Cassandra. The main thing here is to create a Session bean which we can use in other test methods to connect to our database.
                        </p>
<pre class="csharpcode">
 @Bean
    <span class="kwrd">public</span> Session session() throws Exception {
        <span class="kwrd">if</span> (session == <span class="kwrd">null</span>) {
            initialize();
        }

        <span class="kwrd">if</span> (sessionProxy == <span class="kwrd">null</span>) {
            sessionProxy = <span class="kwrd">new</span> SessionProxy(session);
        }

        <span class="kwrd">return</span> sessionProxy;
    }
</pre>
                        <p>
                            For now, we will ignore the <em>SessionProxy</em> thing, which will be explained later. If we do not have Session defined, initialize() method will start Embedded Cassandra, create a cluster and initialize table structure and connect to it. Here is the initialize method as well:
                        </p>
<pre class="csharpcode">
    <span class="kwrd">private</span> <span class="kwrd">void</span> initialize() throws Exception {
        LOGGER.info(<span class="str">"Starting embedded cassandra server"</span>);
        EmbeddedCassandraServerHelper.startEmbeddedCassandra(<span class="str">"another-cassandra.yaml"</span>);

        LOGGER.info(<span class="str">"Connect to embedded db"</span>);
        cluster = Cluster.builder().addContactPoints(contact_points).withPort(port).build();
        session = cluster.connect();

        LOGGER.info(<span class="str">"Initialize keyspace"</span>);
        final CQLDataLoader cqlDataLoader = <span class="kwrd">new</span> CQLDataLoader(session);
        cqlDataLoader.load(<span class="kwrd">new</span> ClassPathCQLDataSet(CQL, <span class="kwrd">false</span>, <span class="kwrd">true</span>, keyspace));
    }
</pre>
                        <p>
                            We created this configuration as DisposableBean implementation which enabled us to use the destroy() method for total cleanup. The complete example with all details of the configuration file [link to file] can be found on our github account, showing how to wire everything up. It is a part of our Spring showcase for <a href="https://github.com/smartcat-labs/cassandra-migration-tool-java" target="_blank">cassanadra schema migration</a> tool we had created. 
                        </p>
                        <p>
                            The second step is creating a listener which can be used on classes which need embedded cassandra. This listener is implementing <em>AbstractTestExecutionListener</em> and is responsible for cleanup between tests. It has <em>afterTestMethod()</em> which is doing cleanup.
                        </p>
<pre class="csharpcode">
@Override
<span class="kwrd">public</span> <span class="kwrd">void</span> afterTestMethod(final TestContext testContext) throws Exception {
    LOGGER.debug(<span class="str">"AfterTest: clean embedded cassandra"</span>);
    final Session session = (Session) TestApplicationContext.getBean(<span class="str">"session"</span>);
    <span class="kwrd">for</span> (final String table : tables(session)) {
        session.execute(String.format(<span class="str">"TRUNCATE %s.%s;"</span>, KEYSPACE, table));
    }
    super.afterTestMethod(testContext);
}
</pre>
                        <p>
                            Nothing special here, for all tables we have in cluster metadata which we are fetching from session we perform truncate, so we can have a clean state before the next test. The complete details of this listener can be seen at [link here]. An important middle step in the communication between listener and configuration class is to create <em>TestApplicationContext</em> which will hold the beans defined in configuration and which can be used to access the Session bean.
                        </p>
                        <p>
                            The last step was loading this listener on each test method, and that was it, we had embedded cassandra working and our Session connected to it injected in all repository classes instead of the production Session which would be created from production code and would be connected to production cassandra cluster.

                        </p>
<pre class="csharpcode">
 @TestExecutionListeners({CassandraTestExecutionListener.<span class="kwrd">class</span>,
     DependencyInjectionTestExecutionListener.<span class="kwrd">class</span>})
  <span class="kwrd">public</span> <span class="kwrd">class</span> SomeRepositoryTest {
      …..
  }</pre>
                        <p>
                            Back to the <em>SessionProxy</em> thing. This was an another tweak we did. With cassandra we used executeAsync() as much as we could; whenever we didn’t need response immediately, we used it. The problem was to test this. First, we took the Thread.sleep() road and added pauses all over our tests to be sure something would be written in order to read and verify it. That slowed our test suite a lot and was not a particular solution since there were no guarantees write will finish in sleep amount of seconds. We stubbed ResultSetFuture which was a result of executeAsync() method on Session and created a proxy on top of Session which would override executeAsync() to work as regular execute. As a result, we got synchronous executions even when our repository method used executeAsync (only in tests of course) which made our life easier while testing. We did not have to worry anymore if the results are written and how long should we pause the execution. Details can also be seen here [link here].
                        </p>
                        <p>
                            To sum it all up. Cassandra is not new to us anymore, but we still like to have repository classes integration tested against production cassandra like environment. Cassandra is known for its schema which evolves, modeling decisions must be revisited occasionally, so this gives us confidence that we can refactor and change. Also, performing tests this way has provided us a lot of insights into driver API much faster because we can now play with API and see the results right away. Last, but not the least, we are starting our backend applications much less often when we are developing database models, which significantly speeds up the development.

                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="MigratingTime.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="LeveragingParallelExecution.aspx" class="next-post">
                            Next post
                            <i></i>
                        </a>
                    </div>
                    <div class="article-footer">
                        <div class="share-box">
                            <span>Share</span>
                            <ul>
                                 <li>
                                    <a href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fsmartcat.io&t=" target="_blank" title="Share on Facebook" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(document.URL) + '&t=' + encodeURIComponent(document.URL)); return false;">FB</a>
                                </li>
                                <li>
                                    <a href="https://twitter.com/intent/tweet?source=http%3A%2F%2Fsmartcat.io&text=:%20http%3A%2F%2Fsmartcat.io" target="_blank" title="Tweet" onclick="window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(document.title) + ':%20'  + encodeURIComponent(document.URL)); return false;">TW</a>
                                </li>
                                <li>
                                    <a href="https://plus.google.com/share?url=http%3A%2F%2Fsmartcat.io" target="_blank" title="Share on Google+" onclick="window.open('https://plus.google.com/share?url=' + encodeURIComponent(document.URL)); return false;">G+</a>
                                </li>
                                <li>
                                    <a href="http://www.linkedin.com/shareArticle?mini=true&url=http%3A%2F%2Fsmartcat.io&title=&summary=&source=http%3A%2F%2Fsmartcat.io" target="_blank" title="Share on LinkedIn" onclick="window.open('http://www.linkedin.com/shareArticle?mini=true&url=' + encodeURIComponent(document.URL) + '&title=' +  encodeURIComponent(document.title)); return false;">IN</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="author-box">
                        <img src="assets/img/content/home-nenad.png"  alt="" class="hidden-on-mobile" />
                        <div class="info">
                            <h4><span>Nenad Bozic</span></h4>
                            <h5>Co-Founder</h5>
                            <p>
                                Craftsman with more than 10 years of experience, when he does backend coding in Java he feels right at home but likes to do short excursions in other technologies like ruby on rails, angularJS, PHP…
                            </p>
                            <div class="bottom">
                                <a href="mailto:nenad.bozic@smartcat.io" class="contact-link">
                                    <i class="ico ico-mail"></i> Contact Nenad
                                </a>
                                <ul class="social-links">
                                    <li>
                                        <a href="https://twitter.com/nenadbozicns" target="_blank" class="twitter"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://github.com/nbozic" target="_blank" class="git"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://rs.linkedin.com/pub/nenad-bozic/32/1b6/b30" target="_blank" class="linked"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="http://stackoverflow.com/users/4617377/nenad-bozic" target="_blank" class="stack"><i class="ico"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <aside class="sidebar">
                    <div class="widget slider">
                        <h3><a href="News.aspx">What's new</a></h3>
                        <div class="flexslider">
                            <ul class="slides">
                                <li>
                                    <div class="text-item">
                                        <div class="romb badge">
                                            <span class="reset-inner">N.</span>
                                        </div>
                                        <h4><a href="OnThisDay.aspx">On this day</a></h4>
                                        <p>
                                            <a href="OnThisDay.aspx">On this day the news that we've decided to open our own company may not be interesting or relevant to many of you reading this, however I assure you that this...</a>
                                        </p>
                                        <span class="author">Bojan Kovac</span>
                                        <span class="date">09/03/15</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="text-item">
                                        <div class="romb badge">
                                            <span class="reset-inner">N.</span>
                                        </div>
                                        <h4><a href="CassandraSummit.aspx">Cassandra summit 2015</a></h4>
                                        <p>
                                            <a href="CassandraSummit.aspx">We are excited for the upcoming Cassandra Summit in San Francisco, the biggest NoSQL conference in the world and epicenter of Cassandra...</a>
                                        </p>
                                        <span class="author">Matija Gobec</span>
                                        <span class="date">30/07/15</span>
                                    </div>
                                </li>
                                <li>
                                    <div class="text-item">
                                        <div class="romb badge">
                                            <span class="reset-inner">N.</span>
                                        </div>
                                        <h4><a href="CodingSerbia.aspx">Coding Serbia</a></h4>
                                        <p>
                                            <a href="CodingSerbia.aspx">We would like to share our excitement with you. This October we will be a part of the 3rd international Coding Serbia conference in Novi Sad as silver...</a>
                                        </p>
                                        <span class="author">Bojan Kovac</span>
                                        <span class="date">05/08/15</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="widget slider">
                        <h3><a href="Team.aspx">Challengers</a></h3>
                        <div class="flexslider challengers">
                            <ul class="slides">
                                <li>
                                    <div class="inner">
                                        <img src="assets/img/content/sidebar-bojan.png">
                                        <div class="author-info">
                                            <h4>Bojan Kovac</h4>
                                            <span>Co-Founder</span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="inner">
                                        <img src="assets/img/content/sidebar-matija.png">
                                        <div class="author-info">
                                            <h4>Matija Gobec</h4>
                                            <span>Co-Founder</span>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="inner">
                                        <img src="assets/img/content/sidebar-nenad.png">
                                        <div class="author-info">
                                            <h4>Nenad Bozic</h4>
                                            <span>Co-Founder</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="widget slider">
                        <h3><a href="Services.aspx">What we do</a></h3>
                        <div class="flexslider small">
                            <ul class="slides">
                                <li>
                                    <div class="center">
                                        <img src="assets/img/content/data-architecture-slider.png">
                                        <h4><a href="Architecture.aspx">Architecture</a></h4>
                                    </div>
                                </li>
                                <li>
                                    <div class="center">
                                        <img src="assets/img/content/data-storage-slider.png">
                                        <h4><a href="DataStorage.aspx">Data storage</a></h4>
                                    </div>
                                </li>
                                <li>
                                    <div class="center">
                                        <img src="assets/img/content/data-analytics-slider.png">
                                        <h4><a href="DataProcessing.aspx">Data processing</a></h4>
                                    </div>
                                </li>
                                <li>
                                    <div class="center">
                                        <img src="assets/img/content/data-analytics-slider.png">
                                        <h4><a href="DataAnalytics.aspx">Data analytics</a></h4>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </aside>
            </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
    
</asp:Content>