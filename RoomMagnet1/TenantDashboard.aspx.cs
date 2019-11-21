﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using Google.Cloud.Translation.V2;
using System.Web.UI.HtmlControls;

public partial class TenantDashboard : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["RoomMagnetAWS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        // Load database data into local variables to be displayed on dashboard
        sc.Open();
        SqlCommand selectTenantInfo = new SqlCommand("SELECT concat(firstName, ' ', lastName), email," +
            "phoneNumber, birthDate, isnull(biography, 'bio goes here'), cleared FROM [Tenant] where email = @email", sc);
        selectTenantInfo.Parameters.AddWithValue("@email", Session["userEmail"]);
        SqlDataReader reader = selectTenantInfo.ExecuteReader();
        String name = "";
        String email = "";
        String phoneNumber = "";
        DateTime DOB = DateTime.Now;
        DateTime today = DateTime.Now;
        String age = "";
        String bio = "";
        char badge1 = 'F';
        char badge2 = 'F';
        while (reader.Read())
        {
            name = reader.GetString(0);
            email = reader.GetString(1);
            phoneNumber = reader.GetString(2);
            DOB = Convert.ToDateTime(reader.GetDateTime(3));
            today = DateTime.Now;
            age = CalculateAge(reader.GetDateTime(3)).ToString();
            bio = reader.GetString(4);

            String cleared = reader.GetString(5);
            if (cleared == "T")
            {
                TenantBackgroundStatusImage.ImageUrl = "images/icons-07.png";
                TenantBackgroundStatusDescrip.Text = "You are a verified user! Your background check has been completed and you are cleared.";
                TenantBackgroundStatusWords.Text = "Completed";
            }
            else
            {
                TenantBackgroundStatusImage.ImageUrl = "images/icons-08.png";
                TenantBackgroundStatusDescrip.Text = "Your background check has either not yet been submitted or is currently under review.";
                TenantBackgroundStatusWords.Text = "Not Completed";
            }
        }
        reader.Close();

        SqlCommand selectBadge = new SqlCommand("SELECT undergraduate, graduate FROM TenantBadge where tenantID = (select tenantID from Tenant where email = @email2)", sc);
        selectBadge.Parameters.AddWithValue("@email2", Session["userEmail"]);
        reader = selectBadge.ExecuteReader();
        while (reader.Read())
        {
            badge1 = Convert.ToChar(reader["undergraduateBadge"]);
            badge2 = Convert.ToChar(reader["graduateBadge"]);
        }
        reader.Close();

        string image1 = checkBadge(badge1, "images/undergrad-badge.png");
        string image2 = checkBadge(badge2, "images/masters-badge.png");

        FirstNameLastNameHeader.Text = HttpUtility.HtmlEncode(name) + "'s Dashboard";
        FirstNameLastNameAge.Text = HttpUtility.HtmlEncode(name) + ", " + age;
        BioLabel.Text = HttpUtility.HtmlEncode(bio);

        SqlCommand selectImages = new SqlCommand();
        selectImages.Connection = sc;

        selectImages.CommandText = "Select tenantID from Tenant where email = @tenEmail";
        selectImages.Parameters.AddWithValue("@tenEmail", Session["userEmail"]);

        int tenantID = Convert.ToInt32(selectImages.ExecuteScalar());

        selectImages.CommandText = "Select ISNULL(mainImage, ''), ISNULL(image2, ''), ISNULL(image3, '') FROM TenantImages where tenantID = " + tenantID;
        reader = selectImages.ExecuteReader();

            while (reader.Read())
            {
                TenantPrimaryImage.ImageUrl = reader.GetString(0);
                TenantImage2.ImageUrl = reader.GetString(1);
                TenantImage3.ImageUrl = reader.GetString(2);
            }
            reader.Close();


        //Header.Text = "Host Dashboard.";
        //select.CommandText = "Select (firstName + ' ' + lastName) from host where email = @email1";
        //select.Parameters.Add(new System.Data.SqlClient.SqlParameter("@email1", Session["userEmail"]));
        //String hostName = Convert.ToString(select.ExecuteScalar());
        //ProfileHeader.Text = "Welcome " + hostName;

        SqlCommand select = new SqlCommand();
        select.Connection = sc;

        select.CommandText = "select a.accommodationID, a.description, h.firstName, h.cleared from FavoriteProperty fp " +
            "inner join Accommodation a on a.accommodationID = fp.accommodationID " +
            "inner join Host h on h.hostID = a.hostID where fp.tenantID = " + tenantID;

        reader = select.ExecuteReader();

        while (reader.Read())
        {
            //Generating the initial div
            var div1 = new HtmlGenericControl("div")
            {

            };
            div1.Attributes.Add("class", "col-md-6");
            //div1.Style.Add("margin-top", "1rem;");
            div1.Style.Add("border-top", "solid");
            div1.Style.Add("border-top-width", "1px");
            div1.Style.Add("border-bottom", "solid");
            div1.Style.Add("border-bottom-width", "1px");
            favorites.Controls.Add(div1);

            var hostName = new HtmlGenericControl("h4")
            {

            };
            hostName.InnerText = reader.GetString(2) + "'s Property";
            div1.Controls.Add(hostName);

            var propDesc = new HtmlGenericControl("h6")
            {

            };
            propDesc.InnerText = reader.GetString(1);
            div1.Controls.Add(propDesc);

            var div2 = new HtmlGenericControl("div")
            {

            };
            favorites.Controls.Add(div2);
            div2.Attributes.Add("class", "col-md-6");
            div2.Style.Add("border-top", "solid");
            div2.Style.Add("border-top-width", "1px");
            div2.Style.Add("border-bottom", "solid");
            div2.Style.Add("border-bottom-width", "1px");
            //div2.Style.Add("margin-top", "1rem;");

            Image status = new Image();
            String cleared = reader.GetString(3);
            if (cleared == "T")
            {
                status.ImageUrl = "images/icons-07.png";
            }
            else
            {
                status.ImageUrl = "images/icons-08.png";
            }
            status.Style.Add("max-width", "50px");
            div2.Controls.Add(status);

            Button viewProf = new Button();
            viewProf.ID = Convert.ToString(reader.GetInt32(0));
            viewProf.Text = "View Property";
            viewProf.Attributes.Add("class", "btn");
            viewProf.Style.Add("margin-left", "1rem");
            viewProf.Click += new EventHandler(ViewProfile_Click);
            div2.Controls.Add(viewProf);


        }

    }
    protected void EditProfileBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditAccountInformation.aspx");
    }
    protected void SearchProperties_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchResultPage.aspx");
    }
    public string CalculateAge(DateTime DOB)
    {
        DateTime dob = Convert.ToDateTime(DOB);
        DateTime today = DateTime.Today;
        int age = today.Year - dob.Year;

        if ((today.Month < dob.Month) || ((today.Month == dob.Month) && (today.Day < dob.Day)))
        {

            age--;
        }

        return age.ToString();
    }

    protected string checkBadge(char badge, string img)
    {
        string image = "";

        if (badge.Equals('T'))
            image = img;

        return image;
    }

    protected void addBadge(string image)
    {
        if (image != "")
        {


            HtmlGenericControl newP = new HtmlGenericControl("p")
            {

            };

            Image newImg = new Image()
            {
                ImageUrl = image,

            };
            newImg.Attributes.Add("style", "max-width: 150px; margin-top: 3px; margin-right: 2rem;");

            newP.Controls.Add(newImg);
            badgeModule.Controls.Add(newImg);
        }
    }

    protected void ViewProfile_Click(object sender, EventArgs e)
    {
        Button b = sender as Button;
        String ID = b.ID;
        Session["propertyID"] = ID;
        Response.Redirect("PropertyInfo.aspx");
    }
}