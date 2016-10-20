using System;
using DAL;
using PROP;
using System.Collections.Generic;
namespace BAL
{
    public class BALCountry
    {
        public int CreateCountry(string countryName)
        {
            if (string.IsNullOrEmpty(countryName))
            {
                return -1;
            }
            else
            {
                DALCountry dalCountry = new DALCountry();
                return dalCountry.CreateCountry(countryName);
            }
        }

        public List<PROPCountry> getCoutry(string searchCountry)
        {
            DALCountry dalCountry = new DALCountry();

            if (string.IsNullOrEmpty(searchCountry))
            {
                return dalCountry.getAllCountry();
            }
            else
            {
                return dalCountry.getCountry(searchCountry);
            }
        }

        public int deleteCountry(string stringCountryID)
        {
            int countryID;
            DALCountry dalCountry = new DALCountry();
            int.TryParse(stringCountryID, out countryID);

            if (countryID == 0)
            {
                return 0;
            }
            else
            {
                return dalCountry.DeleteCountry(countryID);
            }
        }

        public string getCountryByID(string stringCountryID)
        {
            int countryID;
            DALCountry dalCountry = new DALCountry();
            int.TryParse(stringCountryID, out countryID);
            if (countryID == 0)
            {
                return string.Empty;
            }
            else
            {
                return dalCountry.GetCountryById(countryID);
            }
        }

        public bool updateCountry(PROPCountry country)
        {
            if (string.IsNullOrEmpty(country.CountryName) || country.CountryID <= 0)
            {
                return false;
            }
            else
            {
                DALCountry dalCountry = new DALCountry();
                dalCountry.UpdateCountry(country);
                return true;
            }
        }
    }
}
