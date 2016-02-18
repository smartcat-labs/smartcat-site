namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-databaseadd.png",
        Name = "Expertise Item",
        Description = "Expertise item document type",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[] { typeof(TechnologyItem) })]
    public class ExpertiseItem : Main
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
    }
}