<%@ Page Title="SmartCat | Services | Architecture" Language="C#" MasterPageFile="Site.master" %>

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
                        <h2><img src="assets/img/content/data-architecture.png" alt="" class="shape" />Architecture</h2>
                        <a href="Services.aspx" class="go-back hidden-on-mobile">BACK</a>
                    </div>
                    <div class="rte-content">
                        <p>
                           This is the most comprehensive service of all. We must truly understand your business before we make any decisions. It all starts with an intake phase, where a workshop is held to help us understand your business and strategy. This knowledge then becomes the guiding light for all future decisions and suggestions. A solution design phase is where we get creative and use prototyping for the proof of concept, before the implementation starts.
                        </p>
                        <p>
                            We are far past the architecture where you had to choose a language and database and start your three layer monolithic application development. We live in a polyglot world where applications look like building blocks where you need to integrate a couple of technologies together to achieve the project goal. We believe in polyglot approach in order to choose the right technology for a specific use, pick appropriate data sources, define how data will be stored, analysed and integrated. If backend system needs to be cross platform done in language with great community support and frontend needs to be interactive, we will go with a combination of java/scala and angularJS, if some data comes from sensors, but we have a true relational account model we will go with a combination of cassandra and relational database of choice. Microservice architecture helps us a lot with this approach since it enables us to wrap different functionalities behind service and define API so we can easily maintain and change if needed. We are proud to say that we have production experience with distributed microservice architecture and we are well aware of potential problems so we are not forcing that architecture because it is hype, we are simply suggesting it where we recognise a need and could benefit from it.
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
                </aside>
            </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
	
</asp:Content>