namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-bullhorn.png",
        Name = "News Container",
        Description = "News container document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[] { typeof(NewsPost) })]
    public class NewsContainer : Main
    {

    }
}