Imports System.Data.SqlClient

Public Class WebForm3
    Inherits System.Web.UI.Page


    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadProfile()
        End If
    End Sub

    Private Sub LoadProfile()
        Try
            Dim alumniID As Integer = Session("alumni_id") ' Get logged-in alumni ID
            Dim query As String = "SELECT * FROM alumni_details WHERE alumni_id = @alumni_id"
            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@alumni_id", alumniID)

            con.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()

            If reader.Read() Then
                lblName.Text = reader("al_full_nm").ToString()
                txtProfession.Text = reader("al_profetion").ToString()
                txtBio.Text = reader("al_bio").ToString()
                txtFacebook.Text = reader("al_face_id").ToString()
                txtTwitter.Text = reader("al_twit_id").ToString()
                txtLinkedIn.Text = reader("al_link_id").ToString()
                txtInstagram.Text = reader("al_insta_id").ToString()
                imgProfile.ImageUrl = If(reader("al_img") IsNot DBNull.Value, reader("al_img").ToString(), "~/Images/default_profile.png")
                lblName.Text = "Welcome " + reader("al_full_nm").ToString()
            Else
                ' No profile found, create a new blank one
                reader.Close()
                Dim insertQuery As String = "INSERT INTO alumni_details (alumni_id, al_full_nm) VALUES (@alumni_id, 'New Alumni')"
                Dim insertCmd As New SqlCommand(insertQuery, con)
                insertCmd.Parameters.AddWithValue("@alumni_id", alumniID)
                insertCmd.ExecuteNonQuery()

                lblName.Text = "New Alumni"
            End If

            reader.Close()
        Catch ex As Exception
            Response.Write("<script>alert('Error loading profile: " & ex.Message & "');</script>")
        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub btnEdit_Click(ByVal sender As Object, ByVal e As EventArgs)
        txtProfession.Enabled = True
        txtBio.Enabled = True
        txtFacebook.Enabled = True
        txtTwitter.Enabled = True
        txtLinkedIn.Enabled = True
        txtInstagram.Enabled = True

        btnEdit.Visible = False
        btnSave.Visible = True
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        Try
            Dim alumniID As Integer = Session("alumni_id")
            Dim query As String = "UPDATE alumni_details SET al_profetion=@prof, al_bio=@bio, al_face_id=@facebook, al_twit_id=@twitter, al_link_id=@linkedin, al_insta_id=@instagram WHERE alumni_id=@alumni_id"
            Dim cmd As New SqlCommand(query, con)
            cmd.Parameters.AddWithValue("@prof", txtProfession.Text)
            cmd.Parameters.AddWithValue("@bio", txtBio.Text)
            cmd.Parameters.AddWithValue("@facebook", txtFacebook.Text)
            cmd.Parameters.AddWithValue("@twitter", txtTwitter.Text)
            cmd.Parameters.AddWithValue("@linkedin", txtLinkedIn.Text)
            cmd.Parameters.AddWithValue("@instagram", txtInstagram.Text)
            cmd.Parameters.AddWithValue("@alumni_id", alumniID)

            con.Open()
            cmd.ExecuteNonQuery()

            Response.Write("<script>alert('Profile updated successfully!');</script>")
        Catch ex As Exception
            Response.Write("<script>alert('Error updating profile: " & ex.Message & "');</script>")
        Finally
            con.Close()
        End Try

        txtProfession.Enabled = False
        txtBio.Enabled = False
        txtFacebook.Enabled = False
        txtTwitter.Enabled = False
        txtLinkedIn.Enabled = False
        txtInstagram.Enabled = False

        btnEdit.Visible = True
        btnSave.Visible = False
    End Sub
End Class