namespace SmartCat.Business.Helpers
{
    using Entities.DocumentTypes;
    using System.Collections.Generic;
    using System.Linq;
    using Vega.USiteBuilder;

    public static class WidgetsHelper
    {
        public static List<int> NewsWidget
        {
            get
            {
                var widgets = NodeHelper.Widgets;

                if (widgets.NewsWidget != null && widgets.NewsWidget.Any())
                {
                    return widgets.NewsWidget;
                }

                var newsNode = ContentHelper.GetChildren<News>(NodeHelper.Home.Id).FirstOrDefault();
                if (newsNode == null) return null;

                var news = ContentHelper.GetChildren<NewsPost>(newsNode.Id).OrderByDescending(post => post.PostDate).Take(5);

                if (news != null && news.Any())
                {
                    return news.Select(item => item.Id).ToList();
                }

                return null;
            }
        }

        public static List<int> TeamWidget
        {
            get
            {
                var widgets = NodeHelper.Widgets;

                if (widgets.TeamWidget != null && widgets.TeamWidget.Any())
                {
                    return widgets.TeamWidget;
                }

                return null;
            }
        }

        public static List<int> ServiceWidget
        {
            get
            {
                var widgets = NodeHelper.Widgets;

                if (widgets.ServiceWidget != null && widgets.ServiceWidget.Any())
                {
                    return widgets.ServiceWidget;
                }

                return null;
            }
        }
    }
}