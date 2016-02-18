namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-websitebuilder.png", Name = "Expertise", Description = "Expertise document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(ServiceItem) })]
    public class Expertise : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor, Name = "Main body", Description = "Define main content using RTE.", Tab = TabNames.Content)]
        public virtual string RteContent { get; set; }
    }
}