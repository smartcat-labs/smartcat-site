namespace SmartCat.Business.Twitter
{
    using Common;
    using Common.Utility;
    using LinqToTwitter;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public static class TwitterHandler
    {
        private static IOAuthCredentials _credentials;

        /// <summary>
        /// Gets the twitter username.
        /// </summary>
        /// <returns>Twitter username</returns>
        public static string GetTwitterUsername()
        {
            return String.Format("@{0}", SmartCat.Common.Configuration.TwitterScreenName);
        }

        private static IOAuthCredentials GetCredentials()
        {
            if (_credentials == null)
            {
                _credentials = new InMemoryCredentials
                {
                    //Twitter Consumer Key
                    ConsumerKey = SmartCat.Common.Configuration.TwitterConsumerKey,
                    //Twitter Consumer Secret
                    ConsumerSecret = SmartCat.Common.Configuration.TwitterConsumerSecret,
                    //OAuth Token
                    OAuthToken = SmartCat.Common.Configuration.TwitterOAuthToken,
                    //Access Token
                    AccessToken = SmartCat.Common.Configuration.TwitterAccessTokenSecret,
                    //Screen Name
                    ScreenName = SmartCat.Common.Configuration.TwitterScreenName,
                    //User ID
                    UserId = SmartCat.Common.Configuration.TwitterUserID
                };
            }

            return _credentials;
        }

        /// <summary>
        /// Gets the last tweet.
        /// </summary>
        /// <returns>Last tweet text.</returns>
        public static string GetLastTweet(int expirationMinutes)
        {
            string retVal = String.Empty;
            Tweet lastTweet = (Tweet)HttpCacheHandler.GetValue(Constants.CacheKeys.LastTweet);
            if (lastTweet == null)
            {
                List<Tweet> tweets = GetSpecificNumberOfLastTweets(1);
                if (tweets != null && tweets.Count > 0)
                {
                    retVal = tweets[0].Text;
                    HttpCacheHandler.SetValueWithAbsoluteExpiration(Constants.CacheKeys.LastTweet, tweets[0], DateTime.Now.AddMinutes(expirationMinutes));
                }
            }
            else
            {
                retVal = lastTweet.Text;
            }

            return retVal;
        }

        public static List<Tweet> GetLatestTweets(int numberOfItems, int expirationMinutes)
        {
            List<Tweet> retVal = new List<Tweet>();

            if (SmartCat.Common.Configuration.TwitterEnabled)
            {
                List<Tweet> cachedTweets = (List<Tweet>)HttpCacheHandler.GetValue(Constants.CacheKeys.LastTweets);

                if (cachedTweets == null)
                {
                    List<Tweet> tweets = TwitterHandler.GetSpecificNumberOfLastTweets(numberOfItems);

                    if (tweets != null && tweets.Count > 0)
                    {
                        retVal = tweets;
                        HttpCacheHandler.SetValueWithAbsoluteExpiration(Constants.CacheKeys.LastTweets, tweets, DateTime.Now.AddMinutes(expirationMinutes));
                    }
                }
                else
                {
                    retVal = cachedTweets;
                }
            }

            return retVal;
        }

        /// <summary>
        /// Gets the specific number of last tweets.
        /// </summary>
        /// <param name="tweetCount">The tweet count.</param>
        /// <returns>Collection of <see cref="Tweet"/>.</returns>
        private static List<Tweet> GetSpecificNumberOfLastTweets(int tweetCount)
        {
            WebAuthorizer auth = new WebAuthorizer();
            auth.Credentials = GetCredentials();

            var twitterCtx = new TwitterContext(auth);
            var statusTweets = (from tweet in twitterCtx.Status
                                where tweet.Type == StatusType.User &&
                                      tweet.ScreenName == GetTwitterUsername()
                                select new Tweet
                                {
                                    Id = tweet.StatusID,
                                    Text = Utility.AddLinksToTweets(tweet.Text),
                                    Date = tweet.CreatedAt
                                }).Take(tweetCount);

            return statusTweets.ToList();
        }
    }
}