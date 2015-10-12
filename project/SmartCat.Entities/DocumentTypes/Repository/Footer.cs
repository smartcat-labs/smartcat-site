namespace SmartCat.Entities.DocumentTypes.Repository
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-arrow-down.png", Name = "Footer", Description = "Footer document type", AllowAtRoot = false)]
    public class Footer : Repository
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Footer Logo",
                           Tab = TabNames.Content,
                           Description = "Footer logo image.")]
        public virtual int? FooterLogoImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                           Name = "Copyright",
                           Tab = TabNames.Content,
                           Description = "Copyright text.")]
        public virtual string Copyright { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                          Name = "Address",
                          Tab = TabNames.Content,
                          Description = "Company address.")]
        public virtual string Address { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Telephone number", Description = "Visual number, any characters or symbols.", Tab = TabNames.Content)]
        public virtual string TelephoneNumber { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring, Name = "Telephone number href", Description = "Used for skype calling, only numbers with +381 prefix, without spacing.", Tab = TabNames.Content)]
        public virtual string TelephoneNumberHref { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                         Name = "Email",
                         Tab = TabNames.Content,
                         Description = "Email address.")]
        public virtual string Email { get; set; }

        #region CONTACT US

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                           Name = "Introduction",
                           Tab = TabNames.ContactUs,
                           Description = "Contact form introduction text.")]
        public virtual string IntroductionText { get; set; }

        #endregion

        #region SOCIAL

        public virtual string GitHub { get; set; }
        public virtual string Twitter { get; set; }
        public virtual string Facebook { get; set; }
        public virtual string LinkedIn { get; set; }

        #endregion

        public bool HideContactForm { get; set; }
    }
}