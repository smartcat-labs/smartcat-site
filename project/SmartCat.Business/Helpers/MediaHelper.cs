using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.XPath;
using umbraco;
using Umbraco.Core;
using Umbraco.Core.Models;

namespace SmartCat.Business.Helpers
{

    /// <summary>
    /// Provides utility methods for manipulations with media files.
    /// </summary>
    public static class MediaHelper
    {
        /// <summary>
        /// Gets the media by identifier.
        /// </summary>
        /// <param name="mediaId">The media identifier.</param>
        /// <returns></returns>
        public static Umbraco.Core.Models.Media GetMediaById(int mediaId)
        {
            return (Umbraco.Core.Models.Media)ApplicationContext.Current.Services.MediaService.GetById(mediaId);
        }

        /// <summary>
        /// Gets the children media.
        /// </summary>
        /// <param name="parentMediaId">The parent media identifier.</param>
        /// <returns></returns>
        public static IEnumerable<IMedia> GetChildrenMedia(int parentMediaId)
        {
            return ApplicationContext.Current.Services.MediaService.GetChildren(parentMediaId);
        }

        /// <summary>
        /// Gets the children media.
        /// </summary>
        /// <param name="parentMediaId">The parent media identifier.</param>
        /// <param name="mediaAlias">The media alias.</param>
        /// <returns></returns>
        public static IEnumerable<IMedia> GetChildrenMedia(int parentMediaId, string mediaAlias)
        {
            return ApplicationContext.Current.Services.MediaService.GetChildren(parentMediaId).Where(x => x.ContentType.Alias.Equals(mediaAlias));
        }

        /// <summary>
        /// Gets the media URL.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static string GetMediaUrl(Umbraco.Core.Models.Media media)
        {
            string retVal = string.Empty;

            if (media != null)
            {
                retVal = media.GetValue<string>(SmartCat.Common.Constants.Media.Properties.Url);
            }

            return retVal;
        }

        /// <summary>
        /// Gets the image alternate text.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static string GetImageAlternateText(Umbraco.Core.Models.Media media)
        {
            string retVal = string.Empty;

            if (media != null && media.HasProperty(SmartCat.Common.Constants.Media.Properties.AlternateText))
            {
                retVal = Common.Constants.DefaultValues.SiteName + " " + media.GetValue<string>(SmartCat.Common.Constants.Media.Properties.AlternateText);
            }

            return retVal;
        }

        /// <summary>
        /// Gets the image caption text.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static string GetImageCaptionText(Umbraco.Core.Models.Media media)
        {
            string retVal = string.Empty;

            if (media != null && media.HasProperty(SmartCat.Common.Constants.Media.Properties.Caption))
            {
                retVal = media.GetValue<string>(SmartCat.Common.Constants.Media.Properties.Caption);
            }

            return retVal;
        }

        /// <summary>
        /// Gets the media alternate text.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static string GetMediaAlternateText(this umbraco.cms.businesslogic.media.Media media)
        {
            string retVal = string.Empty;

            if (media != null)
            {
                retVal = media.GetProperty<string>(Common.Constants.Media.Properties.AlternateText);
            }

            return !string.IsNullOrEmpty(retVal) ? Common.Constants.DefaultValues.SiteName + " " + retVal : Common.Constants.DefaultValues.SiteName;
        }

        /// <summary>
        /// Gets the media name by identifier.
        /// </summary>
        /// <param name="mediaId">The media identifier.</param>
        /// <returns></returns>
        public static string GetMediaNameById(int mediaId)
        {
            string retVal = String.Empty;
            try
            {
                XPathNodeIterator xpathNodeIterator = umbraco.library.GetMedia(mediaId, false);
                if (xpathNodeIterator != null && mediaId != 0)
                {
                    xpathNodeIterator.MoveNext();
                    retVal = xpathNodeIterator.Current.SelectSingleNode("@nodeName").Value;
                }
            }
            catch
            {
            }

            return retVal;
        }

