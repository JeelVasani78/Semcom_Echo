<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MainPage_admin.Master" CodeBehind="Invitation.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
     body {
         font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
         background-color: #e9f3fc;
         margin: 0;
         padding: 0;
     }
     .container {
         max-width: 600px;
         margin: 50px auto;
         padding: 30px;
         background-color: #ffffff;
         border-radius: 10px;
         box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
     }
     h2 {
         text-align: center;
         color: #007bff;
     }
     .form-group {
         margin-bottom: 20px;
     }
     .form-group label {
         display: block;
         font-weight: bold;
         margin-bottom: 5px;
         color: #333;
     }
     .form-group input, .form-group textarea {
         width: 100%;
         padding: 12px;
         border: 1px solid #ccc;
         border-radius: 4px;
         box-sizing: border-box;
         transition: border 0.3s ease;
     }
     .form-group input:hover, .form-group textarea:hover {
         border: 1px solid #007bff;
     }
     .form-group textarea {
         resize: vertical;
         height: 120px;
     }
     .form-group input[type="file"] {
         background-color: #007bff;
         color: white;
         border: none;
         padding: 10px;
         text-align: center;
         font-size: 16px;
         cursor: pointer;
         border-radius: 4px;
         width: 100%;
     }
     .form-group input[type="file"]:hover {
         background-color: #0056b3;
     }
     .form-group button {
         background-color: #007bff;
         color: white;
         border: none;
         padding: 10px 15px;
         text-align: center;
         font-size: 16px;
         cursor: pointer;
         border-radius: 4px;
         width: 100%;
         transition: transform 0.2s, background-color 0.2s;
     }
     .form-group button:hover {
         background-color: #0056b3;
         transform: scale(1.05);
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
            <h2>Invite Alumni as Chief Guest</h2>
            
            <!-- Alumni Name -->
            <div class="form-group">
                <label for="alumniName">Organiser's Name</label>
                <asp:TextBox ID="txtAlumniName" runat="server" CssClass="form-control" placeholder="Enter alumni name"></asp:TextBox>
            </div>

            <!-- Event Name -->
            <div class="form-group">
                <label for="eventName">Event Name</label>
                <asp:TextBox ID="txtEventName" runat="server" CssClass="form-control" placeholder="Enter event name"></asp:TextBox>
            </div>

            <!-- Event Date -->
            <div class="form-group">
                <label for="eventDate">Event Date</label>
                <asp:TextBox ID="txtEventDate" runat="server" CssClass="form-control" placeholder="Enter event date (e.g., MM/DD/YYYY)" TextMode="Date"></asp:TextBox>
            </div>

            <!-- Event Time -->
            <div class="form-group">
                <label for="eventTime">Event Time</label>
                <asp:TextBox ID="txtEventTime" runat="server" TextMode="Time" CssClass="form-control" placeholder="Select event time"></asp:TextBox>
            </div>

            <!-- Event Description -->
            <div class="form-group">
                <label for="eventDescription">Event Description</label>
                <asp:TextBox ID="txtEventDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Describe the event"></asp:TextBox>
            </div>

            <!-- Event Picture -->
            <div class="form-group">
                <label for="eventPicture">Event Picture</label>
                <asp:FileUpload ID="fileUploadEventPicture" runat="server" CssClass="form-control" />
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Send Invitation"  CssClass="btn btn-primary" />
                <asp:Label ID="lblMessage" runat="server" Text="hello jerry" ForeColor="PowderBlue" Visible="false"></asp:Label>
            </div>
        </div>
</asp:Content>
