<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Alumni/MainPage_alumni.Master" CodeBehind="job_posting.aspx.vb" Inherits="TYBCA_35_PROJECT_ALUMNI_PLATFORM.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    /* Form Container */
    .form-container {
        max-width: 1100px;
        width: 90%;
        margin: 0 auto;
        padding: 20px;
        background: rgba(255, 255, 255, 0.9);
        border-radius: 10px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        backdrop-filter: blur(10px);
        animation: fadeIn 1s ease-out;
        font-family:Helvetica;
        margin-top:5%;
    }

    /* Form Heading */
    .form-container h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
        position: relative;
        display: inline-block;
        padding-bottom: 8px;
        
    }

    /* Underline for Heading */
    .form-container h2::after {
        content: '';
        background: linear-gradient(to right, #ff7e5f, #feb47b);
        height: 2px;
        border-radius: 2px;
        width: 100%;
        position: absolute;
        bottom: 0;
        left: 0;
        transition: width 0.3s ease-in-out;
    }

    .form-container h2:hover::after {
        width: 0;
    }

    /* Grid Layout for Sections */
    .form-grid {
        display: flex;
        gap: 25px;
    }

    .form-grid .form-column {
        flex: 1;
    }

    /* Section Headings */
    .section-heading {
        margin-bottom: 10px;
        font-size: 20px;
        color: #333;
    }

    /* Form Groups */
    .form-group {
        margin-bottom: 15px;
    }

    /* Form Control Styling */
    .form-control {
        width: 90%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.9);
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        font-size: 14px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 4px rgba(0, 123, 255, 0.3);
        outline: none;
    }

    /* Button Styles */
    .btn-primary, .btn-danger {
        border: none;
        padding: 8px 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 16px;
        font-weight: bold;
    }

    /* Primary Button */
    .btn-primary {
        color: white;
        background-color: royalblue;
    }

    .btn-primary:hover {
        box-shadow: 4px 4px 8px #c5c5c5, -4px -4px 8px #ffffff;
        color: #000;
    }

    /* Danger Button */
    .btn-danger {
        color: white;
        background-color: Red;
    }

    .btn-danger:hover {
        transform: translateY(-2px);
        box-shadow: 4px 4px 8px #c5c5c5, -4px -4px 8px #ffffff;
        color: #000;
    }

    /* Fade In Animation */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Custom Scrollbar for WebKit Browsers */
    ::-webkit-scrollbar {
        width: 8px;
    }

    ::-webkit-scrollbar-track {
        background: #f1f1f1;
        border-radius: 10px;
    }

    ::-webkit-scrollbar-thumb {
        background: #888;
        border-radius: 10px;
    }

    ::-webkit-scrollbar-thumb:hover {
        background: #555;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
     <h2>Add / Update Job Posting</h2>

     <asp:Panel ID="pnlJobForm" runat="server">
         <div class="form-grid">

             <div class="form-column">
                 <h3 class="section-heading">Job Details</h3>
                 <br />

                 <div class="form-group" style="display:none;">
                     <asp:HiddenField ID="hfAlumniId" runat="server" Value="0" />
                 </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtJobTitle" runat="server" CssClass="form-control" Placeholder="Job Title" TextMode="MultiLine" Rows="3" Style="resize:none;"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" ControlToValidate="txtJobTitle" ErrorMessage="Job Title is required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtJobDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" Style="resize: none;" Placeholder="Job Description"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvJobDescription" runat="server" ControlToValidate="txtJobDescription" ErrorMessage="Job Description is required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" Placeholder="Company Name"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ControlToValidate="txtCompanyName" ErrorMessage="Company Name is required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtLocation" runat="server" CssClass="form-control" Placeholder="Location"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvLocation" runat="server" ControlToValidate="txtLocation" ErrorMessage="Location is required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:DropDownList ID="ddlJobCategory" runat="server" CssClass="form-control" Width="90%">
                         <asp:ListItem Value="0">Select Job Category</asp:ListItem>
                         <asp:ListItem Value="IT">IT</asp:ListItem>
                         <asp:ListItem Value="Finance">Finance</asp:ListItem>
                         <asp:ListItem Value="Marketing">Marketing</asp:ListItem>
                     </asp:DropDownList>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvJobCategory" runat="server" ControlToValidate="ddlJobCategory" InitialValue="0" ErrorMessage="Please select a job category." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

             </div>

             <div class="form-column">
                 <h3 class="section-heading">Application Details</h3>
                 <br />

                 <div class="form-group">
                     <asp:TextBox ID="txtSalary" runat="server" CssClass="form-control" Placeholder="Salary"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvSalary" runat="server" ControlToValidate="txtSalary" ErrorMessage="Salary is required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                     <asp:RegularExpressionValidator ID="revSalary" runat="server" ControlToValidate="txtSalary" ErrorMessage="Enter a valid salary amount." ValidationExpression="^\d+(\.\d{1,2})?$" CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtQualifications" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Style="resize: none;" Placeholder="Qualifications"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvQualifications" runat="server" ControlToValidate="txtQualifications" ErrorMessage="Qualifications are required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:DropDownList ID="ddlEmploymentType" runat="server" CssClass="form-control" Width="90%">
                         <asp:ListItem Text="Select Employment Type" Value="0"></asp:ListItem>
                         <asp:ListItem Text="Full-Time" Value="Full-Time"></asp:ListItem>
                         <asp:ListItem Text="Part-Time" Value="Part-Time"></asp:ListItem>
                         <asp:ListItem Text="Contract" Value="Contract"></asp:ListItem>
                         <asp:ListItem Text="Internship" Value="Internship"></asp:ListItem>
                     </asp:DropDownList>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvEmploymentType" runat="server" ControlToValidate="ddlEmploymentType" InitialValue="0" ErrorMessage="Please select an employment type." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtRequiredExperience" runat="server" CssClass="form-control" Placeholder="Required Experience (in years)"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvRequiredExperience" runat="server" ControlToValidate="txtRequiredExperience" ErrorMessage="Required Experience is required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                     <asp:RangeValidator ID="rvExperience" runat="server" ControlToValidate="txtRequiredExperience" ErrorMessage="Experience must be between 0 and 40 years." MinimumValue="0" MaximumValue="40" Type="Integer" CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group">
                     <asp:TextBox ID="txtVacancy" runat="server" CssClass="form-control" Placeholder="Vacancy"></asp:TextBox>
                     <br />
                     <asp:RequiredFieldValidator ID="rfvVacancy" runat="server" ControlToValidate="txtVacancy" ErrorMessage="Vacancy count is required." CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                     <asp:RangeValidator ID="rvVacancy" runat="server" ControlToValidate="txtVacancy" ErrorMessage="Vacancy must be at least 1." MinimumValue="1" MaximumValue="1000" Type="Integer" CssClass="text-danger" Display="Dynamic" EnableClientScript="true" ForeColor="Red" />
                 </div>

                 <div class="form-group" id="btns">
                     <asp:Button ID="btnSubmit" runat="server" CssClass="btn-primary" Text="Submit" />
                     <asp:Button ID="btnCancel" runat="server" CssClass="btn-danger" Text="Cancel" />
                 </div>

             </div>
         </div>
     </asp:Panel>
 </div>
</asp:Content>
