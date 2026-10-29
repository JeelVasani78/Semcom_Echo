Public Class MainPage_admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Session("admin_id") Is Nothing Then
        '    Response.Redirect("../login.aspx")
        'End If

        If Not IsPostBack Then
            Dim currentPage As String = Request.RawUrl.ToLower()

            If currentPage.Contains("/Admin/Dashboard_Admin.aspx") Then
                LinkDashboard1.CssClass = "l_selected"
                m_link1.CssClass = "m_selected"
            ElseIf currentPage.Contains("/Admin/Alumnicheck.aspx") Then
                LinkProfile1.CssClass = "l_selected"
                m_link2.CssClass = "m_selected"
            ElseIf currentPage.Contains("Job_Request.aspx") Then
                LinkEvents1.CssClass = "l_selected"
                m_link3.CssClass = "m_selected"
            ElseIf currentPage.Contains("page4.aspx") Then
                'LinkNetworking1.CssClass = "l_selected"
                'm_link4.CssClass = "m_selected"
            ElseIf currentPage.Contains("donation_requests.aspx") Then
                LinkDonation1.CssClass = "l_selected"
                m_link5.CssClass = "m_selected"
            ElseIf currentPage.Contains("page6.aspx") Then
                LinkJobPosting1.CssClass = "l_selected"
                m_link6.CssClass = "m_selected"
            ElseIf currentPage.Contains("career_counseling.aspx") Then
                'LinkSeminar1.CssClass = "l_selected"
                'm_link7.CssClass = "m_selected"
            ElseIf currentPage.Contains("page8.aspx") Then
                'LinkFeedback1.CssClass = "l_selected"
                'm_link8.CssClass = "m_selected"
            End If
        End If
    End Sub

    Private Sub logout_btn_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles logout_btn.Click
        Session.Abandon()
        Session.Clear()
        Dim alumniCookie As New HttpCookie("alumni_id")
        alumniCookie.Expires = DateTime.Now.AddDays(-1) ' Set the expiration date to the past
        Response.Cookies.Add(alumniCookie)
        Response.Redirect("../login.aspx")
    End Sub
End Class