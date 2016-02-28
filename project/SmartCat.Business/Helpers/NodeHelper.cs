using SmartCat.Common;
using SmartCat.Entities.DocumentTypes;
using SmartCat.Entities.DocumentTypes.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using umbraco;
using umbraco.NodeFactory;
using Vega.USiteBuilder;

namespace SmartCat.Business.Helpers
{
    public static class NodeHelper
    {
        #region PUBLIC PROPERTIES

        public static Repository Repository
        {
            get
            {
                var currentLanguageCulture = Thread.CurrentThread.CurrentCulture.Name;

                Repository repository = null;

                switch (currentLanguageCulture)
                {
                    case "en-US":
                        var repositoryNodeEn = ContentHelper.GetChildren<Repository>(Configuration.LanguageEN, true).FirstOrDefault();
                        if (repositoryNodeEn != null)
                        {
                            repository = repositoryNodeEn;
                        }
                        break;
                    case "nl-NL":
                        var repositoryNodeNl = ContentHelper.GetChildren<Settings>(Configuration.LanguageNL, true).FirstOrDefault();
                        if (repositoryNodeNl != null)
                        {
                            repository = repositoryNodeNl;
                        }
                        break;
                }

                return repository;
            }
        }

        public static Settings Settings
        {
            get
            {
                var currentLanguageCulture = Thread.CurrentThread.CurrentCulture.Name;

                Settings retVal = null;

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
                }

                return retVal;
            }

        }

        public static Widgets Widgets
        {
            get
            {
                var currentLanguageCulture = Thread.CurrentThread.CurrentCulture.Name;

                Widgets retVal = null;

                switch (currentLanguageCulture)
                {
                    case "en-US":
                        var widgetsNodeEn = ContentHelper.GetChildren<Widgets>(Configuration.LanguageEN, true).FirstOrDefault();
                        if (widgetsNodeEn != null)
                        {
                            retVal = widgetsNodeEn;
                        }
                        break;

                    case "nl-NL":
                        var widgetsNodeNl = ContentHelper.GetChildren<Widgets>(Configuration.LanguageNL, true).FirstOrDefault();
                        if (widgetsNodeNl != null)
                        {
                            retVal = widgetsNodeNl;
                        }
                        break;
                }

                return retVal;
            }
        }

        #region PAGES

        public static Home Home
        {
            get
            {
                var currentLanguageCulture = Thread.CurrentThread.CurrentCulture.Name;

                Home retVal = null;

                switch (currentLanguageCulture)
                {
                    case "en-US":
                        var homeNodeEn = ContentHelper.GetChildren<Home>(Configuration.LanguageEN, true).FirstOrDefault();
                        if (homeNodeEn != null)
                        {
                            retVal = homeNodeEn;
                        }
                        break;

                    case "nl-NL":
                        var homeNodeNl = ContentHelper.GetChildren<Home>(Configuration.LanguageNL, true).FirstOrDefault();
                        if (homeNodeNl != null)
                        {
                            retVal = homeNodeNl;
                        }
                        break;
                    default:
                        //default en settings node
                        retVal = null; // TODO: Do we need a default home node defined from app settings ?
                        break;
                }

                return retVal;
            }
        }

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