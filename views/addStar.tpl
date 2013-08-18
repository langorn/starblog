<!DOCTYPE html>
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8" />

  <!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width" />

  <title>Welcome to Foundation | Store</title>

  <link rel="stylesheet" href="/static/css/normalize.css">
  <link rel="stylesheet" href="/static/css/foundation.css"> 

<!-- <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/normalize.css">
  <link rel="stylesheet" href="http://foundation.zurb.com/page-templates4/css/foundation.css">  -->

<!-- http://foundation.zurb.com/page-templates4/css/normalize.css -->
  <script src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
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
          
          <form id="createStar">
              <table>
                <tr>
                  <td>Surname</td>
                  <td><input type="text" name="surname"></td>
                </tr>
                <tr>
                  <td>Name</td>
                  <td><input type="text" name="name"></td>
                </tr>
                <tr>
                  <td>Blog</td>
                  <td><input type="text" name="blog"></td>
                </tr>
                <tr>
                  <td>FB</td>
                  <td><input type="text" name="fb"></td>
                </tr>
                <tr>
                  <td>Gender</td>
                  <td><input type="text" name="gender"></td>
                </tr>
                <tr>
                  <td>Occupation</td>
                  <td>
                  <input type="checkbox" name="occupation" value="singer">Singer
                  <input type="checkbox" name="occupation" value="actor">Actor
                  <input type="checkbox" name="occupation" value="normalguy">None of Them</td>
                </tr> 

                <tr>
                  <td><div id="add_star" >ADD</div></td>
                  <td></td>
                </tr>
              </table>
          </div>
        </form>

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




  $('#add_star').click(function(){
      var form = $('#createStar').serializeObject();
      $.ajax({
        type:"POST",
        url:"/star",
        data:JSON.stringify(form),
        dataType:"json",
        success:function(data){
          console.log(data);
          console.log('work');
        },
        error:function(jqXHR, textStatus, errorThrown){
          console.log(errorThrown);
        }
      })
  })


$.fn.serializeObject = function()
{
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};
  </script>


  <!-- End Footer -->




</body>
</html>
