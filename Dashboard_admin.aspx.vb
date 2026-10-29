Imports System.Data.SqlClient
Imports System.Configuration

Public Class WebForm8
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadDashboardData()
        End If
    End Sub

    Private Sub LoadDashboardData()
        Dim connString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Using conn As New SqlConnection(connString)
            Try
                conn.Open()
                ' Query for total alumni
                Using cmd As New SqlCommand("SELECT COUNT(*) FROM alumni_info", conn)
                    lblTotalAlumni.Text = cmd.ExecuteScalar().ToString()
                End Using
                ' Query for pending approvals
                Using cmd As New SqlCommand("SELECT COUNT(*) FROM alumni_info WHERE status = 'P'", conn)
                    lblPendingAlumni.Text = cmd.ExecuteScalar().ToString()
                End Using
                ' Query for total jobs
                Using cmd As New SqlCommand("SELECT COUNT(*) FROM jobPostings", conn)
                    lblTotalJobs.Text = cmd.ExecuteScalar().ToString()
                End Using
                ' Query for upcoming events
                Using cmd As New SqlCommand("SELECT COUNT(*) FROM Events WHERE EventDate >= GETDATE()", conn)
                    lblTotalEvents.Text = cmd.ExecuteScalar().ToString()
                End Using
                ' Query for approved reviews
                Using cmd As New SqlCommand("SELECT COUNT(*) FROM AlumniReviews WHERE status = 'Approved'", conn)
                    lblTotalReviews.Text = cmd.ExecuteScalar().ToString()
                End Using
            Catch ex As Exception
                ' Handle exception (log it, display error, etc.)
            End Try
        End Using
    End Sub
End Class