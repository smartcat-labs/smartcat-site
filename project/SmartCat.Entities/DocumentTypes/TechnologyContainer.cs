namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-servers.png",
        Name = "Technology Container",
        Description = "Technology container document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[] { typeof(TechnologyItem) })]
    public class TechnologyContainer : Main
    {
    }
}