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

Vue.component('paginate', VuejsPaginate)

var app = new Vue({
	el: '#app',
	data: {
			listUsers: [],
			// user: '',
			url: '/api/user/get_users',
			pagination: {}
	},
	methods: {
		get_users()
		{
			axios.post(this.url)
			.then(response=>{

				for(let i=0;i<response.data.data.length;i++)
				{
					if(response.data.data[i].active == 1)
						response.data.data[i].active = true;
					else
						response.data.data[i].active = false;
				}

				this.listUsers = response.data.data;
				this.pagination = response.data;
			})
		},
		FetchPagination(page_number)
		{
			this.url = '/api/user/get_users?page='+page_number;
			this.get_users();
		},
		removeUser(user)
		{

			confirmSweet("Bạn có muốn xóa người dùng: "+user.username, function(){
				Swal.fire(
					'Deleted!',
					'Bạn vừa xóa: '+user.username,
					'success'
				);

				const fd = new FormData();
				fd.append('id', user.id);
				axios.post('/api/user/remove',fd)
				.then(response=>{
					 window.location="/admin/users";
				});

			});


		},
		updateActive(user)
		{
			const fd = new FormData();
			fd.append('id',user.id);
			axios.post('/api/user/update-active',fd)
			.then(response=>{
				user.active = !user.active;
			})
		}
	},
	mounted(){
		this.get_users();
	}

});
