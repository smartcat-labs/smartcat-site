namespace SmartCat.Common.Utility
{
    using System;
    using System.Collections.Generic;
    using System.Text.RegularExpressions;
    using System.Web;
    using System.Web.UI;

    /// <summary>
    /// Contains utility methods
    /// </summary>
    public static class Utility
    {
        /// <summary>
        /// Strips the specified text.
        /// </summary>
        /// <param name="text">The input text.</param>
        /// <returns>Text without HTML tags.</returns>
        public static string StripHtml(string text)
        {
            string retVal = text;
            if (!string.IsNullOrEmpty(text))
            {
                retVal = Regex.Replace(text, @"<(.|\n)*?>", string.Empty);
            }

            return retVal;
        }

        /// <summary>
        /// Sets the caching.
        /// </summary>
        /// <param name="minutes">The minutes.</param>
        public static void SetCaching(int minutes)
        {
            HttpContext.Current.Response.Cache.SetExpires(DateTime.Now.AddMinutes(minutes));
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.ServerAndPrivate);
            HttpContext.Current.Response.Cache.SetValidUntilExpires(true);
        }

        /// <summary>
        /// Adds the links to tweets.
        /// </summary>
        /// <param name="inputText">The input text.</param>
        /// <returns>Replaced text</returns>
        public static string AddLinksToTweets(string inputText)
        {
            var replacedText = inputText;
            var replacePattern1 = @"(https?:\/\/[^ ]+)";
            replacedText = Regex.Replace(replacedText, replacePattern1, "<a href=\"$1\" target=\"_blank\">$1</a>", RegexOptions.Compiled);

            var replacePattern2 = @"@([a-zA-Z0-9_]*)";
            replacedText = Regex.Replace(replacedText, replacePattern2, "<a href=\"http://twitter.com/@$1\" target=\"_blank\">@$1</a>", RegexOptions.Compiled);

            var replacePattern3 = @"#([a-zA-Z0-9_]*)";
            replacedText = Regex.Replace(replacedText, replacePattern3, "<a href=\"http://twitter.com/search?q=%23$1\" target=\"_blank\">#$1</a>", RegexOptions.Compiled);

            return replacedText;
        }

        /// <summary>
        /// Gets the shorter text.
        /// </summary>
        /// <param name="text">The text that need to be smaller.</param>
        /// <param name="numberOfChars">The number of chars.</param>
        /// <param name="roundLastWord">if set to <c>true</c> [round last word].</param>
        /// <returns>
        /// Substring of text if text lenght is grater that numberOfChars, otherwise returns text.
        /// </returns>
        public static string GetShorterText(string text, int numberOfChars, bool roundLastWord, bool addThreeDots)
        {
            var retVal = string.Empty;
            if (!string.IsNullOrEmpty(text))
            {
                retVal = Utility.StripHtml(text);
                if (retVal.Length > numberOfChars)
                {
                    retVal = retVal.Substring(0, numberOfChars);

                    if (roundLastWord)
                    {
                        int lastSpaceIndex = retVal.LastIndexOf(' ');
                        if (lastSpaceIndex != -1)
                        {
                            retVal = retVal.Substring(0, lastSpaceIndex);
                        }
                    }

                    if (addThreeDots)
                    {
                        retVal += "...";
                    }
                }
            }

            return retVal;
        }

        /// <summary>
        /// Gets the URL withouth HTTP.
        /// </summary>
        /// <param name="url">The URL.</param>
        /// <returns></returns>
        public static string GetUrlWithouthHTTP(string url)
        {
            //Remove http and https
            var retVal = url;
            var iIndex1 = retVal.IndexOf("http://");
            var iIndex2 = retVal.IndexOf("https://");
            if (iIndex1 != -1)
            {
                retVal = retVal.Substring(iIndex1 + 7, retVal.Length - 7);
            }
            else if (iIndex2 != -1)
            {
                retVal = retVal.Substring(iIndex2 + 8, retVal.Length - 8);
            }


            return retVal;
        }

        /// <summary>
        /// Gets the in between substring.
        /// </summary>
        /// <param name="text">The input text.</param>
        /// <param name="markerStart">The marker start.</param>
        /// <param name="markerEnd">The marker end.</param>
        /// <returns>Gets inner text.</returns>
        public static string GetInBetweenSubstring(string text, string markerStart, string markerEnd)
        {
            var start = text.IndexOf(markerStart);
            var end = text.LastIndexOf(markerEnd);

            if (start == -1)
            {
                throw new Exception(string.Format("Marker for usercontrol start ('{0}') not found in '{1}'", markerStart, text));
            }

            if (end == -1)
            {
                throw new Exception(string.Format("Marker for usercontrol end ('{0}') not found in '{1}'", markerStart, text));
            }

            if (start > end)
            {
                throw new Exception(string.Format("Start and End markers not possitioned well in '{0}'", text));
            }

            start += markerStart.Length;

            return text.Substring(start, end - start);
        }

        /// <summary>
        /// Gets the source from iframe.
        /// </summary>
        /// <param name="iframe">The iframe.</param>
        /// <returns></returns>
        public static string GetSourceFromIframe(string iframe)
        {
            var retVal = string.Empty;

            try
            {
                retVal = iframe.Replace("\"", "");
                int indexOfSrc = retVal.IndexOf("src=");
                if (indexOfSrc > 0)
                {
                    retVal = retVal.Substring(indexOfSrc + 4, retVal.Substring(indexOfSrc + 4).IndexOf(" "));
                }
            }
            catch (Exception exception)
            {
                Logger.LogException(exception, "Video");
            }

            return retVal;
        }

        public static string NormilizeReqParameter(string param)
        {
            return param.Replace("%20", " ");
        }

        /// <summary>
        /// String formatting with named variables
        /// </summary>
        /// <param name="format"></param>
        /// <param name="source"></param>
        /// <returns></returns>
        public static string FormatWith(this string format, object source)
        {
            return FormatWith(format, null, source);
        }

        public static string FormatWith(this string format, IFormatProvider provider, object source)
        {
            if (format == null)
                throw new ArgumentNullException("format");

            var r = new Regex(@"(?<start>\{)+(?<property>[\w\.\[\]]+)(?<format>:[^}]+)?(?<end>\})+",
              RegexOptions.Compiled | RegexOptions.CultureInvariant | RegexOptions.IgnoreCase);

            var values = new List<object>();
            string rewrittenFormat = r.Replace(format, delegate (Match m)
            {
                var startGroup = m.Groups["start"];
                var propertyGroup = m.Groups["property"];
                var formatGroup = m.Groups["format"];
                var endGroup = m.Groups["end"];

                values.Add((propertyGroup.Value == "0")
                  ? source
                  : DataBinder.Eval(source, propertyGroup.Value));

                return new string('{', startGroup.Captures.Count) + (values.Count - 1) + formatGroup.Value
                  + new string('}', endGroup.Captures.Count);
            });

            return string.Format(provider, rewrittenFormat, values.ToArray());
        }
    }
}