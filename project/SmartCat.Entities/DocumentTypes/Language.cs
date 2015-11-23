namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-websitealt.png",
        Name = "Language",
        Description = "New language document type.",
        AllowAtRoot = true,
        AllowedChildNodeTypes = new[]
        {
            typeof(Home),
            typeof(Repository.Repository)
        })]
    public class Language : Main
    {
    }
}