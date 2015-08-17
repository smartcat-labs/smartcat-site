<%@ Page Title="SmartCat | Why Big data" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <!-- javascript -->

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">window.jQuery || document.write("<script src='assets/scripts/main/jquery-1.8.3.min.js'>\x3C/script>")</script>
    <script type="text/javascript" src="assets/scripts/libs/classie.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/stepsForm.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/jquery.flexslider-min.js"></script>

    <script type="text/javascript" src="assets/scripts/main/default.js"></script>

     <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    
    <div class="page-title">
            <div class="wrapper">
                <h1>Blog</h1>
            </div>
        </div>
        
        <div class="content">
            <div class="wrapper o-visible">
                <div class="main article">
                    <div class="title">
                        <h2>Why Big Data </h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">18/05/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/why-big-data_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            We wanted to share why we want to do what we do and why we think this is the future of IT. The number of internet users is constantly growing (3.17 billion up from 2.94 billion last year) and what strikes us even more is the fact that 90% of all data in the world today has been created in the last 2 years only. IoT made the use of data open to everyone, and now there is every little thing built with sensor and sending information. Social network boom made every single application or business stakeholder eager to go viral, and the volume of shared data increases with viral marketing.
                        </p>
                        <p>
                            However, Big Data is more than just data itself. It is a combination of factors that require a new way of collecting, analyzing, visualizing and sharing data. These factors are forcing software companies to re-think the ways in which they manage and offer their data, from new insights to completely new revenue streams. <strong> Bringing right information at the right time to business decision makers is what counts.</strong>
                        </p>
                        <img src="assets/img/content/why-big-data.png" alt="" />
                        <p>
                            There is a nice pyramid which explains the process of collecting data, analysing it and pulling some meaningful facts out of data sets which improve business. During the first stage, business owners are aware that they have big data sets which they are <strong>collecting</strong>, but do not have a clear idea what to do with that information. Here, the challenge is on engineers to build a good architecture which can facilitate 3Vs of big data, velocity, variety and volume. When dealing with big data systems, complexity arises usually from system distribution (many application servers, database servers, microservices etc.). After this phase, when systems keep collecting data for some time, data scientists usually kick in to <strong>analyze</strong> those data sets and figure out the repeated patterns and are important to business owners. The output of this phase is either a report, idea or algorithm which can provide answers to some questions about business which owners are interested in (what products are bought most often on which day, when to do promotions, how to keep orders from distribution centers at a minimum level but hit customer needs). At this point data becomes knowledge. In the last stage after business owners obtain their answers, <strong>prediction</strong> needs to be incorporated to existing software. During that phase, both data scientists and engineers work together to build better software which can alert, learn from patterns, improve processes, visualize and give even more insight. This phase is transforming knowledge into wisdom.
                        </p>
                        <p>
                            From technical perspective, industry is changing a lot. NoSQL databases are not premature anymore, there are systems with multiple storages where relational databases are used for relational stuff in combination with NoSQL (i.e. cassandra for time series data, redis for session, mongo for document storage). Microservices provide an answer for the huge complexity of monolithic systems but incur large costs of maintenance, monitoring, deployment etc.. Devops have become a must, and every developer must know operational stuff. Messaging systems have become popular as a way of communication between many small services. Everything is asynchronous and non-blocking. Because there is a huge volume of data which needs processing, the speed of processing and delay when getting results has become important. The Hadoop way of batch processing is not enough anymore, near real time processing is in demand. Providing both fast and slow but more accurate processing (as lambda architecture is proposing) is something to strive towards. Apache Spark has become a huge player in the field of batch processing because it provides both batch and stream processing.
                        </p>
                        <p>
                            We have realized that industry is changing and we didn’t want to be just a part of that change but  to actively influence the changes through consultation service and our ideas. In order to do that, we must constantly challenge ourselves and that is in the DNA of our company. We like exploring new technologies, we do our homework, research when we have a problem and choose the best tool for the job and learn the good parts from technologies we are not familiar with so we can use them in technologies we are familiar with. Open source is another thing in the DNA of our company. For a long time we have been searching for answers on StackOverflow, waiting for the jira issue to be solved by someone in order to use something the way we wanted, looked at someone else's GitHub example to find the solution we need. We want to give back to the community, to provide answers, patch bugs and issues in technologies in which we believe, provide examples and ideas for some solutions we have come to, fire up discussions based on those ideas and solutions so we can provide even better solutions. 
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="CraftConference.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="CassandraUsecases.aspx" class="next-post">
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
                        <img src="assets/img/content/home-bojan.png"  alt="" class="hidden-on-mobile" />
                        <div class="info">
                            <h4><span>Bojan Kovac</span></h4>
                            <h5>Co-Founder</h5>
                            <p>
                                A computer science graduate with over 10 years of experience managing software projects and product development while leading organizational changes towards operational maturity and efficiency.
                            </p>
                            <div class="bottom">
                                <a href="mailto:bojan.kovac@smartcat.io" class="contact-link">
                                    <i class="ico ico-mail"></i> Contact Bojan
                                </a>
                                <ul class="social-links">
                                    <li>
                                        <a href="https://rs.linkedin.com/in/bojankovac" target="_blank" class="linked"><i class="ico"></i></a>
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
                                        <h4><a href="WhySmartCat.aspx">Why SmartCat?</a></h4>
                                        <p>
                                            The concept of Big Data has intrigued us from the very first online articles describing this new frontier of technology, back in 2007. Imagine if we could know...
                                        </p>
                                        <span class="author">Nenad Bozic</span>
                                        <span class="date">24/07/15</span>
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