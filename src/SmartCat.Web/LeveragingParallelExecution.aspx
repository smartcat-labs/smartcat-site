<%@ Page Title="SmartCat | Leveraging parallel execution" Language="C#" MasterPageFile="Site.master" %>

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
                        <h2>Leveraging parallel execution</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">08/08/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/leveraging_parallel_execution_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            With NoSql databases comes change in physical data modelling. When it comes to truly distributed databases, data model is denormalized and, in case of Cassandra, based on the way we query data. The idea behind this is that each query is going to target only single partition (file) on a node and read will require only single disk seek. Sometimes, there are some cases where we need to query from multiple partitions but there is no need to create a model to support all the required data in a single partition. Cassandra query language (CQL) supports executing queries with an IN clause. This is nice to have but it's usually too much strain on a coordinator node and should be avoided in the long run. On the other hand, there are some cases where we need to query different tables thus executing multiple partition queries but without the possibility to use the IN clause. This is where parallel execution comes to play.
                        </p>
                        <p>
                            Cassandra datastax driver provides a great ability to execute a sequence of queries on multiple nodes and by doing that, leverage the power of a distributed system.
                        </p>
                        <p>
                            Imagine we have a group of people and we need to ask them a set of questions. For each question, there are 3 people in the group that know the answer. Each person knows who are the 3 that know the answer. If we give a list with all the questions to one guy who then needs to find all the people that know the answers in a sequence and then return to us with all the answers it will take some time and that one guy will have to do a lot of work.
                        </p>
                        <p>
                            On the other hand, if we ask each question to a different person in a round robin fashion, then a lot of questions will be answered in parallel and answer bearers will get back to us quicker and in about the same time.
                        </p>
                        <p>
                            When this is translated to Cassandra nodes, the first case scenario would require coordinator node (the one that we give all the questions to) to go around and query other nodes for data and then acquire all the answers, put them in a single dataset and return to us. The second scenario would be to go around the cluster and query each node with the next request in the list. This would give much better results since there are a lot more workers working on getting the requested data from replica node.
                        </p>
                        <p>
                            Here’s one example: <br>
                            Let’s say we have a logger on gates of some stadium entrance. Each gate will track people coming in at some time and distinguish them by their ticket number.
                        </p>
                        <p>
                            Now imagine that this is going on every day and we are keeping all the records throughout the year for each gate. If we know that one gate would hold up a fairly small number of entrance records (10-20k) per year then it’s fine if we keep it in one partition. There are some queries that require us to have this partitioned per gate so that we could also make some analysis easier. Now there could be hundreds of gates per stadium and we want to get all that information for the whole year. Here comes the benefit of parallel queries. So, instead of making coordinator node execute all these queries for each gate for that stadium, we will execute all the queries in parallel. This drastically reduces the response time of the complete query because there is a lot happening in parallel. The driver itself provides the future handle for the result, so when the query is finished, it populates the result and we can collect the data.
                        </p>
                        <p>
                            Instead of querying with the IN clause and putting too much stress on a single node, we are executing multiple queries in a round robin pattern and the stress is distributed across all nodes in the system, but also the possibility to hit replica node is higher. We can instantly get a response by querying data from replica node. In a 20 node cluster with replication factor of 3 there is a 15% chance that the coordinator node will be the replica node. This is not much of a chance but it beats a single node query any time. In a larger scale system with a large number of nodes, this should be solved by using spark and cassandra spark connector which is data aware and all the queries would get executed against nodes holding the data (replica nodes).
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="SettingUpEmbedded.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="CraftConference.aspx" class="next-post">
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
                                        <a href="https://en-gb.facebook.com/nbozicns" target="_blank" class="facebook"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://twitter.com/nenadbozicns" target="_blank" class="twitter"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://github.com/nbozic" target="_blank" class="git"><i class="ico"></i></a>
                                    </li>
                                    <li>
                                        <a href="https://rs.linkedin.com/pub/nenad-bozic/32/1b6/b30" target="_blank" class="linked"><i class="ico"></i></a>
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

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
	
</asp:Content>