<html>
<head>
  <link rel="stylesheet" href="/static/css/pinterest.css"> 
</head>
	<body>

<div id="wrapper">
  <div id="columns">
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/2/2v3VhAp.png" />
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Sed feugiat consectetur pellentesque. Nam ac elit risus, 
        ac blandit dui. Duis rutrum porta tortor ut convallis.
        Duis rutrum porta tortor ut convallis.
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/1/1swi3Qy.png" />
      <p>
        Donec a fermentum nisi. 
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/6/6f3nXse.png" />
      <p>
        Nullam eget lectus augue. Donec eu sem sit amet ligula 
        faucibus suscipit. Suspendisse rutrum turpis quis nunc 
        convallis quis aliquam mauris suscipit.
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/8/8kEc1hS.png" />
      <p>
        Nullam eget lectus augue. Donec eu sem sit amet ligula 
        faucibus suscipit. Suspendisse rutrum turpis quis nunc 
        convallis quis aliquam mauris suscipit.
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/1/1swi3Qy.png" />
      <p>
        Donec a fermentum nisi. Integer dolor est, commodo ut 
        sagittis vitae, egestas at augue. 
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/6/6f3nXse.png" />
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Sed feugiat consectetur pellentesque. Nam ac elit risus, 
        ac blandit dui. Duis rutrum porta tortor ut convallis.
        Duis rutrum porta tortor ut convallis.
      </p>
    </div>  
    
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/2/2v3VhAp.png" />
      <p>
        Nullam eget lectus augue. Donec eu sem sit amet ligula 
        faucibus suscipit. Suspendisse rutrum turpis quis nunc 
        convallis quis aliquam mauris suscipit.
        Duis rutrum porta tortor ut convallis.
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/1/1swi3Qy.png" />
      <p>
        Nullam eget lectus augue. 
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/8/8kEc1hS.png" />
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Sed feugiat consectetur pellentesque. 
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/2/2v3VhAp.png" />
      <p>
        Donec a fermentum nisi. Integer dolor est, commodo ut 
        sagittis vitae, egestas at augue. Suspendisse id nulla 
        ac urna vestibulum mattis. Duis rutrum porta tortor ut convallis.
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/1/1swi3Qy.png" />
      <p>
        Donec a fermentum nisi. Integer dolor est, commodo ut 
        sagittis vitae, egestas at augue. Suspendisse id nulla 
        ac urna vestibulum mattis. 
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/6/6f3nXse.png" />
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Sed feugiat consectetur pellentesque. Nam ac elit risus, 
        ac blandit dui. Duis rutrum porta tortor ut convallis.
      </p>
    </div>  
    
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/2/2v3VhAp.png" />
      <p>
        Donec a fermentum nisi. Integer dolor est, commodo ut 
        sagittis vitae, egestas at augue. Suspendisse id nulla 
        ac urna vestibulum mattis. 
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/1/1swi3Qy.png" />
      <p>
        Donec a fermentum nisi. Integer dolor est, commodo ut 
        sagittis vitae, egestas at augue. Suspendisse id nulla 
        ac urna vestibulum mattis. 
      </p>
    </div>
  
    <div class="pin">
      <img src="http://cssdeck.com/uploads/media/items/6/6f3nXse.png" />
      <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
        Sed feugiat consectetur pellentesque. Nam ac elit risus, 
        ac blandit dui. Duis rutrum porta tortor ut convallis.
      </p>
    </div>
  </div>
</div>

        %for s in stars:
            
            <p><a href='/star_detail/{{s["_id"]}}'>{{s['name']}}</a></p>
           
        %end%
	</body>



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