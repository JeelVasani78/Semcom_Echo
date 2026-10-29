<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Alumni/MainPage_alumni.Master" CodeBehind="donation.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            border-radius: 12px;
            transition: box-shadow 0.3s;
        }
        .container:hover {
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 8px;
        }
        .form-group input, .form-group textarea {
            width: 95%;
            padding: 13px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        .form-group input:focus, .form-group textarea:focus {
            border-color: #007bff;
            outline: none;
        }
        .submit-button {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
        .status-message {
            margin-top: 20px;
            text-align: center;
            font-size: 18px;
            color: #28a745;
        }
        .pending-message {
            color: #ffc107;
        }
        .rejected-message {
            color: #dc3545;
        }
        .error-message {
            color: #dc3545;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2><i class="fas fa-donate"></i> Request Donation for College</h2>

        <asp:Panel ID="RequestPanel" runat="server">
            <div class="form-group">
                <label for="Amount">Donation Amount (INR)</label>
                <asp:TextBox ID="amt" runat="server" CssClass="form-control" placeholder="Enter donation amount" />
            </div>
            <div class="form-group">
                <label for="Message">Message</label>
                <asp:TextBox ID="msg" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Enter any message (optional)" />
            </div>
            <asp:Button ID="SubmitButton" runat="server" CssClass="submit-button" Text="Submit Request" OnClick="SubmitDonationRequest" />
            <asp:Label ID="ErrorMessage" runat="server" CssClass="error-message" Visible="False" />
        </asp:Panel>

        <asp:Panel ID="StatusPanel" runat="server" Visible="false">
            <h2>Your Donation Request Status</h2>
            <asp:Label ID="RequestStatus" runat="server" CssClass="status-message" /><br />
            <asp:Button ID="Button1" runat="server" CssClass="submit-button" Text="Submit New Request" Enabled="false"/>

        </asp:Panel>
    </div>
</asp:Content>