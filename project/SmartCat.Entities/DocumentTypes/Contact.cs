using SmartCat.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-contact-businesscard.png", Name = "Contact", Description = "Contact document type.", AllowAtRoot = false)]
    public class Contact : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                            Name = "Office email",
                            Tab = TabNames.Content,
                            Description = "Office email address, used for all contact forms as receiving email address.",
                            Mandatory = true)]
        public virtual string OfficeEmail { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                            Name = "Successfully Message",
                            Tab = TabNames.Content,
                            Description = "Define message which will be shown on successfully sent email.")]
        public virtual string SuccessfullyEmailMessage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                           Name = "Failed Message",
                           Tab = TabNames.Content,
                           Description = "Define message which will be shown on failed sent email.")]
        public virtual string FailedEmailMessage { get; set; }

        #region STEPS FORM

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                            Name = "Contact message for steps form",
                            Tab = TabNames.StepsForm,
                            Description = "Define contact message text, with following placeholder fields: {senderName}, {senderEmail}, {subject}, {message}.",
                            Mandatory = true)]
        public virtual string MessageTemplate { get; set; }

        #endregion

        #region MAIN FORM

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                            Name = "Contact message for main form",
                            Tab = TabNames.MainForm,
                            Description = "Define contact message text, with following placeholder fields: {senderName}, {senderEmail}, {senderNumber}, {subject}, {message}.",
                            Mandatory = true)]
        public virtual string MainMessageTemplate { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                              OtherTypeName = Constants.CustomDataTypes.MultipleTeamMemberPicker,
                              Name = "Contact members",
                              Tab = TabNames.MainForm,
                              Description = "Choose team members for contact form.")]
        public virtual List<int> ContactTeamMembers { get; set; }

        #endregion
    }
}
