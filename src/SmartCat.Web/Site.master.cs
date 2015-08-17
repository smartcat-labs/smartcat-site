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

        public void OnContactUsClick(object sender, EventArgs e)
        {
            // Send email to info using gmails anonymous email sending server
            // This should be updated to IP based smtp relay service https://support.google.com/a/answer/176600?hl=en

            using (var client = new SmtpClient(GmailServer, Port))
            {
                try
                {
                    var senderName = Request.Form["SenderName"];
                    var senderEmail = Request.Form["SenderEmail"];
                    var senderContact = Request.Form["SenderContact"];
                    var subject = Request.Form["Subject"];
                    var message = Request.Form["Message"];

                    var mail = new MailMessage();
                    mail.From = new MailAddress(senderEmail);
                    mail.To.Add("info@smartcat.io");
                    mail.Subject = subject;
                    mail.Body = senderName;
                    mail.Body += Environment.NewLine;
                    mail.Body += senderContact;
                    mail.Body += Environment.NewLine;
                    mail.Body += message;

                    client.Send(mail);
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}