<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Alumni/MainPage_alumni.Master" CodeBehind="dash.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.dash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">

/* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    color: #333;
    margin: 0px;
    padding: 0px;
}

/* Container for Side-by-Side Layout */
.dashboard-container 
{
    margin:10px;
    padding:10px;
    display: flex;
    justify-content: space-between;
    gap: 20px;
    max-width: 1200px;
    margin: auto;
}

/* Section Box Styling */
.section {
    flex: 1;
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-top:10px;
}

/* Heading Styling */
h2 {
    text-align: center;
    background: linear-gradient(to right, #007bff, #0056b3);
    color: white;
    padding: 10px;
    border-radius: 6px;
}

/* Review and Event Box Styling */
.review-box, .event-box {
    border-bottom: 1px solid #ddd;
    padding: 15px;
    margin: 10px 0;
    border-radius: 6px;
    background: #f9f9f9;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.review-box:hover, .event-box:hover {
    transform: scale(1.02);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

/* Name and Rating Styling */
.review-box h4 {
    margin: 0;
    color: #007bff;
}

.review-box p {
    margin: 5px 0;
    font-size: 14px;
}

/* Date Styling */
small {
    color: #555;
    font-size: 12px;
}

/* Event Styling */
.event-box h3 {
    margin: 0;
    color: #28a745;
}

.event-box p {
    font-size: 14px;
    color: #444;
}

.event-box img {
    max-width: 100%;
    height: auto;
    border-radius: 6px;
    margin-top: 10px;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="dashboard-container">
        
        <!-- Alumni Reviews Section -->
        <div class="section">
            <h2>Alumni Reviews</h2>
            <asp:Repeater ID="rptAlumniReviews" runat="server">
                <ItemTemplate>
                    <div class="review-box">
                        <h4><%# Eval("Name") %> <br> Rating : (<%# Eval("Rating") %>/5)</h4>
                        <p>Email : <%# Eval("Email") %></p>
                        <p>Review : <%# Eval("Review") %></p>
                        <small><%# Eval("date", "{0:dd MMM yyyy}") %></small>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Upcoming Events Section -->
        <div class="section">
            <h2>Upcoming Events</h2>
            <asp:Repeater ID="rptEvents" runat="server">
                <ItemTemplate>
                    <div class="event-box">
                        <h3><%# Eval("EventName") %></h3>
                        <p><%# Eval("EventDescription") %></p>
                        <p><b>Date:</b> <%# Eval("EventDate", "{0:dd MMM yyyy}") %> | <b>Time:</b> <%# Eval("EventTime") %></p>
                       <%--  <img src='<%# Eval("EventPicture") %>' alt="Event Image" width="200" /> --%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>
