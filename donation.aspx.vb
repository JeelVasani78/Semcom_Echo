Imports System.Data.SqlClient
Imports System.Net.Mail
Public Class WebForm5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("alumni_id") Is Nothing Then
            Response.Redirect("../login.aspx")
        End If

        ShowRequestStatus()
        'If Not IsPostBack Then
        'Display current request status if a request already exists
        'ShowRequestStatus()
        'End If
    End Sub
    Protected Sub SubmitDonationRequest(ByVal sender As Object, ByVal e As EventArgs)
        Dim alumniId As String = Session("alumni_id") ' Alumni ID from session
        Dim amount As Decimal
        Dim message As String = msg.Text
        Dim alumniEmail As String = String.Empty

        ' Validate if the amount input is a valid decimal number
        If Decimal.TryParse(amt.Text, amount) Then
            ' Fetch the alumni email from the alumni_info table
            alumniEmail = GetAlumniEmail(alumniId)

            ' Check for duplicate requests
            If Not IsDuplicateRequest(alumniId) Then
                'Try
                ' Save the donation request into the database
                Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
                    Dim query As String = "INSERT INTO Donations (AlumniId, Amount, Message, Status, Email) VALUES (@AlumniID, @Amount, @Message, 'Pending', @AlumniEmail)"
                    Using cmd As New SqlCommand(query, con)
                        cmd.Parameters.AddWithValue("@AlumniID", alumniId)
                        cmd.Parameters.AddWithValue("@Amount", amount)
                        cmd.Parameters.AddWithValue("@Message", message)
                        cmd.Parameters.AddWithValue("@AlumniEmail", alumniEmail)

                        con.Open()
                        cmd.ExecuteNonQuery()
                    End Using
                End Using

                ' Send email notification
                'SendEmailNotification(alumniEmail, amount, message)

                ' Switch to the status panel and show success message
                RequestPanel.Visible = False
                StatusPanel.Visible = True
                RequestStatus.Text = "Your donation request has been submitted. Current status: Pending."
                RequestStatus.CssClass = "status-message pending-message"
                Button1.Enabled = False
                ' Catch ex As Exception
                ' Handle SQL errors or other exceptions here
                'ErrorMessage.Text = "An error occurred while submitting your request. Please try again."
                'ErrorMessage.Visible = True
                'End Try
            Else
                ErrorMessage.Text = "You already have a pending donation request."
                ErrorMessage.Visible = True
            End If
        Else
            ' Handle invalid amount input by showing an error message
            ErrorMessage.Text = "Please enter a valid donation amount."
            ErrorMessage.Visible = True
        End If
    End Sub

    Protected Function GetAlumniEmail(ByVal alumniId As String) As String
        Dim email As String = String.Empty
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
            Dim query As String = "SELECT al_email FROM alumni_info WHERE alumni_id = @AlumniID"
            Using cmd As New SqlCommand(query, con)
                cmd.Parameters.AddWithValue("@AlumniID", alumniId)

                con.Open()
                email = Convert.ToString(cmd.ExecuteScalar())
            End Using
        End Using
        Return email
    End Function

    Protected Function IsDuplicateRequest(ByVal alumniId As String) As Boolean
        Dim exists As Boolean = False
        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
            Dim query As String = "SELECT COUNT(*) FROM Donations WHERE AlumniId = @AlumniID AND Status = 'Pending'"
            Using cmd As New SqlCommand(query, con)
                cmd.Parameters.AddWithValue("@AlumniID", alumniId)

                con.Open()
                exists = Convert.ToInt32(cmd.ExecuteScalar()) > 0
            End Using
        End Using
        Return exists
    End Function

    Protected Sub ShowRequestStatus()
        Dim alumniId As String = Session("alumni_id")

        Using con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
            Dim query As String = "SELECT Status FROM Donations WHERE AlumniId = @AlumniID"
            Using cmd As New SqlCommand(query, con)
                cmd.Parameters.AddWithValue("@AlumniID", alumniId)

                con.Open()
                Dim status As Object = cmd.ExecuteScalar()

                ' If there is a donation request, show its current status
                If status IsNot Nothing Then
                    RequestPanel.Visible = False
                    StatusPanel.Visible = True
                    Select Case status.ToString()
                        Case "Pending"
                            RequestStatus.Text = "      Your donation request is pending."
                            RequestStatus.CssClass = "status-message pending-message"
                        Case "Accepted"
                            RequestStatus.Text = "      Your donation request has been accepted."
                            RequestStatus.CssClass = "status-message accepted-message"
                            Button1.Enabled = True
                        Case "Rejected"
                            RequestStatus.Text = "       Your donation request has been rejected."
                            RequestStatus.CssClass = "status-message rejected-message"
                    End Select
                End If
            End Using
        End Using
    End Sub

    Protected Sub SendEmailNotification(ByVal alumniEmail As String, ByVal amount As Decimal, ByVal message As String)
        Try
            Dim smtpServer As String = ConfigurationManager.AppSettings("SMTPServer")
            Dim smtpPort As Integer = Convert.ToInt32(ConfigurationManager.AppSettings("SMTPPort"))
            Dim emailUsername As String = ConfigurationManager.AppSettings("EmailUsername")
            Dim emailPassword As String = ConfigurationManager.AppSettings("EmailPassword")

            Dim mail As New MailMessage()
            mail.From = New MailAddress(emailUsername) ' Use your domain or configuration setting
            mail.To.Add(alumniEmail)
            mail.Subject = "Donation Request Submitted"

            ' Format amount in Indian Rupees
            Dim formattedAmount As String = String.Format("₹{0:N2}", amount)

            mail.Body = "Dear Alumni,<br/><br/>Your donation request for the amount of {formattedAmount} has been successfully submitted.<br/>Message: {message}<br/><br/>Thank you for your support!"
            mail.IsBodyHtml = True

            Using smtp As New SmtpClient(smtpServer, smtpPort)
                smtp.Credentials = New System.Net.NetworkCredential(emailUsername, emailPassword)
                smtp.EnableSsl = True ' Set to True if your SMTP server requires SSL
                smtp.Send(mail)
            End Using
        Catch ex As Exception
            ' Log email sending error if needed
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button1.Click
        RequestPanel.Visible = True
        StatusPanel.Visible = False
        Button1.Enabled = False
    End Sub

End Class