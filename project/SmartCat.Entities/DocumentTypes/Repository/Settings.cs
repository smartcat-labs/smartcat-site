using Vega.USiteBuilder;

namespace SmartCat.Entities.DocumentTypes.Repository
{
    [DocumentType(IconUrl = "icon-cog.png", Name = "Settings", Description = "For defining initial settings.", AllowAtRoot = false)]
    public class Settings : Repository
    {
        #region PAGES

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                              Tab = TabNames.Page,
                              Name = "Home",
                              Description = "Home.",
                              Mandatory = true)]
        public virtual int? Home { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                              Tab = TabNames.Page,
                              Name = "Search",
                              Description = "Search.",
                              Mandatory = true)]
        public virtual int? Search { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                             Tab = TabNames.Page,
                             Name = "Contact",
                             Description = "Contact.",
                             Mandatory = true)]
        public virtual int? Contact { get; set; }

        #endregion

        #region NODES

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                     Tab = TabNames.Nodes,
                     Name = "Header",
                     Description = "Header.",
                     Mandatory = true)]
        public virtual int? Header { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                              Tab = TabNames.Nodes,
                              Name = "Footer",
                              Description = "Footer.",
                              Mandatory = true)]
        public virtual int? Footer { get; set; }


        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                              Tab = TabNames.Nodes,
                              Name = "Tags Container",
                              Description = "Tags Container.",
                              Mandatory = true)]
        public virtual int? TagsContainer { get; set; }

        #endregion

        #region SETTINGS

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                            Tab = TabNames.Settings,
                            Name = "Google Analytics Script",
                            Description = "Set google analytics script, including script tags.")]
        public virtual string GoogleAnalyticsScript { get; set; }

        #endregion
    }

}
