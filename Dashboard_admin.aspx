<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MainPage_admin.Master" CodeBehind="Dashboard_admin.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            background: white;
            color: white;
            font-family: Arial, sans-serif;
        }
        .dashboard-card {
            width: 270px;
            padding: 25px;
            background: linear-gradient(135deg, #5B9BD5, #2B579A);
            color: white;
            text-align: center;
            border-radius: 12px;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .dashboard-card:hover {
            transform: scale(1.1);
            box-shadow: 0px 6px 15px rgba(0, 0, 0, 0.3);
        }
        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            gap: 25px;
            justify-content: center;
            margin-top: 25px;
        }
        .dashboard-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .dashboard-value {
            font-size: 20px;
            font-weight: bold;
        }
        .dashboard-header {
            text-align: center;
        }
        .dashboard-header h2 {
            text-align: center;
            color:Black;
            margin-top:10px;
        }
        .dashboard-header hr {
            border: 0;
            height: 5px;
            background: linear-gradient(to right, #5B9BD5, #2B579A);
            margin: 10px auto;
            width: 35%;
            padding: 0 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-header">
        <h2>Admin Dashboard</h2>
        <hr>
    </div>
    <div class="dashboard-container">
        <div class="dashboard-card">
            <div class="dashboard-title">Total Alumni</div>
            <div class="dashboard-value"><asp:Label ID="lblTotalAlumni" runat="server" Text="0"></asp:Label></div>
        </div>
        <div class="dashboard-card">
            <div class="dashboard-title">Pending Approvals</div>
            <div class="dashboard-value"><asp:Label ID="lblPendingAlumni" runat="server" Text="0"></asp:Label></div>
        </div>
        <div class="dashboard-card">
            <div class="dashboard-title">Total Jobs</div>
            <div class="dashboard-value"><asp:Label ID="lblTotalJobs" runat="server" Text="0"></asp:Label></div>
        </div>
        <div class="dashboard-card">
            <div class="dashboard-title">Upcoming Events</div>
            <div class="dashboard-value"><asp:Label ID="lblTotalEvents" runat="server" Text="0"></asp:Label></div>
        </div>
        <div class="dashboard-card">
            <div class="dashboard-title">Approved Reviews</div>
            <div class="dashboard-value"><asp:Label ID="lblTotalReviews" runat="server" Text="0"></asp:Label></div>
        </div>
    </div>
</asp:Content>