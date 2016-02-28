namespace SmartCat.Entities.DocumentTypes
{
    using SmartCat.Common;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-database.png",
        Name = "Technology Details",
        Description = "Technology details document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[]
        {
            typeof(TechnologyUseCase)
        })]
    public class TechnologyDetails : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.Other,
              OtherTypeName = Constants.CustomDataTypes.TechnologyPicker,
              Name = "Technology",
              Tab = TabNames.Content,
              Description = "Choose technology.",
              Mandatory = true)]
        public virtual int Technology { get; set; }
    }
}