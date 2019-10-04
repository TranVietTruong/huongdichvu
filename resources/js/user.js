
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
			current: 'question'
		}
	},
	methods: {
		get_question_user()
		{
			axios.post('/api/user/get_question')
			.then(response=>{
				console.log(response.data);
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
		},
	}

});