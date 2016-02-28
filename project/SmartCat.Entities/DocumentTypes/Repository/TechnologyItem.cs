namespace SmartCat.Entities.DocumentTypes.Repository
{
    using SmartCat.Common;
    using SmartCat.Entities.DataTypes;
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-database.png", Name = "Technology Item", Description = "Technology item document type.", AllowAtRoot = false)]
    public class TechnologyItem : Main
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Technology Image",
                           Tab = TabNames.Content,
                           Description = "Technology image. Dimensions are 115x76 px.")]
        public virtual int? TechnologyImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                          Name = "Technology description",
                          Tab = TabNames.Content,
                          Description = "Short description about technology.")]
        public virtual string TechnologyDescription { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                   OtherTypeName = Constants.CustomDataTypes.UrlPicker,
                   Name = "Technology link",
                   Tab = TabNames.Content,
                   Mandatory = true,
                   Description = "External or internal technology url.")]
        public virtual UrlPicker TechnologyLink { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.TeamMemberPicker,
                          Name = "Contact Member",
                          Tab = TabNames.Content,
                          Description = "Choose team member for this technology.")]
        public virtual int? MemberContact { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.TagsPicker,
                          Name = "Tags",
                          Tab = TabNames.Tags,
                          Description = "Choose technology tags.")]
        public virtual List<int> TechnologyTags { get; set; }
    }
}