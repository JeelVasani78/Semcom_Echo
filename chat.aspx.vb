Imports System.Data.SqlClient
Imports System.IO
Public Class chat
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("alumni_id") Is Nothing Then
            Response.Redirect("../login.aspx")
        End If

        'For Each item1 As RepeaterItem In p_chat_r1.Items
        'Dim p_chat_holder As LinkButton = CType(item1.FindControl("p_chat_holder"), LinkButton)
        'AddHandler p_chat_holder.Click, AddressOf p_chat_holder_Click
        'Next


        If Not IsPostBack Then

            If Session("r_t_img") IsNot Nothing AndAlso Session("r_t_unm") IsNot Nothing Then
                chat_landing_page.Visible = False
                r_t_img.ImageUrl = Convert.ToString(Session("r_t_img"))
                r_t_al_nm.Text = Convert.ToString(Session("r_t_unm"))
            Else
                chat_landing_page.Visible = True
            End If
            load_sidebar_users()


            Dim g_id As Integer = 1
            Dim s_q1 As String = "select * from chat_master where group_id=@g_id1 ORDER BY msg_time DESC"
            Dim cmd1 As New SqlCommand(s_q1, con)
            cmd1.Parameters.AddWithValue("@g_id1", g_id)

            con.Open()
            Dim dt As New DataTable()
            Dim da As New SqlDataAdapter(cmd1)
            da.Fill(dt)
            chat_r1.DataSource = dt
            chat_r1.DataBind()
            con.Close()
        End If

    End Sub

    ' Load Sidebar Users
    Protected Sub load_sidebar_users()
        Dim a_id As Integer = Convert.ToInt32(Session("alumni_id"))
        Dim s_q1 As String = "select a1.al_full_nm,a2.al_img,c.receiver_id,c.sender_id from chat_master c,alumni_info a1,alumni_details a2 where a1.alumni_id=a2.alumni_id and a1.alumni_id=c.sender_id and c.sender_id=@a_id1 ORDER BY msg_time DESC"
        Dim cmd1 As New SqlCommand(s_q1, con)
        cmd1.Parameters.AddWithValue("@a_id1", a_id)

        con.Open()
        Dim dt As New DataTable()
        Dim da As New SqlDataAdapter(cmd1)
        da.Fill(dt)
        p_chat_r1.DataSource = dt
        p_chat_r1.DataBind()
        con.Close()
    End Sub

    Protected Sub search_input_TextChanged(ByVal Sender As Object, ByVal e As EventArgs)
        Dim alumni_id As String = Convert.ToString(Session("alumni_id"))

        Dim full_nm As String = search_input.Text
        Dim s_q1 As String = "select * from alumni_info where al_full_nm LIKE @al_unm1"
        Dim cmd1 As New SqlCommand(s_q1, con)
        cmd1.Parameters.AddWithValue("@al_unm1", full_nm + "%")

        con.Open()
        Dim reader1 As SqlDataReader = cmd1.ExecuteReader()

        If reader1.HasRows Then
            empty_search.Visible = False
            Dim dt As New DataTable()
            dt.Load(reader1)
            search_r1.DataSource = dt
            search_r1.DataBind()


        Else
            ' Show "No Result Found" panel
            empty_search.Visible = True
        End If

        con.Close()
    End Sub

    Protected Sub grp_holder_Click(ByVal sender As Object, ByVal e As EventArgs)

        Session("r_t_img") = grp_img.ImageUrl
        Session("r_t_unm") = grp_lbl.Text


        Response.Redirect("/Alumni/chat.aspx")

    End Sub

    Protected Sub chat_send_btn_Click(ByVal sender As Object, ByVal e As EventArgs)

        Dim s_id As Integer = Convert.ToInt32(Session("alumni_id"))
        Dim g_nm As String = Convert.ToString(Session("r_t_unm"))
        Dim g_id As Integer = 1
        Dim img_path As String = Nothing
        If chat_f_u_btn.HasFile Then


            Dim fileName As String = Path.GetFileName(chat_f_u_btn.PostedFile.FileName)
            Dim savePath As String = Server.MapPath("~/images/" & fileName)


            img_path = "~/images/" & fileName
            chat_f_u_btn.SaveAs(savePath)

        End If

        If g_nm = "Group" Then
            Dim i_q1 As String = "insert into chat_master(sender_id,group_id,txt_msg,img_path) values(@sender_id1,@group_id1,@txt_msg1,@img_path1)"
            Dim cmd1 As New SqlCommand(i_q1, con)
            cmd1.Parameters.AddWithValue("@sender_id1", s_id)
            cmd1.Parameters.AddWithValue("@group_id1", g_id)
            cmd1.Parameters.AddWithValue("@txt_msg1", chat_msg_txt.Text)
            If img_path IsNot Nothing Then
                cmd1.Parameters.AddWithValue("@img_path1", img_path)
            Else
                cmd1.Parameters.AddWithValue("@img_path1", DBNull.Value)
            End If

            con.Open()
            If cmd1.ExecuteNonQuery() Then
                Response.Redirect("/Alumni/chat.aspx")
            End If
            con.Close()

        Else

            Dim r_id As Integer = Convert.ToInt32(Session("other_al_id"))
            Dim i_q1 As String = "insert into chat_master(sender_id,receiver_id,txt_msg,img_path) values(@sender_id1,@receiver_id1,@txt_msg1,@img_path1)"
            Dim cmd1 As New SqlCommand(i_q1, con)
            cmd1.Parameters.AddWithValue("@sender_id1", s_id)
            cmd1.Parameters.AddWithValue("@group_id1", r_id)
            cmd1.Parameters.AddWithValue("@txt_msg1", chat_msg_txt.Text)
            If img_path IsNot Nothing Then
                cmd1.Parameters.AddWithValue("@img_path1", img_path)
            Else
                cmd1.Parameters.AddWithValue("@img_path1", DBNull.Value)
            End If

            con.Open()
            If cmd1.ExecuteNonQuery() Then
                Response.Redirect("/Alumni/chat.aspx")
            End If
            con.Close()
        End If

    End Sub

    Protected Sub p_chat_holder_Click(ByVal sender As Object, ByVal e As EventArgs)

    End Sub
End Class