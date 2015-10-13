namespace SmartCat.Entities.DocumentTypes.Repository
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-equalizer.png", Description = "Repository.", AllowAtRoot = true,
        AllowedChildNodeTypes = new[] { typeof(Settings), typeof(Footer), typeof(Header), typeof(Widgets), typeof(TagsContainer) })]
    public class Repository : Main
    {
    }
}