﻿namespace SmartCat.Controllers
{
    using Business.Helpers;
    using Entities.DocumentTypes.Repository;
    using System.Web.Mvc;
    using Vega.USiteBuilder;

    public class LayoutSufraceController : Umbraco.Web.Mvc.SurfaceController
    {
        [ChildActionOnly]
        public ActionResult GetHeader()
        {
            var headerModel = ContentHelper.GetByNodeId<Header>(NodeHelper.Settings.Header.Value);
            headerModel.SearchUrl = ContentHelper.GetByNodeId(NodeHelper.Settings.Search.Value).NiceUrl;

            return PartialView("_Header", headerModel);
        }

        [ChildActionOnly]
        public ActionResult GetFooter(bool hideFooterContactForm)
        {
            var headerModel = ContentHelper.GetByNodeId<Header>(NodeHelper.Settings.Header.Value);

            var footerModel = ContentHelper.GetByNodeId<Footer>(NodeHelper.Settings.Footer.Value);

            // take social for mobile view into footer
            footerModel.Twitter = headerModel.Twitter;
            footerModel.LinkedIn = headerModel.LinkedIn;
            footerModel.Facebook = headerModel.Facebook;
            footerModel.GitHub = headerModel.GitHub;
            footerModel.HideContactForm = hideFooterContactForm;

            return PartialView("_Footer", footerModel);
        }
    }
}