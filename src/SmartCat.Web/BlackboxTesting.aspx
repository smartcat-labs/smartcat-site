<%@ Page Title="SmartCat | Blackbox testing microservices" Language="C#" MasterPageFile="Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMetaTags" runat="server" >
    <meta property="og:title" content="Blackbox testing microservices" />
    <meta property="og:type" content="blog" />
    <meta property="og:image" content="http://www.smartcat.io/assets/img/content/black-box-testing_detailed.jpg" />
    <meta property="og:url" content="http://www.smartcat.io" />
    <meta property="og:site_name" content="SmartCat" />
</asp:Content>
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
                        <h2>Blackbox testing microservices</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">06/07/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/black-box-testing_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            Microservice architecture is the new normal these days, especially with the growth of distributed systems and need for scalability and fault tolerance. You partition your application in small “two pizza team” services, and they collaborate together to achieve the application goal. This is really nice from an architectural point of view, since development and maintenance are much easier, there is flexibility to change and adopt, domain knowledge is easier to be grasped by new people in teams and many more. But these perks come with a price.
                        </p>
                        <p>
                            The bad part of microservice architecture according to our experience is deployment, monitoring and testing. There are many pieces which are harder to monitor and deploy, since applications consist of many small services, which have integration points, so conventional testing is not enough.
                        </p>
                        <p>
                            In this blog post, we will try to concentrate on testing and monitoring aspect, especially blackbox testing as health check whether the system is doing fine. We will explain why convenient unit and integration testing alone won’t be enough, explain blackbox testing as a concept and give all prerequisites which should be done in order to achieve successful blackbox testing and monitoring. 
                        </p>
                        <h3>Types of tests</h3>
                        <p>
                            In general, when it comes to testing levels, we have unit testing, integration testing, component interface testing and system testing. Unit testing is simply a must, it is the verification that even a smallest piece of code works, and developers gain comfort that the code they produce works as designed alone in isolation. Integration test, on the other hand, should verify that class or piece of code works well with other pieces in the application. Those two levels are widespread and every developer should be familiar with them.  
                        </p>
                        <p>
                            As the system grows in complexity, other two levels start to become more and more important. Component interface testing verifies that data being passed among components in the system is done right and it verifies application flow, apart from simple integration between components. Usually, here the business flow is tested across different components in the system. <strong>Blackbox testing</strong> is a type of component interface testing.
                        </p>
                        <p>
                            At the highest level, we have system testing, which usually verifies non-functional requirements of a system. Each system has them, and we must be sure that the system can support that many users, fail of certain amount of nodes, certain latency etc. For these types of tests, the companies usually build software which deliberately simulate this type of environment and monitor how the system reacts. A good example is netflix Simian Army which is a group of system tests whose goal is to destroy nodes, data centers, regions, add artificial latency and test system performance.
                        </p>
                        <h3>Blackbox testing for microservices</h3>
                        <p>
                            Blackbox testing is a perfect fit for microservices. We try to divide the application into many single purpose modules, and usual business flow needs to touch at least a couple of them to finish the task. We need to be sure that those business flows work as expected. In our application we used spring boot for microservice configuration and spring retry mechanism to orchestrate test execution. There is a problem with latency and async execution of certain parts of the system and retry mechanism with pause in between is a great way to be sure that you have provided enough time for your test to be completed successfully. 
                        </p>
                        <p>
                            We had a couple of prerequisites in order to perform blackbox tests successfully. The first thing that needed to be done was creating a http client, since we needed to trigger our flow and communicate with our tests programmatically. We used jersey http client for that. Then we needed a way to generate data for our tests, so we created microservice whose sole purpose was to generate near production data using a http client. We needed to setup the monitoring and scheduling of those tests, so we configured the main test scheduler to run all tests for 10 minutes each. We saved only the results of the latest run (for now, later we might save all runs so we can audit) and showed results over http in form of json report. This way we can later integrate GUI for monitoring and we can query results with http request.
                        </p>
                        <p>
                            After all this setup, we isolated business flow in our application which was critical to customers and for which we had to be sure that it worked properly. Basically, we have a batch job which is used for import, it starts with ftp file upload, parses that file, generates request to other microservice, and that microservice stores data to DB.  So, here we are testing ftp server microservice, batch microservice, oauth server, gateway server and application which store data. Cleanup is done on the end. What is most important, and where retry mechanism comes as helpful, is the part when you are waiting for the result to be stored. We started with ftp upload and since it can take some time to store data, we needed a mechanism to wait (we did not want to use Thread.sleep) so we created retry with a 30 second pause and maximum 5 attempts to read data, which gave us a lot of window to verify and make sure this flow works. 
                        </p>
                        <p>
                            As for monitoring, if the test fails we place a notification in message queue which can be consumed with anything (currently there is a small service which sends SMS after X failures) and we have integration with rollbar which provides a nice overview of all failures.
                        </p>
                        <h3>Conclusion</h3>
                        <p>
                            Microservice architecture is great for flexibility, it enables you to change small parts of a system without too much risk. Also, it is great for maintenance since parts of a system can be maintained by small teams, which are familiar with all internals of that part down to the smallest details. It is also great for scaling, if there is a bottleneck in some part you can multiply servers. But the problem arises from testing, monitoring and debugging since there are many more components which can produce errors. With that big systems, you must remain in control and the only way to achieve that is through constant tests and good monitoring tools. Blackbox testing with notifications on failure provides that possibility for important business flows.
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="WhyGoDistributed.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="MigratingTime.aspx" class="next-post">
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

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
    
</asp:Content>