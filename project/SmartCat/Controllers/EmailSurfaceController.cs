using SmartCat.Business.Helpers;
using SmartCat.Common;
using SmartCat.Entities.DocumentTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Mvc;
using Vega.USiteBuilder;
using SmartCat.Common.Utility;
using System.Text.RegularExpressions;

namespace SmartCat.Controllers
{
    public class EmailController : SurfaceController
    {
        [HttpPost]
        public string ProcessStepsForm(string senderName, string senderEmail, string subject, string message)
        {
            var contactDetails = ContentHelper.GetByNodeId<Contact>(NodeHelper.Settings.Contact.Value);
            var emailMessage = contactDetails.MessageTemplate.FormatWith(new { senderName = senderName, senderEmail = senderEmail, subject = subject, message = message });

            // replace line breaks with html new line
            emailMessage = Regex.Replace(emailMessage, "\r?\n", "<br/>");

            var isSuccessfullySent = MailHandler.Instance.SendMail(subject, emailMessage, senderEmail, contactDetails.OfficeEmail);

            if (isSuccessfullySent)
            {
                return contactDetails.SuccessfullyEmailMessage;
            }
            else
            {
                return contactDetails.FailedEmailMessage;
            }
        }

        [HttpPost]
        public string ProcessContactForm(string senderName, string senderEmail, string senderNumber, string subject, string message, string contactMemberId)
        {
            var contactDetails = ContentHelper.GetByNodeId<Contact>(NodeHelper.Settings.Contact.Value);
            var emailMessage = contactDetails.MainMessageTemplate.FormatWith(new { senderName = senderName, senderEmail = senderEmail, senderNumber = senderNumber, subject = subject, message = message });

            var contactEmailTo = contactMemberId == "1" ? contactDetails.OfficeEmail : ContentHelper.GetByNodeId<TeamMember>(int.Parse(contactMemberId)).EmailAddress;

            // replace line breaks with html new line
            emailMessage = Regex.Replace(emailMessage, "\r?\n", "<br/>");

            var isSuccessfullySent = MailHandler.Instance.SendMail(subject, emailMessage, senderEmail, contactEmailTo);

            if (isSuccessfullySent)
            {
                return contactDetails.SuccessfullyEmailMessage;
            }
            else
            {
                return contactDetails.FailedEmailMessage;
            }
        }
    }
}