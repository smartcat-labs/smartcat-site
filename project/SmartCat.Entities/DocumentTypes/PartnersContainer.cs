namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-affiliate.png", Name = "Partners Container", Description = "Partner network container document type.", AllowAtRoot = false, AllowedChildNodeTypes = new[] { typeof(PartnerItem) })]
    public class PartnersContainer : Main
    {
    }
}