using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes.Repository
{
    [DocumentType(IconUrl = "icon-arrow-up.png", Name = "Header", Description = "Header document type.", AllowAtRoot = false)]
    public class Header : Repository
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                            Name = "Logo",
                            Tab = TabNames.Content,
                            Description = "Logo image.")]
        public virtual int? LogoImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Telephone number", Description = "Visual number, any characters or symbols.", Tab = TabNames.Content)]
        public virtual string TelephoneNumber { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Telephone number href", Description = "Used for skype calling, only numbers with +381 prefix, without spacing.", Tab = TabNames.Content)]
        public virtual string TelephoneNumberHref { get; set; }

        #region SOCIAL

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "GitHub", Description = "GitHub url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string GitHub { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Twitter", Description = "Twitter url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string Twitter { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Stackoverflow", Description = "Stackoverflow url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string Stackoverflow { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "LinkedIn", Description = "LinkedIn url, including http://", Tab = TabNames.SocialLinks)]
        public virtual string LinkedIn { get; set; }

        #endregion

        #region SUPPORT

        public string SearchUrl { get; set; }

        #endregion

    }
}
