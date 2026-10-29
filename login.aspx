<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="login.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
   <style type="text/css">
   
   
   *{
    padding:0;
    margin:0;
    box-sizing:border-box;
    }

html, body, .main {
    height:100%;
    width:100%;
    position:relative;
}
.main form{
    height:100%;
    width:100%;
    display:flex;
    align-items:center;
    justify-content:center;
    position:relative;
}
.left {
    height: 100%;
    width: 40%;
    background: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 10px;
    font-family: helvetica;
    z-index:5;
    box-shadow: 2px 0px 25px 4px #00000050;
    position:relative;
    overflow:hidden;
}


.left h2{
    font-size:35px;
    margin-bottom:15px;
    color:#484848;
}
.txt1 {
    width: 65%;
    border: none;
    outline: none;
    border-bottom: 2px solid #1d83c480;
    border-radius: 2px;
    padding: 8px 10px;
    background: #e8f0fe;
    font-size: 15px;
    color: #686868;
    transition:0.2s;
}
    .txt1:focus {
        border-color:#1d83c4;
    }
.lbls{
    width:65%;
    padding:2px 0px 0px 0px;
    font-size:10px;
    text-align:left;
}

.f_u_btn {
    width: 65%;
    background: #c4e1a4;
    border-bottom: 2px solid #8ac44a;
    outline: none;
    padding: 8px 5px;
    border-radius: 2px;
    color: #686868;
    font-size: 15px;
    cursor: pointer;
    z-index: 2;
}
    .f_u_btn::-webkit-file-upload-button {
        background: transparent;
        border: none;
        outline: none;
        cursor: pointer;
        color:#686868;
        font-weight:600;
        border-right: 1px solid black;
    }

.submit_btn {
    width: 65%;
    background: #5B9BD5;
    border: none;
    outline: none;
    padding: 8px 5px;
    border-radius: 3px;
    color: white;
    font-size: 15px;
    margin-top: 15px;
    cursor: pointer;
    transition:0.2s;
}
.submit_btn:hover{
    background:#1d83c4;
}

.f_pass_and_re_me{
    width:65%;
    margin-top:2px;
    display:flex;
    justify-content:space-between;
}    

.login_lbl{
    width:65%;
    text-align:center;
    font-size:clamp(12px,15px,2vw);
    margin-top:8px;
}
.redirection_lbl{
    text-decoration:none;
    color:#282828;
    font-size:clamp(12px,15px,2vw);
}
.redirection_lbl:hover{
    text-decoration:underline;
}


.e_msg_panel_opened {
    position: absolute;
    left: 5%;
    bottom: 0;
    height:10%;
    width: 50%;
    background: white;
    box-shadow: 0px 0px 10px #00000050;
    border-radius: 5px;
    z-index: 2;
    overflow: hidden;
    display: flex;
    transition: 0.2s;
}
.e_msg_panel_closed {
    position: absolute;
    left: 5%;
    bottom: -10%;
    height: 10%;
    width: 50%;
    background: white;
    box-shadow: 0px 0px 10px #00000050;
    border-radius: 5px;
    z-index: 2;
    overflow: hidden;
    display: flex;
    transition: 0.2s;
}
.e_left {
    height: 100%;
    width: 80%;
    color: red;
    display: flex;
    align-items: center;
    justify-content: center;
    word-wrap: anywhere;
    padding: 2px;
    font-size: clamp(12px,15px,2vw);
}
.e_right{
    height:100%;
    width:20%;
    display:flex;
    align-items:center;
    justify-content:center;
    transition:0.2s;
    cursor:pointer;
}
.e_right:hover{
    background:red;
}

    .e_right i {
        color: red;
        font-size: clamp(15px,20px,2vw);
        font-weight: 600;
        transition: 0.2s;
        cursor: pointer;
    }
.e_right:hover i{
    color: White !important;
}

.top_strip{
    position:absolute;
    height:1.5%;
    width:100%;
    top:0;
    background:#8ac44a;
}
.bottom_strip {
    position: absolute;
    height: 1.5%;
    width: 100%;
    bottom: 0;
    display:flex;
}
.b_strip1 {
    height: 100%;
    width: 20%;
    background: #FFC000;
}
.b_strip2 {
    height: 100%;
    width: 20%;
    background: #5B9BD5;
}
.b_strip3 {
    height: 100%;
    width: 60%;
    background: #70AD47;
}
.cvm_outline_holder1{
    position:absolute;
    height:40%;
    width:20%;
    top:1.5%;
    left:0;
    background:white;
    z-index:-1;
}
.cvm_outline_holder2 {
    position: absolute;
    height: 40%;
    width: 20%;
    bottom: 1.5%;
    right: 0;
    background: white;
    z-index:-1;
    transform:scale(-1);
}




