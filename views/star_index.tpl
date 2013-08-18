<html>
<head>
<!--   <link rel="stylesheet" href="/static/css/pinterest.css">  -->
  <link rel="stylesheet" href="/static/css/bootstrap3.css"> 
  <link rel="stylesheet" href="/static/css/block.css"> 
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootswatch/2.3.2/spacelab/bootstrap.min.css"> 

  <script src="http://codeorigin.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="/static/js/masonry.pkgd.js"></script>


  <script>

  $(function(){
    var container = document.querySelector('#container');
    var msnry = new Masonry( container, {
      // options...
      itemSelector: '.item',
      columnWidth: 100
    });
  })  



        // $('#containerx').masonry({
        //   itemSelector: '.item',
        //   columnWidth: 200
        // });

  </script>
</head>
	<body>

  %include banner title='xxx'


<div id='container'>

    <div class="js-masonry" data-masonry-options='{ "itemSelector": ".item", "columnWidth": 100 }'>


        %for s in stars:
        <div class="item">
          <ul class="thumbnails">
            <li class="span4">
            <div class="thumbnail">
             
            
              <img src='static/upload/star.jpg' data-src="static/upload/ben.jpg" alt="">
             
              
              <h3><a href='/star_info/{{s["_id"]}}'>{{!s['lastPost']['title']}}</a></h3>
              <p class='published'>{{!s['lastPost']['published']}} 
                  {{!s['lastPost']['description']}} 
              </p>
            </div>
            </li>

          </ul>
        </div>

           
        %end%

 <!--        <div class="item">
          <ul class="thumbnails">
            <li class="span4">
            <div class="thumbnail">
              <img src='static/upload/ben.jpg' data-src="static/upload/ben.jpg" alt="">
              <h3>BEN : Today is a Good Day</h3>
              <p>忠貞不二老公」名列前矛的阿Ben，沒想到竟被爆料，本月10日晚間8點左右，開車帶著長髮美眉進大直有名的摩鐵...</p>
            </div>
            </li>

          </ul>
        </div> -->
    </div>

</div>

	</body>


<div id="fb-root"></div>
<script>

  // $('.published').each(function(){
  //   var p = $(this).text();
  //   $(this).html(p);
  // })


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