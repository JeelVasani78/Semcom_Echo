Imports System.Data.SqlClient

Public Class WebForm10
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("alumni_id") Is Nothing Then
            Response.Redirect("../login.aspx")
        End If

        If Not IsPostBack Then
            ' Set the min attribute to today's date
            career_date.Attributes("min") = DateTime.Now.ToString("yyyy-MM-dd")
        End If
    End Sub

    Protected Sub submit_btn_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim al_id As Integer = Convert.ToInt32(Session("alumni_id"))

        Dim i_q1 As String = "insert into seminar_request(alumni_id,title,description,s_date,s_time) values(@alumni_id,@title,@desc,@s_date,@s_time)"
        Dim cmd1 As New SqlCommand(i_q1, con)
        cmd1.Parameters.AddWithValue("@alumni_id", al_id)
        cmd1.Parameters.AddWithValue("@title", title_txt.Text)
        cmd1.Parameters.AddWithValue("@desc", career_input.Text)
        cmd1.Parameters.AddWithValue("@s_date", career_date.Text)
        cmd1.Parameters.AddWithValue("@s_time", time_txt.Text)

        con.Open()
        If cmd1.ExecuteNonQuery() Then
            Response.Redirect("/Alumni/career_counseling.aspx")
            Response.Write("<script>alert('Your Request has been Submitted, We will send an Email!');</script>")
        End If
        con.Close()
    End Sub
End Class