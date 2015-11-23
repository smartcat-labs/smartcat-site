namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using System;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-document.png", Name = "News Post", Description = "News post document type.", AllowAtRoot = false)]
    public class NewsPost : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                         Name = "News Title",
                         Tab = TabNames.Content,
                         Description = "News title.")]
        public virtual string NewsTitle { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "News Box Image",
                           Tab = TabNames.Content,
                           Description = "News box teaser image. Dimensions are 511x511 px.")]
        public virtual int? BoxImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                   Name = "News Header Image",
                   Tab = TabNames.Content,
                   Description = "News header image above content. Dimensions are 938x600 px.")]
        public virtual int? HeaderImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                            Name = "Main body",
                            Description = "Define main content using RTE.",
                            Tab = TabNames.Content)]
        public virtual string RteContent { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.DatePicker,
                         Name = "Date",
                         Tab = TabNames.Content,
                         Description = "Blog post date. Set this to overide sorting by post create date.")]
        public virtual DateTime PostDate { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                         OtherTypeName = Constants.CustomDataTypes.TeamMemberPicker,
                         Name = "Author",
                         Tab = TabNames.Content,
                         Description = "Choose blog author.")]
        public virtual int? Author { get; set; }

    }
}