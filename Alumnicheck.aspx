<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MainPage_admin.Master" CodeBehind="Alumnicheck.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f0f2f5;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.form-container {
    width: 78%;
    margin: 50px auto;
    padding: 40px;
    background-color: #ffffff;
    border-radius: 15px;
    box-shadow: 0px 20px 40px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.form-container:hover {
    transform: translateY(-12px);
    box-shadow: 0px 30px 60px rgba(0, 0, 0, 0.2);
}

h2 {
    text-align: center;
    color: #222;
    font-size: 30px;
    font-weight: 700;
    margin-bottom: 30px;
    letter-spacing: 1.2px;
    text-transform: uppercase;
}

.alumni-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 30px;
    margin-bottom: 20px;
    background-color: #fdfdfd;
    border-radius: 12px;
    transition: box-shadow 0.3s ease, transform 0.3s ease;
    box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.05);
}

.alumni-item:hover {
    transform: translateY(-6px);
    box-shadow: 0px 18px 35px rgba(0, 0, 0, 0.1);
}

.alumni-details {
    display: flex;
    flex-direction: column;
    gap: 10px;
}

.alumni-details span {
    font-size: 16px;
    color: #555;
}

.alumni-details span strong {
    color: #222;
    font-weight: 600;
}

.alumni-actions {
    display: flex;
    gap: 20px;
}

/* Button Styling */
.btn {
    padding: 14px 30px;
    font-size: 16px;
    font-weight: 600;
    text-transform: uppercase;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15); /* Soft shadow */
}

.btn-accept {
    background: linear-gradient(45deg, #4caf50, #67d367); /* Gradient for modern feel */
    color: white;
}

.btn-accept:hover {
    background: linear-gradient(45deg, #45a049, #5bcc58);
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2); /* Enhanced shadow */
    transform: translateY(-3px);
}

.btn-reject {
    background: linear-gradient(45deg, #f44336, #f76a5f); /* Modern red gradient */
    color: white;
}

.btn-reject:hover {
    background: linear-gradient(45deg, #e53935, #f15a4f);
    box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
    transform: translateY(-3px);
}

/* Responsive Design */
@media (max-width: 768px) {
    .form-container {
        width: 90%;
        padding: 25px;
    }

    .alumni-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 20px;
    }

    .alumni-actions {
        width: 100%;
        justify-content: space-evenly;
        margin-top: 15px;
    }
}


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Review Alumni Applications</h2>
        <asp:Repeater ID="RepeaterAlumni" runat="server" >
            <ItemTemplate>
                <div class="alumni-item">
                    <div class="alumni-details">
                        <span><strong>Name:</strong> <%# Eval("al_full_nm") %> <%# Eval("alumni_id") %></span>
                        <span><strong>Email:</strong> <%# Eval("al_email") %></span>
                        <span><strong>Enrollment No:</strong> <%# Eval("al_enroll_no") %></span>
                        <%--<span><strong>Graduation Year:</strong> <%# Eval("al_graduation") %></span>--%>
                        <%--<span><strong>Department:</strong> <%# Eval("al_dept") %></span>--%>
                    </div>
                    <div class="alumni-actions">
                        <asp:Button ID="btnAccept" runat="server" CommandName="a" Text="Accept" CssClass="btn btn-accept" CommandArgument='<%# Eval("alumni_id") %>' />
                        <asp:Button ID="btnReject" runat="server" CommandName="r" Text="Reject" CssClass="btn btn-reject" CommandArgument='<%# Eval("alumni_id") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
