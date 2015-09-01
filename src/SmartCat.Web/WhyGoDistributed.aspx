<%@ Page Title="SmartCat | Why go distributed" Language="C#" MasterPageFile="Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphMetaTags" runat="server" >
    <meta property="og:title" content="Why go distributed" />
    <meta property="og:type" content="blog" />
    <meta property="og:image" content="http://www.smartcat.io/assets/img/content/why-go-distributed_detailed.jpg" />
    <meta property="og:url" content="http://www.smartcat.io/WhyGoDistributed.aspx" />
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
                        <h2>Why go distributed</h2>
                        <a href="Blog.aspx" class="go-back">Back</a>
                        <span class="date">08/06/15</span>
                    </div>
                    <div class="img-wrap">
                        <img src="assets/img/content/why-go-distributed_detailed.jpg" alt="" />
                        <div class="badge romb"><span class="reset-inner">B.</span></div>
                    </div>
                    <div class="rte-content">
                        <p>
                            Why go distributed? When talking to other fellow engineers and people in our industry this question appears inevitably. We have had a single instance application for decades and there have been no problems. Scaling was done by adding another server behind a router and databases would be deployed on SAN for disk drive failure protection and that’s it. It has been doing the job for years, so why change now?
                        </p>
                        <p>
                            Let’s start from the beginning. The number of people in the world hasn’t grown drastically in the past two or three decades, but the number of people connected to the internet has, but that is not the fact that has had the greatest impact. What really changed is the number of devices. A few years ago every third person had a device capable of collecting and sending any kind of data to some service. Now we have at least three of these devices per person. Smartphones are one of the biggest sources of data out there. Each phone generates huge amounts of data and at this point there are around 6 billion of smartphones online. But that’s not all. Today we have smart watches, smart freezers, smart tvs, even the cars are smart. Everything around us is either already connected to the internet or is going to be in the next few years. Don’t get me wrong, I really think that’s an awesome thing. There are quite a few discussions about personal data and privacy and how this will all make it easy for hackers to get our information and gain control over our lives, but looking at the bright side, we will have so much more information to help us improve our everyday life. With so much data going “through the wire” we can run all kinds of analysis and get incredible answers.
                        </p>
                        <p>
                            Now, looking at the question about distributed systems we started with, the answer is shaping up. There is no way a single computer or multiple instances of one can handle and store even a fraction of this huge data flow and execute complex algorithms and maybe even learn along the way. Distributed systems are created out of need and today's technologies are getting better and better at being distributed. When speaking about hardware itself, today we have multicore servers and hundreds of megabytes of ram and a couple of terabytes of storage and it's really amazing, but the problem is that, in today's big data world, we could easily need thousands of cpu cores, terabytes of ram and even petabytes of storage space. This is not something that can be solved by a single server or even multiple instances of it. The solution lies in distributing this data across multiple machines that work in a coordinated system. There is a great line from Randy Shoup from eBay: “If you can’t split it, you can’t scale it”.
                        </p>
                        <p>
                            There are two types of distributed systems by architecture. The first and easier one is master slave configuration and the second one is masterless.
                            In a master slave architecture, there is one computer in the system that executes administrative tasks and coordinates the other computers in the system. This is relatively easy to implement because all the synchronization is centralized and all participants get orders from and report to one leader. The downside is that this is a single point of failure in the system which is supposed to help us solve this issue. There are some mechanisms that overcome this problem like having a spare master with data replication or all the participants in the system voting for one of them to become the new master.
                        </p>
                        <p>
                            In a masterless architecture all the participants are equal and they communicate to all other participants in the system. This leads to easier failure tolerance implementation since nothing is shared but the downside is keeping everything in sync and timely recognition of failures. There is no master to keep an eye on everything so the participants need to talk to each other a lot. Working with both types of systems from a developer's standpoint are both hard to start with. There is so much going on and it’s hard to debug problems on a single computer, not to mention three or more.

                        </p>
                        <p>
                            The easiest way to start with development is by setting up a cluster of 3 of each components in the system. This shouldn’t be a problem with tools that are available today like ansible, vagrant, docker or others. By creating a distributed development environment, it’s much easier to understand how it all works and problems with certain approaches become visible in early phases. The worst thing you can have is simple bugs wreaking havoc on deployed system which you could easily pinpoint and solve during development. This is especially important for masterless distributed systems with loose consistency.
                        </p>
                        <p>
                            The second most important thing is logging. People developing software usually tend to start with development and then add logging along the way or as it becomes necessary. It should be a good practice for any type of development to set up proper logging first, as it’s always hard to add it later. Also, it is a good idea to use one of the online logging services like loggly or rollbar because it’s easy to setup and monitor and makes life much easier.
                        </p>
                        <p>
                            Distributed systems are a great representative of “everything comes at a price”. They solve a lot of impossible cases for a traditional system and bring a lot of gains but at the same time they introduce problems of their own. If you understand what you are doing and setup all the tools and logging properly there is nothing to be afraid of.
                        </p>
                    </div>
                    <div class="article-nav">
                        <a href="CassandraUsecases.aspx" class="prev-post">
                            <i></i>
                            Previus post
                        </a>
                        <a href="BlackboxTesting.aspx" class="next-post">
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