<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <style>
        table, th, td {
            border: 0px solid black;
            padding-bottom:10px;
        } 
        table, tr{
            padding-bottom:10px;
        }
        .tab { 
            font-size: larger;
    font-weight: bold;
           
        }
    </style>
    <div>

        <p align="center" align="center" class="tab">Admin Login</p>
         

             <table align="center">
  <tr>
    <td align="center" class="tab">Username</td>
    <td>
        <asp:TextBox ID="username" runat="server"></asp:TextBox>
    </td>
    
  </tr>
                 <tr>
    <td align="center" class="tab">Password</td>
    <td>
        <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
    </td>
                    
    
  </tr>
                 
                 <tr>
    <td align="center" class="tab"></td>
    <td>
        <asp:Label ID="error" runat="server" CssClass="error"></asp:Label>
    </td>
                    
    
  </tr>
</table>
       <p align="center"  class="tab">
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" CssClass="comButton" />
        </p>
       <%--  <p align="center"">
            <asp:Label ID="Label1" runat="server" Text="If don't have an account please register here "></asp:Label> 
            <a href="Register.aspx"> Register</a>
           
            </p>--%>
    </div>
</asp:Content>

