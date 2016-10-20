using System;
using System.Collections.Generic;
using DAL;
using MySql.Data.MySqlClient;

namespace Logging
{
    public class clsLogging
    {
        public void WriteLog(Exception ex)
        {
            SQLHelper sqlHelper = new SQLHelper();
            List<MySqlParameter> parameters = new List<MySqlParameter>();
            parameters.Add(new MySqlParameter("_DateTime", DateTime.Now));
            parameters.Add(new MySqlParameter("_ErrorMessage", ex.Message));
            parameters.Add(new MySqlParameter("_ErrorStack", ex.StackTrace));

            sqlHelper.executeSP<int>(parameters, "InsertLog");
        }
    }
}
