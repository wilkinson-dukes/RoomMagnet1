﻿<%@ Page Title="" Language="C#" MasterPageFile="~/RoomMagnet.master" AutoEventWireup="true" CodeFile="SearchResultPage.aspx.cs" Inherits="SearchResultPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
<meta charset="UTF-8">
<meta name="description" content="Room Magnet">
<meta name="keywords" content="room magnet, roommate, housing, matchmaking, house, apartment, living arrangement">
<meta name="author" content="Room Magnet">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap v4 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
<!-- custom css -->
<link href="css/custom.css" rel="stylesheet" type="text/css" media="screen">
<link rel="shortcut icon" href="images/logo-03.png" type="image/x-icon"/>


<form id="form1" runat="server">
<style>
          /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #description {
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
      }

      #infowindow-content .title {
        font-weight: bold;
      }

      #infowindow-content {
        display: none;
      }

      #map #infowindow-content {
        display: inline;
      }

      .pac-card {
        margin: 10px 10px 0 0;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
        background-color: #fff;
        font-family: Roboto;
      }

      #pac-container {
        padding-bottom: 12px;
        margin-right: 12px;
      }

      .pac-controls {
        display: inline-block;
        padding: 5px 11px;
      }

      .pac-controls label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 400px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      #title {
        color: #fff;
        background-color: #4d90fe;
        font-size: 25px;
        font-weight: 500;
        padding: 6px 12px;
      }
      #target {
        width: 345px;
      }
</style>
<h1 style="margin-top: 8rem;" class="container">Search for your perfect space.</h1>
<div class="row" style="margin-top: 3rem;">
<ul class="nav container">
  
  <li class="nav-item" style="padding-right: 2rem;">
        <asp:TextBox ID="CitySearchBox" runat="server" CssClass="form-control" style="" placeholder="Search By City"></asp:TextBox>
  </li>
  <li class="nav-item" style="padding-right: 2rem;">
        <asp:DropDownList ID="stateBox" runat="server" CssClass="form-control" style="">
                    <asp:ListItem>Select a state</asp:ListItem>
                    <asp:ListItem Value="AL">Alabama</asp:ListItem>
                    <asp:ListItem Value="AK">Alaska</asp:ListItem>
                    <asp:ListItem Value="AZ">Arizona</asp:ListItem>
                    <asp:ListItem Value="AR">Arkansas</asp:ListItem>
                    <asp:ListItem Value="CA">California</asp:ListItem>
                    <asp:ListItem Value="CO">Colorado</asp:ListItem>
                    <asp:ListItem Value="CT">Connecticut</asp:ListItem>
                    <asp:ListItem Value="DE">Delaware</asp:ListItem>
                    <asp:ListItem Value="FL">Florida</asp:ListItem>
                    <asp:ListItem Value="GA">Georgia</asp:ListItem>
                    <asp:ListItem Value="HI">Hawaii</asp:ListItem>
                    <asp:ListItem Value="ID">Idaho</asp:ListItem>
                    <asp:ListItem Value="IL">Illinois</asp:ListItem>
                    <asp:ListItem Value="IN">Indiana</asp:ListItem>
                    <asp:ListItem Value="IA">Iowa</asp:ListItem>
                    <asp:ListItem Value="KS">Kansas</asp:ListItem>
                    <asp:ListItem Value="KY">Kentucky</asp:ListItem>
                    <asp:ListItem Value="LA">Louisiana</asp:ListItem>
                    <asp:ListItem Value="ME">Maine</asp:ListItem>
                    <asp:ListItem Value="MD">Maryland</asp:ListItem>
                    <asp:ListItem Value="MA">Massachusetts</asp:ListItem>
                    <asp:ListItem Value="MI">Michigan</asp:ListItem>
                    <asp:ListItem Value="MN">Minnesota</asp:ListItem>
                    <asp:ListItem Value="MS">Mississippi</asp:ListItem>
                    <asp:ListItem Value="MO">Missouri</asp:ListItem>
                    <asp:ListItem Value="MT">Montana</asp:ListItem>
                    <asp:ListItem Value="NE">Nebraska</asp:ListItem>
                    <asp:ListItem Value="NV">Nevada</asp:ListItem>
                    <asp:ListItem Value="NH">New Hampshire</asp:ListItem>
                    <asp:ListItem Value="NJ">New Jersey</asp:ListItem>
                    <asp:ListItem Value="NM">New Mexico</asp:ListItem>
                    <asp:ListItem Value="NY">New York</asp:ListItem>
                    <asp:ListItem Value="NC">North Carolina</asp:ListItem>
                    <asp:ListItem Value="ND">North Dakota</asp:ListItem>
                    <asp:ListItem Value="OH">Ohio</asp:ListItem>
                    <asp:ListItem Value="OK">Oklahoma</asp:ListItem>
                    <asp:ListItem Value="OR">Oregon</asp:ListItem>
                    <asp:ListItem Value="PA">Pennsylvania</asp:ListItem>
                    <asp:ListItem Value="RI">Rhode Island</asp:ListItem>
                    <asp:ListItem Value="SC">South Carolina</asp:ListItem>
                    <asp:ListItem Value="SD">South Dakota</asp:ListItem>
                    <asp:ListItem Value="TN">Tennessee</asp:ListItem>
                    <asp:ListItem Value="TX">Texas</asp:ListItem>
                    <asp:ListItem Value="UT">Utah</asp:ListItem>
                    <asp:ListItem Value="VT">Vermont</asp:ListItem>
                    <asp:ListItem Value="VA">Virginia</asp:ListItem>
                    <asp:ListItem Value="WA">Washington</asp:ListItem>
                    <asp:ListItem Value="WV">West Virginia</asp:ListItem>
                    <asp:ListItem Value="WI">Wisconsin</asp:ListItem>
                    <asp:ListItem Value="WY">Wyoming</asp:ListItem>
                </asp:DropDownList>
  </li>
  <li class="nav-item">
      <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="form-control" style="background-color: #B23325; color: white;" OnClick="SearchButton_Click"/>
  </li>
