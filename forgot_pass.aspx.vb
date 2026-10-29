Imports System.Data.SqlClient
Imports System.Net.Mail
Public Class forgot_pass
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submit_btn_Click(ByVal sender As Object, ByVal e As EventArgs) Handles submit_btn.Click


        Dim s_q1 As String = "select * from alumni_info where al_email=@email1"
        Dim cmd1 As New SqlCommand(s_q1, con)
        cmd1.Parameters.AddWithValue("@email1", email.Text)

        con.Open()
        Dim reader1 As SqlDataReader = cmd1.ExecuteReader()
        If reader1.Read Then


            Dim a_id As String = Convert.ToString(reader1("alumni_id"))

            Session("a_id") = a_id
            'Response.Redirect("a_profile.aspx")

            Dim a_email As String = Convert.ToString(reader1("al_email"))
            con.Close()

            Try
                Dim resetLink As String = "https://localhost:44319/reset_pass.aspx"
                Dim message As New MailMessage()
                message.From = New MailAddress("skroll.webservices@gmail.com")
                message.To.Add(a_email)
                message.Subject = "Password Reset"
                message.Body = "<p>Dear User,</p><p>Please click on the link below to reset your password:</p><p><a href='{resetLink}'>Reset Password</a></p><p>Thank you!</p>"
                message.IsBodyHtml = True

                Dim smtp As New SmtpClient()
                smtp.Send(message)
                error_msg_panel.CssClass = "e_msg_panel_opened"
                error_msg.ForeColor = System.Drawing.Color.Green
                error_msg.Text = "Email Sent!"
                Response.Redirect("forgot.aspx")
            Catch ex As Exception
                error_msg_panel.CssClass = "e_msg_panel_opened"
                error_msg.Text = "Error in Email Sending!" + ex.ToString()
            End Try
        Else

            error_msg_panel.CssClass = "e_msg_panel_opened"
            error_msg.Text = "Account not Exists! Or Wait for Approval!"

        End If
    End Sub
End Class