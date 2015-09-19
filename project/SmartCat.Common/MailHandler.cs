namespace SmartCat.Common
{
    using System;
    using System.Collections.Generic;
    using System.Net.Mail;

    /// <summary>
    /// Provides methods for sending e-mail messages.
    /// </summary>
    public class MailHandler
    {
        #region [Members]
        /// <summary>
        /// The singleton instance.
        /// </summary>
        private static readonly MailHandler _instance = new MailHandler();
        #endregion

        #region [Constructors]
        /// <summary>
        /// Prevents a default instance of the <see cref="MailHandler"/> class from being created.
        /// </summary>
        private MailHandler()
        {            
        }
        #endregion

        #region [Public Static Methods]
        /// <summary>
        /// Gets the singleton instance.
        /// </summary>
        public static MailHandler Instance
        {
            get
            {
                return MailHandler._instance;
            }
        }
        #endregion

        #region [Public Methods]
        /// <summary>
        /// Send e-mail message.
        /// </summary>
        /// <param name="subject">Subject of e-mail.</param>
        /// <param name="bodyText">Body text of e-mail.</param>
        /// <param name="emailTo">E-mail address where e-mail will be sent to.</param>
        /// <returns><c>true</c> if e-mail successfully sent; otherwise <c>false</c></returns>
        public bool SendMail(string subject, string bodyText,string emailFrom, string emailTo)
        {
            return this.SendMail(subject, bodyText, emailFrom, emailTo, new List<Attachment>());
        }

        /// <summary>
        /// Send e-mail message.
        /// </summary>
        /// <param name="subject">Subject of e-mail.</param>
        /// <param name="bodyText">Body text of e-mail.</param>
        /// <param name="emailTo">E-mail address where e-mail will be sent to.</param>
        /// <param name="attachments">Collection of e-mail attachemnts.</param>
        /// <returns><c>true</c> if e-mail successfully sent; otherwise <c>false</c></returns>
        public bool SendMail(string subject, string bodyText,string emailFrom, string emailTo, List<Attachment> attachments)
        {
            bool retVal = false;

            MailMessage mailMessage = new MailMessage();

            mailMessage.Body = bodyText;
            mailMessage.IsBodyHtml = true;
            mailMessage.From = new MailAddress(emailFrom);

            string[] addresses = emailTo.Split(new char[] { ';' });
            //this.CreateTestSubjectAndAddresses(ref subject, emailTo, ref addresses);

            mailMessage.Subject = subject;

            for (int i = 0; i < addresses.Length; i++)
            {
                MailAddress mailAddress = new MailAddress(addresses[i]);
                mailMessage.To.Add(mailAddress);
            }

            SmtpClient smtpClient = new SmtpClient();

            // set attachment
            if (attachments != null && attachments.Count > 0)
            {
                attachments.ForEach(x => mailMessage.Attachments.Add(x));
            }

            // send E-mail
            smtpClient.Send(mailMessage);
            retVal = true;

            return retVal;
        }

        /// <summary>
        /// Creates the test subject and addresses.
        /// </summary>
        /// <param name="subject">The subject.</param>
        /// <param name="emailTo">The email to.</param>
        /// <param name="addresses">The addresses.</param>
        //private void CreateTestSubjectAndAddresses(ref string subject, string emailTo, ref string[] addresses)
        //{
        //    if (System.Net.Configuration.IsTestMode)
        //    {
        //        if (!String.IsNullOrEmpty(Configuration.TestEmailAddresses))
        //        {
        //            addresses = Configuration.TestEmailAddresses.Split(new[] { ';' }, StringSplitOptions.RemoveEmptyEntries);
        //        }
        //        else
        //        {
        //            addresses = new string[0];
        //        }

        //        subject = String.Format("TEST MODE: {0} TO: {1}", subject, emailTo);
        //    }
        //}
        #endregion

    }
}
