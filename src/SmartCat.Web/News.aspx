<%@ Page Title="SmartCat | News" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <!-- javascript -->

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">window.jQuery || document.write("<script src='assets/scripts/main/jquery-1.8.3.min.js'>\x3C/script>")</script>
    <script type="text/javascript" src="assets/scripts/libs/classie.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/stepsForm.js"></script>
    <script type="text/javascript" src="assets/scripts/main/default.js"></script>

    <script type="text/javascript" src="assets/scripts/libs/jquery.stylish-select.min.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/masonry.pkgd.min.js"></script>
    <script type="text/javascript" src="assets/scripts/pages/blog.js"></script>
     <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->    
    
    <div class="page-title">
            <div class="wrapper">
                <h1>News</h1>
            </div>
        </div>
        
        <div class="content">
            <div class="wrapper centered">
                <div class="blog-landing">
                    <div class="blog-inner-wrap">
                        <div class="item stamp">
                            <div class="img-wrap">
                                <img src="assets/img/content/coding_serbia_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <span class="blue-overlay"></span>
                                <a href="CodingSerbia.aspx" class="read-more"><i></i></a>
                                <span class="ribbon"></span>
                            </div>
                            <div class="text hidden-on-mobile">
                                <h3>Coding Serbia</h3>
                                <span class="date">05/08/15</span>
                            </div>
                            <div class="text show-on-mobile">
                                <span class="date">05/08/15</span>
                                <h3>
                                    <a href="CodingSerbia.aspx">Coding Serbia</a>
                                </h3>
                                <span class="author">
                                    By Bojan Kovac
                                </span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="img-wrap">
                                <img src="assets/img/content/cassadra-summit-teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <span class="blue-overlay"></span>
                                <a href="CassandraSummit.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">03/07/15</span>
                                <h3>
                                    <a href="CassandraSummit.aspx">Cassandra summit 2015</a>
                                </h3>
                                <p>
                                    We are excited for the upcoming Cassandra Summit in San Francisco, the biggest NoSQL conference in the world...
                                </p>
                                <span class="author">
                                    By Matija Gobec
                                </span>
                            </div>
                        </div>
                        <div class="item vertical">
                            <div class="img-wrap">
                                <img src="assets/img/content/why-smartcat-teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <span class="blue-overlay"></span>
                                <a href="WhySmartCat.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">24/07/15</span>
                                <h3>
                                    <a href="WhySmartCat.aspx">Why SmartCat?</a>
                                </h3>
                                <p>
                                    The concept of Big Data has intrigued us from the very first online articles describing this new frontier of...
                                </p>
                                <span class="author">
                                    By Nenad Bozic
                                </span>
                            </div>
                        </div>
                        <div class="item right">
                            <div class="img-wrap">
                                <img src="assets/img/content/blog-2.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <span class="blue-overlay"></span>
                                <a href="javascritp:;" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">24/05/15</span>
                                <h3>
                                    <a href="javascript:;">Lorem ipsum dolor sit amet</a>
                                </h3>
                                <p>
                                    Lorem ipsum dolor sit amet, expetenda euripidis cum ad, ex autem epicurei maiestatis mel. In suavitate complectitur sed.
                                </p>
                                <span class="author">
                                    By John Doe
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>