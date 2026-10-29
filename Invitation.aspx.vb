Imports System.Data.SqlClient
Imports System.Configuration

Public Class WebForm9
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSubmit.Click



        Dim connString As String = ConfigurationManager.ConnectionStrings("con_string").ConnectionString
        Using conn As New SqlConnection(connString)
            Try
                conn.Open()
                Dim query As String = "INSERT INTO Events (EventName, EventDate, EventTime, EventDescription, EventPicture) VALUES (@EventName, @EventDate, @EventTime, @EventDescription, @EventPicture)"
                Using cmd As New SqlCommand(query, conn)
                    cmd.Parameters.AddWithValue("@EventName", txtEventName.Text.Trim())
                    cmd.Parameters.AddWithValue("@EventDate", Convert.ToDateTime(txtEventDate.Text))
                    cmd.Parameters.AddWithValue("@EventTime", TimeSpan.Parse(txtEventTime.Text))
                    cmd.Parameters.AddWithValue("@EventDescription", txtEventDescription.Text.Trim())

                    ' Handling file upload
                    If fileUploadEventPicture.HasFile Then
                        Dim filePath As String = "~/images/" & fileUploadEventPicture.FileName
                        fileUploadEventPicture.SaveAs(Server.MapPath(filePath))
                        cmd.Parameters.AddWithValue("@EventPicture", filePath)
                    Else
                        cmd.Parameters.AddWithValue("@EventPicture", DBNull.Value)
                    End If

                    cmd.ExecuteNonQuery()
                End Using
                lblMessage.Text = "Invitation sent successfully!"
                lblMessage.ForeColor = System.Drawing.Color.Green
                lblMessage.Visible = True
            Catch ex As Exception
                lblMessage.Text = "Error: " & ex.Message
                lblMessage.ForeColor = System.Drawing.Color.Red
                lblMessage.Visible = True
            End Try
        End Using

    End Sub
End Class