<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Common_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <p align="center"><asp:Label ID="Label1" runat="server" Text="Online Application System" Font-Bold="True" Font-Size="X-Large"></asp:Label></p>

    </div>
    <div align="center">

        <p style="width:70%; padding-left:10%; font-size: 20px; font-style: normal;" >
             Res-finder is an online application that allows students to apply for accommodation for the period of their studies.
            The system assists students who are registered at any tertiary intuition, that are in need of accommodation. 
            The system is more advantageous to students, who study at instuitions that do not offer student accommodation.
            It also brings increased flexibility in assisting students to find and secure space in a residence and is a lot more
            convenient since students can do the application whenever they wish to, as it does not serve to be a 9 to 5 task.

          

        </p>
    </div>
    <div>
        <p align="center"><asp:Label ID="Label2" runat="server" Text="Residence And Campuses" Font-Bold="True" Font-Size="X-Large"></asp:Label></p>

    </div>
   <div  align="center" style="padding-bottom: 50px;">
        <asp:ImageMap ID="ImageMap1" runat="server" Height="306px" ImageUrl="~/Common/coolpictures/flat2.jpg" Width="456px">
        </asp:ImageMap>
        <br />
        <asp:ImageMap ID="ImageMap2" runat="server" Height="306px" ImageUrl="~/Common/coolpictures/bedrooms.jpg" Width="456px">
        </asp:ImageMap>
        <asp:ImageMap ID="ImageMap3" runat="server" Height="306px" ImageUrl="~/Common/coolpictures/entrance.jpg" Width="456px">
        </asp:ImageMap>
        <br />
        <asp:ImageMap ID="ImageMap5" runat="server" Height="306px" ImageUrl="~/Common/coolpictures/apartment.jpg" Width="456px">
        </asp:ImageMap>
            <asp:ImageMap ID="ImageMap4" runat="server" Height="306px" ImageUrl="~/Common/coolpictures/SingleRoom.jpg" Width="456px">
        </asp:ImageMap>
        <asp:ImageMap ID="ImageMap6" runat="server" Height="306px" ImageUrl="~/Common/coolpictures/flat.jpg" Width="456px">
        </asp:ImageMap>
        
    </div>
    
</asp:Content>

