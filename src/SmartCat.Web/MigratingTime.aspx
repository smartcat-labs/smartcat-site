<%@ Page Title="SmartCat | Migrating time series data from MySql to Cassandra" Language="C#" MasterPageFile="Site.master" %>

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
                        <h2>Migrating time series data from MySql to Cassandra</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">22/06/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/migration-time-series_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            MySql is still widely used in application development as a stable, fairly performant and reliable relational database. People tend to use languages, technologies and tools they feel most comfortable with which is expected. We have got to the point where we generate more data daily than we can store or process, not to mention getting valuable information from it. I have worked on a project for one client where they had been storing time series data into MySql and after a year or two their database started to choke and indexing was falling apart. What's even worse they didn't even use that data properly but just stored it and displayed it with a couple of different queries.
                        </p>
                        <p>
                            The client’s requirement was to have better performance than it already was, with the ability to continue storing their event data. The problem with MySql was that they were getting web request timeouts before retrieving data from database. Queries were not complex at all but the sheer amount of data was too much for MySql. We had a competition with another company that went with Hadoop and we were going to measure up against them. Knowing that Hadoop didn’t have the speed that Cassandra has, this was no contest. On the other hand, Hadoop platform had more functionalities besides storage and would provide us with a way to analyze stored data but we had our eyes on Spark for that.
                        </p>
                        <p>
                            The first step was to define all the ways we need to query data in order to create a suitable data model. This is a crucial step with any database and especially with Cassandra because it has a query based data model.
                        </p>
                        <p>
                            After a few sessions together with engineers with domain knowledge we got to the point where all queries were covered and data model looked good. After initial implementation and testing, we had to make some minor changes to the data model to get the best performance possible. One of the issues when migrating from Cassandra is that the request timeout is probably much less by default than the database you are coming from. In Cassandra the default is 10 seconds and we opted for keeping that value. It sounds like a lot, but for some heavy queries MySql it took up to a minute or more. Since our events have a lot of information and tend to be bigger than the average time series data, query responses were easily measured in megabytes. Pulling that amount of data from replica nodes, merging it into a response on a coordinator, pushing it over the network and packing it up into application models has to take some time. We weren’t targeting millisecond or even sub millisecond responses but rather staying under that 10 seconds timeout.
                        </p>
                        <p>
                            When implementing our solution, we used all bells and whistles that .net driver has to offer. Starting out with a 5 node cluster, we were able to leverage the parallel execution of partition based queries. There is no benefit in executing parallel queries on the same partition since they will all get executed on the same replica nodes. When executing on different partitions there is a high chance that results will be handled by different nodes thus having the response time of the slowest node.
                        </p>
                        <p>
                            One of the major problems was having query limits while executing parallel queries on multiple partitions. We ended up having some overhead in these queries since you don’t know how many events will get queried from each partition because they are unevenly populated. Investigation proved that these queries made up a small percentage of total queries so we decided to leave it at that. There are different ways of handling this and squeezing more performance but all in all, we were happy with the results.
                        </p>
                        <p>
                            The end result was being able to query events for a one-year timespan with reasonable response time which was not even possible with mysql, and prioritized queries were several times faster than mysql. The benefits of this migration are mainly performance and scaling but we have also enabled the client to execute the analysis of their data which can help them improve their business.
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="BlackboxTesting.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="SettingUpEmbedded.aspx" class="next-post">
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