<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="forgot_pass.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.forgot_pass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div class="main">
    <form id="frm1" runat="server">
    <div class="left">
        
        <h2>Forgot Password</h2>
        
        <div class="lbls">
            <asp:RequiredFieldValidator ID="vali2" runat="server" ErrorMessage="*Email Required" ForeColor="Red" ControlToValidate="email"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="vali3" runat="server" ErrorMessage="*Enter Valid Email" ForeColor="Red" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        </div>

        <asp:TextBox ID="email" runat="server" CssClass="txt1" placeholder="Email" TextMode="Email"></asp:TextBox>
            
        

        <asp:Button ID="submit_btn" runat="server" Text="Sent" CssClass="submit_btn"/>

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
