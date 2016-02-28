namespace SmartCat.Business.Helpers
{
    using Entities.DocumentTypes;
    using SmartCat.Entities.DocumentTypes.Repository;
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using Vega.USiteBuilder;

    public static class WidgetsHelper
    {
        public static List<BlogPost> BlogsWidget(List<int> tags)
        {
            var blogsNode = ContentHelper.GetChildren<Blog>(NodeHelper.Home.Id).FirstOrDefault();
            if (blogsNode == null) return null;

            var blogPosts = ContentHelper.GetChildren<BlogPost>(blogsNode.Id, true)
                .OrderByDescending(b => b.PostDate)
                .Where(b => b.TechnologyTags != null && b.TechnologyTags.Any(tag => tags.Contains(tag)))
                .Take(NodeHelper.Widgets.NumberOfBlogItems)
                .ToList();

            if (blogPosts != null && blogPosts.Any()) return blogPosts;

            var blogs = ContentHelper.GetChildren<BlogPost>(blogsNode.Id, true)
                .OrderByDescending(post => post.PostDate)
                .Take(NodeHelper.Widgets.NumberOfBlogItems)
                .ToList();

            if (blogs != null && blogs.Any())
            {
                return blogs;
            }

            return null;
        }

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

                var news = ContentHelper.GetChildren<NewsPost>(newsNode.Id, true).OrderByDescending(post => post.PostDate).Take(NodeHelper.Widgets.NumberOfNewsItems);

                if (news != null && news.Any())
                {
                    return news.Select(item => item.Id).ToList();
                }

                return null;
            }
        }

        public static List<int> ExpertiseWidget
        {
            get
            {
                var widgets = NodeHelper.Widgets;

                if (widgets.ExpertiseWidget != null && widgets.ExpertiseWidget.Any())
                {
                    return widgets.ExpertiseWidget;
                }

                var expertiseNode = ContentHelper.GetChildren<Expertise>(NodeHelper.Home.Id).FirstOrDefault();
                if (expertiseNode == null) return null;

                var expertises = ContentHelper.GetChildren<ExpertiseItem>(expertiseNode.Id, true)
                    .Take(NodeHelper.Widgets.NumberOfExpertiseItems);

                if (expertises != null && expertises.Any())
                {
                    return expertises.Select(item => item.Id).ToList();
                }

                return null;
            }
        }

        public static List<TechnologyItem> TechnologyWidget(List<int> tags)
        {
            var technologiesNode = ContentHelper.GetChildren<Technologies>(NodeHelper.Repository.Id).FirstOrDefault();
            if (technologiesNode == null) return null;

            var technologies = ContentHelper.GetChildren<TechnologyItem>(technologiesNode.Id, true)
                .Where(t => t.TechnologyTags != null && t.TechnologyTags.Any(tag => tags.Contains(tag)))
                .ToList();

            return technologies;
        }

        public static List<TeamMember> TeamWidget(List<int> tags)
        {
            var teamNode = ContentHelper.GetChildren<Team>(NodeHelper.Home.Id).FirstOrDefault();
            if (teamNode == null) return null;

            var teamMembers = ContentHelper.GetChildren<TeamMember>(teamNode.Id, true)
                .Where(m => m.TechnologyTags != null && m.TechnologyTags.Any(tag => tags.Contains(tag)))
                .OrderBy(m => Guid.NewGuid())
                .Take(NodeHelper.Widgets.NumberOfTeamMemberItems)
                .ToList();

            if (teamMembers != null && teamMembers.Any()) return teamMembers;

            var widgets = NodeHelper.Widgets;

            if (widgets.TeamWidget != null && widgets.TeamWidget.Any())
            {
                teamMembers = ContentHelper.GetChildren<TeamMember>(teamNode.Id, true)
                    .Where(m => widgets.TeamWidget.Contains(m.Id))
                    .Take(NodeHelper.Widgets.NumberOfTeamMemberItems)
                    .ToList();

                return teamMembers;
            }

            return null;
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