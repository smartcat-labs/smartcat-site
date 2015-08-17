<%@ Page Title="SmartCat | Craft conference" Language="C#" MasterPageFile="Site.master" %>

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
                        <h2>Craft conference 2015</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">05/05/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/Craft-conference_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            This was our second a craft conference, the place to be if you are connected to IT and want to be a better professional. The main topic of the conference was the art of craftsmanship. It was held in Budapest at a nice venue called Varkert Bazar which is right below the fortress at the bank of the Danube river, which made coffee breaks feel nice and cozy. 
                        </p>
                        <p>
                            There were 4 tracks, one in an actual tent within the fortress and other in a garage (parking garage adapted for conference talks) on lazy bags. Buzzwords from mostly all talks were microservices, distributed systems, functional programming, big data. Here are some talks which we found to be the most interesting.
                        </p>
                        <h3>Scaling Micro-Services at Gilt - Adrian Trenaman</h3>
                        <p>
                            Glit is a high volume traffic website in USA which has loads in peaks (the promotion is at 12 o'clock so load is expected at that time). The talk was about explaining how they had turned from a huge monolith (ruby on rails + postgresql) to microservice architecture with hundreds of microservices. During their transition period, they built microservices on top of the existing service layer and migrated functionalists gradually until they migrated all and they could replace the old service layer with new microservice. They also talked about testing, and why it had been hard and expensive to have a staging environment. They are performing testing in production, they have microservice both in frontend and backend so when a new feature is developed it is deployed on one application server but it is not visible. Testers know how to navigate to a hidden functionality and test it and when they are confident it is working, they deploy it on other servers with visibility to customers. Here is a <a href="http://www.ustream.tv/recorded/61442163" target="_blank">video</a>.
                        </p>
                        <h3>Building Reliable Distributed Data Systems - Jeremy Edberg (Netflix)</h3>
                        <p>
                            This talk was mainly interesting because of the mentioned tools that are in use in  netflix. The talk also put an emphasis on problems with good monitoring,  <a href="https://github.com/Netflix/Hystrix" target="_blank">Hystrix</a> is a latency and fault tolerance library designed to isolate points of access to remote systems, services and 3rd party libraries, it has nice monitoring capabilities which can be checked in screenshots. <a href="https://github.com/Netflix/SimianArmy" target="_blank">Simian Army</a> represents tools for keeping your cloud operating in top form. Chaos Monkey is a resiliency tool that helps applications tolerate random instance failures. They have tools which randomly destroy nodes, servers and data centers and you can test how your application would react. There is also latency monkey which adds artificial latency to endpoint to simulate load. Here is a <a href="http://www.ustream.tv/recorded/61446224" target="_blank">video</a>.
                        </p>
                        <h3>NoSQL Key Value Stores - the Key to Velocity - Peter Milne (Aerospike)</h3>
                        <p>
                            We did not attend this talk but we spoke with them at company booth. AerospikeDB is a pretty fresh DB on the horizon, they are of course advertised as cassandra killer, just like cassandra was a mongo DB killer. This DB is definitely something worth checking out. It is fast, keeps data in memory (has an option to save to data stores in hybrid mode), data is processed on nodes so you can do aggregations and filtering directly on nodes. This accelerates some application filtering since it filters data on each node and aggregates results when returning to application. We are planning to watch this talk to catch more insight, here is a <a href="http://www.ustream.tv/recorded/61448813" target="_blank">video</a>.
                        </p>
                        <h3>Using Logs To Build a Solid Data Infrastructure - Martin Kleppmann (Linkedin)</h3>
                        <p>
                            A great talk putting emphasis on why you should use append only logs and how you can benefit from them. Essentially, the idea is to place all messages in logs which are append only, and not to mutate data. The log is re-playable, everyone can subscribe to read from it and use that information to sync data. Martin provided an example of how to keep data in DB and elasticsearch without thinking of sync issues. Basically there is a log in which data is written and two workers save that data, one in DB and one indexed in elasticsearch. He talked a lot about <a href="http://kafka.apache.org/" target="_blank">Apache Kafka</a> project, which is a distributed messaging broker built on top of distributed log idea. The nice thing about it is that you can mirror logs, it saves messages on disks, replays the whole log history from disks (so when you add new data source you can replay messages and have the whole history in the new data source). Kafka also enables a lot of prototyping and ideas to be tested, you just mirror your log, attach new subscriber which will, for example, write to elasticsearch and you test against it, if it is ok, use it, if not, just drop the mirror of queues. Here is a <a href="http://www.ustream.tv/recorded/61479591" target="_blank">video</a>. Logical next step was the following talk <strong>How Do You Scale a Logging - Paul Stack (OpenTable)</strong> which also talked about kafka, mistakes they had made and some of take-aways from those mistakes, so you might watch that <a href="http://www.ustream.tv/recorded/61484961" target="_blank">video</a> as well, not that good as Martin Kleppmann but good for kafka experience.
                        </p>
                        <h3>Microservice AntiPatterns - Tammer Saleh (Pivotal)</h3>
                        <p>
                            The last talk we would recommend, Tammer from pivotal, provided a nice overview of <strong>10 things that hurt when you do microservice architecture</strong>, and how to solve them (at least from his perspective). One of the things we liked from this talk is the explanation how to develop server and client at same time. The basic idea is to create an integration client (http client) with all endpoints calls for each language which you plan to support. This is like a contract, which has mock mode and from that point on, both client and server sides can be developed. Client can test and develop against contract (mock response) and server side must be developed to adhere to contract. When server side is ready, mock mode is switched to real mode. This way you can speed up development and provide sort of documentation right away. Here is a <a href="http://www.ustream.tv/recorded/61486500" target="_blank">video</a>.
                        </p>
                        <h3>Food for thought</h3>
                        <p>
                            Microservice architecture is definitely the way to go forward but it is accompanied with its problems (monitoring, testing, deployment). Big data is the next big thing, systems should be built with that in mind (a rule of thumb is <strong>always build for 3</strong>, meaning 3 application servers, 3 nodes, etc.).  Scalability and fault tolerance is a new norm and each system must have the ability to grow and must be resilient to errors
                        </p>
                        <p>
                            In relation to craftsmanship, the speakers reflected on the topic of learning, how hard it is to cope with technology and be good in all things required within a project. In the past, we had only a couple of tools, frameworks, languages which had to be understood in order to do your job well and to finish projects. Now, microservice architecture has enabled an easy usage of different DB, different languages and frameworks, deployment tools, monitoring tools but it is quite hard to follow everything. The idea is to delegate, and implement some sort of microservice architecture in the organization as well. You should have specialized teams in your organization, know just enough to delegate and to manage to remain on top level but provide some features to these micro teams (two pizza teams) to work on them from bottom to top independently and give full control to them regarding the technology and tooling choices.
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="LeveragingParallelExecution.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="CassandraMigrationTool.aspx" class="next-post">
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