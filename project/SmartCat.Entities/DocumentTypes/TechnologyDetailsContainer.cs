namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-servers.png",
        Name = "Technology Details Container",
        Description = "Technology details container document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[]
        {
            typeof(TechnologyDetails)
        })]
    public class TechnologyDetailsContainer : Main
    {
    }
}