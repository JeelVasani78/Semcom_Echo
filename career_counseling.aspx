<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Alumni/MainPage_alumni.Master" CodeBehind="career_counseling.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .career_holder{
            height:100%;
            width:100%;
            font-family:Helvetica;
            position:relative;
            padding:40px;
        }
        .career_holder h2{
            color:#2473ff;
        }
        .career_holder hr{
            width:100%;
            height:2px;
            border:none;
            background:#2473ff;
        }
        .career_inputbox{
            width: 70%;
            border: none;
            outline: none;
            border-bottom: 2px solid #1d83c480;
            border-radius: 7px;
            padding: 8px 10px;
            background: #e8f0fe;
            font-size: 15px;
            color: #686868;
            transition: 0.2s;
            resize:none;
        }

        .career_date{
            width: 20%;
            border: none;
            outline: none;
            border-bottom: 2px solid #1d83c480;
            border-radius: 7px;
            padding: 8px 10px;
            background: #e8f0fe;
            font-size: 15px;
            color: #686868;
            transition: 0.2s;
            resize:none;
        }

        .career_inputbox:hover, .career_date:hover{
            border-color:#1d83c4;
        }

        .career_inputbox:focus, .career_date:focus{
            border-color:#1d83c4;
        }

        .submit_btn{
            width: 15%;
            background: #5B9BD5;
            border: none;
            outline: none;
            padding: 8px 5px;
            border-radius: 3px;
            color: white;
            font-size: 15px;
            cursor: pointer;
            transition:0.2s;
        }
        .submit_btn:hover{
            background:#1d83c4;
        }

        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="career_holder">
            <h2>Seminar</h2><br />
            <hr /><br />
            <asp:Label ID="title_lbl" runat="server" Text="Title" CssClass="txt_lbl"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="title_txt"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="title_txt" runat="server" CssClass="career_date" placeholder="Enter Title"></asp:TextBox><br /><br />
            <asp:Label ID="txt_lbl" runat="server" Text="Request Career Counseling:" CssClass="txt_lbl"></asp:Label><asp:RequiredFieldValidator ID="vali1" runat="server" ErrorMessage="*" ControlToValidate="career_input"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="career_input" runat="server" TextMode="MultiLine" Rows="5" CssClass="career_inputbox" placeholder="Type here..."></asp:TextBox> <br /><br />
            <asp:Label ID="date_lbl" runat="server" Text="Date" CssClass="txt_lbl"></asp:Label><asp:RequiredFieldValidator ID="vali2" runat="server" ErrorMessage="*" ControlToValidate="career_date"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="career_date" runat="server" TextMode="Date" CssClass="career_date"></asp:TextBox><br /><br />
            <asp:Label ID="time_lbl" runat="server" Text="Time" CssClass="txt_lbl"></asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="time_txt"></asp:RequiredFieldValidator><br />
            <asp:TextBox ID="time_txt" runat="server" TextMode="Time" CssClass="career_date"></asp:TextBox><br /><br />
            <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="submit_btn" OnClick="submit_btn_Click" /><br /><br />

            <asp:Label ID="success_msg" runat="server" ForeColor="Green"></asp:Label>
        </div>
</asp:Content>
