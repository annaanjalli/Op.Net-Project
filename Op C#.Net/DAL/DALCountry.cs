using System.Collections.Generic;
using MySql.Data.MySqlClient;
using PROP;
using System.Data;
using System;

namespace DAL
{
    public class DALCountry
    {
        public int CreateCountry(string countryName)
        {            
            SQLHelper sqlHelper = new SQLHelper();
            List<MySqlParameter> parameters = new List<MySqlParameter>();
            parameters.Add(new MySqlParameter("_CountryName", countryName));

            return sqlHelper.executeSP<int>(parameters, "InsertCountry");
        }

        public List<PROPCountry> getAllCountry()
        {
            List<PROPCountry> countryList = new List<PROPCountry>();
            SQLHelper sqlHelper = new SQLHelper();
            List<MySqlParameter> parameters = new List<MySqlParameter>();
            var resultSet = sqlHelper.executeSP<DataSet>(parameters, "getAllCountry");


            PROPCountry country;
            foreach (DataRow drow in resultSet.Tables[0].Rows)
            {
                country = new PROPCountry(Convert.ToInt32(drow[0].ToString()) , drow[1].ToString());
                countryList.Add(country);
            }

            return countryList;
        }

        public List<PROPCountry> getCountry(string searchCountry)
        {
            List<PROPCountry> countryList = new List<PROPCountry>();
            SQLHelper sqlHelper = new SQLHelper();
            List<MySqlParameter> parameters = new List<MySqlParameter>();
            parameters.Add(new MySqlParameter("_CountryName", searchCountry));
            var resultSet = sqlHelper.executeSP<DataSet>(parameters, "SelectCountryByName");

            PROPCountry country;
            foreach (DataRow drow in resultSet.Tables[0].Rows)
            {
                country = new PROPCountry(Convert.ToInt32(drow[0].ToString()), drow[1].ToString());
                countryList.Add(country);
            }

            return countryList;
        }

        public int DeleteCountry(int countryID)
        {
            SQLHelper sqlHelper = new SQLHelper();
            List<MySqlParameter> lstParameter = new List<MySqlParameter>();
            lstParameter.Add(new MySqlParameter("_CountryID", countryID));
            return sqlHelper.executeSP<int>(lstParameter, "DeleteCountry");                
        }

        public string GetCountryById(int countryID)
        {
            SQLHelper sqlHelper = new SQLHelper();
            List<MySqlParameter> lstParameter = new List<MySqlParameter>();
            lstParameter.Add(new MySqlParameter("_CountryID", countryID));
            return sqlHelper.executeScaler(lstParameter, "SelectCountryByID");                
        }

        public void UpdateCountry(PROPCountry country)
        {
            SQLHelper sqlHelper = new SQLHelper();
            List<MySqlParameter> lstParameter = new List<MySqlParameter>();
            lstParameter.Add(new MySqlParameter("_CountryID", country.CountryID));
            lstParameter.Add(new MySqlParameter("_CountryName", country.CountryName));
            sqlHelper.executenonquery(lstParameter, "UpdateCountryName");
        }
    }
}
