<html>
<head>
  <link rel="stylesheet" href="/static/css/pinterest.css"> 
  <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>


</head>
	<body>
    <div class="span12">
    <table class="table table-striped table-condensed">
          
        <thead>
          <tr>
             <td>  
               <legend>Admin</legend>
               <button class="btn btn-success"><a href="/starc"><i class="icon-plus"></i>ADD+</a></button>
              
             </td>

          </tr>
        </thead>
        %for s in stars:
        <tr>
           <td>  
              <p>
                <img src="http://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Vivian4comp.jpg/220px-Vivian4comp.jpg" width="40" height="40" class="img-polaroid">
                <a href='/star_detail/{{s["_id"]}}'>{{s['name']}}</a> 


              </p>
             

           </td>
           <td>
            <button class="btn btn-primary delStar" id="{{s['_id']}}"><i class="icon-remove icon-white"></i>Delete</button>
           </td>
        </tr>
        %end%
     

    <table>
  </div>
	</body>

<script>

  var id = $('.delStar').attr('id');
  $('.delStar').click(function(){

      var ans=confirm("Are you sure want to Delete it?");
      if(ans){

        $.ajax({
            url:"/star/"+id,
            type:"DELETE",
            dataType:"json",
            success:function(data){
              console.log(data);

            }
        })

      }


  })


</script>

<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
    // init the FB JS SDK
    FB.init({
      appId      : 'YOUR_APP_ID',                        // App ID from the app dashboard
      channelUrl : '//WWW.YOUR_DOMAIN.COM/channel.html', // Channel file for x-domain comms
      status     : true,                                 // Check Facebook Login status
      xfbml      : true                                  // Look for social plugins on the page
    });

    // Additional initialization code such as adding Event Listeners goes here
  };

  // Load the SDK asynchronously
  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/all.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>
</html>