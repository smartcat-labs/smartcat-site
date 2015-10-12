namespace SmartCat.Business.Helpers
{
    using Common;
    using Entities.DocumentTypes;
    using System.Linq;
    using Vega.USiteBuilder;

    public static class ContactHelper
    {
        public static string GetContactUrl(int memberId)
        {
            var contactsPage = ContentHelper.GetChildren<Contact>(NodeHelper.Home.Id).FirstOrDefault();

            return string.Format("{0}?{1}={2}", contactsPage.NiceUrl, Constants.RequestParameters.ContactMemberId, memberId);
        }
    }
}