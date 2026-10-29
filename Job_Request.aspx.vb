Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail

Public Class WebForm7
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindJobApprovalRequests()
        End If
    End Sub

    Private Sub BindJobApprovalRequests()
        Dim connString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Using conn As New SqlConnection(connString)

            Dim cmd As New SqlCommand("SELECT jp.JobId, jp.JobTitle, jp.JobDescription, jp.Status, ai.al_full_nm AS FullName, ai.al_email AS Email FROM JobPostings jp INNER JOIN alumni_info ai ON jp.alumni_id = ai.alumni_id WHERE jp.Status = 'Pending'", conn)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            rptJobApprovalRequests.DataSource = reader
            rptJobApprovalRequests.DataBind()
        End Using
    End Sub

    Protected Sub ApproveJob(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim jobId As Integer = Convert.ToInt32(e.CommandArgument)
        Dim email As String = String.Empty
        Dim jobTitle As String = String.Empty
        Dim jobDescription As String = String.Empty

        Dim connString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Using conn As New SqlConnection(connString)
            Dim cmd As New SqlCommand("SELECT JobTitle, JobDescription, (SELECT al_email FROM alumni_info WHERE alumni_id = (SELECT alumni_id FROM JobPostings WHERE JobId = @JobId)) AS Email FROM JobPostings WHERE JobId = @JobId", conn)
            cmd.Parameters.AddWithValue("@JobId", jobId)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            If reader.Read() Then
                jobTitle = reader("JobTitle").ToString()
                jobDescription = reader("JobDescription").ToString()
                email = reader("Email").ToString()
            End If
        End Using

        Using conn As New SqlConnection(connString)
            Dim cmd As New SqlCommand("UPDATE JobPostings SET Status = @Status WHERE JobId = @JobId", conn)
            cmd.Parameters.AddWithValue("@Status", "Approved")
            cmd.Parameters.AddWithValue("@JobId", jobId)
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using

        'SendApprovalEmail(email, jobTitle, jobDescription)

        BindJobApprovalRequests()

        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Job approved successfully!');", True)
    End Sub

    Protected Sub RejectJob(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim jobId As Integer = Convert.ToInt32(e.CommandArgument)
        Dim email As String = String.Empty
        Dim jobTitle As String = String.Empty
        Dim jobDescription As String = String.Empty

        Dim connString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Using conn As New SqlConnection(connString)
            Dim cmd As New SqlCommand("SELECT JobTitle, JobDescription, (SELECT al_email FROM alumni_info WHERE alumni_id = (SELECT alumni_id FROM JobPostings WHERE JobId = @JobId)) AS Email FROM JobPostings WHERE JobId = @JobId", conn)
            cmd.Parameters.AddWithValue("@JobId", jobId)
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            If reader.Read() Then
                jobTitle = reader("JobTitle").ToString()
                jobDescription = reader("JobDescription").ToString()
                email = reader("Email").ToString()
            End If
        End Using

        Using conn As New SqlConnection(connString)
            Dim cmd As New SqlCommand("UPDATE JobPostings SET Status = @Status WHERE JobId = @JobId", conn)
            cmd.Parameters.AddWithValue("@Status", "Rejected")
            cmd.Parameters.AddWithValue("@JobId", jobId)
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using

        ' SendRejectionEmail(email, jobTitle, jobDescription)
        BindJobApprovalRequests()

        ' Show alert message
        ClientScript.RegisterStartupScript(Me.GetType(), "alert", "alert('Job rejected successfully!');", True)
    End Sub

    ' Method to send approval email with custom content
    Private Sub SendApprovalEmail(ByVal recipient As String, ByVal jobTitle As String, ByVal jobDescription As String)
        Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
        Dim smtpPort As Integer = Convert.ToInt32(ConfigurationManager.AppSettings("SMTPPort"))
        Dim emailUsername As String = ConfigurationManager.AppSettings("EmailUsername")
        Dim emailPassword As String = ConfigurationManager.AppSettings("EmailPassword")

        Using mail As New MailMessage()
            mail.From = New MailAddress(emailUsername)
            mail.To.Add(recipient)
            mail.Subject = "Your Job Posting '{jobTitle}' has been Approved"
            mail.IsBodyHtml = True
            mail.Body = "<html><body><h2>Dear Alumni,</h2><p>Congratulations! Your job posting titled <strong>'{jobTitle}'</strong> has been approved.</p><p>Here are the details of your approved job posting:</p><ul><li><strong>Job Title:</strong> {jobTitle}</li><li><strong>Job Description:</strong> {jobDescription}</li><li><strong>Status:</strong> Approved</li></ul><p>Thank you for your submission and your contribution to our alumni community.</p><p>Best Regards,<br/>The Alumni Relations Team<br/>Jeel Vidhya Mandal<br/>9876543210<br/>Alumni(Platform)</p></body></html>"
                

            Using smtp As New SmtpClient(smtpServer, smtpPort)
                smtp.Credentials = New NetworkCredential(emailUsername, emailPassword)
                smtp.EnableSsl = True
                smtp.Send(mail)
            End Using
        End Using
    End Sub

    ' Method to send rejection email with custom content
    Private Sub SendRejectionEmail(ByVal recipient As String, ByVal jobTitle As String, ByVal jobDescription As String)
        Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
        Dim smtpPort As Integer = Convert.ToInt32(ConfigurationManager.AppSettings("SMTPPort"))
        Dim emailUsername As String = ConfigurationManager.AppSettings("EmailUsername")
        Dim emailPassword As String = ConfigurationManager.AppSettings("EmailPassword")

        Using mail As New MailMessage()
            mail.From = New MailAddress(emailUsername)
            mail.To.Add(recipient)
            mail.Subject = "Your Job Posting '{jobTitle}' has been Rejected"
            mail.IsBodyHtml = True
            mail.Body = "<html>                <body>                    <h2>Dear Alumni,</h2>" &
                    "<p>We regret to inform you that your job posting titled <strong>'{jobTitle}'</strong> has been rejected.</p" &
                    "<p>Here are the details of your rejected job posting:</p>" &
                    "<ul>" &
                    "    <li><strong>Job Title:</strong> {jobTitle}</li>" &
                     "   <li><strong>Job Description:</strong> {jobDescription}</li>" &
                      "  <li><strong>Status:</strong> Rejected</li>" &
                    "</ul>" &
                    "<p>If you would like further information or wish to resubmit the job posting, please contact us.</p>" &
                    "<p>Best Regards,<br/>" &
                    "The Alumni Relations Team<br/>" &
                    "Jeel Vidhya Mandal<br/>" &
                    "9876543210<br/>            Alumni(Platform)     </p>           </body>       </html>"

            Using smtp As New SmtpClient(smtpServer, smtpPort)
                smtp.Credentials = New NetworkCredential(emailUsername, emailPassword)
                smtp.EnableSsl = True
                smtp.Send(mail)
            End Using
        End Using
    End Sub

End Class