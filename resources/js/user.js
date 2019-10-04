
 const dictionary = {
	custom: {
		full_name: {
			required: () => 'Tên không được để trống',
			max: () => 'Tên tối đa 30 ký tự',
			min: () => 'Tên tối thiểu 2 ký tự',
			alpha: () => 'Tên không hợp lệ'
		},
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
		question()
		{
			this.current = 'question'
		},
		answer()
		{
			this.current = 'answer';
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
				active: this.current == 'info'
			}
		}
	}

});