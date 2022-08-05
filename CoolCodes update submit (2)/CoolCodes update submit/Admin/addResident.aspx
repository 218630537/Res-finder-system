<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="addResident.aspx.cs" Inherits="Admin_sddResident" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 59px;
        }
        .auto-style2 {
            height: 47px;
        }
        .auto-style3 {
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    

     <div align="center" style="width: 60%; padding-left: 15%">

        <asp:Panel ID="Panel1" runat="server">

            <p style="font-size: x-large; font-weight: bold;">Add Resident</p>
        </asp:Panel>

    </div>

    <table style="width: 50%" align="center">
             <tr>
                <td align="center" class="tab">Resident Name</td>
                <td>
                    
                    <asp:TextBox ID="ressName" runat="server" required="true"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td align="center" class="auto-style1">Resident Town</td>
                <td class="auto-style1">
                    
                    <asp:DropDownList ID="ressTown" runat="server" DataSourceID="getTown" DataTextField="townname" DataValueField="townname" Height="16px" Width="132px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getTown" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT townname FROM town"></asp:SqlDataSource>
                    
                </td>

            </tr>
            <tr>
                <td align="center" class="tab">Resident Institution</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="getRessname" DataTextField="institutionID" DataValueField="institutionID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="getRessname" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="Select institutionID from institution"></asp:SqlDataSource>
                </td>

            </tr>
        <tr>
            <td align="center" class="auto-style3">Resident Picture</td>
            <td class="auto-style3">
                &nbsp;<%--<input type="file" id="ressImage" accept="image/*" />--%> 
                 
                    <INPUT id="oFile" type="file" runat="server" NAME="oFile">
                    
                    <asp:Panel ID="frmConfirmation" Visible="False" Runat="server">
     <asp:Label id="lblUploadResult" Runat="server"></asp:Label>
              </asp:Panel>
        </tr>
        <tr>
            <td  align="center" class="tab">
                

                
            </td>
            
            <td>
                <asp:button id="btnUpload" type="submit" text="Upload image" runat="server" OnClick="btnUpload_Click1"></asp:button>
            </td>
        </tr>

        <tr>
            <td class="auto-style2">

                <%--<asp:Label ID="error1" runat="server" Text="Label"></asp:Label>--%>

            </td>
            <td class="auto-style2">

                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Resident" Visible="False" />
                &nbsp; &nbsp; 
                <asp:Label ID="error1" runat="server"></asp:Label>

            </td>
        </tr>
        </table>

</asp:Content>

