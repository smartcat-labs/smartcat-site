using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes
{
    [DocumentType(IconUrl = "icon-websitebuilder.png", Name = "Services", Description = "Services document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(ServiceItem) })]
    public class Services : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.RichtextEditor, Name = "Main body", Description = "Define main content using RTE.", Tab = TabNames.Content)]
        public virtual string RteContent { get; set; }
    }
}