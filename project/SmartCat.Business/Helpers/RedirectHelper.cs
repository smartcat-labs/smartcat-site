using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;

namespace SmartCat.Business.Helpers
{
    public static class RedirectHelper
    {

        public static bool IsNL(HttpRequestBase request)
        {
            var isoCode = GetIsoCode(GetLocation(request));
            return isoCode.Equals("NL");
        }

        private static string GetLocation(HttpRequestBase request)
        {
            var ip = request.ServerVariables["REMOTE_ADDR"];
            //ip = "188.2.93.142";

            var userId = "109390";
            var licenceKey = "y0c1uXVlxvv8";
            var json = "";

            Uri objUrl = new Uri("https://geoip.maxmind.com/geoip/v2.1/country/" + ip);
            HttpWebRequest objWebReq = (HttpWebRequest)WebRequest.Create(objUrl);
            String encoded = System.Convert.ToBase64String(System.Text.Encoding.GetEncoding("ISO-8859-1").GetBytes(userId + ":" + licenceKey));
            objWebReq.Headers.Add("Authorization", "Basic " + encoded);

            try
            {
                HttpWebResponse res = (HttpWebResponse)objWebReq.GetResponse();
                StreamReader streamReader = new StreamReader(res.GetResponseStream());
                json = streamReader.ReadToEnd();
            }
            catch (Exception)
            {
                // In case of an error, return an empty json response
            }

            return json;
        }

        private static string GetIsoCode(string json)
        {
            var isoCode = "";

            Match match = Regex.Match(json, @"""iso_code"":""([A-Z]+)""");
            if (match.Success)
            {
                isoCode = match.Groups[1].Value;
            }

            return isoCode;
        }
    }
}
