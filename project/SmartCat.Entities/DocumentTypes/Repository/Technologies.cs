namespace SmartCat.Entities.DocumentTypes.Repository
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-servers.png",
        Name = "Technologies",
        Description = "Technologies document type.",
        AllowAtRoot = false,
        AllowedChildNodeTypes = new[]
        {
            typeof(CertificateContainer),
            typeof(TechnologyContainer)
        })]
    public class Technologies : Page
    {

    }
}