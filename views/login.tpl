<!DOCTYPE html>
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />

  <!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width" />

  <title>Welcome to Foundation | Store</title>

<!--   <link rel="stylesheet" href="/static/css/normalize.css"> -->
  <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootswatch/2.3.2/spacelab/bootstrap.min.css"> 
<!--   <link rel="stylesheet" href="/static/css/bt.css">  -->
<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/normalize.css">
  <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/foundation.css">  -->

<!-- http://foundation.zurb.com/page-templates4/css/normalize.css -->

  <script src="js/vendor/custom.modernizr.js"></script>

</head>
<body>

  %include banner title='xxx'

  <!-- include -->
  <div>

              <form class="bs-example form-horizontal" action="/login_auth" method="POST">
                <fieldset>
                  <legend>Login</legend>
                  <div class="form-group">
                    <label for="inputEmail" class="col-lg-2 control-label">Email</label>
                    <div class="col-lg-10">
                      <input type="text" name="username" class="form-control" id="inputEmail" placeholder="Email">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword" class="col-lg-2 control-label">Password</label>
                    <div class="col-lg-10">
                      <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password">
                    </div>
                  </div>

                  <div class="form-group">

                    <div class="col-lg-10">
                      <input type="submit" value="Create">
                    </div>
                  </div>  
            </form>
  </div>

  <script>
  document.write('<script src=js/vendor/' +
  ('__proto__' in {} ? 'zepto' : 'jquery') +
  '.js><\/script>')
  </script>
  <script src="js/foundation.min.js"></script>
  <script>
    $(document).foundation();
  </script>
  <!-- End Footer -->

</body>
</html>
