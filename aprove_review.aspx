<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MainPage_admin.Master" CodeBehind="aprove_review.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.aprove_review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
     body {
         font-family: Arial, sans-serif;
         background-color: #f4f4f4;
         margin: 0;
         padding: 0;
     }
     .container {
         width: 100%;
         max-width: 1200px;
         margin: 0 auto;
         padding: 20px;
         position: relative;
     }
     .review-wrapper {
         display: flex;
         overflow: hidden;
         max-width: 100%;
         position: relative;
     }
     .review-container {
         display: flex;
         flex-direction:column;
         align-items:center;
         justify-content:center
         transition: transform 0.5s ease-in-out;
     }
     .review-card {
         background-color: #ffffff;
         border-radius: 8px;
         box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
         width: 900px;
         height: 100%;
         padding: 20px;
         margin:20px 0px 20px 20px  ;
     }
         .review-header {
            display:flex;
            
            flex-direction:row;
            justify-content:space-between;
         }
     .review-header h2 {
         font-size: 1.2em;
         margin: 0;
     }
     .rating {
         color: black;
     }
         .action-btn {
            display:flex;
            gap:10px;
            color:white;
            cursor:pointer
         }

         .acc_btn {
               background:green;
               height:100%;
               color:white;
               width:100%;
               padding:10px;
               border:1px solid white;
               border-radius:10px;
         }
         .rej_btn {
            background:red;
            height:100%;
            color:white;
            width:100%;
            padding:10px;
            border:1px solid white;
            border-radius:10px;
         }
        .review-id-label {
    font-weight: bold;
    font-size: 0.9em;
    color: #888;
    margin-right: 10px;
}
     .review-body {
         margin: 10px 0;
         flex-grow: 1;
     }
     .review-footer {
         font-size: 0.9em;
         color: #888;
     }
     .review-footer i {
         margin-right: 5px;
     }
     .prev, .next {
         position: absolute;
         top: 50%;
         transform: translateY(-50%);
         background-color: rgba(0, 0, 0, 0.5);
         color: #fff;
         border: none;
         padding: 10px;
         cursor: pointer;
         display: none; /* Initially hidden */
         z-index: 1;
     }
     .prev:hover, .next:hover {
         background-color: rgba(0, 0, 0, 0.7);
     }
     .prev {
         left: 10px;
     }
     .next {
         right: 10px;
     }
     .container:hover .prev, .container:hover .next {
         display: block;
     }
     @media only screen and (max-width: 768px) {
         .review-container {
             width: calc(300px * 2); /* Display 2 reviews on smaller screens */
         }
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <asp:Repeater ID="ReviewRepeater" runat="server">
        <HeaderTemplate>
            <div class="review-wrapper">
                <div class="review-container">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="review-card">
                <div class="review-header">
                    <h2><%# Eval("Name") %></h2>
                   
                   <div class="action-btn">
                        <asp:Button ID="accept_review" runat="server" Text="Accept" CssClass="acc_btn" CommandName="Accept" CommandArgument='<%# Eval("review_id") %>' />
                           <asp:Button ID="Reject_review" runat="server" Text="Reject" CssClass="rej_btn" CommandName="Reject"  CommandArgument='<%# Eval("review_id") %>' />
                   </div>
                </div>

                 <div class="rating">
                    <%# Eval("Rating") %>
                </div><br />
                <div class="review-body">
                    <p><%# Eval("Review") %></p>
                </div>
                <div class="review-body">
                   
                </div>
                <div class="review-footer">
                    <i class="fas fa-envelope"></i> <%# Eval("Email") %> |
                    <i class="fas fa-calendar-alt"></i> <%# Eval("date", "{0:dd MMM yyyy}") %>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
                </div>
            </div>
          
        </FooterTemplate>
    </asp:Repeater>
</div>
</asp:Content>
