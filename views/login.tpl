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
<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/normalize.css">
  <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/foundation.css">  -->

<!-- http://foundation.zurb.com/page-templates4/css/normalize.css -->

  <script src="js/vendor/custom.modernizr.js"></script>

</head>
<body>
    <!-- Navigation -->

      <div class="row">
        <div class="large-12 columns">

          <nav class="top-bar">
            <ul class="title-area">
              <!-- Title Area -->
              <li class="name">
                <h1>
                  <a href="#">
                    Top Bar Title
                  </a>
                </h1>
              </li>
              <li class="toggle-topbar menu-icon"><a href="#"><span>menu</span></a></li>
            </ul>
         
            <section class="top-bar-section">
              <!-- Right Nav Section -->
              <ul class="right">
                <li class="divider"></li>
                <li class="has-dropdown">
                  <a href="#">Main Item 1</a>
                  <ul class="dropdown">
                    <li><label>Section Name</label></li>
                    <li class="has-dropdown">
                      <a href="#" class="">Has Dropdown, Level 1</a>
                      <ul class="dropdown">
                        <li><a href="#">Dropdown Options</a></li>
                        <li><a href="#">Dropdown Options</a></li>
                        <li><a href="#">Level 2</a></li>
                        <li><a href="#">Subdropdown Option</a></li>
                        <li><a href="#">Subdropdown Option</a></li>
                        <li><a href="#">Subdropdown Option</a></li>
                      </ul>
                    </li>
                    <li><a href="#">Dropdown Option</a></li>
                    <li><a href="#">Dropdown Option</a></li>
                    <li class="divider"></li>
                    <li><label>Section Name</label></li>
                    <li><a href="#">Dropdown Option</a></li>
                    <li><a href="#">Dropdown Option</a></li>
                    <li><a href="#">Dropdown Option</a></li>
                    <li class="divider"></li>
                    <li><a href="#">See all &rarr;</a></li>
                  </ul>
                </li>
                <li class="divider"></li>
                <li><a href="#">Main Item 2</a></li>
                <li class="divider"></li>
                <li class="has-dropdown">
                  <a href="#">Main Item 3</a>
                  <ul class="dropdown">
                    <li><a href="#">Dropdown Option</a></li>
                    <li><a href="#">Dropdown Option</a></li>
                    <li><a href="#">Dropdown Option</a></li>
                    <li class="divider"></li>
                    <li><a href="#">See all &rarr;</a></li>
                  </ul>
                </li>
              </ul>
            </section>
          </nav>
          <!-- End Top Bar -->
        </div>
      </div>

    <!-- End Navigation -->
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