</ul>
</div>

<div class="row" style="margin-top: 1.5rem;">
    <label class="container">Filter By:</label>
<ul class="nav container">
  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="PrivateEntranceBox" runat="server" Text="Private Entrance" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="PrivateEntranceBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="PrivateBathroomBox" runat="server" Text="Private Bathroom" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="PrivateBathroomBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="FurnishedBox" runat="server" Text="Furnished" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="FurnishedBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="StorageSpaceBox" runat="server" Text="Storage Space" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="StorageSpaceBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="HasPetsBox" runat="server" Text="Does not have Pets" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="HasPetsBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="AllowsSmokingBox" runat="server" Text="Allows Smoking" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="AllowsSmokingBox_CheckedChanged"/>
  </li>
</ul><!-- end nav -->
</div><!-- end row -->

<div class="row" style="margin-top: 1rem;">
<ul class="nav container">
  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="WifiBox" runat="server" Text="WiFi" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="WifiBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="ParkingBox" runat="server" Text="Private Parking" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="ParkingBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="KitchenBox" runat="server" Text="Private Kitchen" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="KitchenBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="CableBox" runat="server" Text="Cable TV" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="CableBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="AllowsPetsBox" runat="server" Text="Allows Pets" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="AllowsPetsBox_CheckedChanged"/>
  </li>

  <li class="nav-item" style="padding-right: 1rem;">
        <asp:CheckBox ID="LaundryBox" runat="server" Text="Laundry Access" cssclass="form-control" style="background-color: white; color: #B23325" OnCheckedChanged="LaundryBox_CheckedChanged"/>
  </li>
</ul><!-- end nav -->
</div><!-- end row -->

