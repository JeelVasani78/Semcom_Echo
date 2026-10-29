Imports System.Data.SqlClient

Public Class login
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submit_btn_Click(ByVal sender As Object, ByVal e As EventArgs) Handles submit_btn.Click


        If email.Text = "admin@gmail.com" And password.Text = "1234" Then

            Session("admin_id") = "admin"
            Response.Redirect("/Admin/Alumnicheck.aspx")

        Else

            Dim s_q1 As String = "select * from alumni_info where al_email=@email1 and status='a'"
            Dim cmd1 As New SqlCommand(s_q1, con)
            cmd1.Parameters.AddWithValue("@email1", email.Text)

            con.Open()
            Dim reader1 As SqlDataReader = cmd1.ExecuteReader()
            If reader1.Read Then
                Dim a_id As String = Convert.ToString(reader1("alumni_id"))

                Session("alumni_id") = a_id
                Response.Redirect("/Alumni/profile.aspx")
            Else


                lbl.Text = "Account Not Exists! Or Wait for Approval!"

        End If
            con.Close()

        End If
    End Sub

End Class