.right{
    height:100%;
    width:60%;
    display:flex;
    align-items:center;
    justify-content:center;
    position:relative;
}
.sm_img_holder {
    height: 100%;
    width: 100%;
    background: url("./images/semcom_clg_img.jpg");
    background-size: cover;
    filter: contrast(30%);
    display: flex;
    align-items: center;
    justify-content: center;
}
.sm_logo_holder{
    position:absolute;
    height:160px;
    width:550px;
    background:#ffffff85;
    display:flex;
    align-items:center;
    justify-content:center;
    box-shadow:0px 0px 10px 2px #00000045;
    padding:10px;
}
.image_holder{
    height:100%;
    width:100%;
    object-fit:cover;
}


@media (max-width: 768px) {
    .main form {
        flex-direction: column;
    }

    .left, .right {
        width: 100%;
    }

    .left {
        height: 100%;
        padding: 20px;
        box-shadow: none;
        text-align: center;
        height:100%;
    }

    .txt1 {
        width: 90%;
        font-size: 14px;
    }
    .f_pass_and_re_me {
        width: 90%;
        
    }
    .lbls {
        width: 90%;
        font-size: 12px;
    }

    .f_u_btn, .submit_btn {
        width: 90%;
    }

    .right {
        display: none; /* Hide right section on smaller devices */
    }

    .sm_img_holder {
        background-size: cover;
        height: 300px;
    }

    .sm_logo_holder {
        height: 100px;
        width: 300px;
    }
}


@media (max-width: 480px) {
    .left h2 {
        font-size: 28px;
    }

    .txt1 {
        padding: 8px;
        font-size: 12px;
    }
    .f_pass_and_re_me{
        width:90%;
        
}
    .lbls {
        font-size: 10px;
    }

    .f_u_btn, .submit_btn {
        font-size: 13px;
    }
}
   
   </style>
</head>
<body>
   <div class="main">
    <form id="frm1" runat="server">
        <div class="left">
            
            <h2>Login</h2>
            
            <div class="lbls">
                <asp:RequiredFieldValidator ID="vali2" runat="server" ErrorMessage="*Email Required" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vali3" runat="server" ErrorMessage="*Enter Valid Email" ForeColor="Red" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>

            <asp:TextBox ID="email" runat="server" CssClass="txt1" placeholder="Email" TextMode="Email"></asp:TextBox>
                
            <div class="lbls">
                <asp:RequiredFieldValidator ID="vali4" runat="server" ErrorMessage="*Password Required" ForeColor="Red" ControlToValidate="password"></asp:RequiredFieldValidator>
            </div>
            <div class="lbls">
            
                <asp:Label ID="lbl" runat="server" ></asp:Label>
            </div>
            <asp:TextBox ID="password" runat="server" CssClass="txt1" placeholder="Password" TextMode="Password"></asp:TextBox>

            <div class="f_pass_and_re_me">
                <asp:HyperLink ID="forgot_pass" runat="server" Text="Forgot Password?" CssClass="redirection_lbl" NavigateUrl="forgot_pass.aspx"></asp:HyperLink>
                <asp:CheckBox ID="re_me" runat="server" CssClass="redirection_lbl" Text=" Remember Me" />
            </div>

            <asp:Button ID="submit_btn" runat="server" Text="LogIn" CssClass="submit_btn"/>

            <div class="login_lbl">
                <span>Not Registered?</span>&nbsp;<asp:HyperLink ID="login_lbl" runat="server" NavigateUrl="~/registration.aspx" Text="Register" CssClass="redirection_lbl"></asp:HyperLink>
            </div>

            <asp:Panel ID="error_msg_panel" runat="server" CssClass="e_msg_panel_closed">

    
                <div class="e_left">
                    <i class="ri-error-warning-line"></i>&nbsp;
                    <asp:Label ID="error_msg" runat="server" Text="Wrong Password"></asp:Label>
                </div>

                <div class="e_right">
                    <i class="ri-close-fill"></i>
                </div>
    
            </asp:Panel>

            <!--<div class="top_strip"></div>-->
            <div class="bottom_strip">
                <div class="b_strip1"></div>
                <div class="b_strip2"></div>
                <div class="b_strip3"></div>
            </div>
            <div class="cvm_outline_holder1">
                <img src="./images/cvm_logo_outlined.png" class="image_holder"/>
            </div>
            <div class="cvm_outline_holder2">
                <img src="./images/cvm_logo_outlined.png" class="image_holder"/>
            </div>
        </div>
        <div class="right">
            <div class="sm_img_holder">
                <asp:Image ID="sm_img" runat="server" CssClass="image_holder" ImageUrl="~/images/semcom_clg_img.jpg" />
            </div>
            <div class="sm_logo_holder">
                <asp:Image ID="sm_logo" runat="server" CssClass="image_holder" ImageUrl="~/images/semcom_logo.png"/>
            </div>
        </div>
    </form>
    </div>

    <script>

        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        /* Error Box Close */
        var e_cancel = document.querySelector(".e_right").addEventListener("click", function () {
            var e_msg_panel = document.querySelector(".e_msg_panel_opened");
            e_msg_panel.className = "e_msg_panel_closed";
        });

    </script>
</body>
</html>
