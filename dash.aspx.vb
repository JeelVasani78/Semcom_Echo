Imports System.Data.SqlClient
Imports System.Configuration
Public Class dash
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindAlumniReviews()
            BindUpcomingEvents()
        End If
    End Sub

    Private Sub BindAlumniReviews()
        Try
            Dim connString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
            Using conn As New SqlConnection(connString)
                Using cmd As New SqlCommand("SELECT * FROM AlumniReviews WHERE status = 'Approved' ORDER BY [date] DESC", conn)
                    conn.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        rptAlumniReviews.DataSource = reader
                        rptAlumniReviews.DataBind()
                    Else
                        rptAlumniReviews.DataSource = Nothing
                        rptAlumniReviews.DataBind()
                    End If
                End Using
            End Using
        Catch ex As Exception
            ' Handle Exception (log or display message)
        End Try
    End Sub

    Private Sub BindUpcomingEvents()
        Try
            Dim connString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
            Using conn As New SqlConnection(connString)
                Using cmd As New SqlCommand("SELECT EventName, EventDate, EventTime, EventDescription FROM Events WHERE EventDate >= GETDATE() ORDER BY EventDate ASC", conn)
                    conn.Open()
                    Dim reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.HasRows Then
                        rptEvents.DataSource = reader
                        rptEvents.DataBind()
                    Else
                        rptEvents.DataSource = Nothing
                        rptEvents.DataBind()
                    End If
                End Using
            End Using
        Catch ex As Exception
            ' Handle Exception (log or display message)
        End Try
    End Sub

End Class
