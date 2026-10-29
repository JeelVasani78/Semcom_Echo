<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Alumni/MainPage_alumni.Master" CodeBehind="profile.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            overflow: hidden;
            background: #f4f4f4;
            font-family: Arial, sans-serif;
        }

        .profile-container {
            display: flex;
            max-width: 980px;
            margin: 20px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .profile-left {
            background: #007bff;
            color: white;
            padding: 40px;
            text-align: center;
            width: 40%;
            display:flex;
            align-items:center;
            justify
        }

        .profile-left img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            border: 4px solid white;
            margin-right:20px;
            object-fit: cover;
            transition: transform 0.3s ease-in-out;
        }

        .profile-left img:hover {
            transform: scale(1.1);
        }

        .profile-right {
            padding: 30px;
            width: 65%;
        }

        .profile-right h2 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: all 0.3s ease-in-out;
            resize: none;
        }

        .form-group input:focus, .form-group textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
            outline: none;
        }

        .buttons-container {
            margin-top: 15px;
            text-align: right;
        }

        .buttons-container .buttons {
            background: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            width:30%;
            cursor: pointer;
            margin-left: 10px;
            transition: background 0.3s ease-in-out;
        }

        .buttons-container .buttons:hover {
            background: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile-container">
        <div class="profile-left">
            <asp:Image ID="imgProfile" runat="server" ImageUrl="~/Images/default_profile.png" />
            <h3><asp:Label ID="lblName" runat="server" Text="Your Name"></asp:Label></h3>
        </div>
        
        <div class="profile-right">
            <h2>Profile Details</h2>
            <div class="form-group">
                <label>Profession:</label>
                <asp:TextBox ID="txtProfession" runat="server" Enabled="false"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Bio:</label>
                <asp:TextBox ID="txtBio" runat="server" TextMode="MultiLine" Enabled="false"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Facebook:</label>
                <asp:TextBox ID="txtFacebook" runat="server" Enabled="false"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Twitter:</label>
                <asp:TextBox ID="txtTwitter" runat="server" Enabled="false"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>LinkedIn:</label>
                <asp:TextBox ID="txtLinkedIn" runat="server" Enabled="false"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Instagram:</label>
                <asp:TextBox ID="txtInstagram" runat="server" Enabled="false"></asp:TextBox>
            </div>
            
            <div class="buttons-container">
                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="buttons" OnClick="btnEdit_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="buttons" OnClick="btnSave_Click" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>