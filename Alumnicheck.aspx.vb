Imports System.Data.SqlClient
Imports System.Net.Mail

Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadAlumniData()
        End If
    End Sub

    Private Sub LoadAlumniData()
        Dim conString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Using con As New SqlConnection(conString)
            Dim query As String = "SELECT * FROM alumni_info WHERE status='p'"
            Dim cmd As New SqlCommand(query, con)
            con.Open()
            RepeaterAlumni.DataSource = cmd.ExecuteReader()
            RepeaterAlumni.DataBind()
        End Using
    End Sub

    Protected Sub RepeaterAlumni_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles RepeaterAlumni.ItemCommand
        If e.CommandName = "a" OrElse e.CommandName = "r" Then
            Dim alumniId As Integer = Convert.ToInt32(e.CommandArgument)
            Dim status As String = If(e.CommandName = "a", "a", "r")
            'Response.Write("<script> alert(" + alumniId + "); </script>")
            Dim conString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
            Using con As New SqlConnection(conString)
                Dim query As String = "UPDATE alumni_info SET status = @status WHERE alumni_id = @alumni_id"
                Dim cmd As New SqlCommand(query, con)
                cmd.Parameters.AddWithValue("@status", status)
                cmd.Parameters.AddWithValue("@alumni_id", alumniId)
                con.Open()
                cmd.ExecuteNonQuery()
            End Using

            Dim alumniDetails = GetAlumniDetails(alumniId)

            'If alumniDetails IsNot Nothing Then
            '    Dim subject As String = "Alumni Membership {status}"
            '    Dim body As String = CreateEmailBody(alumniDetails, status)
            '    SendEmail(alumniDetails("al_email"), subject, body)
            'End If

            LoadAlumniData()

        End If
    End Sub

    Private Function GetAlumniDetails(ByVal alumniId As Integer) As Dictionary(Of String, String)

        Dim conString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Dim alumniDetails As New Dictionary(Of String, String)

        Using con As New SqlConnection(conString)
            Dim query As String = "SELECT al_full_nm, al_email, al_enroll_no FROM alumni_info WHERE alumni_id = @alumni_id"
            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@alumni_id", alumniId)
            con.Open()

            Using reader As SqlDataReader = cmd.ExecuteReader()
                If reader.Read() Then
                    alumniDetails("al_full_nm") = reader("al_full_nm").ToString()
                    alumniDetails("al_email") = reader("al_email").ToString()
                    alumniDetails("al_enroll_no") = reader("al_enroll_no").ToString()
                    'alumniDetails("al_graduation") = reader("al_graduation").ToString()
                    'alumniDetails("al_dept") = reader("al_dept").ToString()
                End If
            End Using
        End Using

        Return If(alumniDetails.Count > 0, alumniDetails, Nothing)
    End Function

    Private Sub SendEmail(ByVal recipientEmail As String, ByVal subject As String, ByVal body As String)
        Try
            Dim smtpServer As String = System.Configuration.ConfigurationManager.AppSettings("SMTPServer")
            Dim smtpPort As Integer = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings("SMTPPort"))
            Dim emailUsername As String = System.Configuration.ConfigurationManager.AppSettings("EmailUsername")
            Dim emailPassword As String = System.Configuration.ConfigurationManager.AppSettings("EmailPassword")

            Dim smtpClient As New SmtpClient(smtpServer, smtpPort)
            smtpClient.Credentials = New System.Net.NetworkCredential(emailUsername, emailPassword)
            smtpClient.EnableSsl = True

            Dim mailMessage As New MailMessage()
            mailMessage.From = New MailAddress(emailUsername)
            mailMessage.To.Add(recipientEmail)
            mailMessage.Subject = subject
            mailMessage.Body = body
            mailMessage.IsBodyHtml = True

            smtpClient.Send(mailMessage)
            Response.Write("Email sent successfully!")
        Catch ex As Exception
            Response.Write("Error sending email: " & ex.Message)
        End Try
    End Sub

    Private Function CreateEmailBody(ByVal alumniDetails As Dictionary(Of String, String), ByVal status As String) As String
        Dim alumniName As String = alumniDetails("al_full_nm")
        Dim alumniEnrollNo As String = alumniDetails("al_enroll_no")
        'Dim alumniGraduation As String = alumniDetails("al_graduation")
        'Dim alumniDept As String = alumniDetails("al_dept")

        If status = "Accepted" Then
            Return "<p>Dear {alumniName},</p>" &
                   "<p>We are pleased to inform you that you have been <strong>accepted</strong> as a member of the Alumni Platform.</p>" &
                   "<p>Enrollment No: {alumniEnrollNo}<br/></p>" &
                   "<p>Thank you for your participation.</p><p>Best regards,<br/>Alumni Team</p>"
        Else
            Return "<p>Dear {alumniName},</p>" &
                   "<p>We regret to inform you that your membership has been <strong>rejected</strong> at this time.</p>" &
                   "<p>Enrollment No: {alumniEnrollNo}<br/></p>" &
                   "<p>You may reach out to us for further inquiries.</p><p>Best regards,<br/>Alumni Team</p>"
        End If
    End Function
End Class