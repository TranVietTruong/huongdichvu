
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

var app = new Vue({
	el: '#app',
	data(){
		return{
			full_name: '',
			email: '',
			username: '',
			password: '',
			repassword: '',
			message: '',
			errorCaptcha: '',

			// ---------------
			keysearch: '',
			questions: [],
			news: [],
			searchs: []
		}
	},
	methods: {
		register(){
			let captcha = grecaptcha.getResponse();
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					if(captcha == '')
					{
						this.errorCaptcha = 'Nhập captcha';
						return;
					}
					const fd = new FormData();
					fd.append('full_name',this.full_name);
					fd.append('email',this.email);
					fd.append('username',this.username);
					fd.append('password',this.password);
					fd.append('captcha',captcha);
					axios.post('api/register',fd,{
            			onUploadProgress: uploadEvent => {
            				this.message = 'Đang đăng ký ... '+ Math.round((uploadEvent.loaded * 99) / uploadEvent.total)+"%";
            				thongbao2('info',this.message);
            			}
            		})
					.then(response=>{
						this.full_name = '';
						this.email = '';
						this.username = '';
						this.password = '';
						this.repassword = '';
						this.errorCaptcha = '';
						thongbao('success','Một email đã được gửi đến hòm thư của bạn, vui lòng kiểm tra hòm thư');
					})
					.catch(error=>{
						thongbao('error',error.response.data);
					})
					.finally(function(){
						grecaptcha.reset();
					})
				}
			});
		},
		intanceSearch()
		{
			if(this.keysearch == '')
			{
				this.searchs = [];
				this.questions = [];
				this.news = [];
				return;
			}	

			let species = $("#species").val();
			let category = $("#category").val();

			const fd = new FormData();
			fd.append('species',species);
			fd.append('category',category);
			fd.append('keysearch',this.keysearch);

			axios.post('/api/search/keyword',fd)
			.then(response=>{
				this.searchs = response.data.searchs;
				this.questions = response.data.questions;
				this.news = response.data.news;
			})
			.catch(error=>{
				thongbao('error',error.response.data);
			})
		}
	}

});