<div class="row" style="margin-top: 1.5rem; margin-bottom: 3rem">
    <label class="container">Price:</label>
    <ul class="nav container">

      <li class="nav-item" style="padding-right: 1rem;">
          <asp:TextBox ID="MinPriceBox" runat="server" CssClass="form-control" placeholder="Min" Width="110px"></asp:TextBox>
      </li>

      <li class="nav-item" style="padding-right: 1rem;">
          <asp:TextBox ID="MaxPriceBox" runat="server" CssClass="form-control" placeholder="Max" Width="110px"></asp:TextBox>
      </li>

      <li class="nav-item">
          <asp:DropDownList ID="SortByDropDown" runat="server" CssClass="form-control">
              <asp:ListItem Value="">Sort By</asp:ListItem>
              <asp:ListItem Value="PriceAscending">Price: Low - High</asp:ListItem>
              <asp:ListItem Value="PriceDescending">Price: High - Low</asp:ListItem>
              <asp:ListItem Value="DateNewOld">Date Listed: Newest - Oldest</asp:ListItem>
              <asp:ListItem Value="DateOldNew">Date Listed: Oldest - Newest</asp:ListItem>
          </asp:DropDownList>
      </li>

    </ul>
</div>
<!-- map container div -->
<div class="row" style="margin-left: 24rem; margin-bottom: 3rem;"> 
    <input id="pac-input" class="controls" type="text" placeholder="Search Box">
    <div id="map" style="height: 600px; width: 900px"></div>
</div>
    
<section style="margin-left: 8rem" id="ResultList" runat="server">
    <div class="row " style="margin-top: 2rem; border-bottom: solid; border-bottom-width: 1px; ">
            <h5><asp:Label ID="countLabel" runat="server" Text=""></asp:Label></h5>
        </div>
    <div class="row " style="margin-top: 1rem; border-bottom-width: 1px; ">
        <div class="col-md-4" >
            
        </div>
        <div class="col-md-2" style="margin-top: .5rem;">
            
        </div>
        <div class="col-md-5" style="margin-top: .5rem; float: right; margin-bottom: 1rem;">
           
        </div>
        
    </div><!-- end div row -->

</section>

<!-- start footer! -->
<footer class="footer mt-auto py-3 footer-expand-lg">
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
    <p>
    <a href="#"><img src="images/social-icons-02.png" class="img-fluid" style="max-width: 180px;"></a></p>
    </div>
       
    </div>
</footer><!-- end footer! -->    

</form>

<script>

    function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
            center: { lat: -33.8688, lng: 151.2195 },
            zoom: 13,
            mapTypeId: 'roadmap'
        });

        //try to geolocate the map based on web browser ip
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var pos = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                
                map.setCenter(pos);
                

            }, function () {
                handleLocationError(true, infoWindow, map.getCenter());
            });
        } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
        }

        // Create the search box and link it to the UI element.
        var input = document.getElementById('pac-input');
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function () {
            searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function () {
            var places = searchBox.getPlaces();

            if (places.length == 0) {
                return;
            }

            // Clear out the old markers.
            markers.forEach(function (marker) {
                marker.setMap(null);
            });
            markers = [];

            // For each place, get the icon, name and location.
            var bounds = new google.maps.LatLngBounds();
            places.forEach(function (place) {
                if (!place.geometry) {
                    console.log("Returned place contains no geometry");
                    return;
                }
                var icon = {
                    url: place.icon,
                    size: new google.maps.Size(71, 71),
                    origin: new google.maps.Point(0, 0),
                    anchor: new google.maps.Point(17, 34),
                    scaledSize: new google.maps.Size(25, 25)
                };

                // Create a marker for each place.
                markers.push(new google.maps.Marker({
                    map: map,
                    icon: icon,
                    title: place.name,
                    position: place.geometry.location
                }));

                if (place.geometry.viewport) {
                    // Only geocodes have viewport.
                    bounds.union(place.geometry.viewport);
                } else {
                    bounds.extend(place.geometry.location);
                }
            });
            map.fitBounds(bounds);
        });
    }    

    function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
            'Error: The Geolocation service failed.' :
            'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
    }
    
    </script>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqkMkz8ShD_qn4w4OEvMvjSKEPBa68TJo&libraries=places&callback=initAutocomplete"
         async defer></script>

</asp:Content>

