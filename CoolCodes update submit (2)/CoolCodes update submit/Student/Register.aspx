<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Student_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
        .auto-style1 {
            width: 141px;
        }
    </style>
    <div align="center" style="width: 60%; padding-left: 15%">

        <asp:Panel ID="Panel1" runat="server">

            <p style="font-size: x-large; font-weight: bold;">Registration</p>
        </asp:Panel>


    </div>
    <div align="center" style="width: 60%; padding-left: 15%">
        <table style="width: 72%">
             <tr>
                <td align="center" class="tab">Name</td>
                <td>
                    <asp:TextBox ID="name" runat="server" ></asp:TextBox>
                </td>
                 <td class="auto-style1">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required" ControlToValidate="name" CssClass="error"></asp:RequiredFieldValidator>
                 </td>

            </tr>
            <tr>
                <td align="center" class="tab">Surname</td>
                <td>
                    <asp:TextBox ID="surname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Surname required" ControlToValidate="surname" CssClass="error"></asp:RequiredFieldValidator>
                 </td>

            </tr>
            <tr>
                <td align="center" class="tab">ID Number</td>
                <td>
                    <asp:TextBox ID="idnumber" runat="server" OnTextChanged="idnumber_TextChanged" MaxLength="13" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="auto-style1">
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="idnumber" CssClass="error" 
                         ErrorMessage="RegularExpressionValidator" ValidationExpression="\d{13}[\d|X]|\d{13}">ID must be 13 numbers only</asp:RegularExpressionValidator>
               
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="ID required" ControlToValidate="idnumber" CssClass="error"></asp:RequiredFieldValidator>
                   <br /> <asp:Label ID="regID" runat="server" Visible="False" Text="ID number is registerd" CssClass="error"></asp:Label>
                
                </td>

            </tr>
            <tr>
                <td align="center" class="tab">EmailAddress</td>
                <td>
                    <asp:TextBox ID="email" runat="server" OnTextChanged="email_TextChanged" TextMode="Email" AutoPostBack="true"></asp:TextBox>
                </td>
                 <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="emal required" ControlToValidate="email" CssClass="error"></asp:RequiredFieldValidator>
                    <br>
                     <asp:Label ID="emailReg" runat="server" Visible="False" Text="Email exist" CssClass="error"></asp:Label>
                      </td>

            </tr>
            <tr>
                <td align="center" class="tab">Student Number</td>
                <td>
                    <asp:TextBox ID="studNumber" TextMode="Number" runat="server"></asp:TextBox>
                </td>
                 <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="student number required" ControlToValidate="studNumber" CssClass="error"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td align="center" class="tab">Institution</td>
                <td>
                    <asp:DropDownList ID="institutionID" runat="server" style="margin-left: 0px" Width="190px" DataSourceID="SqlDataSource1" DataTextField="institutionName" DataValueField="institutionID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT institutionID, institutionName FROM coolcodes.institution"></asp:SqlDataSource>
                </td>

            </tr>
            <tr>
                <td align="center" class="tab">Cell Number</td>
                <td>
                    <asp:TextBox ID="cellNumber" runat="server"></asp:TextBox>
                </td>
                 <td class="auto-style1">
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="cellNumber" CssClass="error" 
                         ErrorMessage="RegularExpressionValidator" ValidationExpression="\d{10}[\d|X]|\d{10}">cell Number must be 10 numbers</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Number required" ControlToValidate="cellNumber" CssClass="error"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td align="center" class="tab">Password</td>
                <td>
                    <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Password Required" ControlToValidate="password" CssClass="error"></asp:RequiredFieldValidator>
                </td>

            </tr>
            <tr>
                <td align="center" class="tab" >Confirm Password</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" TextMode="Password"></asp:TextBox>
                </td>

            </tr>
            <tr>
                
                <td>
                    
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Don't Match" ControlToCompare="password" ControlToValidate="TextBox9" CssClass="error"></asp:CompareValidator>
                </td>

            </tr>


        </table>
        <p>

            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" CssClass="comButton" /> 
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="If have an account please login here ">If have an account please login here<a href="../Student/Login.aspx"> Login</a></asp:Label> 
           
           <%-- <asp:Button ID="Button2" runat="server" Text="Login"  PostBackUrl="~/Student/Login.aspx" CssClass="comButton" />--%> 
            </p>
        
    </div>
</asp:Content>

