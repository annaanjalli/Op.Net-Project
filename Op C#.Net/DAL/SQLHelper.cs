﻿namespace DAL
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Text;
    using MySql.Data.MySqlClient;
    using System.Data;
    using System.Configuration;

    public class SQLHelper
    {
        string connString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;

        public void executenonquery(List<MySqlParameter> parameters, string SPName)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connString))
                {
                    using (MySqlCommand cmd = new MySqlCommand(SPName, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        foreach (MySqlParameter param in parameters)
                        {
                            cmd.Parameters.Add(param);
                        }

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public string executeScaler(List<MySqlParameter> parameters, string SPName)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connString))
                {
                    using (MySqlCommand cmd = new MySqlCommand(SPName, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        foreach (MySqlParameter param in parameters)
                        {
                            cmd.Parameters.Add(param);
                        }

                        con.Open();
                        return Convert.ToString(cmd.ExecuteScalar());
                    }
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public T executeSP<T>(List<MySqlParameter> parameters, string SPName)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connString))
                {
                    using (MySqlCommand cmd = new MySqlCommand(SPName, con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        foreach (MySqlParameter param in parameters)
                        {
                            cmd.Parameters.Add(param);
                        }

                        if (typeof(T) == typeof(DataSet))
                        {
                            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                            DataSet dset = new DataSet();
                            con.Open();
                            adapter.Fill(dset);
                            return (T)(object)dset;
                        }
                        else if (typeof(T) == typeof(int) || typeof(T) == typeof(string))
                        {
                            MySqlParameter _ReturnValue = new MySqlParameter("_ReturnValue", MySqlDbType.Int32);
                            _ReturnValue.Direction = System.Data.ParameterDirection.Output;
                            cmd.Parameters.Add(_ReturnValue);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            return (T)_ReturnValue.Value;
                        }
                        else
                        {
                            return default(T);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

    }
}
