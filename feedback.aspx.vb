Imports System
Imports System.Data.SqlClient
Imports System.Configuration
Public Class feedback
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)

    Public TotalReviews As Integer = 0
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub SubmitReview_Click(ByVal sender As Object, ByVal e As EventArgs) Handles SubmitReview.Click
        ' Retrieve form data
        Dim name As String = Me.name.Text
        Dim email As String = Me.email.Text
        Dim rating As Integer = Convert.ToInt32(DropDownList1.Text) ' Retrieve the rating from HiddenField
        Dim review As String = Me.review.Text

        ' Insert data into the database
        'Try
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
            ' Define SQL query to insert data
            Dim query As String = "INSERT INTO AlumniReviews (Name, Email, Rating, Review) VALUES (@Name, @Email, @Rating, @Review)"

            ' Create the SQL command
            Using cmd As New SqlCommand(query, conn)
                ' Add parameters to prevent SQL injection
                cmd.Parameters.AddWithValue("@Name", name)
                cmd.Parameters.AddWithValue("@Email", email)
                cmd.Parameters.AddWithValue("@Rating", rating)
                cmd.Parameters.AddWithValue("@Review", review)

                ' Open the connection
                conn.Open()

                ' Execute the query to insert data
                cmd.ExecuteNonQuery()

                ' Display success message
                Response.Write("<script>alert('Review submitted successfully.');</script>")
            End Using
        End Using
        'Catch ex As Exception
        '    ' Handle any errors that occur
        '    Response.Write("<script>alert('An error occurred while submitting the review.');</script>")
        'End Try
    End Sub

    Protected Sub ResetForm_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ResetForm.Click
        ' Logic to reset the form fields
        Me.name.Text = String.Empty
        Me.email.Text = String.Empty
        Me.review.Text = String.Empty
    End Sub

End Class