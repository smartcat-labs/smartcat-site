namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-quoteup.png", Name = "Testimonial Container", Description = "Testimonial container document type", AllowedChildNodeTypes = new[] { typeof(TestimonialItem) })]
    public class TestimonialContainer : Main
    {
    }
}