<%@ Page Title="SmartCat | Blog" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <div class="page-title">
            <div class="wrapper">
                <h1>Blog</h1>
            </div>
        </div>
        
        <div class="content">
            <div class="wrapper centered">
                <div class="blog-landing">
                    <!-- <div class="filter-wrapper">
                        <div class="item">
                            <select name="" id="">
                                <option value="">Category</option>
                                <option value="">Option 1</option>
                                <option value="">Option 2</option>
                                <option value="">Option 3</option>
                            </select>
                        </div>
                        <div class="item">
                            <div class="search-filter">
                                <input type="text" placeholder="Search" />
                                <a href="javascript:;">Search</a>
                            </div>
                        </div>
                    </div> -->
                    <div class="blog-inner-wrap">
                        <div class="item stamp">
                            <div class="img-wrap">
                                <img src="assets/img/content/leveraging_parallel_execution_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="LeveragingParallelExecution.aspx"><span class="blue-overlay"></span></a>
                                <a href="LeveragingParallelExecution.aspx" class="read-more"><i></i></a>
                                <span class="ribbon"></span>
                            </div>
                            <div class="text hidden-on-mobile">
                                <h3>Leveraging parallel execution</h3>
                                <span class="date">08/08/15</span>
                            </div>
                            <div class="text show-on-mobile">
                                <span class="date">08/08/15</span>
                                <h3>
                                    <a href="LeveragingParallelExecution.aspx">Leveraging parallel execution</a>
                                </h3>
                                <span class="author">
                                    By Matija Gobec
                                </span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="img-wrap">
                                <img src="assets/img/content/setting-up-embedded-cassandra-with-spring_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="SettingUpEmbedded.aspx"><span class="blue-overlay"></span></a>
                                <a href="SettingUpEmbedded.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">23/07/15</span>
                                <h3>
                                    <a href="SettingUpEmbedded.aspx">Setting up embedded cassandra on spring project</a>
                                </h3>
                                <p>
                                    <a href="SettingUpEmbedded.aspx">When we first started using cassandra, we immediately realized there would be a...</a>
                                </p>
                                <span class="author">
                                    By Nenad Bozic
                                </span>
                            </div>
                        </div>
                        <div class="item vertical">
                            <div class="img-wrap">
                                <img src="assets/img/content/migration-time-series_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="MigratingTime.aspx"><span class="blue-overlay"></span></a>
                                <a href="MigratingTime.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">17/07/15</span>
                                <h3>
                                    <a href="MigratingTime.aspx">Migrating time series data from MySql to Cassandra</a>
                                </h3>
                                <p>
                                    <a href="MigratingTime.aspx">MySql is still widely used in application development as a stable, fairly performant...</a>
                                </p>
                                <span class="author">
                                    By Matija Gobec
                                </span>
                            </div>
                        </div>
                        <div class="item right">
                            <div class="img-wrap">
                                <img src="assets/img/content/black-box-testing_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="BlackboxTesting.aspx"><span class="blue-overlay"></span></a>
                                <a href="BlackboxTesting.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">08/07/15</span>
                                <h3>
                                    <a href="BlackboxTesting.aspx">Blackbox testing microservices</a>
                                </h3>
                                <p>
                                    <a href="BlackboxTesting.aspx">Microservice architecture is the new normal these days, especially with the growth of distributed systems...</a>
                                </p>
                                <span class="author">
                                    By Nenad Bozic
                                </span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="img-wrap">
                                <img src="assets/img/content/why-go-distributed_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="WhyGoDistributed.aspx"><span class="blue-overlay"></span></a>
                                <a href="WhyGoDistributed.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">28/06/15</span>
                                <h3>
                                    <a href="WhyGoDistributed.aspx">Why go distributed</a>
                                </h3>
                                <p>
                                    <a href="WhyGoDistributed.aspx">Why go distributed? When talking to other fellow engineers and people in our industry this question appears inevitably. We have had a single...</a>
                                </p>
                                <span class="author">
                                    By Matija Gobec
                                </span>
                            </div>
                        </div>
                        <div class="item vertical">
                            <div class="img-wrap">
                                <img src="assets/img/content/cassandra-use-casses_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="CassandraUsecases.aspx"><span class="blue-overlay"></span></a>
                                <a href="CassandraUsecases.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">15/06/15</span>
                                <h3>
                                    <a href="CassandraUsecases.aspx">Cassandra use cases</a>
                                </h3>
                                <p>
                                    <a href="CassandraUsecases.aspx">Just a couple of years ago, the decisions faced by software architects were quite easy, such as which language to choose... </a>
                                </p>
                                <span class="author">
                                    By Nenad Bozic
                                </span>
                            </div>
                        </div>
                        <div class="item right">
                            <div class="img-wrap">
                                <img src="assets/img/content/why-big-data_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="WhyBigData.aspx"><span class="blue-overlay"></span></a>
                                <a href="WhyBigData.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">18/05/15</span>
                                <h3>
                                    <a href="WhyBigData.aspx">Why Big Data</a>
                                </h3>
                                <p>
                                    <a href="WhyBigData.aspx">We wanted to share why we want to do what we do and why we think this is the future of IT. The number of internet ...</a>
                                </p>
                                <span class="author">
                                    By Nenad Bozic
                                </span>
                            </div>
                        </div>
                        <div class="item right">
                            <div class="img-wrap">
                                <img src="assets/img/content/Craft-conference_teaser.jpg" alt="" />
                                <span class="color-overlay"></span>
                                <a href="CraftConference.aspx"><span class="blue-overlay"></span></a>
                                <a href="CraftConference.aspx" class="read-more"><i></i></a>
                                <span class="arrow"></span>
                            </div>
                            <div class="text">
                                <span class="date">05/05/15</span>
                                <h3>
                                    <a href="CraftConference.aspx">Craft conference 2015</a>
                                </h3>
                                <p>
                                    <a href="CraftConference.aspx">This was our second a craft conference, the place to be if you are connected to IT and want to be a better...</a> 
                                </p>
                                <span class="author">
                                    By Nenad Bozic
                                </span>
                            </div>
                        </div>
                        <div class="item right">
							<div class="img-wrap">
								<img src="assets/img/content/cassandra-migration-tool_teaser.jpg" alt="" />
								<span class="color-overlay"></span>
								<a href="CassandraMigrationTool.aspx"><span class="blue-overlay"></span></a>
								<a href="CassandraMigrationTool.aspx" class="read-more"><i></i></a>
								<span class="arrow"></span>
							</div>
							<div class="text">
								<span class="date">29/04/15</span>
								<h3>
									<a href="CassandraMigrationTool.aspx">Cassandra migration tool</a>
								</h3>
								<p>
									<a href="CassandraMigrationTool.aspx">Developing a product usually means that during the period of development you are going to change requirements and...</a>
								</p>
								<span class="author">
									By Matija Gobec
								</span>
							</div>
						</div>
						<div class="item">
							<div class="img-wrap">
								<img src="assets/img/content/the-perfect-match__teaser.jpg" alt="" />
								<span class="color-overlay"></span>
								<a href="sparkPlusCassandra.aspx"><span class="blue-overlay"></span></a>
								<a href="sparkPlusCassandra.aspx" class="read-more"><i></i></a>
								<span class="arrow"></span>
							</div>
							<div class="text">
								<span class="date">10/04/15</span>
								<h3>
									<a href="sparkPlusCassandra.aspx">Spark + Cassandra: The perfect match</a>
								</h3>
								<p>
									<a href="sparkPlusCassandra.aspx">Hadoop has been the leading platform for distributed data storage and analytics for some time now. It is a solid...</a>
								</p>
								<span class="author">
									By Matija Gobec
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