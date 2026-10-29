Imports System.Data.SqlClient
Imports System.Configuration
Public Class WebForm4
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("alumni_id") Is Nothing Then
            Response.Redirect("../login.aspx")
        End If
        hfAlumniId.Value = Session("alumni_id")
        If Not IsPostBack Then
            ClearFormFields()
        End If
    End Sub

    Protected Sub ClearFormFields()
        txtJobTitle.Text = ""
        txtJobDescription.Text = ""
        txtCompanyName.Text = ""
        txtLocation.Text = ""
        ddlJobCategory.SelectedValue = "0"
        txtSalary.Text = ""
        txtQualifications.Text = ""
        ddlEmploymentType.SelectedValue = "0"
        txtRequiredExperience.Text = ""
        txtVacancy.Text = ""
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click

        SaveJobPosting()

    End Sub



    Private Sub SaveJobPosting()
        Dim connectionString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Using connection As New SqlConnection(connectionString)
            Using command As New SqlCommand("INSERT INTO JobPostings (JobTitle, JobDescription, CompanyName, Location, JobCategory, Salary, Qualifications, EmploymentType, RequiredExperience, Vacancy, alumni_id) VALUES (@JobTitle, @JobDescription, @CompanyName, @Location, @JobCategory, @Salary, @Qualifications, @EmploymentType, @RequiredExperience, @Vacancy, @AlumniId)", connection)
                command.Parameters.AddWithValue("@JobTitle", txtJobTitle.Text.Trim())
                command.Parameters.AddWithValue("@JobDescription", txtJobDescription.Text.Trim())
                command.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text.Trim())
                command.Parameters.AddWithValue("@Location", txtLocation.Text.Trim())
                command.Parameters.AddWithValue("@JobCategory", ddlJobCategory.SelectedValue)
                command.Parameters.AddWithValue("@Salary", Decimal.Parse(txtSalary.Text.Trim()))
                command.Parameters.AddWithValue("@Qualifications", txtQualifications.Text.Trim())
                command.Parameters.AddWithValue("@EmploymentType", ddlEmploymentType.SelectedValue)
                command.Parameters.AddWithValue("@RequiredExperience", Integer.Parse(txtRequiredExperience.Text.Trim()))
                command.Parameters.AddWithValue("@Vacancy", Integer.Parse(txtVacancy.Text.Trim()))
                command.Parameters.AddWithValue("@AlumniId", Integer.Parse(hfAlumniId.Value)) ' Assuming you have a valid alumni_id

                connection.Open()
                command.ExecuteNonQuery()
                Response.Write("<script>alert('Job Posting saved successfully!');</script>")
                ClearFormFields()

            End Using
        End Using

        ' Optionally show a success message or redirect

    End Sub

End Class