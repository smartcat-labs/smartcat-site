namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using SmartCat.Entities.DataTypes;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-briefcase.png", Name = "Partner Item", Description = "Partner item document type.", AllowAtRoot = false)]
    public class PartnerItem : Main
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Partner Image",
                           Tab = TabNames.Content,
                           Description = "Select partner image.")]
        public virtual int? PartnerImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
           OtherTypeName = Constants.CustomDataTypes.UrlPicker,
           Name = "Partner Url",
           Tab = TabNames.Content,
           Description = "External or internal url.")]
        public virtual UrlPicker PartnerUrl { get; set; }
    }
}