<%@ Page Title="SmartCat | Error" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <div class="page-title">
            <div class="wrapper">
                <h1>Error page</h1>
            </div>
        </div>
        
        <div class="content error-page">
            <div class="wrapper">
                <div class="main">
                  	<div class="rte-content">
						<h3>Page not found</h3>
						<p>This might be because:</p>
						<ul class="bulleted-list">
							<li>
								You have typed the web address incorrectly 
							</li>
							<li>
								The page you were looking for may have been moved, updated or deleted 
							</li>
						</ul>
						<p>Please try the following options instead:</p>
						<ul class="bulleted-list">
							<li>
								Use our search above to find what you are looking for 
							</li>
							<li>
								Go to our <a href="/">homepage</a>
							</li>
						</ul>
					</div>		                    
                </div>                
            </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
	<script type="text/javascript" src="assets/scripts/pages/error.js"></script>
</asp:Content>