namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using System;
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-magazine.png", Name = "Blog Post", Description = "Blog post document type.", AllowAtRoot = false)]
    public class BlogPost : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                         Name = "Blog Title",
                         Tab = TabNames.Content,
                         Description = "Blog title.")]
        public virtual string BlogTitle { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                           OtherTypeName = Constants.CustomDataTypes.BlogImageCropper,
                           Name = "Header Image",
                           Tab = TabNames.Content,
                           Description = "Header image above content.")]
        public virtual string HeaderImage { get; set; }

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

        [DocumentTypeProperty(UmbracoPropertyType.Other,
                          OtherTypeName = Constants.CustomDataTypes.TagsPicker,
                          Name = "Tags",
                          Tab = TabNames.Tags,
                          Description = "Choose technology tags.")]
        public virtual List<int> TechnologyTags { get; set; }
    }
}