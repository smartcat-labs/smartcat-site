namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-databaseadd.png",
        Name = "Expertise Item",
        Description = "Expertise item document type",
        AllowAtRoot = false)]
    public class ExpertiseItem : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Image",
                           Tab = TabNames.Content,
                           Description = "Expertise image.")]
        public virtual int? ServiceImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.MediaPicker,
                           Name = "Title Image",
                           Tab = TabNames.Content,
                           Description = "Expertise title image.")]
        public virtual int? ServiceTitleImage { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                         Name = "Home Page Text",
                         Description = "Set home page text that will be shown on home page.",
                         Tab = TabNames.Content)]
        public virtual string HomePageText { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                         Name = "Featured Text",
                         Description = "Set featured text that will be shown when you reference this service to other pages.",
                         Tab = TabNames.Content)]
        public virtual string FeaturedText { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor,
                            Alias = "rteContent",
                            Name = "Main body",
                            Description = "Define main content using RTE.",
                            Tab = TabNames.Content)]
        public virtual string ServiceContent { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Other,
              OtherTypeName = Constants.CustomDataTypes.MultipleTechnologyPicker,
              Name = "Featured Technologies",
              Tab = TabNames.FeaturedTechnologies,
              Description = "Choose featured technologies.")]
        public virtual List<int> FeaturedTechnologies { get; set; }
    }
}