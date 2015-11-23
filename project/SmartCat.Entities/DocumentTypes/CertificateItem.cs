namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using SmartCat.Entities.DataTypes;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-invoice.png", Name = "Certificate Item", Description = "Certificate item document type.", AllowAtRoot = false)]
    public class CertificateItem : Main
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                          Name = "Certificate",
                          Tab = TabNames.Content,
                          Description = "Certificate image.")]
        public virtual int? CertificateImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                         OtherTypeName = Constants.CustomDataTypes.UrlPicker,
                         Name = "Certificate Url",
                         Tab = TabNames.Content,
                         Description = "Certificate external or internal url.")]
        public virtual UrlPicker CertificateUrl { get; set; }
    }
}