Imports System.Data.SqlClient

Public Class MainPage_alumni
    Inherits System.Web.UI.MasterPage

    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("alumni_id") Is Nothing Then
            Response.Redirect("../login.aspx")
        End If

        If Not IsPostBack Then
            Dim currentPage As String = Request.RawUrl.ToLower()

            If currentPage.Contains("dashboard_alumni.aspx") Then
                LinkDashboard1.CssClass = "l_selected"
                m_link1.CssClass = "m_selected"
            ElseIf currentPage.Contains("page2.aspx") Then
                LinkProfile1.CssClass = "l_selected"
                m_link2.CssClass = "m_selected"
            ElseIf currentPage.Contains("page3.aspx") Then
                'LinkEvents1.CssClass = "l_selected"
                m_link3.CssClass = "m_selected"
            ElseIf currentPage.Contains("chat.aspx") Then
                'LinkNetworking1.CssClass = "l_selected"
                'm_link4.CssClass = "m_selected"
            ElseIf currentPage.Contains("donation.aspx") Then
                LinkDonation1.CssClass = "l_selected"
                m_link5.CssClass = "m_selected"
            ElseIf currentPage.Contains("job_posting.aspx") Then
                LinkJobPosting1.CssClass = "l_selected"
                m_link6.CssClass = "m_selected"
            ElseIf currentPage.Contains("career_counseling.aspx") Then
                'LinkSeminar1.CssClass = "l_selected"
                'm_link7.CssClass = "m_selected"
            ElseIf currentPage.Contains("page8.aspx") Then
                'LinkFeedback1.CssClass = "l_selected"
                'm_link8.CssClass = "m_selected"
            ElseIf currentPage.Contains("page9.aspx") Then
                'LinkNearby1.CssClass = "l_selected"
                'm_link9.CssClass = "m_selected"
            End If

            dash_img()

        End If

    End Sub
    ' Dashboard User Image
    Protected Sub dash_img()
        Dim alumni_id As String = Convert.ToString(Session("alumni_id"))

        Dim s_q1 As String = "select al_img from alumni_details where alumni_id=@a_id1"
        Dim cmd1 As New SqlCommand(s_q1, con)
        cmd1.Parameters.AddWithValue("@a_id1", alumni_id)

        con.Open()
        Dim reader1 As SqlDataReader = cmd1.ExecuteReader()
        If reader1.Read Then
            al_img.ImageUrl = Convert.ToString(reader1("al_img"))
        End If
        con.Close()
    End Sub

    ' Alumni Searching....
    Protected Sub searchbar_TextChanged(ByVal sender As Object, ByVal e As EventArgs)


        Dim alumni_id As String = Convert.ToString(Session("alumni_id"))

        Dim full_nm As String = searchbar.Text
        Dim s_q1 As String = "select * from alumni_info where al_full_nm LIKE @al_unm1"
        Dim cmd1 As New SqlCommand(s_q1, con)
        cmd1.Parameters.AddWithValue("@al_unm1", full_nm + "%")

        con.Open()
        Dim reader1 As SqlDataReader = cmd1.ExecuteReader()

        If reader1.HasRows Then
            empty_search.Visible = False
            Dim dt As New DataTable()
            dt.Load(reader1)
            search_r1.DataSource = dt
            search_r1.DataBind()


        Else
            ' Show "No Result Found" panel
            empty_search.Visible = True
        End If

        con.Close()


    End Sub

    Protected Sub logout_btn_Click(ByVal sender As Object, ByVal e As EventArgs)
        Session.Abandon()
        Session.Clear()
        Dim alumniCookie As New HttpCookie("alumni_id")
        alumniCookie.Expires = DateTime.Now.AddDays(-1) ' Set the expiration date to the past
        Response.Cookies.Add(alumniCookie)
        Response.Redirect("../login.aspx")
    End Sub
End Class