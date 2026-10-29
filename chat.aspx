
<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="chat.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.chat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="~/Alumni/Styles/chat.css" rel="stylesheet" />
    
    <style type="text/css">
        /* Keep Group navigation properly spaced */
        .left_middle {
            display: block;
            padding: 12px 13px 0;
            box-sizing: border-box;
        }

        .left_middle .grp_holder {
            display: flex;
            align-items: center;
            gap: 10px;
            width: 100%;
            min-height: 48px;
            padding: 6px 8px;
            box-sizing: border-box;
            border-radius: 6px;
            text-decoration: none;
        }

        /* Home link at the bottom of the sidebar */
        .sidebar_home {
            position: absolute;
            bottom: 24px;
            left: 13px;
            right: 13px;
        }

        .home_link {
            display: flex;
            align-items: center;
            width: 100%;
            min-height: 44px;
            padding: 10px 16px;
            box-sizing: border-box;
            color: white;
            background: transparent;
            border-radius: 6px;
            text-decoration: none;
            font-family: Arial, sans-serif;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.2s ease;
        }

        .home_link:hover {
            background-color: rgba(255, 255, 255, 0.18);
        }

        /* Improve heading and divider spacing */
        .left_top {
            padding: 12px 13px 0;
            box-sizing: border-box;
        }

        .left_top > span {
            display: block;
            margin-bottom: 18px;
        }

        .left_top .l_top_icons {
            margin-bottom: 0;
        }
    </style>
