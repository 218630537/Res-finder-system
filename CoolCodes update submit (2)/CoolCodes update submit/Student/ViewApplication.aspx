<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewApplication.aspx.cs" Inherits="Student_ViewApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="myview" align="center">

        <h1>Applications for you</h1>
        <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="applicationID" DataSourceID="SqlDataSource1" Font-Bold="False" ShowHeaderWhenEmpty="True">
        <Columns>
            <asp:BoundField DataField="applicationID" HeaderText="Application ID" ReadOnly="True" SortExpression="applicationID" />
            <asp:BoundField DataField="institutionname" HeaderText="Institution Name" SortExpression="institutionname" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="Year" />
            <asp:BoundField DataField="locationcity" HeaderText="Location City" SortExpression="locationcity" />
            <asp:BoundField DataField="residentName" HeaderText="Resident Name" SortExpression="residentName" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
        SelectCommand="Select applicationID ,institutionname ,year, 
locationcity ,residentName,Status
FROM application a,institution i,resident r
Where idnumber = ?
AND a.residentID =r.residentID 
AND r.institutionID = i.institutionID">
        <SelectParameters>
            <asp:SessionParameter Name="?" SessionField="idnumber" />
        </SelectParameters>
        </asp:SqlDataSource>
</div>
   <p align="center">
                <button id="SAVE" onclick="printo()">
                    Save/Print</button>
            </p>
    <script>

        function printo() {
            var printContents = document.getElementById("myview").innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;

            return true;
        }
    </script>
</asp:Content>


