<!DOCTYPE html>
<html lang="en">

<head>
  <base href="../">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="tư vấn khởi nghiệp">
  <meta name="author" content="tuvankhoinghiep.me">
  <meta name="keyword" content="tư vấn,khởi nghiệp">
  <title>Admin - Tư Vấn Khởi Nghiệp</title>

  <!-- Favicons -->
  <link href="public/admin/img/favicon.png" rel="icon">
  <link href="public/admin/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="public/admin/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="public/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="public/admin/css/style.css" rel="stylesheet">
  <link href="public/admin/css/style-responsive.css" rel="stylesheet">
  


  </head>

  <body>
  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <div id="login-page">
        <div class="container">
          <form class="form-login" action="index.html">
            <h2 class="form-login-heading">Đăng Nhập</h2>
            <div class="login-wrap">
            
                <input v-validate="'required|max:30|alpha_num'" v-model="username" type="text" class="form-control" placeholder="Tài khoản" data-vv-name="username" autofocus>
                <div class="text-danger mt" v-if="errors.has('username')">{{errors.first('username')}}</div>
              <br>
              <input v-validate="'required'" v-model="password" type="password" class="form-control" placeholder="Mật khẩu" data-vv-name="password">
              <div class="text-danger mt" v-if="errors.has('password')">{{errors.first('password')}}</div>

              <!-- <div class="mt alert alert-danger" v-if="errors.has('password')">
                    {{errors.first('password')}}
              </div> -->
              <label class="checkbox">
                <!-- <input type="checkbox" value="remember-me"> Remember me -->
                <!-- <span class="pull-right">
                  <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>
                </span> -->
              </label>
              <br>
              <button @click="login" class="btn btn-theme btn-block" href="index.html" type="button"><i class="fa fa-lock"></i> Đăng Nhập</button>
              <hr>
             
            </div>
            <!-- Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Forgot Password ?</h4>
                  </div>
                  <div class="modal-body">
                    <p>Enter your e-mail address below to reset your password.</p>
                    <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
                  </div>
                  <div class="modal-footer">
                    <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                    <button class="btn btn-theme" type="button">Submit</button>
                  </div>
                </div>
              </div>
            </div>
            <!-- modal -->
          </form>
        </div>
      </div>
      <!-- js placed at the end of the document so the pages load faster -->
      <script src="public/admin/lib/jquery/jquery.min.js"></script>
      <script src="public/admin/lib/bootstrap/js/bootstrap.min.js"></script>
      <!--BACKSTRETCH-->
      <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
      <script type="text/javascript" src="public/admin/lib/jquery.backstretch.min.js"></script>

      
      <script src="public/admin/vue.js"></script>
      <script src="public/admin/vee-validate.js"></script>
      <script src="public/admin/sweetalert.js"></script>
      <script src="public/admin/axios.min.js"></script>
      
      <!-- <script src="https://cdn.jsdelivr.net/npm/vee-validate@latest/dist/vee-validate.js"></script> -->
      <script>
        $.backstretch("public/admin/img/login-bg.jpg", {
          speed: 500
        });
      </script>

      <script>
       

        const dictionary = {
          custom: {
            username: {
              required: () => 'Tài khoản không được để trống',
              max: () => 'Tài khoản không hợp lệ',
              alpha_num: () => 'Tài khoản không hợp lệ'
            },
            password:{
              required: () => 'Mật khẩu được để trống'
            }
          }
        };
        VeeValidate.Validator.localize('en',dictionary);
         Vue.use(VeeValidate);
          var login = new Vue({
            el: '#login-page',
            data: {
              username: '',
              password: ''
            },
            methods:{
              login(){
                this.$validator.validate().then(valid=>{
                  if(valid)
                  {
                    const fd = new FormData();
                    fd.append('username',this.username);
                    fd.append('password',this.password);

                    axios.post('api/admin/login',fd)
                    .then(response=>{
                        window.location.href = "/admin";
                    })
                    .catch(error=>{
                      Swal.fire({
                        type: 'error',
                        title: 'Lỗi',
                        text: error.response.data
                      })
                    })
                  }
                })
              }
            }
          })
      </script>
    </body>
    </html>