</head>
<body>
    <div class="main">
        <form id="frm1" runat="server">
            <asp:ScriptManager ID="script_manager" runat="server"></asp:ScriptManager>

            <!-- Sidebar -->
            <div class="left">

                <div class="cvm_outline_holder1">
                    <img src="../images/cvm_logo_outlined.png" class="image_holder"/>
                </div>

                <div class="cvm_outline_holder2">
                    <img src="../images/cvm_logo_outlined.png" class="image_holder"/>
                </div>

                <div class="left_top">
                    <span>Chat</span>
                    <div class="l_top_icons">
                        <asp:HyperLink ID="Navigate_DashBoard" runat="server" NavigateUrl="/Alumni/DashBoard_Alumni.aspx">
                            <i class="fa-solid fa-house"></i>
                        </asp:HyperLink>
                        <i class="fa-solid fa-magnifying-glass" id="search_icon"></i>
                    </div>
                </div>

                <div class="left_middle">
                    <asp:LinkButton ID="grp_holder" runat="server" CssClass="grp_holder" OnClick="grp_holder_Click">
                        <div class="grp_img_holder">
                            <asp:Image ID="grp_img" runat="server" CssClass="image_holder" ImageUrl="~/images/user_grp.jpg" />
                        </div>
                        <asp:Label ID="grp_lbl" runat="server" Text="Group"></asp:Label>
                    </asp:LinkButton>
                </div>

                <div class="left_bottom">
                    <!--<asp:Repeater ID="p_chat_r1" runat="server">
                    <ItemTemplate>
                        <asp:LinkButton ID="p_chat_holder" runat="server" CssClass="grp_holder" OnClick="p_chat_holder_Click">
                            <div class="grp_img_holder">
                                <asp:Image ID="p_chat_img" runat="server" CssClass="image_holder" ImageUrl='<%# Eval("al_img") %>' />
                            </div>
                            <asp:Label ID="p_nm_lbl" runat="server" Text='<%# Eval("al_full_nm") %>'></asp:Label>
                            <asp:Label ID="p_id_lbl" runat="server" Text='<%# Eval("receiver_id") %>'></asp:Label>
                        </asp:LinkButton>
                    </ItemTemplate>
                    </asp:Repeater>-->
                </div>

                <!-- Home link at bottom-left -->
                <div class="sidebar_home">
                    <asp:HyperLink ID="home_holder" runat="server"
                        NavigateUrl="~/Alumni/dash.aspx"
                        CssClass="home_link">Home</asp:HyperLink>
                </div>

            </div>
            <!-- End Sidebar -->

            <!-- Right -->
            <div class="right">

                <asp:Panel ID="chat_landing_page" runat="server" CssClass="chat_landing_page" Visible="false">
                    <p>Welcome to&nbsp;<span>Alumni Chat Section</span></p>
                </asp:Panel>

                <asp:Panel ID="right_top" runat="server" CssClass="right_top">
                    <div class="r_t_left">
                        <div class="r_t_img_holder">
                            <asp:Image ID="r_t_img" runat="server" CssClass="image_holder" />
                        </div>
                        <asp:Label ID="r_t_al_nm" runat="server"></asp:Label>
                    </div>
                </asp:Panel>

                <asp:Panel ID="right_bottom" runat="server" CssClass="right_bottom">
                    <asp:UpdatePanel ID="chat_up1" runat="server">
                        <ContentTemplate>
                            <asp:Panel ID="chat_holder" runat="server" CssClass="chat_holder">
                                <asp:Label ID="test_lbl" runat="server"></asp:Label>

                                <asp:Repeater ID="chat_r1" runat="server">
                                    <ItemTemplate>
                                        <div class="message <%# IIf(Eval("sender_id").ToString() = Session("alumni_id").ToString(), "sent", "received") %>">
                                            <%# Eval("txt_msg") %><br/>
                                            <asp:Image ID="imgChat" runat="server"
                                                ImageUrl='<%# IIf(String.IsNullOrEmpty(Eval("img_path").ToString()), "", Eval("img_path").ToString()) %>'
                                                Visible='<%# Not String.IsNullOrEmpty(Eval("img_path").ToString()) %>'
                                                Width="150px" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </asp:Panel>

                            <asp:Panel ID="chat_controls" runat="server" CssClass="chat_controls">
                                <asp:FileUpload ID="chat_f_u_btn" runat="server" CssClass="chat_f_u_btn" />
                                <asp:TextBox ID="chat_msg_txt" runat="server" CssClass="chat_msg_txt" placeholder="Type a Message"></asp:TextBox>
                                <asp:Button ID="chat_send_btn" runat="server" CssClass="chat_send_btn" Text="Send" OnClick="chat_send_btn_Click" />
                            </asp:Panel>
                        </ContentTemplate>

                        <Triggers>
                            <asp:PostBackTrigger ControlID="chat_send_btn" />
                        </Triggers>
                    </asp:UpdatePanel>
                </asp:Panel>

            </div>
            <!-- End Right -->

            <!-- Search Panel -->
            <div class="search_panel">

                <div class="cvm_outline_holder1">
                    <img src="../images/cvm_logo_outlined.png" class="image_holder"/>
                </div>

                <div class="cvm_outline_holder2">
                    <img src="../images/cvm_logo_outlined.png" class="image_holder"/>
                </div>

                <div class="search_top">
                    <h2>Search</h2>
                    <i class="fa-solid fa-xmark" id="search_cancel"></i>
                </div>

                <div class="search_bottom">
                    <asp:Panel ID="search_p1" runat="server">

                        <asp:UpdatePanel ID="search_up1" runat="server">
                            <ContentTemplate>

                                <asp:Panel ID="search_bar" runat="server" class="search_bar">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                    <asp:TextBox ID="search_input" runat="server"
                                        placeholder="Search"
                                        CssClass="search_input"
                                        AutoPostBack="true"
                                        OnTextChanged="search_input_TextChanged"></asp:TextBox>
                                </asp:Panel>

                                <asp:Panel ID="search_result" runat="server" Visible="true" CssClass="search_result">
                                    <asp:Repeater ID="search_r1" runat="server">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="search_id" runat="server" CssClass="s_btn_holder">
                                                <div class="sidebar_p_img">
                                                    <asp:Image ID="search_profile" runat="server"
                                                        CssClass="image_holder"
                                                        ImageUrl='<%# Eval("al_img") %>'/>
                                                </div>
                                                <asp:Label ID="search_usernm" runat="server" Text='<%# Eval("al_full_nm") %>'></asp:Label>
                                                <asp:Label ID="s_f_user_id" runat="server" Text='<%# Eval("alumni_id") %>' style="display:none;"></asp:Label>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                    <asp:Panel ID="empty_search" runat="server" CssClass="empty_search" Visible="false">
                                        <asp:Label ID="empty_search_lbl" runat="server" Text="No Result Found!"></asp:Label>
                                    </asp:Panel>
                                </asp:Panel>

                            </ContentTemplate>

                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="search_input" EventName="TextChanged" />
                            </Triggers>
                        </asp:UpdatePanel>

                    </asp:Panel>
                </div>
            </div>
            <!-- End Search Panel -->

        </form>
    </div>

    <script>
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        var search_icon = document.querySelector("#search_icon");
        var search_cancel = document.querySelector("#search_cancel");
        var search_panel = document.querySelector(".search_panel");

        search_icon.addEventListener("click", function () {
            if (search_panel.style.left == "250px") {
                search_panel.style.left = "-60px";
            }
            else {
                search_panel.style.left = "250px";
            }
        });

        search_cancel.addEventListener("click", function () {
            if (search_panel.style.left == "250px") {
                search_panel.style.left = "-60px";
            }
            else {
                search_panel.style.left = "250px";
            }
        });
    </script>
</body>
</html>
