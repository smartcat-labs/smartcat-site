namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(Name = "Main", Description = "This is base document type for all document types.", AllowAtRoot = false)]
    public class Main : Vega.USiteBuilder.DocumentTypeBase
    {
    }
}