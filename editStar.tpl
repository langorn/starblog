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

      <div class="row">

  <!-- Side Bar -->

        <div class="large-4 columns">

          <img src="http://placehold.it/500x500&text=Logo">
          <!-- <img src="/static/upload/sname['image']" width='500' height='500'> -->
          <div class="hide-for-small panel">
            <h3>{{sname['name']}}</h3>
            <h5 class="subheader">
            </h5>
            <button id='latestPost'>UpdateBlog</button>
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
                  <td><input type="text" name="surname" value="{{sname['surname']}}">
                      <input type="text" name="_id" id="oid" value="{{sname['_id']}}">

                  </td>
                </tr>
                <tr>
                  <td>Name</td>
                  <td><input type="text" name="name" value="{{sname['name']}}"></td>
                </tr>
                <tr>
                  <td>Blog</td>
                  <td><input type="text" name="blog" value="{{sname['blog_list']}}"></td>
                </tr>
                <tr>
                  <td>FB</td>
                  <td><input type="text" name="fb" value="{{sname['fb']}}"></td>
                </tr>
                <tr>
                  <td>Gender</td>
                  <td><input type="text" name="gender" value="{{sname['gender']}}"></td>
                </tr>
                <tr>
                  <td>Occupation</td>
                  <td>

                  <input type="checkbox" name="occupation" CHECKED value="singer">Singer
                  <input type="checkbox" name="occupation" value="actor">Actor
                  <input type="checkbox" name="occupation" value="normalguy">None of Them</td>
                </tr> 

                <tr>
                  <td><button class="btn btn-primary" id="add_star" ><i class="icon-ok"></i>Edit</div></td>
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
      <div style='width:400px;'>
          <form enctype="multipart/form-data" action="/upload/{{sname['_id']}}" method="post">
          <p>Category: <input type="text" name="category"></p>
          <p>File: <input type="file" name="file"></p>

          <p><input type="submit" value="Upload"></p>
          </form>
      </div>



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


  $(function(){
      var url = $('input[name="blog"]').val();
      $.post('/parse_xml',{'urls':url},function(xdata){

        var full_url = '<a href="'+xdata.data.link+'">'+xdata.data.title+'<br>'+xdata.data.description+'</a>';
        $('.subheader').html(full_url)
        console.log(xdata.data.title);
      })



  })

  $('#add_star').click(function(){
      //var form = $('#createStar').serializeObject();
      var form = $('#createStar').serialize();
      var oid = $('#oid').val();
/*      var Obj = {}
      Obj = {
          data:form
      }
      form['_id'] = {'$oid':'x2' }
*/

     //console.log(form);
      $.ajax({
        type:"PUT",
        url:"/star",
        data:form,
        dataType:"json",
        success:function(data){
          console.log(data);
          console.log('work');
        },
        error:function(data){
          console.log(data);
        }
      })
  })

$('#latestPost').click(function(){

  var url = $('input[name="blog"]').val();
  var id = $('#oid').val();
  if(!url){
    return 
  }

  var ans = confirm('are you sure want to update the latestPost?');
  if(ans){
    $.ajax({
      url:'/update_blog',
      data:{'urls':url,'id':id},
      dataType:'json',
      type:'PUT',
      success:function(data){
        if(data.code==204){
          alert('update success');
        }
      }
    })
  }
})

      var url = $('input[name="blog"]').val();
      $.post('/parse_xml',{'urls':url},function(xdata){

        var full_url = '<a href="'+xdata.data.link+'">'+xdata.data.title+'<br>'+xdata.data.description+'</a>';
        $('.subheader').html(full_url)
        console.log(xdata.data.title);
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
       } 
         else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};
  </script>


  <!-- End Footer -->




</body>
</html>
