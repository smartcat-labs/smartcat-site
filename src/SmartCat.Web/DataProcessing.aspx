<%@ Page Title="SmartCat | Services | Data processing" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <div class="page-title">
            <div class="wrapper">
                <h1>services</h1>
            </div>
        </div>
        
        <div class="content services-detail-page">
            <div class="wrapper">
                <div class="main centered">
                    <div class="title">						
                        <h2><img src="assets/img/content/data-processing.png" alt="" class="shape" />Data processing</h2>
                        <a href="Services.aspx" class="go-back hidden-on-mobile">BACK</a>
                    </div>
                    <div class="rte-content">
                        <p>
                            It is hard to think of an enterprise application these days without the need for integration, both internally among many small services and externally with public APIs or 3rd party services. With the emergence of IoT and public APIs this has become a common requirement. For successful integration, data needs to be processed and this needs to be done fast, fault tolerant, usually in async and non blocking matter (?).  You need to fill your application with a lot of data for release, attach to public API, convert data to your data model and you are ready to go. This goes for the other end of integration, exposing data to outside world, since this data can rarely be exposed without preprocessing first. We have experience with a huge variety of public APIs, protocols and tools for data processing (messaging systems, stream computing systems, batch processing tools and reactive technologies).
                        </p>
                        <p>
                            In order to leverage truly distributed systems you need to have a <strong>messaging system</strong> that enables implementing many microservices which communicate with each other through asynchronous non blocking messages (we have experience with kafka, rabbitmq, zeromq and mosquitto). Storing data alone is not enough, data usually needs to be processed before writing and reading. For this problem, we use <strong>stream computing systems</strong> which are able to process large amounts of data in parallel before the data is stored (we have experience with apache spark and apache storm). <strong>Batch processing</strong> is always needed when you work with big data, since some data sets are so large they cannot be processed in real-time. Data must be migrated from different data sources and this needs to be done in parallel and in background (we have experience with apache spark and spring batch for batch processing needs). In order to build a highly concurrent and distributed message-driven system with high throughput and low latency, we are using <strong>reactive technology</strong> (we have experience with akka).
                        </p>
                    </div>
                    <section class="full-width what-we-do-block">
                        <h3>Other services</h3>
                        <div class="one-third">
                            <div class="romb-wrap">
                                <div class="top romb">
                                    <div class="box-title">
                                        <h4>Data storage</h4>
                                    </div>
                                    <div class="img-wrap">
                                        <a href="DataStorage.aspx"><img src="assets/img/content/data-storage-white.png" alt="" class="icon-img"/></a>
                                    </div>
                                </div>
                            </div>
                            <div class="text">
                                <h2><a href="DataStorage.aspx">Data storage</a></h2>
                                <p>
                                    We are way past the time when you had to choose a data storage provider and put all data in it without worrying about use cases of specific data models. We are strong believers... <a href="DataStorage.aspx" class="ico arrow-more hidden-on-mobile"></a>
                                </p>
                                <a href="DataStorage.aspx" class="btn show-on-mobile">read more</a>
                            </div>
                        </div>
                        <div class="one-third right-aligned">
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

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
	
</asp:Content>