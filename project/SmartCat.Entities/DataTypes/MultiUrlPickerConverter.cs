using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.IO;
using Vega.USiteBuilder.Types;

namespace SmartCat.Entities.DataTypes
{
    /// <summary>
    /// Class used for conversion of Umbraco property value to instance of RelatedLink.
    /// </summary>
    public class MultiUrlPickerConverter : ICustomTypeConvertor
    {
        #region [ICustomTypeConvertor Members]
        /// <summary>
        /// Gets the Type that this convertor converts to and from
        /// </summary>
        public Type ConvertType
        {
            get
            {
                return typeof(List<UrlPicker>);
            }
        }

        /// <summary>
        /// Converts inputValue to other type and returns converted value. This method is used when reading item from Umbraco.
        /// </summary>
        /// <param name="inputValue">Input value (for example string xml)</param>
        /// <returns>
        /// Output value (instance of class created from input xml, could be anything)
        /// </returns>
        public object ConvertValueWhenRead(object inputValue)
        {
            List<UrlPicker> retVal = new List<UrlPicker>();

            if (inputValue != null && (string)inputValue != String.Empty)
            {
                JsonTextReader jsreader = new JsonTextReader(new StringReader(inputValue.ToString()));
                JArray json = (JArray)new JsonSerializer().Deserialize(jsreader);

                foreach (var jtoken in json.AsJEnumerable())
                {
                    UrlPicker link = new UrlPicker();

                    link.Name = (string)jtoken["name"];
                    link.Url = (string)jtoken["url"];
                    link.Target = (string)jtoken["target"];
                    retVal.Add(link);
                }
            }

            return retVal;
        }

        /// <summary>
        /// Converts inputValue to other type and returns converted value. This method is used when writting item to Umbraco (e.g. with ContentHelper.Save).
        /// </summary>
        /// <param name="inputValue">Input value (for example List of RelatedLinks)</param>
        /// <returns>Output value (string or xml)</returns>
        public object ConvertValueWhenWrite(object inputValue)
        {
            return Newtonsoft.Json.JsonConvert.SerializeObject(inputValue);
        }
        #endregion
    }
}
