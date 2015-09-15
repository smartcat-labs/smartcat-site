using System;
using umbraco.BusinessLogic;

namespace SmartCat.Common
{
    public static class Logger
    {
        #region PROPERTIES

        /// <summary>
        /// User logger.
        /// </summary>
        private static User user = null;

        /// <summary>
        /// Gets the user.
        /// </summary>
        /// <value>The user logger.</value>
        private static User User
        {
            get
            {
                if (user == null)
                {
                    user = User.getAllByLoginName("logger")[0];
                }

                return user;
            }
        }

        #endregion

        #region PUBLIC METHODS

        /// <summary>
        /// Logs the debug.
        /// </summary>
        /// <param name="format">The format.</param>
        /// <param name="args">The arguments.</param>
        public static void LogDebug(string format, params object[] args)
        {
            Logger.AddLog(LogTypes.Debug, format, args);
        }

        /// <summary>
        /// Logs the info.
        /// </summary>
        /// <param name="format">The format.</param>
        /// <param name="args">The arguments.</param>
        public static void LogInfo(string format, params object[] args)
        {
            Logger.AddLog(LogTypes.System, format, args);
        }

        /// <summary>
        /// Logs the error.
        /// </summary>
        /// <param name="format">The format.</param>
        /// <param name="args">The arguments.</param>
        public static void LogError(string format, params object[] args)
        {
            Logger.AddLog(LogTypes.Error, format, args);
        }

        /// <summary>
        /// Logs the exception.
        /// </summary>
        /// <param name="exc">The exception.</param>
        /// <param name="format">The format.</param>
        /// <param name="args">The args objects.</param>
        public static void LogException(Exception exc, string format, params object[] args)
        {
            System.Diagnostics.StackTrace trace = new System.Diagnostics.StackTrace(exc, true);

            string excDetails = String.Format("Method name: {0}. Line number: {1}, Column: {2}", trace.GetFrame(0).GetMethod().Name, trace.GetFrame(0).GetFileLineNumber(), trace.GetFrame(0).GetFileColumnNumber());

            string message = String.Format(format, args);
            message += ". Exception message: " + exc.Message + ", Details (" + excDetails + "), Exception stack trace: " + exc.StackTrace;
            if (exc.InnerException != null)
            {
                message += ". Inner Exception message: " + exc.InnerException.Message + ", Inner Exception stack trace: " + exc.InnerException.StackTrace;
            }

            Log.Add(LogTypes.Error, Logger.User, -1, message);
        }

        #endregion

        #region PRIVATE METHODS

        /// <summary>
        /// Adds the log.
        /// </summary>
        /// <param name="logType">Type of the log.</param>
        /// <param name="format">The format.</param>
        /// <param name="args">The object array.</param>
        private static void AddLog(LogTypes logType, string format, params object[] args)
        {
            string message = String.Format(format, args);

            Log.Add(logType, Logger.User, -1, message);
        }

        #endregion
    }
}
