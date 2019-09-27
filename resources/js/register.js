
 const dictionary = {
	custom: {
		full_name: {
			required: () => 'Tên không được để trống',
			max: () => 'Tên tối đa 30 ký tự',
			min: () => 'Tên tối thiểu 2 ký tự',
			alpha: () => 'Tên không hợp lệ'
		},
		email:{
			required: () => 'Email ảnh không được để trống',
			email: () => 'Email không hợp lệ'
		},
		major:{
			required: () => 'Lĩnh vực không được để trống'
		},
		username: {
			required: () => 'Tên đăng nhập không được để trống',
			max: () => 'Tên đăng nhập tối đa 30 ký tự',
			min: () => 'Tên tối thiểu 2 ký tự'
		},
		
	}
};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);


function thongbao(type,title)
{
	Swal.fire({
		toast: true,
		position: 'top-end',
		type: type,
		title: title,
		showConfirmButton: false,
		timer: 3000
	})
}

var slogan = new Vue({
	el: '#register',

});