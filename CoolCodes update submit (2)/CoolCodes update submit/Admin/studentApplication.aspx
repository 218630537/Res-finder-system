<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="studentApplication.aspx.cs" Inherits="Admin_studentApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">

        table{
            padding-bottom:10px;
        }
        table {
            border: 0px solid black;
            padding-bottom:10px;
        }
        tr{
            padding-bottom:10px;
        }
        .tab { 
            font-size: larger;
    font-weight: bold;
           
        }
        td {
            border: 0px solid black;
            padding-bottom:10px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">

            <p style="font-size: x-large; font-weight: bold;" align="center">Application</p>
        </asp:Panel>
    <table style="width: 50%" align="center">
         <tr>
            <td align="center" class="tab">ID Number</td>
            <td>
                <asp:TextBox ID="idNumber" runat="server" AutoPostBack="True" OnTextChanged="idNumber_TextChanged" ></asp:TextBox>
            </td>
              <td>
             <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="selectApp" DataTextField="ID NUMBER" DataValueField="ID NUMBER" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="228px"></asp:ListBox>
               
                  <asp:SqlDataSource ID="selectApp" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="Select  distinct IDNUMBER 'ID NUMBER' from application 
order by year,applicationid"></asp:SqlDataSource>
               
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Name</td>
            <td>
                <asp:Label ID="name" text="name" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Surname</td>
            <td>
                <asp:Label ID="surname"  text="surname" runat="server"></asp:Label>
            </td>
        </tr>
       
        <tr>
            <td align="center" class="tab">EmailAddress</td>
            <td>
                <asp:Label ID="email"  Text="email" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Student Number</td>
            <td>
                <asp:Label ID="studNumber"  text="studNumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Institution</td>
            <td>
                <asp:Label ID="institution" text="institution" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Cell Number</td>
            <td>
                <asp:Label ID="cellNumber" text="cellNumber" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Application ID</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="applications" DataTextField="applicationID" DataValueField="applicationID" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Select ID</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="populate" />
                <asp:SqlDataSource ID="applications" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select applicationID from Application where idnumber =?">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="idNumber" Name="?" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Year</td>
            <td>
                <asp:Label ID="year" text="year" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Resident City</td>
            <td>
                <asp:Label ID="city" text="City" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="tab">Resident</td>
            <td>
                <asp:Label ID="resident" text="resident" runat="server"></asp:Label>
            </td>
        </tr>
          <tr>
            <td align="center" class="tab">Status</td>
            <td>
                <asp:DropDownList ID="status" runat="server" Width="162px" OnSelectedIndexChanged="status_SelectedIndexChanged">
                    <asp:ListItem>Pending</asp:ListItem>
                    <asp:ListItem>Approved</asp:ListItem>
                    <asp:ListItem>Rejected</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
           <td>

           </td>
            <td>
                <br />
                <asp:Button ID="update" runat="server" Text="UPDATE" OnClick="update_Click" />
            </td>
        </tr>
    </table>

</asp:Content>

