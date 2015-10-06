namespace SmartCat.Common
{
    using System;
    using System.Configuration;

    public static class Configuration
    {
        public static int SettingsNodeId
        {
            get
            {
                return int.Parse(ConfigurationManager.AppSettings["settingsNodeId"]);
            }
        }

        public static bool TwitterEnabled
        {
            get
            {
                return Convert.ToBoolean(ConfigurationManager.AppSettings["twitter.enabled"]);
            }
        }

        public static string TwitterScreenName
        {
            get
            {
                return ConfigurationManager.AppSettings["twitter.screen.name"];
            }
        }

        public static string TwitterConsumerKey
        {
            get
            {
                return ConfigurationManager.AppSettings["twitter.consumer.key"];
            }
        }

        public static string TwitterConsumerSecret
        {
            get
            {
                return ConfigurationManager.AppSettings["twitter.consumer.secret"];
            }
        }

        public static string TwitterOAuthToken
        {
            get
            {
                return ConfigurationManager.AppSettings["twitter.oauth.token"];
            }
        }

        public static string TwitterAccessTokenSecret
        {
            get
            {
                return ConfigurationManager.AppSettings["twitter.access.token.secret"];
            }
        }

        public static string TwitterUserID
        {
            get
            {
                return ConfigurationManager.AppSettings["twitter.userid"];
            }
        }

        public static int LanguageEN
        {
            get
            {
                return int.Parse(ConfigurationManager.AppSettings["LanguageEN"]);
            }
        }

        public static int LanguageNL
        {
            get
            {
                return int.Parse(ConfigurationManager.AppSettings["LanguageNL"]);
            }
        }
    }
}