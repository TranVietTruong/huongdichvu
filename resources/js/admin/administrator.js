function confirmSweet(message, callBack)
{
	Swal.fire({
  title: message,
  text: "Bạn sẽ không thể hoàn tác hành động này!",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
	cancelButtonText: "Thoát",
  confirmButtonText: 'Xóa'
	}).then((result) => {
	  if (result.value) {
	    callBack();
	  }
	});
}


function thongbao(type,title)
{
	Swal.fire({
		type: type,
		title: title,
		showConfirmButton: false,
		timer: 3000
	})
}

const dictionary = {
	custom: {
		full_name: {
			required: () => 'Họ và tên không được để trống',
			max: () => 'Họ và tên không hợp lệ',
		},
		email: {
			required: () => 'Bạn chưa điền Email',
			max: () => 'Email không hợp lệ',
		},
		username: {
			required: () => 'Chưa điền tên người dùng',
			max: () => 'Tên người dùng quá dài',
		},
		password: {
			required: () => 'Chưa nhập mật khẩu',
			max: () => 'Mật khẩu quá dài',
		},
		confirm_password: {
			required: () => 'Yêu cầu xác nhận mật khẩu',
			max: () => 'Mật khẩu quá dài',
		},
	},

};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);

var administrator = new Vue({
	el: '#app',
	data:{
		full_name: '',
		email: '',
		username: '',
		password: '',
		confirm_password: '',
		admin: '',
		listAdmin: []
	},
	methods:{
		getAll(){
			axios.post('/api/admin/get_all')
			.then(response=>{
				for(let i=0;i<response.data.length;i++)
				{
					if(response.data[i].active == 1)
						response.data[i].active = true;
					else
						response.data[i].active = false;
				}
				this.listAdmin = response.data;
			})
		},
		updateActive(admin)
		{
			const fd = new FormData();
			fd.append('id',admin.id);
			axios.post('/api/admin/update_active',fd)
			.then(response=>{
				admin.active = !admin.active;
			})
		},
		addAdmin(){
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					const fd = new FormData();
					fd.append('full_name',this.full_name);
					fd.append('email',this.email);
					fd.append('username',this.username);
					fd.append('password',this.password);
					if(!(this.password == this.confirm_password))
					{
						thongbao("error", "Mật khẩu xác nhận không giống nhau");
						this.confirm_password = '';
					}
					else{
						axios.post('/api/admin/add',fd)
						.then(response=>{
							console.log(response.data);
							thongbao(response.data.type, response.data.message);
							this.full_name = '';
							this.email = '';
							this.username = '';
							this.password = '';
							this.confirm_password = '';
							if(response.data.type == "success")
								window.location="/admin/administrator";
						});
					}

				}
			});
		},
		removeAdmin(admin)
		{
			confirmSweet("Bạn có muốn người dùng này? - "+admin.username, function(){
				Swal.fire(
		      'Đã xóa!',
		      'Bạn vừa xóa người dùng '+admin.username,
		      'success'
		    );

				const fd = new FormData();
				fd.append('id',admin.id);
				axios.post('/api/admin/remove',fd)
				.then(response=>{
					window.location="/admin/administrator";
				});
			});
		}
	},
	mounted()
	{
		this.getAll();
	}
});
