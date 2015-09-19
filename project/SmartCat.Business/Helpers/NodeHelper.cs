using SmartCat.Common;
using SmartCat.Entities.DocumentTypes;
using SmartCat.Entities.DocumentTypes.Repository;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Threading;
using umbraco;
using umbraco.NodeFactory;
using Umbraco.Web;
using Vega.USiteBuilder;

namespace SmartCat.Business.Helpers
{
    public static class NodeHelper
    {

        #region PUBLIC PROPERTIES

        public static Settings Settings
        {
            get
            {
                var umbracoHelper = new UmbracoHelper();

                var currentLanguageCulture = Thread.CurrentThread.CurrentCulture.Name;
                
                Settings retVal = new Settings();
               

                switch (currentLanguageCulture)
                {
                    case "en-US":
                        var settingsNodeEn = ContentHelper.GetChildren<Settings>(Configuration.LanguageEN, true).FirstOrDefault();
                        if (settingsNodeEn != null)
                        {
                            retVal = settingsNodeEn;
                        }
                        break;

                    case "nl-NL":
                        var settingsNodeNl = ContentHelper.GetChildren<Settings>(Configuration.LanguageNL, true).FirstOrDefault();
                        if (settingsNodeNl != null)
                        {
                            retVal = settingsNodeNl;
                        }
                        break;
                    default:
                        //default en settings node
                        retVal = ContentHelper.GetByNodeId<Settings>(Configuration.SettingsNodeId);
                        break;
                }

                return retVal;
            }

            //get
            //{
            //    Settings retVal = (Settings)HttpCacheHandler.GetValue(Constants.CacheKeys.Settings);

            //    if (retVal == null)
            //    {
            //        retVal = ContentHelper.GetByNodeId<Settings>(Configuration.SettingsNodeId);
            //        if (retVal != null)
            //        {
            //            HttpCacheHandler.SetValue(Constants.CacheKeys.Settings, retVal);
            //        }
            //    }

            //    return retVal;
            //}
        }

        #region PAGES


        #endregion

        #region NODES

        #endregion

        #endregion

        #region PUBLIC METHODS

        public static Node GetFirstLevelItemNode()
        {
            return uQuery.GetCurrentNode().GetAncestorByPathLevel(2);
        }

        /// <summary>
        /// Gets the URL of child page with template.
        /// </summary>
        /// <param name="nodeId">The node id.</param>
        /// <returns>URL of the first child page that has template.</returns>
        public static string GetUrlOfChildPageWithTemplate(int nodeId)
        {
            string retVal = String.Empty;

            IEnumerable<Node> childNode = uQuery.GetNode(nodeId).GetChildNodes();

            foreach (Node curr in childNode)
            {
                if (curr.template != 0/* && curr.NodeTypeAlias != Constants.DocumentTypes.Virtual*/)
                {
                    retVal = curr.NiceUrl;
                }
                else
                {
                    retVal = NodeHelper.GetUrlOfChildPageWithTemplate(curr.Id);
                }

                if (!String.IsNullOrEmpty(retVal))
                {
                    break;
                }
            }

            return retVal;
        }

        #endregion

        #region PRIVATE METHODS

        /// <summary>
        /// Gets the page.
        /// </summary>
        /// <typeparam name="T">Document type.</typeparam>
        /// <param name="nodeId">The node id.</param>
        /// <param name="nodeName">Name of the page.</param>
        /// <returns>New instance of T.</returns>
        private static T GetNode<T>(int nodeId, string nodeName)
            where T : DocumentTypeBase, new()
        {
            if (nodeId == 0)
            {
                throw new Exception(String.Format("Node id for node '{0}' is not set (please check Settings)!", nodeName));
            }

            return ContentHelper.GetByNodeId<T>(nodeId);
        }

        /// <summary>
        /// Checks the node id.
        /// </summary>
        /// <param name="nodeId">The node id.</param>
        /// <param name="nodeName">Name of the node.</param>
        /// <returns>Node ID if nodeId is different than zero.</returns>
        private static int CheckNodeId(int nodeId, string nodeName)
        {
            if (nodeId == 0)
            {
                throw new Exception(String.Format("Node id for node '{0}' is not set (please check Settings)!", nodeName));
            }

            return nodeId;
        }

        #endregion
    }
}