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

    }
}
