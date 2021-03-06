
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


var app = new Vue({
	el: '#app',
	data(){
		return{
			username: '',
			password: '',

			// ---------------
			keysearch: '',
			questions: [],
			news: [],
			searchs: []
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
		},

		forgetPass()
		{
			(async () => {
				const { value: email } = await Swal.fire({
					text: "Nhập địa chỉ email",
					input: "email",
					inputPlaceholder: "Nhập đia chỉ email"
				});

				if (email) {
					const fd = new FormData();
					fd.append('email',email);

					axios.post('/api/user/forget_password',fd,{
						onUploadProgress: uploadEvent => {
            				Swal.fire({
								type: 'info',
								title: 'Thông báo',
								text: 'Đang xử lý...',
								showConfirmButton: false
							})
            			}
					})
					.then(response=>{
						Swal.fire({
							type: 'success',
							title: 'Thông báo',
							text: 'Một tin nhắn đã được gửi đến email của bạn',
						})
					})
					.catch(error=>{
						
					})
				}
			})();
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