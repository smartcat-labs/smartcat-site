namespace SmartCat.Web
{
    using System;
    using System.Net.Mail;
    using System.Web.UI;

    public class Site : MasterPage
    {
        //Smpt server  
        public const string GmailServer = "aspmx.l.google.com";
        //Connecting port  
        public const int Port = 25;

        protected void OnContactUsClick(object sender, EventArgs e)
        {
            using (var client = new SmtpClient(GmailServer, Port))
            {
                //Request.Form[""]

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("matija0204@gmail.com");
                mail.To.Add("info@smartcat.io");
                mail.Subject = "Contact us";
                mail.Body = "I'm contacting you from your smartcat.io web application";

                //client.Send(mail);
            }
        }
    }
}