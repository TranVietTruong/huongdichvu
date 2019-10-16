var app = new Vue({
	el: '#app',
	data(){
		return{
			listUsers: [],
			// user: '',
			url: '/api/user/get_users',
			pagination: {}
		}
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
			const fd = new FormData();
			fd.append('id', user.id);
			axios.post('/api/user/remove',fd)
			.then(response=>{
				this.listUsers.splice(this.listUsers.indexOf(user),1);
			})
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
