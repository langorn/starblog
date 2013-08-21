<!DOCTYPE html>
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />

  <!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width" />

  <title>Welcome to Foundation | Store</title>
  <link rel="stylesheet" href="/static/css/bootstrap3.css"> 
  <link rel="stylesheet" href="/static/css/block.css"> 

  <link rel="stylesheet" href="/static/css/normalize.css">
  <link rel="stylesheet" href="/static/css/foundation.css"> 


<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/normalize.css">
  <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/foundation.css">  -->

<!-- http://foundation.zurb.com/page-templates4/css/normalize.css -->

  <script src="js/vendor/custom.modernizr.js"></script>

</head>
<body>





<div class="row">
    <div class="large-12 columns">

      %include banner title='xxx'

      <div class="row">

  <!-- Side Bar -->

        <div class="large-4 columns">

          <img src="http://placehold.it/500x500&text=Logo">

          <div class="hide-for-small panel">
            <h3>{{name}}</h3>
            <h5 class="subheader">Risus ligula, aliquam nec fermentum vitae, sollicitudin eget urna. Donec dignissim nibh fermentum odio ornare sagittis.
            </h5>
          </div>

          <a href="#">
          <div class="panel callout radius">
            <h6>99&nbsp; items in your cart</h6>
          </div>
          </a>

        </div>

    <!-- End Side Bar -->


    <!-- Thumbnails -->

        <div class="large-8 columns">
          <div class="row">

            <div class="large-4 small-6 columns">
              <img src="http://placehold.it/1000x1000&text=Thumbnail">

              <div class="panel">
                <h5>{{name}}</h5>
                <h6 class="subheader">$000.00</h6>
              </div>
            </div>

            <div class="large-4 small-6 columns">
              <img src="http://placehold.it/500x500&text=Thumbnail">

              <div class="panel">
                <h5>{{name}}</h5>
                <h6 class="subheader">$000.00</h6>
              </div>
            </div>

            <div class="large-4 small-6 columns">
              <img src="http://placehold.it/500x500&text=Thumbnail">

              <div class="panel">
                <h5>{{name}}</h5>
                <h6 class="subheader">$000.00</h6>
              </div>
            </div>

            <div class="large-4 small-6 columns">
              <img src="http://placehold.it/500x500&text=Thumbnail">

              <div class="panel">
                <h5>{{name}}</h5>
                <h6 class="subheader">$000.00</h6>
              </div>
            </div>

            <div class="large-4 small-6 columns">
              <img src="http://placehold.it/500x500&text=Thumbnail">

              <div class="panel">
                <h5>{{name}}</h5>
                <h6 class="subheader">$000.00</h6>
              </div>
            </div>

            <div class="large-4 small-6 columns">
              <img src="http://placehold.it/500x500&text=Thumbnail">

              <div class="panel">
                <h5>Item Name</h5>
                <h6 class="subheader">$000.00</h6>
              </div>
            </div>
          </div>

    <!-- End Thumbnails -->


    <!-- Managed By -->
          <div class="row">
            <div class="large-12 columns">
              <div class="panel">
                <div class="row">

                  <div class="large-2 small-6 columns">
                    <img src="http://placehold.it/300x300&text=Site Owner">
                  </div>

                  <div class="large-10 small-6 columns">
                    <strong>This Site Is Managed By<hr/></strong>

                    Risus ligula, aliquam nec fermentum vitae, sollicitudin eget urna. Donec dignissim nibh fermentum odio ornare sagittis
                  </div>

                </div>
              </div>
            </div>

    <!-- End Managed By -->

          </div>
        </div>
      </div>


    <!-- Footer -->

      <footer class="row">
        <div class="large-12 columns"><hr />
          <div class="row">

            <div class="large-6 columns">
              <p>&copy; Copyright no one at all. Go to town.</p>
            </div>

            <div class="large-6 columns">
              <ul class="inline-list right">
                <li><a href="#">Link 1</a></li>
                <li><a href="#">Link 2</a></li>
                <li><a href="#">Link 3</a></li>
                <li><a href="#">Link 4</a></li>
              </ul>
            </div>

          </div>
        </div>
      </footer>

    <!-- End Footer -->

    </div>
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
