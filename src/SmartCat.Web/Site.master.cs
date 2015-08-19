namespace SmartCat.Web
{
    using System;
    using System.Net.Mail;
    using System.Web.UI;

    public class Site : MasterPage
    {
        public void OnContactUsClick(object sender, EventArgs e)
        {
            using (var client = new SmtpClient())
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
                    System.Diagnostics.Trace.TraceError("Something brokeded", ex);
                    throw ex;
                }
            }
        }
    }
}