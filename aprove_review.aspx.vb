Imports System
Imports System.Data.SqlClient
Imports System.Configuration
Public Class aprove_review
    Inherits System.Web.UI.Page

    Public TotalReviews As Integer = 0
    Private connectionString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            BindReviews()
        End If

    End Sub

    Private Sub BindReviews()

        Dim query As String = "SELECT review_id, Name, Email, Rating, Review, date FROM AlumniReviews where status='p' ORDER BY date DESC"


        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                conn.Open()

                Dim reader As SqlDataReader = cmd.ExecuteReader()

                Dim dt As New DataTable()
                dt.Load(reader)
                TotalReviews = dt.Rows.Count

                ReviewRepeater.DataSource = dt
                ReviewRepeater.DataBind()
            End Using
        End Using
    End Sub


    Public Function GetStars(ByVal rating As Object) As String
        Dim stars As Integer = Convert.ToInt32(rating)
        Dim starHtml As String = ""


        For i As Integer = 1 To stars
            starHtml &= "<i class='fas fa-star'></i>"
        Next

        For i As Integer = stars + 1 To 5
            starHtml &= "<i class='far fa-star'></i>"
        Next

        Return starHtml
    End Function

    Protected Sub ReviewRepeater_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles ReviewRepeater.ItemCommand
        Dim reviewID As Integer = Convert.ToInt32(e.CommandArgument)

        If e.CommandName = "Accept" Then
            AcceptReview(reviewID)
        ElseIf e.CommandName = "Reject" Then
            RejectReview(reviewID)
        End If
    End Sub

    Private Sub AcceptReview(ByVal reviewID As Integer)
        Dim query As String = "UPDATE AlumniReviews SET status = 'Approved' WHERE review_id = @ReviewID"
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@ReviewID", reviewID)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
        BindReviews()
    End Sub

    Private Sub RejectReview(ByVal reviewID As Integer)
        Dim query As String = "UPDATE AlumniReviews SET status = 'Rejected' WHERE review_id = @ReviewID"
        Using conn As New SqlConnection(connectionString)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@ReviewID", reviewID)
                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using
        BindReviews()
    End Sub
End Class