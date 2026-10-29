Imports System.Data.SqlClient
Public Class reset_pass
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submit_btn_Click(ByVal sender As Object, ByVal e As EventArgs) Handles submit_btn.Click


        Dim s_q1 As String = "select al_email from alumni_info where al_email=@email1"
        Dim cmd1 As New SqlCommand(s_q1, con)
        cmd1.Parameters.AddWithValue("@email1", email.Text)

        con.Open()
        Dim reader1 As SqlDataReader = cmd1.ExecuteReader()
        If reader1.Read Then
            con.Close()



            Dim u_q1 As String = "update alumni_info set al_password=@pass1 where al_email=@email1"
            Dim cmd2 As New SqlCommand(u_q1, con)
            cmd2.Parameters.AddWithValue("@email1", email.Text)
            cmd2.Parameters.AddWithValue("@pass1", password.Text)

            con.Open()
            If cmd2.ExecuteNonQuery() Then
                Response.Redirect("login.aspx")
            End If
            con.Close()

        Else

            error_msg_panel.CssClass = "e_msg_panel_opened"
            error_msg.Text = "Account Not Exists! Or Wait for Approval!"

        End If



    End Sub
End Class