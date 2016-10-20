using System;
using System.Web.UI;
using BAL;
using Logging;

namespace CRUD
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                binding(null);
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            BALCountry balCountry = new BALCountry();
            
            try
            {                
                int returnValue = balCountry.CreateCountry(txtCountryName.Text);
                if (returnValue > 0)
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Country is created successfully')</script>");
                    txtCountryName.Text = string.Empty;
                }
                else
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Incorrect User Inputs.')</script>");
                }
            }
            catch (Exception ex)
            {
                clsLogging logError = new clsLogging();
                logError.WriteLog(ex);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            BALCountry balCountry = new BALCountry();
            try
            {
                int returnValue = balCountry.deleteCountry(txtDeleteID.Text);
                if (returnValue == 0)
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Incorrect Country Id')</script>");
                }
                else if(returnValue == -2)
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Country ID could not found.')</script>");
                }
                else if (returnValue == 1)
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Country is deleted successfully.')</script>");
                    binding(null);
                    txtDeleteID.Text = string.Empty;
                }
                else
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Unspecified error.')</script>");
                }
            }
            catch (Exception ex)
            {
                clsLogging logError = new clsLogging();
                logError.WriteLog(ex);                
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            binding(txtSearchName.Text);
        }        

        protected void btnEditCountryName_Click(object sender, EventArgs e)
        {
            try
            {
                PROP.PROPCountry country = new PROP.PROPCountry();
                country.CountryID = Convert.ToInt16(ddlCountry.SelectedValue);
                country.CountryName = txtEditCountryName.Text;

                BALCountry balCountry = new BALCountry();
                bool result = balCountry.updateCountry(country);

                if (!result)
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Invalid Inputs for update.')</script>");
                }
                else
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Country is updated successfully.')</script>");
                    binding(null);
                    ddlCountry.SelectedIndex = 0;
                    txtEditCountryName.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                clsLogging logError = new clsLogging();
                logError.WriteLog(ex);                                                 
            }
        }

        private void binding(string searchCountry)
        {
            try
            {
                BALCountry balCountry = new BALCountry();
                gvCountryList.DataSource = balCountry.getCoutry(searchCountry);
                gvCountryList.DataBind();
                
                ddlCountry.DataSource = balCountry.getCoutry(null);
                ddlCountry.DataValueField = "CountryID";
                ddlCountry.DataTextField = "CountryName";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0,new System.Web.UI.WebControls.ListItem("Select Country to Edit", "-1"));
            }
            catch (Exception ex)
            {
                clsLogging logError = new clsLogging();
                logError.WriteLog(ex);                                                 
            }            
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            string countryName = string.Empty;
            BALCountry balCountry = new BALCountry();
            try
            {
                countryName = balCountry.getCountryByID(ddlCountry.SelectedValue);
                if (string.IsNullOrEmpty(countryName))
                {
                    Page.RegisterClientScriptBlock("message", "<script>alert('Country Id is not found.')</script>");
                }
                else
                {
                    txtEditCountryName.Text = countryName;
                }
            }
            catch (Exception ex)
            {
                clsLogging logError = new clsLogging();
                logError.WriteLog(ex);
            }   
        }
    }
}
