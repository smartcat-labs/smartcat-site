using SmartCat.Entities.DocumentTypes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web.Models;
using Umbraco.Web.Mvc;
using Examine;
using Examine.LuceneEngine.SearchCriteria;
using Examine.SearchCriteria;
using SmartCat.Common;
using Vega.USiteBuilder;

namespace SmartCat.Controllers
{
    public class SearchController : RenderMvcController
    {
        public ActionResult Search(RenderModel model, string s, string page)
        {
            var search = new Search();
            search.Title = model.Content.GetProperty("title").Value.ToString();

            if (!string.IsNullOrEmpty(Request.QueryString["s"]))
            {
                var pageNumber = 0;
                var paged = Request.QueryString["page"];
                var successfullParsing = int.TryParse(paged, out pageNumber);

                var currentPageIndex = successfullParsing ? pageNumber - 1 : 0;
                var itemsPerPage = model.Content.GetProperty("itemsPerPage").HasValue ? int.Parse(model.Content.GetProperty("itemsPerPage").Value.ToString()) : Constants.DefaultValues.DefaultSearchItemsPerPage;

                var q = Request.QueryString["s"].Trim();

                var searcher = ExamineManager.Instance.SearchProviderCollection["SmartCatSearcher"];

                //Searching and ordering the result by score, and we only want to get the results that has a minimum of 0.05(scale is up to 1.)
                var searchResults = searcher.Search(q, true).OrderByDescending(x => x.Score).TakeWhile(x => x.Score > 0.05f);

                if (searchResults != null && searchResults.Any())
                {
                    search.PageSize = itemsPerPage;
                    search.PageNumber = pageNumber;
                    search.TotalItemCount = searchResults.Count();
                    search.Query = q;

                    searchResults = searchResults.Skip(currentPageIndex * itemsPerPage).Take(itemsPerPage);

                    if (searchResults.Any())
                    {
                        search.searchResults = searchResults.Select(x => new SearchResults
                        {
                            Title = x.Fields.Where(y => y.Key == "title").First().Value,
                            Description = x.Fields.Where(z => z.Key == "rteContent").FirstOrDefault().Value != null ?x.Fields.Where(z => z.Key == "rteContent").FirstOrDefault().Value.Substring(0, 260) : string.Empty,
                            Url = ContentHelper.GetByNodeId(int.Parse(x.Fields.Where(t => t.Key == "id").First().Value)).NiceUrl

                        }).ToList();
                    }

                }
            }

            return CurrentTemplate(search);
        }
    }
}