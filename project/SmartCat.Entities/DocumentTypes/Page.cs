namespace SmartCat.Entities.DocumentTypes
{
    using Vega.USiteBuilder;

    [DocumentType(Name = "Page", Description = "This document type used as a master document type for all pages, should not be used for creating content.")]
    public class Page : Main
    {
        #region PAGE

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                              Name = "Title",
                              Tab = TabNames.Page,
                              Description = "Page title.",
                              Mandatory = true)]
        public virtual string Title { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TrueFalse,
                            Name = "Hide Footer Contact Form",
                            Tab = TabNames.Page,
                            Description = "Hide footer contact form on this page.")]
        public virtual bool HideFooterContactForm { get; set; }

        #endregion

        #region WIDGETS

        [DocumentTypeProperty(UmbracoPropertyType.TrueFalse,
            Name = "News Widget",
            Tab = TabNames.Widgets,
            Description = "Display news widget")]
        public virtual bool NewsWidget { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TrueFalse,
            Name = "Blogs Widget",
            Tab = TabNames.Widgets,
            Description = "Display blogs widget")]
        public virtual bool BlogsWidget { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TrueFalse,
            Name = "Team Widget",
            Tab = TabNames.Widgets,
            Description = "Display team widget")]
        public virtual bool TeamWidget { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TrueFalse,
            Name = "Experties Widget",
            Tab = TabNames.Widgets,
            Description = "Display expertise widget")]
        public virtual bool ExpertiseWidget { get; set; }

        #endregion

        #region SEO

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                              Name = "SEO Title",
                              Tab = TabNames.SEO,
                              Description = "Page title in meta tag.")]
        public virtual string SeoTitle { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                              Name = "SEO Keywords",
                              Tab = TabNames.SEO,
                              Description = "Page keywords in meta tag.")]
        public virtual string SeoKeywords { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.TextboxMultiple,
                              Name = "SEO Description",
                              Tab = TabNames.SEO,
                              Description = "Page description in meta tag.")]
        public virtual string SeoDescription { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                              Name = "SEO Author",
                              Tab = TabNames.SEO,
                              Description = "Page author in meta tag.")]
        public virtual string SeoAuthor { get; set; }

        #endregion

        #region UMBRACO

        [DocumentTypeProperty(UmbracoPropertyType.TrueFalse,
                              Name = "Umbraco Navigation Hide",
                              Description = "This 'True/False' property will hide pages from the navigation when they are set to true.")]
        public virtual bool UmbracoNaviHide { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.ContentPicker,
                              Name = "Umbraco Redirect",
                              Description = "Choose a node ID that you want the page to redirect to.")]
        public virtual int? UmbracoRedirect { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                              Name = "Umbraco Url Name",
                              Description = "This property allows you to change the URL of the node without changing the name of the node/page you have created.")]
        public virtual string UmbracoUrlName { get; set; }

        [DocumentTypeProperty(UmbracoPropertyType.Textstring,
                              Name = "Umbraco Url Alias",
                              Description = "This property allows you to give the node multiple URLs using a textstring property.")]
        public virtual string UmbracoUrlAlias { get; set; }

        #endregion
    }
}