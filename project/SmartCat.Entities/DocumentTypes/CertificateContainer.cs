namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-certificatealt.png", Name = "Certificate Container", Description = "Certificate container document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(CertificateItem) })]
    public class CertificateContainer : Main
    {
    }
}