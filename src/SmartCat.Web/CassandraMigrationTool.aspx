<%@ Page Title="SmartCat | Cassandra migration tool" Language="C#" MasterPageFile="Site.master" %>

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
                        <h2>Cassandra migration tool</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">20/07/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/cassandra-migration-tool_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            Developing a product usually means that during the period of development you are going to change requirements and technologies especially if it's an RnD type of a project. Cassandra as a database is known for great performance but this performance comes from the fact that data modeling is query based, meaning that it is not that simple to extend functionality as is with a traditional relational database where data model is entity based. We were working on our second RnD project when we felt the need for something that would help us apply changes to schema but keeping the existing data. The early stages of development and prototyping are easy because you can always drop and recreate the database to reflect the new schema but this was not the case since some clients were already testing implemented functionalities and evaluating the system we were working on. This was really crucial for our product because it helped us shape the new functionalities and make changes to the existing ones.
                        </p>
                        <p>
                            The first steps towards schema migration tool made us do a bit of research. There were a few projects that were aimed at solving this issue but none was really what we needed: a lightweight framework that would allow us to make changes to schema and take care of the data. A big bonus would be the ability to execute this tool with different parameters in different stages of deployment. We started our investigation with <strong>Pentaho</strong> with kettle, <strong>Talend</strong> and <strong>Clover ETL</strong>. These projects are using heavy ETL and are generally well supported and have a great community. But it comes at a price of having a huge overhead and complexity with more features than we needed. Also, there were free and paid versions meaning of functionality set differences. The next one was <strong>Ruby cassandra migration</strong> and it was looking great. It was truly lightweight and easy to install using gems but it had some drawbacks. Application logic for calculations and transformations had to be implemented in both ruby and java and we could not benefit from java object mapper.
                        </p>
                        <p>
                            The last one was <strong>Mutagen cassandra</strong> which was a really small framework and built around the similar idea we had in mind but it was a one man repository with no fresh commits and it required Neflix’s astyanax driver which would require some changes before we could use it.
                        </p>
                        <p>
                            We decided to build a simple tool for executing database schema transformations and keep track of schema version in the database itself. This is required if we want to be able to make changes to schema while database is operational and make these changes through the code so that we can test it before running in production. Simple schema changes are easy because cassandra allows adding or removing columns, changing types with some restrictions and similar simple updates but we also had the need to make drastical changes to some tables. Since we were working on a prototype project which was also serving clients at the same time we couldn’t just drop and recreate schema but had to keep all the data. Being able to write schema transformation and execute it in a unit test is something you would want on a live system.
                        </p>
                        <p>
                            The migration tool started as just a runner for migration implementations but then we figured out that there were two stages where we wanted to execute migrations. The first stage is when application code is build and we want to deploy it to the server. In order for the application to run we needed to update the schema. In this step we executed schema type migrations. This is where schema gets changed and everything gets set so that the application can consume data. But there were some cases where after doing updates to schema we needed to handle big amounts of already existing data. For this purpose, we defined data type migrations. This is usually used when we create a new table for the existing application model in order to serve new queries but there is already a certain amount of data in the database. Executing this in the pre-deploy stage would take time and thus keep the application down. We wanted to get the application up and running as soon as possible so this work had to be done afterwards. Executing newly implemented queries wouldn’t return all results until data migration finishes execution but we would still be able to serve requests and handle new incoming data. Here, uptime vs consistency won and application had minimal down time.
                        </p>
                        <p>
                            For future work, we plan to leverage schema updated events from the database so that we are 100% sure that the change has been propagated to all the nodes and there is no need to use any waiting mechanism in the migration implementation. Here is a ticket that solves this <a href="https://datastax-oss.atlassian.net/browse/JAVA-669" target="_blank">https://datastax-oss.atlassian.net/browse/JAVA-669</a>.
                        </p>
                        <p>
                           Of course there is no perfect tool for all possible use cases but this one helped us a lot and made our life much easier through handling constant schema updates on a live prototype system. If this sounds like a viable solution for your problem head out to our github page (<a href="https://github.com/smartcat-labs" target="_blank">https://github.com/smartcat-labs</a>)  and try it out. Please do send us a feedback, report any issues you have or even contribute to the project if you have an idea for improvement. 
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="WhyBigData.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="SparkPlusCassandra.aspx" class="next-post">
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