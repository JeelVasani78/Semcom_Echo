<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MainPage_admin.Master" CodeBehind="manage_seminar.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm11" %>
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

        .btn {
            padding: 14px 30px;
            font-size: 16px;
            font-weight: 600;
            text-transform: uppercase;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
        }

        .btn-accept {
            background: linear-gradient(45deg, #4caf50, #67d367);
            color: white;
        }

        .btn-accept:hover {
            background: linear-gradient(45deg, #45a049, #5bcc58);
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            transform: translateY(-3px);
        }

        .btn-reject {
            background: linear-gradient(45deg, #f44336, #f76a5f);
            color: white;
        }

        .btn-reject:hover {
            background: linear-gradient(45deg, #e53935, #f15a4f);
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            transform: translateY(-3px);
        }

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
        <h2>Manage Seminar Requests</h2>
        <asp:Repeater ID="rptSeminars" runat="server">
    <ItemTemplate>
        <div class="alumni-item">
            <div class="alumni-details">
                <span><strong>Title:</strong> <%# Eval("title") %></span>
                <span><strong>Description:</strong> <%# Eval("description") %></span>
                <span><strong>Date:</strong> <%# Eval("s_date", "{0:dd/MM/yyyy}") %></span>
                <span><strong>Time:</strong> <%# Eval("s_time") %></span>
                <span><strong>Status:</strong> <%# Eval("status") %></span>
            </div>
            <div class="alumni-actions">
                <asp:Button ID="btnAccept" runat="server" CssClass="btn btn-accept" 
                    Text="Accept" CommandArgument='<%# Eval("seminar_id") %>' 
                    CommandName="Accept" OnCommand="UpdateSeminarStatus" />

                <asp:Button ID="btnReject" runat="server" CssClass="btn btn-reject" 
                    Text="Reject" CommandArgument='<%# Eval("seminar_id") %>' 
                    CommandName="Reject" OnCommand="UpdateSeminarStatus" />
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

    </div>
</asp:Content>

