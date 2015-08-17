<%@ Page Title="SmartCat | Services | Data storage" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <!-- javascript -->

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">window.jQuery || document.write("<script src='assets/scripts/main/jquery-1.8.3.min.js'>\x3C/script>")</script>
    <script type="text/javascript" src="assets/scripts/libs/classie.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/stepsForm.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/jquery.flexslider-min.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/grayscale.js"></script>

    <script type="text/javascript" src="assets/scripts/main/default.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/functions.js"></script>
     <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    
    <div class="page-title">
            <div class="wrapper">
                <h1>services</h1>
            </div>
        </div>
        
        <div class="content services-detail-page">
            <div class="wrapper">
                <div class="main centered">
                    <div class="title">						
                        <h2><img src="assets/img/content/data-storage.png" alt="" class="shape" />Data storage</h2>
                        <a href="Services.aspx" class="go-back hidden-on-mobile">BACK</a>
                    </div>
                    <div class="rte-content">
                        <p>
                            We are way past the time when you had to choose a data storage provider and put all data in it without worrying about use cases of specific data models.  We are strong believers in polyglot persistence, within this level of service we will analyse your use cases and suggest the most appropriate data storage for the specific aspects of your application. We consider data modeling very important because doing it right will make the latter phases of analysis and prediction much easier. Data Storage for huge amounts of data brings along problems with volume, velocity and variety of the incoming data. In order to store information efficiently for fast writes and fast reads and scale right, storage must be fault tolerant and distributed with easy maintenance and deployment. Epic wars between the relational and non-relational world are behind the community, NoSQL vendors are mature enough and production proven. We have experience with the majority of vendors, both in NoSQL and relational world, and we make a choice based on use case. 
                        </p>
                        <p>
                            Indexing engines are an addition to storage when you need to provide a wide variety of data queries. Distributed databases are built for speed and performance but their tradeoff is inability to support complicated relational queries with joins, group by etc. Indexing engines bring this functionality to the system. Indexed data is held in memory and complicated queries are served fast. We have experience with elasticsearch and solr.
                        </p>
                    </div>
                    <section class="full-width what-we-do-block">
                        <h3>Other services</h3>
                        <div class="one-third">
                            <div class="romb-wrap">
                                <div class="top romb">
                                    <div class="box-title">
                                        <h4>Architecture</h4>
                                    </div>
                                    <div class="img-wrap">
                                        <a href="Architecture.aspx"><img src="assets/img/content/data-architecture-white.png" alt="" class="icon-img" /></a>
                                    </div>
                                </div>
                            </div>
                            <div class="text">
                                <h2><a href="Architecture.aspx">Architecture</a></h2>
                                <p>
                                    This is the most comprehensive service of all. We must truly understand your business before we make any decisions. It all starts with an intake phase, where a workshop is held... <a href="Architecture.aspx" class="ico arrow-more hidden-on-mobile"></a>
                                </p>
                                <a href="Architecture.aspx" class="btn show-on-mobile">read more</a>
                            </div>
                        </div>
                        <div class="one-third right-aligned">
                            <div class="romb-wrap">
                                <div class="top romb">
                                    <div class="box-title">
                                        <h4>Data processing</h4>
                                    </div>
                                    <div class="img-wrap">
                                        <a href="DataProcessing.aspx"><img src="assets/img/content/data-processing-white.png" alt="" class="icon-img" /></a>
                                    </div>
                                </div>
                            </div>
                            <div class="text">
                                <h2><a href="DataProcessing.aspx">Data processing</a></h2>
                                <p>
                                    It is hard to think of an enterprise application these days without the need for integration, both internally among many small services and externally with public APIs or 3rd party... <a href="DataProcessing.aspx" class="ico arrow-more hidden-on-mobile"></a>
                                </p>
                                <a href="DataProcessing.aspx" class="btn show-on-mobile">read more</a>
                            </div>
                        </div>
                        <div class="one-third">
                            <div class="romb-wrap">
                                <div class="top romb">
                                    <div class="box-title">
                                        <h4>Data analytics</h4>
                                    </div>
                                    <div class="img-wrap">
                                        <a href="DataAnalytics.aspx"><img src="assets/img/content/data-analytics-white.png" alt="" class="icon-img" /></a>
                                    </div>
                                </div>
                            </div>
                            <div class="text">
                                <h2><a href="DataAnalytics.aspx">Data analytics</a></h2>
                                <p>
                                    Probably the most valuable service since it can directly influence the business with new insights. This is where our team of business analysts and business intelligence...<a href="DataAnalytics.aspx" class="ico arrow-more hidden-on-mobile"></a>
                                </p>
                                <a href="DataAnalytics.aspx" class="btn show-on-mobile">read more</a>
                            </div>
                        </div>
                    </section>
                </div>
                <aside class="sidebar">					
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
                </aside>
            </div>
        </div>

</asp:Content>