using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace SmartCat.Common
{
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
                return Convert.ToBoolean(ConfigurationManager.AppSettings["TwitterEnabled"]);
            }
        }

        public static string TwitterScreenName
        {
            get 
            {
                return ConfigurationManager.AppSettings["TwitterScreenName"];          
            }
        }

        public static string TwitterConsumerKey
        {
            get
            {
                return ConfigurationManager.AppSettings["TwitterConsumerKey"];
            }
        }

        public static string TwitterConsumerSecret
        {
            get
            {
                return ConfigurationManager.AppSettings["TwitterConsumerSecret"];
            }
        }

        public static string OAuthToken
        {
            get
            {
                return ConfigurationManager.AppSettings["OAuthToken"];
            }
        }

        public static string AccessTokenSecret
        {
            get
            {
                return ConfigurationManager.AppSettings["AccessTokenSecret"];
            }
        }

        public static string TwitterUserID
        {
            get
            {
                return ConfigurationManager.AppSettings["TwitterUserID"];
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
