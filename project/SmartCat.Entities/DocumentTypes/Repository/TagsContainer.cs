namespace SmartCat.Entities.DocumentTypes.Repository
{
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-tags.png", Name = "Tags Container", Description = "Container for tag items",
        AllowedChildNodeTypes = new[] { typeof(TagItem) }, AllowAtRoot = false)]
    public class TagsContainer : Repository
    {

    }
}