        /// <summary>
        /// Gets all available images.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static IEnumerable<Media> GetAllAvailableImages(Media media)
        {
            return media.Children()
                        .Select(x => (Media)x)
                        .Where(x => x.ContentType.Alias.Equals(Common.Constants.Media.ContentTypes.Image))
                        .Where(x => !string.IsNullOrEmpty(x.GetValue<string>(Common.Constants.Media.Properties.Size)));
        }

        public static string GetImageCropUrl(int mediaId, string propertyAlias)
        {
            string retVal = string.Empty;

            umbraco.cms.businesslogic.media.Media media = new umbraco.cms.businesslogic.media.Media(mediaId);

            if (media != null)
            {
                retVal = media.GetImageCropperUrl(Common.Constants.Media.Properties.Crops, propertyAlias);
            }

            if (string.IsNullOrEmpty(retVal))
            {
                retVal = media.GetProperty<string>(Common.Constants.Media.Properties.Url);
            }

            return retVal;
        }

        #region EXTENSIONS

        /// <summary>
        /// Gets the media download URL.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static string GetMediaDownloadUrl(this Media media)
        {
            return media.GetValue<string>(Common.Constants.Media.Properties.Url);
        }

        /// <summary>
        /// Gets the size of the formated.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static string GetFormatedSize(this umbraco.cms.businesslogic.media.Media media)
        {
            string retVal = string.Empty;
            string mediaSizeInBytes = media.getProperty(Common.Constants.Media.Properties.Size).Value.ToString();

            if (!string.IsNullOrEmpty(mediaSizeInBytes))
            {
                decimal tmpMb = Convert.ToInt32(mediaSizeInBytes) / 1048576;

                if (tmpMb >= 1)
                {
                    decimal roundMb = Math.Round(tmpMb, 2);
                    retVal = roundMb.ToString() + " mb";
                }
                else
                {
                    decimal tmpKb = Convert.ToInt32(mediaSizeInBytes) / 1024;
                    retVal = Math.Round(tmpKb, 2).ToString() + " kb";
                }
            }

            return retVal;
        }

        /// <summary>
        /// Formats the size.
        /// </summary>
        /// <param name="bytes">The bytes.</param>
        /// <returns></returns>
        public static string FormatSize(string bytes)
        {
            string retVal = string.Empty;

            if (!string.IsNullOrEmpty(bytes))
            {
                decimal tmpMb = Convert.ToInt32(bytes) / 1048576;

                if (tmpMb >= 1)
                {
                    decimal roundMb = Math.Round(tmpMb, 2);
                    retVal = roundMb.ToString() + "mb";
                }
                else
                {
                    decimal tmpKb = Convert.ToInt32(bytes) / 1024;
                    retVal = Math.Round(tmpKb, 2).ToString() + "kb";
                }
            }

            return retVal;
        }

        /// <summary>
        /// Gets the type of the media.
        /// </summary>
        /// <param name="media">The media.</param>
        /// <returns></returns>
        public static string GetMediaType(this Media media)
        {
            return media.GetValue<string>(Common.Constants.Media.Properties.Extension).ToUpper();
        }

        /// <summary>
        /// Medias the exists.
        /// </summary>
        /// <param name="mediaId">The media identifier.</param>
        /// <returns></returns>
        public static bool MediaExists(int mediaId)
        {
            return MediaHelper.GetMediaIfExists(mediaId) != null;
        }

        /// <summary>
        /// Gets the media if exists.
        /// </summary>
        /// <param name="mediaId">The media identifier.</param>
        /// <returns></returns>
        public static umbraco.cms.businesslogic.media.Media GetMediaIfExists(int mediaId)
        {
            umbraco.cms.businesslogic.media.Media retVal = null;
            if (mediaId != 0)
            {
                retVal = new umbraco.cms.businesslogic.media.Media(mediaId);
                if (string.IsNullOrEmpty(retVal.GetProperty<string>(SmartCat.Common.Constants.Media.Properties.Size)))
                {
                    retVal = null;
                }
            }

            return retVal;
        }

        #endregion
    }
}