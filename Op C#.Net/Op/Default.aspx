<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="CRUD._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="font-weight:bold">Create Country</div>
    <span style="height:20px; vertical-align:top">Country Name :</span> 
    <asp:TextBox ID="txtCountryName" runat="server"></asp:TextBox>
    <asp:Button ID="btnCreate" runat="server" Text="Create" 
    onclick="btnCreate_Click" />
    <hr />

    <div style="font-weight:bold">Delete Country By ID</div>
    <span style="height:20px; vertical-align:top">Country ID :</span>
    <asp:TextBox ID="txtDeleteID" runat="server"></asp:TextBox>
    <asp:Button ID="btnDelete" runat="server" Text="Delete" onclick="btnDelete_Click" />
    <hr />

    <div style="font-weight:bold">Search Country</div>
    <span style="height:20px; vertical-align:top">Country Name :</span>
    <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search" 
        onclick="btnSearch_Click" />
    <asp:GridView ID="gvCountryList" runat="server">
    </asp:GridView>
    <hr />
<div style="font-weight:bold">Edit Country</div>
<span style="height:20px; vertical-align:top">Country ID :</span>
<asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" onselectedindexchanged="ddlCountry_SelectedIndexChanged">    
</asp:DropDownList>        
<br />
<span style="height:20px; vertical-align:top">Country Name :</span>
<asp:TextBox ID="txtEditCountryName" runat="server"></asp:TextBox>
<asp:Button ID="btnEditCountryName" runat="server" Text="UpdateCountry" onclick="btnEditCountryName_Click" />
</asp:Content>
