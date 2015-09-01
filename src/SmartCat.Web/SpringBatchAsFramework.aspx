<%@ Page Title="SmartCat | Spring batch as framework for system integration" Language="C#" MasterPageFile="Site.master" %>

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
                    <h2>Spring batch as framework for system integration</h2>
                    <a href="Blog.aspx" class="go-back">Back</a>
                    <span class="date">25/08/15</span>
                </div>
                <div class="img-wrap">
                    <img src="assets/img/content/spring-batch_detailed.jpg" alt="" />
                    <div class="badge romb"><span class="reset-inner">B.</span></div>
                </div>
                <div class="rte-content">
                    <p>
                        We had finished up the first set of requirements for some project and obtained a fully working application. It was an application for retail industry which stores article information and it was cloud based, where each company paid for subscription, uploaded data and gained access to all kinds of statistics. There was only one problem, it was hard for customers with a lot of articles to upload them, and it was essential for them to download them in a format their ERP system could handle (usually XML or CSV). We needed a framework which could provide this for us, we needed easy parsing and generating of documents, some kind of scheduling or triggering to start import or export, restartability feature and monitoring of jobs. Since that project was mainly Spring and Java based, we decided to go with Spring Batch. It has met all of our requirements except monitoring but there is a project called Spring Batch Admin which can be used as a web application on top of Spring Batch meta tables and provides good monitoring capabilities.
                    </p>
                    <h3>Spring Batch</h3>
                    <p>
                        <a href="http://projects.spring.io/spring-batch/">Spring batch</a> is a spring tool for executing batch jobs. It has a job configuration which consists of steps. A step can have a reader, one or multiple processors and writer or it can have a tasklet which is basically a single action step with execute method. A job can have various configurations where you can specify chunk processing for a step (how many items you want to process in one go), commit interval (how many items to write in a step), restartability option, maximum number of invocations, job parameters etc. This is the only subset of options, for all possibilities or specific cases, <a href="http://docs.spring.io/spring-batch/trunk/reference/html/index.html">reference documentation</a> should be checked.
                    </p>
                    <p>
                        Spring Batch provides item readers and item writers for most common cases. Use cases where Spring Batch is powerful is reading from file, database, message queue or various lists and writing to mostly the same formats. We had a case where we provided id and wanted to do HTTP request to fetch list to process so we needed to use a custom reader which extended ItemReader and in initialization we fetched list from HTTP endpoint. That way we could give the id as input job parameter and step will fetch list when needed. Each time you restart the job it will try to fetch list so it is isolated.
                    </p>
                    <p>
                        Spring Batch is using database for meta tables for job and step state. Mostly all relational databases can be used, spring batch provides connectors and scripts to create and teardown a schema for tables. You can configure Spring Batch to deal with tables each time the application is started.
                    </p>
                    <p>
                        A good place to check various examples and jobs is <a href="https://github.com/spring-projects/spring-batch/tree/master/spring-batch-samples">github spring batch examples</a> repository.
                    </p>
                    <h3>Spring Batch Admin</h3>
                    <p>
                        <a href="http://docs.spring.io/spring-batch-admin/">Spring Batch Admin</a> is an open source project which provides a web based interface and REST like API for Spring Batch. It provides a nice way to monitor your jobs, trace exceptions which occur during job run, restart jobs, stop jobs or abandon them, upload the whole job configuration or job-specific configuration file. It works as a web application, uses tomcat server, you can customize the port on which it can work and it is gui on top of regular Spring Batch tables in database. It provides visualization of Spring Batch meta tables with a convenient way of controlling jobs.
                    </p>
                    <p>
                        Each job configuration must be placed to <em>META-INF/spring/batch/jobs/</em> as xml, each job should be self contained and must have all dependencies for successful processing. 
                    </p>
                    <h3>Good parts</h3>
                    <p>
                        When you want to work with CSV files, relational database or message queue with minimal configuration you get fully functional job with little or no configuration. There is a great selection of <em>ItemReaders</em> and <em>ItemWriters</em> out of the box shipped with Spring Batch project and its usage is is only a matter of configuration.
                    </p>
                    <p>
                        As the number of jobs starts growing, it gets much easier, since all jobs look alike, you can even create abstract steps and jobs and reuse them across different jobs.
                    </p>
                    <p>
                        Testability support is really great, there is <em>JobLauncherTestUtils</em> which can start jobs in a controlled environment and you can verify the output against the expected one.
                    </p>
                    <p>
                        It has nice scaling options where the master step is creating many threads and giving work to each thread so you can parallelize execution. This is called Partitioning and you can have an aggregator to collect all of the data in the end. This is one way of scaling that we have tried, for more options you can check the <a href="http://docs.spring.io/spring-batch/trunk/reference/html/scalability.html">scaling documentation</a>.
                    </p>
                    <h3>Problems</h3>
                    <p>
                        We wanted to use Java configuration since many examples on internet are XML based, so sometimes it can be hard to find an example of configuration you are trying to implement.
                    </p>
                    <p>
                        When you move out of conventional use cases, you have to pull up your sleeves to make things work. Our input was SOAP server so we needed to create a custom reader which pulled initial data from SOAP server to list.
                    </p>
                    <p>
                        Spring Batch with Spring Boot for multiple jobs is not well documented. We created a parent project which defined a multiple child context for each job and each job had a launcher. Spring Batch examples with Spring Boot are mostly single job examples, so some tweaking is needed to make things work. This <a href="https://github.com/codecentric/spring-boot-starter-batch-web">codecentric starter project</a> helped us a lot in our baby steps. We have explained in <a href="http://stackoverflow.com/questions/30045837/how-to-best-approach-to-use-spring-batch-annotation-or-xml-files/30048830#30048830">this stackoverflow answer</a> how to achieve multiple job configuration.
                    </p>
                    <p>
                        Integration of Spring Batch and Spring Batch Admin with Spring Boot was more problematic than beneficial. Spring Batch Admin works best if you deploy and start jobs through it. We wanted to have our own launchers and use them only for monitoring. <a href="http://stackoverflow.com/questions/29195981/cant-import-properties-after-integrating-spring-batch-admin-into-existed-spring/29196768#29196768">Importing properties</a> and using <a href="http://stackoverflow.com/questions/29272611/spring-batch-admin-integration-in-the-existing-app-with-batch-jobs/29275368#29275368">scheduler</a> are just some of the problems explained in stackoverflow answers. We finally decided to drop the single application approach and separated Spring Batch and Spring Batch Admin applications into two, connected to same meta table. By doing so, we lost the ability to launch jobs through Spring Batch Admin, which we did not need, but we lowered the complexity and moved the monitoring application from the main processing application.
                    </p>
                    <h3>Conclusion</h3>
                    <p>
                        From the initial read of Spring Batch documentation it looks like an easy straightforward framework. It has readers, processors and writers and it basically functions as an input output framework. However, it has a steep learning curve when it comes to custom use cases. There are many possibilities and it is easy to choose the wrong one, kill performance or mess up multithreaded execution. It is a fun framework to work with, great for file parsing and database integration use cases and certainly a tool we would choose again for solving this kind of problems.
                    </p>
                </div>
                <div class="article-nav">
                    <a href="SparkPlusCassandra.aspx" class="prev-post">
                        <i></i>
                        Previus post
                    </a>
                    <a href="LeveragingParallelExecution.aspx" class="next-post">Next post
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
                    <img src="assets/img/content/home-nenad.png" alt="" class="hidden-on-mobile" />
                    <div class="info">
                        <h4><span>Nenad Bozic</span></h4>
                        <h5>Co-Founder</h5>
                        <p>
                            Craftsman with more than 10 years of experience, when he does backend coding in Java he feels right at home but likes to do short excursions in other technologies like ruby on rails, angularJS, PHP…
                        </p>
                        <div class="bottom">
                            <a href="mailto:nenad.bozic@smartcat.io" class="contact-link">
                                <i class="ico ico-mail"></i>Contact Nenad
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
                 <div class="disqus-wrap">
                        <div id="disqus_thread"></div>
                        <script type="text/javascript">
                            /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
                            var disqus_shortname = 'smartcatio'; // required: replace example with your forum shortname
                            
                            /* * * DON'T EDIT BELOW THIS LINE * * */
                            (function() {
                                var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
                                dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
                                (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
                            })();
                        </script>
                        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
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

<asp:Content runat="server" ID="CphAdditionalFooter" ContentPlaceHolderID="cphAdditionalFooter">
</asp:Content>
