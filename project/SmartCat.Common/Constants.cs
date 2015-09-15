namespace SmartCat.Common
{
    public static class Constants
    {
        #region NODE IDs

        public static class NodeIDs
        {
           
        }

        #endregion

        #region DEFAULT VALUES

        public static class DefaultValues
        {
            public const string SiteName = "SmartCat";
        }

        #endregion

        #region DOCUMENT TYPES

        public static class DocumentTypes
        {
            public const string Settings = "Settings";
        } 

        #endregion

        #region DOCUMENT TYPE PROPERTIES

        public static class DocumentTypeProperties
        {
            public const string Title = "title";
        }

        #endregion

        #region REQUEST PARAMETERS

        public static class RequestParameters
        {

        }

        #endregion

        #region CUSTOM DATA TYPES

        public static class CustomDataTypes
        {
            public const string TeamMemberImageCropper = "Team Member Image Cropper";
            public const string TeamMemberPicker = "Team Member Picker";
            public const string UrlPicker = "Url Picker";
            public const string MultiUrlPicker = "Multi Url Picker";
        }

        #endregion

        #region LINK TARGET

        public static class LinkTarget
        {
            public const string NewWindow = "_blank";

            public const string SameWindow = "_self";
        }

        #endregion

        #region HTML ATTRIBUTES

        public static class HtmlAttributes
        {

        }

        #endregion

        #region CACHE

        public static class Cache
        {
            public const int OutputCachingMinutes = 30;
        }

        public static class CacheKeys
        {
            public const string Settings = "CACHE_SETTINGS";
        }

        #endregion

        #region MEDIA

        public static class Media
        {

            public static class Properties
            {
                public const string AlternateText = "alternateText";

                public const string Caption = "caption";

                public const string Url = "umbracoFile";

                public const string Size = "umbracoBytes";

                public const string FileDate = "fileDate";

                public const string Description = "description";

                public const string Title = "title";

                public const string Type = "type";

                public const string Height = "umbracoHeight";

                public const string Width = "umbracoWidth";

                public const string Name = "nodeName";

                public const string Subtitle = "subtitle";

                public const string Extension = "umbracoExtension";

                public const string Crops = "crops";
            }

            public static class CropNames
            {
                public const string ProfileImageAlias = "profileImage";

                public const string Team = "team";
                public const string Home = "home";
                public const string Sidebar = "sidebar";

            }

            public static class ContentTypes
            {
                public const string Folder = "Folder";

                public const string Image = "Image";

                public const string File = "File";
            }
        }

        #endregion

        #region COOKIES

        #endregion

        #region SEARCH

        public static class Search
        {

        }

        #endregion
    }
}