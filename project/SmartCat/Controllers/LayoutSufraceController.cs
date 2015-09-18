using SmartCat.Business.Helpers;
using SmartCat.Common;
using SmartCat.Entities.DocumentTypes.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Vega.USiteBuilder;

namespace SmartCat.Controllers
{
    public class LayoutSufraceController : Umbraco.Web.Mvc.SurfaceController
    {
        [ChildActionOnly]
        public ActionResult GetHeader()
        {
            var headerModel = new Header();

            headerModel = ContentHelper.GetByNodeId<Header>(NodeHelper.Settings.Header.Value);
            headerModel.SearchUrl = ContentHelper.GetByNodeId(NodeHelper.Settings.Search.Value).NiceUrl;

            return PartialView("_Header", headerModel);
        }

        [ChildActionOnly]
        public ActionResult GetFooter()
        {
            var headerModel = ContentHelper.GetByNodeId<Header>(NodeHelper.Settings.Header.Value);

            var footerModel = new Footer();
            footerModel = ContentHelper.GetByNodeId<Footer>(NodeHelper.Settings.Footer.Value);

            // take social for mobile view into footer
            footerModel.Twitter = headerModel.Twitter;
            footerModel.LinkedIn = headerModel.LinkedIn;
            footerModel.Stackoverflow = headerModel.Stackoverflow;
            footerModel.GitHub = headerModel.GitHub;

            return PartialView("_Footer", footerModel);
        }
    }
}