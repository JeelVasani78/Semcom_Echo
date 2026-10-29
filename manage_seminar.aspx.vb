Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration

Public Class WebForm11
    Inherits System.Web.UI.Page

    Private ReadOnly connectionString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadSeminarRequests()
        End If
    End Sub

    ' Load seminar requests into the Repeater
    Private Sub LoadSeminarRequests()
        Dim query As String = "SELECT * FROM seminar_request where status='p' ORDER BY s_date DESC"

        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                Dim da As New SqlDataAdapter(cmd)
                Dim dt As New DataTable()

                conn.Open()
                da.Fill(dt)
                conn.Close()

                rptSeminars.DataSource = dt
                rptSeminars.DataBind()
            End Using
        End Using
    End Sub

    ' Handles both Accept and Reject button clicks
    Protected Sub UpdateSeminarStatus(ByVal sender As Object, ByVal e As CommandEventArgs)
        Dim seminarId As Integer = Convert.ToInt32(e.CommandArgument)
        Dim newStatus As String = If(e.CommandName = "Accept", "a", "r") ' "A" for Accepted, "R" for Rejected

        Dim query As String = "UPDATE seminar_request SET status = @Status WHERE seminar_id = @SeminarId"

        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@Status", newStatus)
                cmd.Parameters.AddWithValue("@SeminarId", seminarId)

                conn.Open()
                cmd.ExecuteNonQuery()
                conn.Close()
            End Using
        End Using

        ' Reload the updated seminar list
        LoadSeminarRequests()
    End Sub
End Class