<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="apply.aspx.cs" Inherits="Student_apply" %>

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
    
    <div align="center" style="width: 60%; padding-left: 15%">

        <asp:Panel ID="Panel1" runat="server">

            <p style="font-size: x-large; font-weight: bold;">Resident Application</p>
        </asp:Panel>


    </div>
    <div>

        <table style="width: 50%" align="center">
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
                <td align="center" class="tab">ID Number</td>
                <td>
                    <asp:Label ID="idnumber"  Text="idnumber" runat="server"></asp:Label>
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
                <td align="center" class="tab">Year</td>
                <td>
                    <asp:DropDownList ID="yearInput" runat="server" Height="25px" Width="180px">
                        <asp:ListItem>2022</asp:ListItem>
                        <asp:ListItem>2023</asp:ListItem>
                        <asp:ListItem>2024</asp:ListItem>
                        <asp:ListItem>2025</asp:ListItem>
                        <asp:ListItem>2026</asp:ListItem>
                        <asp:ListItem>2027</asp:ListItem>
                        <asp:ListItem>2028</asp:ListItem>
                        <asp:ListItem>2029</asp:ListItem>
                        <asp:ListItem>2030</asp:ListItem>
                    </asp:DropDownList>
                </td>

            </tr>
            <tr>
                <td align="center" class="tab">Resident City</td>
                <td>
                    <asp:DropDownList ID="resCity" runat="server" Height="23px" Width="182px" DataTextField="locationCity" AutoPostBack="True" DataSourceID="city">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="city" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT locationCity from resident where institutionID =?">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="?" SessionField="instID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>

            </tr>
            <tr>
                <td align="center" class="tab">Resident</td>
                <td>
                    <asp:DropDownList ID="ResidentName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="residentName" DataValueField="residentID" Height="26px" Width="179px" OnSelectedIndexChanged="ResidentName_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select residentID,residentname from resident where locationcity=?">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="resCity" Name="?" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>

            </tr>
            <tr>
                <td  align="center" class="tab">

                </td>
                <td  align="left" class="tab">
                    <asp:Image ID="Image1" Visible="true" runat="server" Height="267px" Width="309px" ImageUrl="~/Common/images/corridor." />
                </td>
            </tr>
            <tr>
                <td>

                </td>
                <td>
                    <asp:Label ID="error" runat="server" Visible="false" Text="Application exist" ForeColor="Red"></asp:Label>
                </td>
            </tr>


        </table>


    </div>
      <div align="center" style="width: 60%; padding-left: 15%">

        <asp:Panel ID="Panel2" runat="server">

            <p style="font-size: x-large; font-weight: bold;">

                <asp:Button ID="Button1" runat="server" Text="Submit Application" OnClick="Button1_Click" />
            </p>
        </asp:Panel>


    </div>
</asp:Content>

