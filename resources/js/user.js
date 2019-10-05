
 const dictionary = {
	custom: {
		name: {
			required: () => 'Tên không được để trống',
			max: () => 'Tên tối đa 30 ký tự',
			min: () => 'Tên tối thiểu 3 ký tự'
		},
		pass: {
			required: () => 'Mật khẩu không được để trống',
		},
		newpass: {
			required: () => 'Nhập mật khẩu mới',
			min: () => 'Mật khẩu tối thiểu 3 ký tự'
		},
		renewpass: {
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


var slogan = new Vue({
	el: '#user',
	data(){
		return{
			questions: [],
			answers: [],
			current: 'question',
			name_user: $('#name_user').val(),
			showEditName: false,
			showEditPass: false,
			pass: '',
			newpass:'',
			renewpass: ''
		}
	},
	methods: {
		get_question_user()
		{
			axios.post('/api/user/get_question')
			.then(response=>{
				for(let i=0;i<response.data.length;i++)
				{
					response.data[i].showEdit = false;
				}
				this.questions = response.data;
			})
		},
		get_answer_user()
		{
			axios.post('/api/user/get_answer')
			.then(response=>{
				console.log(response.data);
				this.answers = response.data;
			})
		},
		get_category()
		{
			axios.post('/api/catagory/get_all')
			.then(response=>{
				this.categories = response.data;
			})
		},
		remove_question(question)
		{
			Swal.fire({
				title: 'Bạn có muốn xóa ?',
				text: "",
				type: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Xóa'
			}).then((result) => {
				if (result.value) {

					const fd = new FormData();
					fd.append('id',question.id);
					axios.post('/api/user/remove_question',fd)
					.then(response=>{
						this.questions.splice(this.questions.indexOf(question),1);
						Swal.fire(
							'Xóa thành công!',
							'Câu hỏi đã được xóa',
							'success'
						)
					})	
				}
			})
			
		},
		remove_answer(answer)
		{
			const fd = new FormData();
			fd.append('id',answer.id);
			axios.post('/api/user/remove_answer',fd)
			.then(response=>{
				this.answers.splice(this.answers.indexOf(answer),1);
				Swal.fire(
					'Xóa thành công!',
					'Câu trả lời đã được xóa',
					'success'
				)
			})	
		},
		update_name()
		{
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					const fd = new FormData();
					fd.append('name',this.name_user);
					axios.post('/api/user/update_name',fd)
					.then(response=>{
						this.showEditName = false;
					})
				}
			})
				
		},
		update_pass()
		{
			this.$validator.validateAll('password').then(valid=>{
				console.log(valid);
				if(valid)
				{
					const fd = new FormData();
					fd.append('pass',this.pass);
					fd.append('newpass',this.newpass);

					axios.post('/api/user/update_pass',fd)
					.then(response=>{
						this.showEditPass = false;
						const Toast = Swal.mixin({
							toast: true,
							position: 'top-end',
							showConfirmButton: false,
							timer: 3000
						})

						Toast.fire({
							type: 'success',
							text: 'Đổi mật khẩu thành công'
						})

					})
					.catch(error=>{
						const Toast = Swal.mixin({
							toast: true,
							position: 'top-end',
							showConfirmButton: false,
							timer: 3000
						})

						Toast.fire({
							type: 'error',
							text: error.response.data
						})
					})
				}
			})
		},
		question()
		{
			this.current = 'question'
		},
		answer()
		{
			this.current = 'answer';
		},
		user()
		{
			this.current = 'user';
		}
	},
	mounted()
	{
		this.get_question_user();
		this.get_answer_user();
	},
	computed:
	{
		object: function() {
			return {
				active: this.current == 'question'
			}
		},
		object1: function() {
			return {
				active: this.current == 'answer'
			}
		},
		object2: function() {
			return {
				active: this.current == 'user'
			}
		}
	}

});