<%@ Page Title="SmartCat | Spark + Cassandra: The perfect match" Language="C#" MasterPageFile="Site.master" %>

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
                        <h2>Spark + Cassandra: The perfect match</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">25/04/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/the-perfect-match_details.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            Hadoop has been the leading platform for distributed data storage and analytics for some time now. It is a solid platform with a feature rich eco system. The base modules are core module Common, distributed file-system HDFS, resource management platform YARN and the much talked-about programming model for data processing MapReduce. There are also numerous packages that were built on top of Hadoop, primarily Pig, Hive and HBase.
                        </p>
                        <p>
                            One of the projects that started as data processing on top of Hadoop is Spark and it’s really been gaining attention since it got open-sourced. What Spark does is that it abstracts data as a distributed data collection called Resilient Distributed Dataset (RDD) and enables us to process that data using functional transformations always resulting in a new immutable RDD. What is different between Spark and Hadoop's MapReduce is that Spark does everything in memory making it much faster but also RAM dependable. Also, Spark is just a data processing framework without a storage engine.
                        </p>
                        <p>
                            In benchmarking HDFS and Cassandra there is a big difference in how the data is distributed and accessed so it does make a big impact on the overall performance. HDFS is generally deployed in a single data center on multiple racks but usually in the same geographical location. This is because of the way how HDFS works and how MapReduce relies on network and disk I/O executing calculations on data stored on disk. On the other hand Cassandra is deployed in a completely distributed fashion and having a cluster spanning across multiple zones and regions is actually preferred.
                        </p>
                        <p>
                            So we have Cassandra which is a completely distributed shared-nothing database and Spark which is also a distributed system working with in-memory data. What’s more interesting is that Spark executes transformations where the data is so the network traffic is used for passing jobs and results. With this in mind, these two technologies make a perfect couple. Both are distributed, both are resilient and both benefit from scaling so why not join the two and even deploy Spark nodes on top of Cassandra nodes.
                        </p>
                        <p>
                            There is a project called spark-cassandra-connector (<a href="https://github.com/datastax/spark-cassandra-connector" target="_blank">https://github.com/datastax/spark-cassandra-connector</a>) which enables these two technologies to work together to get even better results. What it does is that it exposes cassandra tables as RDDs enabling Spark to read from and write to Cassandra and also execute SQL queries. I would like to explain why the last one is really important. First, let me try to explain the problem. Cassandra has a denormalized data model which is query based. Unlike relational databases, there are no JOINs and no GROUP BYs. You cannot query data from two tables with a single query and what is also important you cannot filter data with free-style criteria. This is where one of the Spark modules SparkSQL comes into play. It’s a module for working with structured data and by using the before mentioned spark cassandra connector we can query data from Cassandra in a relational-like way. 
                        </p>
                        <p>
                            Keeping in mind that connector is data location aware, this means that when we query data using SparkSQL, queries will get executed on the node containing data and only results will get passed back. This keeps the network traffic down but the response time as well.
                        </p>
                        <p>
                            How do you start with Cassandra and Spark ? First of all you need a running cassandra instance or cluster, spark and a spark cassandra connector libraries with all of its dependencies. The first step is to create a keyspace and table in cassandra:
                        </p>
<pre class="csharpcode">
CREATE KEYSPACE IF NOT EXISTS testsparkcassandra WITH replication = {<span class="str">'class'</span>: <span class="str">'SimpleStrategy'</span>, <span class="str">'replication_factor'</span>: 1 };
CREATE TABLE IF NOT EXISTS testsparkcassandra.users ( username text PRIMARY KEY, name text, email text, age <span class="kwrd">int</span> );
</pre>
                        <p>
                            Then we need to insert some demo data into that table
                        </p>
<pre class="csharpcode">
INSERT INTO testsparkcassandra.users (username, name, email, age ) VALUES (<span class="str">'test1'</span>, <span class="str">'Test User 1'</span>, <span class="str">'test.user.1@smartcat.io'</span>, 32);
INSERT INTO testsparkcassandra.users (username, name, email, age ) VALUES (<span class="str">'test2'</span>, <span class="str">'Test User 2'</span>, <span class="str">'test.user.2@smartcat.io'</span>, 22);
INSERT INTO testsparkcassandra.users (username, name, email, age ) VALUES (<span class="str">'test3'</span>, <span class="str">'Test User 3'</span>, <span class="str">'test.user.3@smartcat.io'</span>, 12);</pre>
                        <p>
                            Now when we have the data we need to create spark configuration and initialize spark context
                        </p>
<pre class="csharpcode">
val conf = <span class="kwrd">new</span> SparkConf(<span class="kwrd">true</span>)
    .<span class="kwrd">set</span>(<span class="str">"spark.cassandra.connection.host"</span>, <span class="str">"127.0.0.1"</span>)
    .setMaster(SparkMaster)
    .setAppName(SparkAppName)
val sc = <span class="kwrd">new</span> SparkContext(conf)</pre>
                        <p>
                            At this point we initialize spark context and we can get table rdd from cassandra
                        </p>
<pre class="csharpcode">
val usersTable = sc.cassandraTable(<span class="str">"testsparkcassandra"</span>, <span class="str">"users"</span>)</pre>
                        <p>
                            In a typical query scenario we couldn’t query by age because it’s not a part of a partition or clustering key. We could query and explicitly allow filtering but this is a huge performance impact and it is not recommended. On the other hand, we could use secondary indexing but this is also at the cost of performance since cardinality is high. We can solve this problem using spark. As an example, we could execute transformation and get count
                        </p>
<pre class="csharpcode">
<span class="kwrd">case</span> <span class="kwrd">class</span> User(username: String, name: String, email: String, age: Int)
sc.cassandraTable[User](<span class="str">"testsparkcassandra"</span>, <span class="str">"users"</span>).registerAsTable(<span class="str">"users"</span>)
<span class="kwrd">var</span> adults = sql(<span class="str">"SELECT * FROM users WHERE age &gt; 21"</span>)
</pre>
                        <p>
                            This is great but since we are talking about SparkSQL we can also query using SQL statements against the cassandra table like this
                        </p>
<pre class="csharpcode">
<span class="kwrd">case</span> <span class="kwrd">class</span> User(username: String, name: String, email: String, age: Int)
sc.cassandraTable[User](<span class="str">"testsparkcassandra"</span>, <span class="str">"users"</span>).registerAsTable(<span class="str">"users"</span>)
<span class="kwrd">var</span> adults = sql(<span class="str">"SELECT * FROM users WHERE age &gt; 21"</span>)
</pre>                        
                        <p>
                            Now when we execute count the actual query will be executed and we have used SQL syntax to execute query which could not be possible on cassandra. Keep in mind that it is always recommended to execute filtering on the server side so that the least required amount of data is being transferred over network. Selecting only required columns or using correct where clauses does this job pretty well.
                        </p>
                        <p>
                            Spark has really helped in enabling wider audiences of people to execute data analysis and also raised the performance bar really high. In combination with Cassandra, our favourite database, it really makes a great stack for data streaming, processing and analysis. Being distributed helps with scaling and project documentation is really detailed. This is the reason why we put this combo in front and why we can cover a high percentage of use cases with it.
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="CassandraMigrationTool.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="WhyBigData.aspx" class="next-post">
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
                        <!-- <span class="current-coments">
                            <a href="javascript:;">35</a>comments
                        </span> -->
                    </div>
                    
                    <div class="author-box">
                        <img src="assets/img/content/home-matija.png"  alt="" class="hidden-on-mobile" />
                        <div class="info">
                            <h4><span>Matija Gobec</span></h4>
                            <h5>Co-Founder</h5>
                            <p>
                                Polyglot engineer with open minded approach to technologies. Always looking for new challenges and seeking for knowledge.
                            </p>
                            <div class="bottom">
                                <a href="mailto:matija.gobec@smartcat.io" class="contact-link">
                                    <i class="ico ico-mail"></i> Contact Matija
                                </a>
                                <ul class="social-links">
                                    <li>
                                        <a href="https://twitter.com/mad_max0204" target="_blank" class="twitter"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://github.com/mgobec" target="_blank" class="git"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://www.linkedin.com/in/matijagobec" target="_blank" class="linked"><i class="ico"></i></a>
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
                                            On this day the news that we've decided to open our own company may not be interesting or relevant to many of you reading this, however I assure you that this...
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
                                            We are excited for the upcoming Cassandra Summit in San Francisco, the biggest NoSQL conference in the world and epicenter of Cassandra...
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
                                            We would like to share our excitement with you. This October we will be a part of the 3rd international Coding Serbia conference in Novi Sad as silver...
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