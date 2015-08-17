<%@ Page Title="SmartCat | Contact" Language="C#" MasterPageFile="Site.master" %>

<asp:Content runat="server" ID="unknown" ContentPlaceHolderID="ContentPlaceHolder">
    
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
                                    <span><label for="q7">*What's your name?</label></span>
                                    <div class="contact-info">
                                        <input id="q7" name="q7" type="text"/>
                                    </div>
                                </li>
                                <li>
                                    <span><label for="q8">*Email?</label></span>
                                    <div class="contact-info">
                                        <input id="q8" name="q8" type="email"/>
                                    </div>
                                </li>
                                <li>
                                    <span><label for="q9">*Contact number?</label></span>
                                    <div class="contact-info">
                                        <input id="q9" name="q9" type="text"/>
                                    </div>
                                </li>
                            </ol><!-- / main-questions -->
                        </li>
                        <li class="contact-who-block">
                            <p>*Who do you want to contact?</p>
                            <div class="contacts-wrapper">
                                <div class="one-contact active">
                                    <div class="contact-romb-wrap contact-office-img">
                                        <div class="contact-who romb">
                                            <div class="img-wrap">
                                                <img src="assets/img/content/contact-office.png" alt="" class="contact-img"/>
                                            </div>
                                        </div>
                                        <div class="contact-who-name hidden-on-mobile">
                                            <p>Our office</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="one-contact hidden-on-mobile">
                                    <div class="contact-romb-wrap">
                                        <div class="contact-who romb">
                                            <div class="img-wrap">
                                                <img src="assets/img/content/contact-bojan.png" alt="" class="contact-img"/>
                                            </div>
                                        </div>
                                        <div class="contact-who-name">
                                            <p>Bojan Kovac, Co-founder</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="one-contact hidden-on-mobile">
                                    <div class="contact-romb-wrap">
                                        <div class="contact-who romb">
                                            <div class="img-wrap">
                                                <img src="assets/img/content/contact-matija.png" alt="" class="contact-img"/>
                                            </div>
                                        </div>
                                        <div class="contact-who-name">
                                            <p>Matija Gobec, Co-founder</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="one-contact hidden-on-mobile">
                                    <div class="contact-romb-wrap">
                                        <div class="contact-who romb">
                                            <div class="img-wrap">
                                                <img src="assets/img/content/contact-nenad.png" alt="" class="contact-img"/>
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
                            <span><label for="Subject">*Subject</label></span>
                            <div class="contact-info">
                                <input id="Subject" name="Subject" type="text"/>
                            </div>
                        </li>
                        <li class="contact-message">									
                            <span><label for="Message">*Message?</label></span>
                            <div class="contact-info">
                                <textarea id="Message" name="Message"></textarea>
                            </div>
                        </li>
                    </ol>
                    <a href="javascript:;" class="btn arrow"><span>Send</span> <i class="ico"></i></a>
                </div>
            </div>
        </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphAdditionalFooter" runat="server">
    
</asp:Content>