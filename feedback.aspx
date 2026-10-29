<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Alumni/MainPage_alumni.Master" CodeBehind="feedback.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
                    .main-bottom {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        padding: 20px;
        width: 100%;
        font-family:Arial, Helvetica, sans-serif;
    }           .review-form {
            width: 100%;
        }

        .review-form h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2473ff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
            color: #333333;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            border-color: #1C1C88;
            outline: none;
        }

        .rating {
        display: flex;
        gap: 10px;
    }

    .rating input {
        display: none;
    }

    .rating label {
        font-size: 30px;
        color: #cccccc; /* Default gray color */
        cursor: pointer;
        transition: color 0.3s;
    }

/*    .rating label:hover ~ label,
    .rating label:hover
    
    
     {
        color: #FFD700;  Gold color on hover 
    }*/
    .rating input:checked ~ label 
    {
        color: #FFD700;  Gold color when clicked 
    }

        .submit-btn {
            width: 20%;
            padding: 12px;
            background-color: #2473ff;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #346daf;
        }
    
        .back-btn {
            
            width: 100%;
            padding: 12px;
            background-color: #1C1C88;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
.bu{
    display: flex;
    margin-left: 60rem  ;
}
        .back-btn:hover {
            background-color: #346daf;
        }

        /* Reviews Section */
        .reviews-section {
            margin-top: 40px;
        }

        .reviews-section h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #1C1C88;
        }

        .review {
            background-color: #fafafa;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            position: relative;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .review .review-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .review .review-header .user-info {
            display: flex;
            flex-direction: column;
        }

        .review .review-header .user-info .name {
            font-weight: 600;
            color: #333333;
        }

        .review .review-header .user-info .date {
            font-size: 14px;
            color: #777777;
        }

        .review .review-body {
            margin-bottom: 15px;
        }

        .review .review-body p {
            font-size: 16px;
            color: #555555;
            line-height: 1.5;
        }

        .review .review-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .review .review-footer .rating {
            color: #FFD700;
        }

        .review .review-footer .delete-btn {
            background-color: transparent;
            border: none;
            color: #ff4d4d;
            font-size: 18px;
            cursor: pointer;
            transition: color 0.3s;
        }

        .review .review-footer .delete-btn:hover {
            color: #ff1a1a;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .review .review-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .review .review-footer {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
       
       
    </style>
<%--<script type="text/javascript">
//    // This variable holds the selected rating
//    let selectedRating = 0;

//    function setRating(star) {
//        // Update the selected rating
//        selectedRating = star;

//        // Get all stars
//        let stars = document.querySelectorAll('.rating label i');

//        // Change the color of the clicked star and the stars before it
//        stars.forEach((starElem, index) => {
//            if (index < star) {
//                starElem.style.color = '#FFD700';  // Set clicked stars to golden color
//            } else {
//                starElem.style.color = '#cccccc';  // Reset others to default gray color
//            }
//        });

//        // Optionally, store the rating in a hidden field to be submitted to the server
//        

//        document.getElementById('<%= ratingValue.ClientID %>').value = selectedRating;
//       
//    }
</script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    
        <div class="main-bottom">
          

            <!-- Review Form Starts Here -->
            <div class="review-form">
                <h2>Submit Your Review</h2>
                <asp:Panel ID="ReviewPanel" runat="server">
                    <div class="form-group">
                        <label for="name">Name <span style="color: red;">*</span></label>
                        <asp:TextBox ID="name" runat="server" CssClass="form-control" Placeholder="Enter your name" required="true"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label for="email">Email <span style="color: red;">*</span></label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" Placeholder="Enter your email" required="true"></asp:TextBox>
                    </div>

                   <div class="form-group">
                    <label>Rating <span style="color: red;">*</span></label>
                    <div class="rating">
                        <asp:DropDownList ID="DropDownList1" runat="server" >
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RadioButton ID="star1" runat="server" GroupName="rating" Value="1" />
                        <label for="star1" title="1 star" onclick="setRating(1);"><i class="fas fa-star"></i></label>

                        <asp:RadioButton ID="star2" runat="server" GroupName="rating" Value="2" />
                        <label for="star2" title="2 stars" onclick="setRating(2);"><i class="fas fa-star"></i></label>

                        <asp:RadioButton ID="star3" runat="server" GroupName="rating" Value="3" />
                        <label for="star3" title="3 stars" onclick="setRating(3);"><i class="fas fa-star"></i></label>

                        <asp:RadioButton ID="star4" runat="server" GroupName="rating" Value="4" />
                        <label for="star4" title="4 stars" onclick="setRating(4);"><i class="fas fa-star"></i></label>

                        <asp:RadioButton ID="star5" runat="server" GroupName="rating" Value="5" />
                        <label for="star5" title="5 stars" onclick="setRating(5);"><i class="fas fa-star"></i></label>
    
                        <asp:HiddenField ID="ratingValue" runat="server" />--%>
                    </div>
                </div>



                    <div class="form-group">
                        <label for="review">Review <span style="color: red;">*</span></label>
                        <asp:TextBox ID="review" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Placeholder="Write your review about the College..." required="true"></asp:TextBox>
                    </div>

                    <asp:Button ID="SubmitReview" runat="server" Text="Submit Review" CssClass="submit-btn" OnClick="SubmitReview_Click" />
                    <asp:Button ID="ResetForm" runat="server" Text="Reset" CssClass="submit-btn" CausesValidation="false" OnClick="ResetForm_Click" />
                </asp:Panel>
            </div>
        </div>
         
    
</div>
</asp:Content>
