using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PROP
{
    public class PROPCountry
    {
        public int CountryID { get; set; }
        public string CountryName { get; set; }

        public PROPCountry()
        {

        }

        public PROPCountry(int countryID, string countryName)
        {
            this.CountryID = countryID;
            this.CountryName = countryName;
        }        
    }
}
