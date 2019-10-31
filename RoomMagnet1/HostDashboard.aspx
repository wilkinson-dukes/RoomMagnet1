﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="HostDashboard.aspx.cs" Inherits="HostDashboard" %>

<asp:Content ID="HostDashboard" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="Room Magnet">
<meta name="keywords" content="room magnet, roommate, housing, matchmaking, house, apartment, living arrangement">
<meta name="author" content="Room Magnet">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Dashboard</title>

<!-- Bootstrap v4 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
<!-- custom css -->
<link href="css/custom.css" rel="stylesheet" type="text/css" media="screen">
<link rel="shortcut icon" href="images/logo-03.png" type="image/x-icon"/>
<link href="https://fonts.googleapis.com/css?family=Oswald:400|Raleway:300&display=swap" rel="stylesheet">    
</head>

<body>
<form runat="server">     
<div  class="container">

  <div class="row " style="margin-top: 7rem;">
    <div class="col-md-9">
        <h1><asp:Label ID="FirstNameLastNameHeader" runat="server" Text="Host Dashboard"></asp:Label></h1><!-- += 's Dashboard -->
      </div>
    </div><!-- end div row -->  
    
   <!--Start First Module -->
   <div class="row " style="margin-top: 1rem;">
    <div class="col-md-6" style="border: solid; border-color: white;">
        <div class="row">
            <div class="col-md-6">
               <h2 >Your Property</h2> 
            </div>
        </div>
        
        <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem; padding-bottom: 1rem;" >
            <div class="col-md-6" style="margin-top: 1rem;">
                <asp:Image ID="TenantPrimaryImage" ImageURl="Images/couple-with-new-home_rtaSl4ABo.jpg" runat="server" CssClass="img-fluid"/>
                <div class="row" style="margin-top: 1rem;">
                    <div class="col-md-6">
                        <asp:Image ID="TenantImage2" ImageURl="images/scott-webb-1ddol8rgUH8-unsplash.jpg" runat="server" CssClass="img-fluid"/>
                    </div>
                    <div class="col-md-6">
                        <asp:Image ID="TenantImage3" ImageURl="images/kitchen.jpeg" runat="server" CssClass="img-fluid"/>
                    </div>
                </div>
            </div>
             <div class="col-md-6" style="margin-top: 1rem;">
                 <h3><asp:Label ID="PropertyName" runat="server" Text="Example Property in Harrisonburg 22801"></asp:Label></h3>
                    <p><asp:Label ID="PropertyInfo" runat="server" Text="This is a brief description of the property"></asp:Label></p>
                    <p><asp:Image ID="Badge1" runat="server" ImageUrl="images/kitchen-badge.png" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Badge2" runat="server" ImageUrl="images/private-entrance.png" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Badge3" runat="server" ImageUrl="" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Badge4" runat="server" ImageUrl="" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Badge5" runat="server" ImageUrl="" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
            </div>
        </div>
      </div>
    <!--End First Module -->   

    <!--Start Second Module -->
    <div class="col-md-6" style="border: solid; border-color: white;">
        <div class="row">
            <div class="col-md-6">
               <h2 >Your Profile</h2> 
            </div>
            <div class="col-md-6">
                <asp:Button ID="Button1" runat="server" OnClick="EditProfileBtn_Click" Text="Edit Profile" cssclass="btn"/>
            </div>
        </div>
        
        <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem; padding-bottom: 1rem;" >
            <div class="col-md-6" style="margin-top: 1rem;">
                <asp:Image ID="Image1" ImageURl="images/johnsmith1.jpeg" runat="server" CssClass="img-fluid"/>
                <div class="row" style="margin-top: 1rem;">
                    <div class="col-md-6">
                        <asp:Image ID="Image2" ImageURl="images/johnsmith2.jpeg" runat="server" CssClass="img-fluid"/>
                    </div>
                    <div class="col-md-6">
                        <asp:Image ID="Image3" ImageURl="images/johnsmith3.jpeg" runat="server" CssClass="img-fluid"/>
                    </div>
                </div>
            </div>
             <div class="col-md-6" style="margin-top: 1rem;">
                 <h3><asp:Label ID="HostName" runat="server" Text="First Last"></asp:Label></h3>
                    <p><asp:Label ID="HostBio" runat="server" Text="This is a brief bio of the tenant."></asp:Label></p>
                    <p><asp:Image ID="Image4" runat="server" ImageUrl="images/non-smoker-badge.png" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Image5" runat="server" ImageUrl="images/undergrad-badge.png" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Image6" runat="server" ImageUrl="" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Image7" runat="server" ImageUrl="" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
                    <p><asp:Image ID="Image8" runat="server" ImageUrl="" style="max-width: 150px; margin-top: 3px"></asp:Image></p>
            </div>
        </div>
      </div> 
       <!--End Second Module -->   
             
    </div><!-- end div big row -->
    
    
     <div class="row " style="margin-top: 1rem;">
        <div class="col-md-6"  style="border: solid; border-color: white;">
            <div class="row">
                <div class="col-md-12">
                   <h2 >Message Board</h2> 
                </div>

            </div>

            <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem;" >
                <div class="col-md-12" style="margin-top: 1rem; border-bottom: solid; border-bottom-width: 1px;">
                   <h3>New Message Sender Name</h3>
                    <p>Content of the message. Do you want to live at my house? I want to video chat with you first. When are you free to talk?</p>
                </div>
                 <div class="col-md-12" style="margin-top: 1rem; border-bottom: solid; border-bottom-width: 1px;">
                   <h3>New Message Sender Name</h3>
                    <p>Content of the message. Do you want to live at my house? I want to video chat with you first. When are you free to talk?</p>
                </div>
            </div>
          </div>


        <div class="col-md-6" style="border: solid; border-color: white;" >
        <div class="row">
            <div class="col-md-12">
               <h2 >Background Check Status</h2> 
            </div>
            
        </div>
        
        <div class="row" style="background-color: #ebebeb; margin-top: 1rem; margin-bottom: 1rem; " >
            <div class="col-md-12" style="margin-top: 1rem; border-bottom: solid; border-bottom-width: 1px;">
                <h3><asp:Label ID="TenantBackgroundStatusWords" runat="server" Text="Status Goes Here"></asp:Label></h3>
                <p style="text-align: center;"><asp:Image ID="TenantBackgroundStatusImage" runat="server" ImageURL="images/icons-07.png" style="max-width: 75px;"/></p>
                <p><asp:Label ID="TenantBackgroundStatusDescrip" runat="server" Text="You are a verified user! Your background check has been successful and you are cleared."></asp:Label></p>
                    
            </div>
             
        </div>
      </div>
    
    </div><!-- end div big row -->
    
   
    <div class="row " style="margin-top: 1rem;">
        <div class="col-md-12"  >
            <h2>Your Rental Agreements</h2>
          </div>
    </div><!-- end div big row -->  
    
    <div class="row " style="margin-top: 1rem; background-color: #ebebeb; margin-bottom: 3rem;">
        <div class="col-md-12"  style=" margin-top: 1rem;">
            <p>When you have a rental agreement, it will be indicated here. We hope you find your perfect housing match so that you can have some wonderful rental agreements.</p>
          </div>
    </div><!-- end div big row -->  
    
    
    
</div> <!-- end div container! -->    
<footer class="footer mt-auto py-3 footer-expand-lg"><!-- start footer! -->
   <div class="row" style="padding-left: 3rem;">
    <div class="col-md-4" style="padding-left: 3rem;">   
    <h3 class="din">Room Magnet</h3>
    <p>Support:<br>
    540-123-4567<br>
    <a href="mailto:help@roommagnet.com">help@roommagnet.com</a></p>
    </div>
       
    <div class="col-md-4" style="padding-left: 3rem;">   
    <h4 class="din">Site Map</h4>
        <p><a href="#">Home-Owners</a><br>
        <a href="#">Tenants</a><br>
        <a href="#">Safety</a><br>
        <a href="#">FAQ</a><br>
        <a href="#">Contact Us</a>
    </p>
    </div>
    
    <div class="col-md-4" style="padding-left: 3rem;">   
        <h4 class="din">Stay Connected</h4>
        <p><a href="#"><img src="images/social-icons-02.png" class="img-fluid" style="max-width: 180px;"></a></p>
    </div>
       
    </div>
</footer><!-- end footer! --> 
    
<!-- jQuery and Bootstrap links - do not delete! -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<!-- end of do not delete -->
</form>
</body>
</html>
</asp:Content>
