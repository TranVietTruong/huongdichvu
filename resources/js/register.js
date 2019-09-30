
 const dictionary = {
	custom: {
		full_name: {
			required: () => 'Tên không được để trống',
			max: () => 'Tên tối đa 30 ký tự',
			min: () => 'Tên tối thiểu 2 ký tự',
			alpha: () => 'Tên không hợp lệ'
		},
		email:{
			required: () => 'Email không được để trống',
			email: () => 'Email không hợp lệ'
		},
		username: {
			required: () => 'Tên đăng nhập không được để trống',
			max: () => 'Tên đăng nhập tối đa 30 ký tự',
			min: () => 'Tên đăng nhập tối thiểu 3 ký tự'
		},
		password: {
			required: () => 'Mật khẩu không được để trống',
			min: () => 'Mật khẩu tối thiểu 3 ký tự'
		},
		repassword: {
			required: () => 'Nhập lại mật khẩu',
			is: () => 'Mật khẩu nhập lại không khớp'
		}
		
	}
};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);


function thongbao(type,message)
{
	Swal.fire({
        type: type,
        title: 'Thông báo',
        text: message,
    })
}

function thongbao2(type,message)
{
	Swal.fire({
        type: type,
        text: message,
        showConfirmButton: false,
    })
}

var slogan = new Vue({
	el: '#register',
	data(){
		return{
			full_name: '',
			email: '',
			username: '',
			password: '',
			repassword: '',
			message: ''
		}
	},
	methods: {
		register(){
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					const fd = new FormData();
					fd.append('full_name',this.full_name);
					fd.append('email',this.email);
					fd.append('username',this.username);
					fd.append('password',this.password);

					axios.post('api/register',fd,{
            			onUploadProgress: uploadEvent => {
            				this.message = 'Đang đăng ký ... '+ Math.round((uploadEvent.loaded * 99) / uploadEvent.total)+"%";
            				thongbao2('info',this.message);
            			}
            		})
					.then(response=>{
						thongbao('success','Một email đã được gửi đến hòm thư của bạn, vui lòng kiểm tra hòm thư');
						this.full_name = '';
						this.email = '';
						this.username = '';
						this.password = '';
						this.repassword = '';
					})
					.catch(error=>{
						thongbao('error',error.response.data);
					})
				}
			});
		}
	}

});