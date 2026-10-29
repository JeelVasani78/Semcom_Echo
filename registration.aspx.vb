Imports System.Data.SqlClient

Public Class WebForm1
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("con_string").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub submit_btn_Click(ByVal sender As Object, ByVal e As EventArgs) Handles submit_btn.Click

        If f_u_btn.HasFile Then

            Dim s_q1 As String = "select al_email from alumni_info where al_email=@email1"
            Dim cmd1 As New SqlCommand(s_q1, con)
            cmd1.Parameters.AddWithValue("@email1", email.Text)

            con.Open()
            Dim reader1 As SqlDataReader = cmd1.ExecuteReader()
            If Not reader1.Read Then
                con.Close()

                Dim fe As String = System.IO.Path.GetExtension(f_u_btn.FileName).ToLower()
                

                    Dim fp1 As String = Server.MapPath("~/images/") & f_u_btn.FileName
                    f_u_btn.SaveAs(fp1)

                    Dim fp2 As String = "~/images/" + f_u_btn.FileName
                    Dim curr_date As Date = Date.Now

                Dim i_q1 As String = "INSERT INTO alumni_info (al_full_nm, al_email, al_password, al_enroll_no, al_proof, [date]) " &
                   "VALUES (@al_full_nm1, @al_email1, @al_pass1, @al_enroll_no1, @al_proof1, @date1)"
                Dim cmd2 As New SqlCommand(i_q1, con)
                cmd2.Parameters.AddWithValue("@al_full_nm1", full_nm.Text)
                cmd2.Parameters.AddWithValue("@al_email1", email.Text)
                cmd2.Parameters.AddWithValue("@al_pass1", password.Text)
                cmd2.Parameters.AddWithValue("@al_enroll_no1", enroll_number.Text)
                cmd2.Parameters.AddWithValue("@al_proof1", fp2)
                cmd2.Parameters.AddWithValue("@date1", curr_date)


                    con.Open()
                    If cmd2.ExecuteNonQuery() Then
                        lbl.Text = "We will sent you an Email when your Request gets approval!"
                    End If
                    con.Close()

            Else


                lbl.Text = "Account Already Exists! Or Wait for Approval!"

            End If

        Else


            lbl.Text = "Please Choose a File!"

        End If

    End Sub
End Class