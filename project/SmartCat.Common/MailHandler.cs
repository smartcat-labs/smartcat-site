namespace SmartCat.Common
{
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
                return _instance;
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
        public bool SendMail(string subject, string bodyText, string emailFrom, string emailTo)
        {
            return SendMail(subject, bodyText, emailFrom, emailTo, new List<Attachment>());
        }

        /// <summary>
        /// Send e-mail message.
        /// </summary>
        /// <param name="subject">Subject of e-mail.</param>
        /// <param name="bodyText">Body text of e-mail.</param>
        /// <param name="emailTo">E-mail address where e-mail will be sent to.</param>
        /// <param name="attachments">Collection of e-mail attachemnts.</param>
        /// <returns><c>true</c> if e-mail successfully sent; otherwise <c>false</c></returns>
        public bool SendMail(string subject, string bodyText, string emailFrom, string emailTo, List<Attachment> attachments)
        {
            var retVal = false;

            var mailMessage = new MailMessage();

            mailMessage.Body = bodyText;
            mailMessage.IsBodyHtml = true;
            mailMessage.From = new MailAddress(emailFrom);

            var addresses = emailTo.Split(new char[] { ';' });

            mailMessage.Subject = subject;

            for (int i = 0; i < addresses.Length; i++)
            {
                var mailAddress = new MailAddress(addresses[i]);
                mailMessage.To.Add(mailAddress);
            }

            var smtpClient = new SmtpClient();

            // set attachment
            if (attachments != null && attachments.Count > 0)
            {
                attachments.ForEach(x => mailMessage.Attachments.Add(x));
            }

            // send E-mail
            smtpClient.Send(mailMessage);

            // TODO: What is the point of this ? Its never returned as false. Does it throw exceptions ? Why isnt it caught and then return false ?
            retVal = true;

            return retVal;
        }

        #endregion
    }
}