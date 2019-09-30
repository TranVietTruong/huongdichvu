
 const dictionary = {
	custom: {
		username: {
			required: () => 'Tên đăng nhập không được để trống',
		},
		password: {
			required: () => 'Mật khẩu không được để trống',
		},	
	}
};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);


function thongbao(type,message)
{
	Swal.fire({
        type: type,
        title: 'Lỗi',
        text: message,
    })
}


var slogan = new Vue({
	el: '#login',
	data(){
		return{
			username: '',
			password: '',
		}
	},
	methods: {
		login(){
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					const fd = new FormData();
					fd.append('username',this.username);
					fd.append('password',this.password);

					axios.post('/api/user/login',fd)
					.then(response=>{
						window.location.href = '/';
					})
					.catch(error=>{
						thongbao('error',error.response.data);
					})
				}
			});
		}
	}

});