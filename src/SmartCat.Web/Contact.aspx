<%@ Page Title="SmartCat | Contact" Language="C#" MasterPageFile="Site.master" %>

<%@ MasterType VirtualPath="Site.master" %>
<script runat="server">

    private void OnContactClick(object sender, EventArgs e)
    {
        Master.OnContactUsClick(sender, e);
        
    }

</script>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
    <script type="text/javascript">
        function whoSelected(ctrl) {
            var info = document.getElementById('info');
            var bk = document.getElementById('bk');
            var mg = document.getElementById('mg');
            var nb = document.getElementById('nb');

            info.classList.remove('active');
            bk.classList.remove('active');
            mg.classList.remove('active');
            nb.classList.remove('active');

            ctrl.classList.add('active');
        }
    </script>

    <div class="page-title">
        <div class="wrapper">
            <h1>CONTACT</h1>
        </div>
    </div>

    <div class="content">
        <div class="wrapper centered">
            <div class="contact-us">
                <ol class="contact-questions">
                    <li>
                        <ol class="main-questions">
                            <li>
                                <span>
                                    <label for="SenderName">*What's your name?</label></span>
                                <div class="contact-info">
                                    <input id="SenderName" name="SenderName" type="text" />
                                </div>
                            </li>
                            <li>
                                <span>
                                    <label for="SenderEmail">*Email?</label></span>
                                <div class="contact-info">
                                    <input id="SenderEmail" name="SenderEmail" type="email" />
                                </div>
                            </li>
                            <li>
                                <span>
                                    <label for="SenderContact">Contact number?</label></span>
                                <div class="contact-info">
                                    <input id="SenderContact" name="SenderContact" type="text" />
                                </div>
                            </li>
                        </ol>
                        <!-- / main-questions -->
                    </li>
                    <li class="contact-who-block">
                        <p>*Who do you want to contact?</p>
                        <div class="contacts-wrapper">
                            <div class="one-contact active" id="info" onclick="whoSelected(this)">
                                <div class="contact-romb-wrap contact-office-img">
                                    <div class="contact-who romb">
                                        <div class="img-wrap">
                                            <img src="assets/img/content/contact-office.png" alt="" class="contact-img" />
                                        </div>
                                    </div>
                                    <div class="contact-who-name hidden-on-mobile">
                                        <p>Our office</p>
                                    </div>
                                </div>
                            </div>
                            <div class="one-contact hidden-on-mobile" id="bk" onclick="whoSelected(this)">
                                <div class="contact-romb-wrap">
                                    <div class="contact-who romb">
                                        <div class="img-wrap">
                                            <img src="assets/img/content/contact-bojan.png" alt="" class="contact-img" />
                                        </div>
                                    </div>
                                    <div class="contact-who-name">
                                        <p>Bojan Kovac, Co-founder</p>
                                    </div>
                                </div>
                            </div>
                            <div class="one-contact hidden-on-mobile" id="mg" onclick="whoSelected(this)">
                                <div class="contact-romb-wrap">
                                    <div class="contact-who romb">
                                        <div class="img-wrap">
                                            <img src="assets/img/content/contact-matija.png" alt="" class="contact-img" />
                                        </div>
                                    </div>
                                    <div class="contact-who-name">
                                        <p>Matija Gobec, Co-founder</p>
                                    </div>
                                </div>
                            </div>
                            <div class="one-contact hidden-on-mobile" id="nb" onclick="whoSelected(this)">
                                <div class="contact-romb-wrap">
                                    <div class="contact-who romb">
                                        <div class="img-wrap">
                                            <img src="assets/img/content/contact-nenad.png" alt="" class="contact-img" />
                                        </div>
                                    </div>
                                    <div class="contact-who-name">
                                        <p>Nenad Bozic, Co-founder</p>
                                    </div>
                                </div>
                            </div>
                            <div class="select-contact-form show-on-mobile">
                                <select>
                                    <option value="">Our office</option>
                                    <option value="">Bojan Kovac, Co-Founder</option>
                                    <option value="">Matija Gobec, Co-Founder</option>
                                    <option value="">Nenad Bozic, Co-Founder</option>
                                </select>
                            </div>
                        </div>
                    </li>
                    <li>
                        <span>
                            <label for="Subject">*Subject</label>
                        </span>
                        <div class="contact-info">
                            <input id="Subject" name="Subject" type="text" />
                        </div>
                    </li>
                    <li class="contact-message">
                        <span>
                            <label for="Message">*Message?</label>
                        </span>
                        <div class="contact-info">
                            <textarea id="Message" name="Message"></textarea>
                        </div>
                    </li>
                </ol>
                <%--<a href="javascript:;" class="btn arrow"><span>Send</span> <i class="ico"></i></a>--%>
                <asp:LinkButton runat="server" ID="SubmitButton" CssClass="btn arrow" OnClick="OnContactClick">
                    <span>Send</span>
                    <i class="ico"></i>
                </asp:LinkButton>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
</asp:Content>
