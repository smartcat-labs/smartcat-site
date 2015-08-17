<%@ Page Title="SmartCat | News" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
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
                                <a href="CodingSerbia.aspx"><span class="blue-overlay"></span></a>
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
                                <a href="CassandraSummit.aspx"><span class="blue-overlay"></span></a>
                                <a href="CassandraSummit.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">03/07/15</span>
                                <h3>
                                    <a href="CassandraSummit.aspx">Cassandra summit 2015</a>
                                </h3>
                                <p>
                                	<a href="CassandraSummit.aspx">
                                    	We are excited for the upcoming Cassandra Summit in San Francisco, the biggest NoSQL conference in the world...
                                	</a>
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
                                <a href="OnThisDay.aspx"><span class="blue-overlay"></span></a>
                                <a href="OnThisDay.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">09/03/15</span>
                                <h3>
                                    <a href="OnThisDay.aspx">On this day</a>
                                </h3>
                                <p>
                                	<a href="OnThisDay.aspx">
                                    	On this day the news that we’ve decided to open our own company may not be interesting or relevant to many of...
                                	</a>
                                </p>
                                <span class="author">
                                    By Bojan Kovac
                                </span>
                            </div>
                        </div>
                        <div class="item right">
                            <div class="img-wrap">
                                <img src="assets/img/content/blog-2.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="WeAreGettingCertified.aspx"><span class="blue-overlay"></span></a>
                                <a href="WeAreGettingCertified.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">26/07/15</span>
                                <h3>
                                    <a href="WeAreGettingCertified.aspx">We're Getting Certified!</a>
                                </h3>
                                <p>
                                	<a href="WeAreGettingCertified.aspx">
                               			We are pleased to announce that SmartCat will be one of the first companies in the world to become officially Cassandra...
                               	 	</a>
                                </p>
                                <span class="author">
                                    By Bojan Kovac
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
    <script type="text/javascript" src="assets/scripts/libs/jquery.stylish-select.min.js"></script>
    <script type="text/javascript" src="assets/scripts/libs/masonry.pkgd.min.js"></script>
    <script type="text/javascript" src="assets/scripts/pages/blog.js"></script>  
</asp:Content>