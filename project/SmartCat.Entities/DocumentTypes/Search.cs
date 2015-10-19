namespace SmartCat.Entities.DocumentTypes
{
    using System.Collections.Generic;
    using Vega.USiteBuilder;

    [DocumentType(IconUrl = "icon-search.png", Name = "Search", Description = "Search document type.", AllowAtRoot = false)]
    public class Search : Page
    {
        [DocumentTypeProperty(UmbracoPropertyType.Numeric,
                          Name = "Items Per Page",
                          Tab = TabNames.Content,
                          Description = "Number of results per page, if nothing is set 5 will be used.",
                          DefaultValue = 5)]
        public virtual int ItemsPerPage { get; set; }

        public int PageSize { get; set; }
        public int PageNumber { get; set; }
        public int TotalItemCount { get; set; }
        public string Query { get; set; }

        public List<SearchResults> searchResults { get; set; }
    }

    #region SUPPORT

    public class SearchResults
    {
        public string Title { get; set; }
        public string Description { get; set; }
        public string Url { get; set; }
    }

    #endregion
}