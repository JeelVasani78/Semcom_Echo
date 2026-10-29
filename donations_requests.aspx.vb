Imports System.Data.SqlClient
Imports System.Net
Imports System.Net.Mail


Public Class WebForm6
    Inherits System.Web.UI.Page

    Private connectionString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindDonationRequests()
        End If
    End Sub

    Private Sub BindDonationRequests()
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT * FROM Donations WHERE Status = 'Pending'", con)
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            rptDonationRequests.DataSource = reader
            rptDonationRequests.DataBind()
        End Using
    End Sub

    Protected Sub AcceptRequest(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim requestId As Integer = Convert.ToInt32(e.CommandArgument)
        AcceptDonationRequest(requestId)
    End Sub

    Protected Sub RejectRequest(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim requestId As Integer = Convert.ToInt32(e.CommandArgument)
        RejectDonationRequest(requestId)
    End Sub

    Private Sub AcceptDonationRequest(ByVal requestId As Integer)
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("UPDATE Donations SET Status = 'Accepted' WHERE RequestId = @RequestId", con)
            cmd.Parameters.AddWithValue("@RequestId", requestId)
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

        Dim alumniEmail As String = GetAlumniEmail(requestId)
        Dim subject As String = "Donation Request Accepted"
        Dim body As String = "<p>Dear Alumni,</p><p>Your donation request for the amount of <strong>₹{GetDonationAmount(requestId).ToString()}</strong> has been accepted. Thank you for your contribution!</p><p>If you would like to discuss further donations, please feel free to contact the college directly.</p><p>Best Regards,<br>Your Alumni Team</p>"
        'SendEmail(alumniEmail, subject, body)

        BindDonationRequests()
    End Sub

    Private Sub RejectDonationRequest(ByVal requestId As Integer)
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("UPDATE Donations SET Status = 'Rejected' WHERE RequestId = @RequestId", con)
            cmd.Parameters.AddWithValue("@RequestId", requestId)
            con.Open()
            cmd.ExecuteNonQuery()
        End Using

        Dim alumniEmail As String = GetAlumniEmail(requestId)
        Dim subject As String = "Donation Request Rejected"
        Dim body As String = "<p>Dear Alumni,</p><p>Your donation request has been rejected. If you have any questions or would like to discuss further donation opportunities, please feel free to contact the college.</p><p>Best Regards,<br>Your Alumni Team</p>"
        'SendEmail(alumniEmail, subject, body)

        BindDonationRequests()
    End Sub

    Private Function GetAlumniEmail(ByVal requestId As Integer) As String
        Dim email As String = String.Empty
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT Email FROM Donations WHERE RequestId = @RequestId", con)
            cmd.Parameters.AddWithValue("@RequestId", requestId)
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            If reader.Read() Then
                email = reader("Email").ToString()
            End If
        End Using
        Return email
    End Function

    Private Function GetDonationAmount(ByVal requestId As Integer) As Decimal
        Dim amount As Decimal = 0
        Using con As New SqlConnection(connectionString)
            Dim cmd As New SqlCommand("SELECT Amount FROM Donations WHERE RequestId = @RequestId", con)
            cmd.Parameters.AddWithValue("@RequestId", requestId)
            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            If reader.Read() Then
                amount = Convert.ToDecimal(reader("Amount"))
            End If
        End Using
        Return amount
    End Function

    Private Sub SendEmail(ByVal toEmail As String, ByVal subject As String, ByVal body As String)
        Try
            Dim fromAddress As New MailAddress(ConfigurationManager.AppSettings("EmailUsername"), "jvm")
            Dim toAddress As New MailAddress(toEmail)
            Dim smtp As New SmtpClient() With {
                .Host = ConfigurationManager.AppSettings("SMTPServer"),
                .Port = Convert.ToInt32(ConfigurationManager.AppSettings("SMTPPort")),
                .EnableSsl = True,
                .DeliveryMethod = SmtpDeliveryMethod.Network,
                .UseDefaultCredentials = False,
                .Credentials = New NetworkCredential(fromAddress.Address, ConfigurationManager.AppSettings("EmailPassword"))
            }

            Using message As New MailMessage(fromAddress, toAddress) With {
                .Subject = subject,
                .Body = body,
                .IsBodyHtml = True
            }
                smtp.Send(message)
                Response.Write("<script>alert('Email Sent.');</script>")
            End Using
        Catch ex As Exception
            ' Log the error or display an alert
            Response.Write("<script>alert('Failed to send Email.');</script>")
        End Try
    End Sub

End Class