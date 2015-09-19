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
                Description = "Office email address, used for contact forms.",
                Mandatory = true)]
        public virtual string OfficeEmail { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                Name = "Successfully Message",
                Tab = TabNames.Content,
                Description = "Define message which will be shown to successfully sent email.")]
        public virtual string SuccessfullyEmailMessage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
               Name = "Failed Message",
               Tab = TabNames.Content,
               Description = "Define message which will be shown to failed sent email.")]
        public virtual string FailedEmailMessage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                Name = "Contact message",
                Tab = TabNames.Content,
                Description = "Define contact message text, with following placeholder fields: {senderName}, {senderEmail}, {subject}, {message}.",
                Mandatory = true)]
        public virtual string MessageTemplate { get; set; }

    }
}
