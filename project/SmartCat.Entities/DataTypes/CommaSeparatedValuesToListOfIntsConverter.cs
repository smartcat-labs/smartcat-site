namespace SmartCat.Entities.DataTypes
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    using Vega.USiteBuilder.Types;

    /// <summary>
    /// MultiNodeTreePickerConverter class
    /// </summary>
    public class CommaSeparatedValuesToListOfIntsConverter : ICustomTypeConvertor
    {
        #region ICustomTypeConvertor Members

        /// <summary>
        /// Gets the Type that this convertor converts to and from
        /// </summary>
        /// <value></value>
        public Type ConvertType
        {
            get { return typeof(List<int>); }
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
            List<int> retVal = new List<int>();

            if (inputValue != null)
            {
                string csv = (string)inputValue;

                if (!String.IsNullOrEmpty(csv))
                {
                    foreach (string nodeId in csv.Split(','))
                    {
                        if (!String.IsNullOrEmpty(nodeId))
                        {
                            retVal.Add(Int32.Parse(nodeId));
                        }
                    }
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
            List<int> nodeIds = (List<int>)inputValue;

            string xml = "<![CDATA[{0}]]>";

            return string.Format(xml, String.Join(",", nodeIds.Select<int, string>(s => s.ToString()).ToArray()));
        }

        #endregion ICustomTypeConvertor Members
    }
}