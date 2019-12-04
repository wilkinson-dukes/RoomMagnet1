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
using System.Data;

public partial class HostMessageCenter : System.Web.UI.Page
{
    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["RoomMagnetAWS"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        // Retrieve HostID to be used in queries
        SqlCommand selectHostID = new SqlCommand("SELECT hostID FROM Host WHERE email = @email", sc);
        selectHostID.Parameters.AddWithValue("@email", Convert.ToString(Session["userEmail"]));
        sc.Open();
        ViewState["hostID"] = Convert.ToInt32(selectHostID.ExecuteScalar());
        sc.Close();

        // Retrieve contacts (Tenants that have favorited this host's property) 
        SqlCommand selectContacts = new SqlCommand("SELECT concat(t.firstName,' ', t.lastName), t.tenantID, h.hostID "
                                                    + "FROM Tenant t "
                                                    + "INNER JOIN FavoriteProperty f ON f.tenantID = t.tenantID "
                                                    + "INNER JOIN Accommodation a ON f.accommodationID = a.accommodationID "
                                                    + "INNER JOIN Host h ON a.hostID = h.hostID "
                                                    + "WHERE h.hostID = @hID", sc);
        selectContacts.Parameters.AddWithValue("@hID", Convert.ToString(ViewState["hostID"]));
        sc.Open();
        SqlDataReader reader = selectContacts.ExecuteReader();






        // Add contacts to dropdowns

        while (reader.Read())
        {
            if (CheckExistingContacts(Convert.ToString(reader.GetInt32(1))) == false)
            {
                ListItem contact = new ListItem(reader.GetString(0), Convert.ToString(reader.GetInt32(1)));
                DropDownList1.Items.Add(contact);
            }



        }
        reader.Close();



        // Get Message History grouped by contact
        SqlCommand selectMessages = new SqlCommand("SELECT m.tenantID, m.hostID, m.messageText, m.dateSent, concat(t.firstName, ' ', t.lastName), concat(h.firstName, ' ', h.lastName), m.sender FROM Host h "
                                                    + "INNER JOIN MessageCenter m on h.hostID = m.hostID "
                                                    + "INNER JOIN tenant t on m.tenantID = t.tenantID "
                                                    + "WHERE m.dateSent in (select max(dateSent) from MessageCenter group by tenantID) and m.hostID = @hID "
                                                    + "group by m.dateSent, m.tenantID, m.messageText, t.firstName, t.lastName, h.firstName, h.lastName, m.hostID, m.sender "
                                                    + "order by m.dateSent desc", sc);
        selectMessages.Parameters.AddWithValue("@hID", Convert.ToString(ViewState["hostID"]));
        

        reader = selectMessages.ExecuteReader();



        while (reader.Read())
        {


            // Populate Left column
            // Sender 
            String senderType = reader.GetString(6);
            String tenantName = reader.GetString(4);
           
            var leftSenderHeader = new HtmlGenericControl("h5")
            {
                InnerText = tenantName
            };
            leftSenderHeader.Attributes.Add("style", "font-size: 17px");
            leftDiv.Controls.Add(leftSenderHeader);

            // View message button
            Button viewMessage = new Button();
            //viewMessage.ID = Convert.ToString(reader.GetInt32(4));
            viewMessage.Text = "View";
            viewMessage.Attributes.Add("type", "button");
            viewMessage.Attributes.Add("class", "btn btn-sm float-right");
            viewMessage.Attributes.Add("runat", "server");
            viewMessage.Attributes.Add("OnClientClick", "ViewFullMessage_Click");
            //view.Attributes.Add("data-toggle", "modal");
            //view.Attributes.Add("data-target", "#exampleModalCenter");
            //viewMessage.Click += new EventHandler(ViewFullMessage_Click);
            leftSenderHeader.Controls.Add(viewMessage);

            // Date 
            String date = reader.GetDateTime(3).ToShortDateString();
            var leftDateSent = new HtmlGenericControl("p")
            {
                InnerText = date
            };
            leftDateSent.Attributes.Add("style", "font-size: 13px");
            leftDiv.Controls.Add(leftDateSent);

            // Message
            String message = reader.GetString(2);
            if (message.Length >= 20)
            {
                message = message.Substring(0, 20) + "...";
            }
            var leftMessageText = new HtmlGenericControl("p")
            {
                InnerText = message
            };
            leftDiv.Controls.Add(leftMessageText);
        }
        reader.Close();
        sc.Close();
        /*
        // Populate Right column
        SqlCommand selectClickedMessage = new SqlCommand("SELECT concat(t.firstName, ' ', t.lastName), m.messageText, t.tenantID, m.dateSent, m.messageID FROM MessageCenter m "
                                                    + "INNER JOIN Tenant t ON t.tenantID = m.tenantID "
                                                    + "WHERE m.hostID = @hID and t.tenantID = @tID and m.messageID = @mID "
                                                    + "ORDER BY dateSent DESC", sc);
        selectClickedMessage.Parameters.AddWithValue("@hID", Convert.ToString(ViewState["hostID"]));
        selectClickedMessage.Parameters.AddWithValue("@tID", tID);
        selectClickedMessage.Parameters.AddWithValue("@mID", mID);
        sc.Open();
        reader = selectClickedMessage.ExecuteReader();

        while (reader.Read())
        {
            lblSender.Text = reader.GetString(0);
            lblDate.Text = reader.GetDateTime(3).ToShortDateString();
            lblMessageText.Text = reader.GetString(1);
            Button send = new Button();
            send.ID = Convert.ToString(reader.GetInt32(4));
            send.Text = "Send";
            send.Attributes.Add("type", "button");
            send.Click += new EventHandler(Send_Click);
            send.Attributes.Add("class", "btn float-right");
            send.Attributes.Add("runat", "server");
            //view.Attributes.Add("data-toggle", "modal");
            //view.Attributes.Add("data-target", "#exampleModalCenter");
            send.Attributes.Add("UseSubmitBehavior", "false");
            //send.Attributes.Add("data-dismiss", "modal");
            rightDiv.Controls.Add(send);
        }
        reader.Close();

    */
    }


    protected void Send_Click(object sender, EventArgs e)
    {
        Button sendBtn = (Button)sender;
        String mID = Convert.ToString(sendBtn.ID);

        // Get TenantID based on messageID passed from send button
        SqlCommand selectTenant = new SqlCommand("SELECT TenantID FROM MessgeCenter WHERE MessageID = @msgID", sc);
        selectTenant.Parameters.AddWithValue("@msgID", mID);

        String tID = Convert.ToString(sendBtn.ID);

        SqlCommand sendMessage = new SqlCommand("INSERT INTO MessageCenter(hostID, tenantID, messageText, dateSent, sender) VALUES(@hostID2, @tenantID2, @msg2, @date2, @sender2)", sc);
        sendMessage.Parameters.AddWithValue("@hostID2", Convert.ToString(ViewState["hostID"]));
        sendMessage.Parameters.AddWithValue("@tenantID2", tID);
        sendMessage.Parameters.AddWithValue("@msg2", txtBoxReply.Text);
        sendMessage.Parameters.AddWithValue("@date2", DateTime.Now.ToLongDateString());
        sendMessage.Parameters.AddWithValue("@sender2", "H");
        sc.Open();
        sendMessage.ExecuteNonQuery();
        sc.Close();



    }

    protected Boolean CheckExistingContacts(String tenantID)
    {
        Boolean contactExists = false;
        foreach (ListItem li in DropDownList1.Items)
        {
            if (li.Value == tenantID)
            {
                contactExists = true;
            }
        }
        return contactExists;
    }

}