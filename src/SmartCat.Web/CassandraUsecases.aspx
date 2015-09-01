<%@ Page Title="SmartCat | Cassandra use cases" Language="C#" MasterPageFile="Site.master" %>

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
                        <h2>Cassandra use cases (what cassandra should not be used for)</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">25/05/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/cassandra-use-casses_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            Just a couple of years ago, the decisions faced by software architects were quite easy, such as which language to choose, in which DB to store data, what kind of frontend technology to use etc. Basically you could divide your application into a couple of building blocks, choose the best for each building block and use it throughout the whole application. 
                        </p>
                        <p>
                            Big distributed systems, with huge data flow changed this game, microservices are new normal, and this multiplied problems with technology choices for each microservice. Now you should be a polyglot in every part of the system and choose the  best tool for each use case. But still, the assortment of many technologies in one system comes with a price. Maintenance costs are higher, it is hard to find people which will fit in the team, picking up small details of many technologies is hard so teams usually stay on basic to advanced level of knowledge in chosen technologies. 
                        </p>
                        <h3>Cassandra DB</h3>
                        <p>
                            Cassandra is scalable and distributed partitioned row storage optimized for fast writes. It is an AP database based on CAP theorem with tunable C (tunable consistency). Basically you choose what is more important, availability or partition tolerance, and tune the consistency based on your choice. It is a masterless database, a new node in the cluster can pick up information from any node, which means there is no single point of failure, and database can be scaled horizontally. 
                        </p>
                        <p>
                            As for data modeling, it is important to understand some of the implementation internals. Data is stored in rows which have partition keys, so the right choice of this key is important to build up performance. This is also important for data modeling, since in comparison with relational data modeling data is modeled as it will be read, not written. Basically you should think of queries and model data like that. Data is denormalized, it can exist in multiple columns and each column is optimized for one query. For example if you need to find books by genre, but also by author, you will most likely end up with two columns, one with genre key and other with author key. So, searching by genre would be one disk seek which will pick up the whole column of books partitioned by requested genre. 
                        </p>
                        <h3>Use cases</h3>
                        <p>
                            Designing as explained above makes cassandra a perfect candidate when working with events. They come sequentially and you can store them in one column, sorted by time, and partitioned by data which will be interesting when doing queries. We worked on an event system and that was the main reason why we chose it. Also, you can partition events into time buckets (by day, week, month) and view each time bucket as a new column, which makes the perfect data store for drawing charts. The data is duplicated, and choosing precision in the chart from one week to one month represents one additional disk seek in another column.
                        </p>
                        <p>
                            Since we made a choice based on the event use case we decided to place our master data in cassandra as well. Articles for retail industry were master data which represent a big object with lots of properties (size, color, name, description, barcode, price etc.). At that time, there were no extensive searching requirements (we needed articles only by unique identifier) so we decided to go with cassandra as data store for master data as well.
                        </p>
                        <h3>Problems</h3>
                        <p>
                            Since in cassandra you model data based on queries, the important thing to note is that you must change your data model along the way. When new requirements for querying data appear, the data model must be changed, or you will end up with a wrong or overly complicated data model. We learned that the hard way.
                        </p>
                        <p>
                            The first requirement appeared in relation to syncing with devices, where we needed information about the time of last update for each article and we needed to sync only the changed articles. Since we stored articles based on unique identifiers and updated information on each batch update, we needed a new table. The idea was to have articles by the times of their updates, so you can pass time and get all articles updated since that time. The articles were updated and we needed only the latest update (not the whole history), also we needed to page through that table without duplicates which caused the first problem, we needed to delete the previous entry from that table and keep only the last one. To do that, we needed the time of last update of the changed article and in order to do that we needed to do read before write (famous anti-pattern in cassandra). Doing this on a large scale was slow, time consuming and error prone. For each update we created many tombstones from delete insert and soon afterwards, in big updates we ran into a tombstones limit reached problem. In other words, our data model started to talk to us. Maintaining this monster logic of reading before writing became a nightmare, debugging, adding small stuff, every small step started to hurt. On the bright side, we at least became aware of the data model problem and we pushed the code as is, since this was a startup phase and change would be time consuming.
                        </p>
                        <p>
                            The second requirement really made us drop the whole cassandra article storage, or at least partially. Our web application became overwhelmed with article information and we wanted to give the users a possibility to search, filter and narrow the list. Since articles have lots of attributes, this would provide many possibilities of combining queries (search by color, price, size, narrow search by brand, store etc.). This would be impossible to do in cassandra, since that would mean duplicating articles in many tables, each by single criteria, and do intersections or unions on application level. This has triggered a new research regarding tackling both problems.  
                        </p>
                        <h3>Possible solutions</h3>
                        <p>
                            The second requirement made us lean more to indexing engines, particularly solr and elasticsearch. We were aware that apache spark sql module could solve complicated queries at application level and it was powerful when placed over cassandra, but we did not want to make a relational database of cassandra. Our idea was to use cassandra with a single table as permanent storage and to index articles for searching and syncing requirement. The core of our system is message queue so storing stuff in elasticsearch was just a matter of adding one more subscriber to storing queue. Slowly, data started to be indexed in elasticsearch which gave us searching possibilities in the distributed indexing engine, and we got rest API for free. Also, we could query the articles by their last update, so this solved the first problem as well. Basically, first we find the article, check hash over content of indexed article with hash over content of article which is coming to server, and if it is changed, reindex and update in cassandra. Devices can sync by querying elasticsearch API directly and this is bloody fast.
                        </p>
                        <h3>Conclusion</h3>
                        <p>
                            Cassandra is a great DB but not for everything. It works great with sensor data, time series data and easy reads without too much query combinations. When there is a need to do read before write you are doing something wrong so stop and rethink. With microservices and polyglot being new, normal developers should not be afraid to use multiple databases on projects and to combine master data in one storage with events over that data stored in cassandra where they fit perfectly.
                        </p>
                        <p>
                            Software engineering came to a point where choosing the right technology to do the right job is essential. Instead of huge enterprise solutions which do everything and everything on average the key is to choose small tools which do a perfect job for tasks you need to do. This comes naturally with drawbacks, maintenance is expensive, you cannot find people and introduce them to projects easily, you cannot be an expert in all technologies. But we are witnessing a shift in industry which will facilitate these challenges, where companies turn from big size do-it-all shops to small specialized shops which provide consulting services in smaller areas. We think that the key will be good cooperation between those companies in handling big projects. Do not be afraid to move from your comfort zone and explore new technology, it might be that the tool which solves perfectly the problem you are facing, like elasticsearch in our case, is just around the corner.
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="WhyBigData.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="WhyGoDistributed.aspx" class="next-post">
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