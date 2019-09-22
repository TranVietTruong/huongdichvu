
const dictionary = {
	custom: {
		author: {
			required: () => 'Tên tác giả không được để trống',
			max: () => 'Tên tác giả không hợp lệ',
		},
		image:{
			required: () => 'Hình ảnh không được để trống',
			image: () => 'Tệp đã chọn không phải hình ảnh'
		},
		description: {
			required: () => 'Mô tả không được để trống',
			max: () => 'Dữ liệu không hợp lệ'
		},
		slogan: {
			required: () => 'Slogan không được để trống'
		}
	}
};
VeeValidate.Validator.localize('en',dictionary);
Vue.use(VeeValidate);


function thongbao(type,title)
{
	Swal.fire({
		toast: true,
		position: 'top-end',
		type: type,
		title: title,
		showConfirmButton: false,
		timer: 3000
	})
}

var slogan = new Vue({
	el: '#container',
	data:{
		author: '',
		description: '',
		slogan: '',
		listSlogan: [],
		sloganEdit: {}
	},
	methods:{
		getAllSlogan(){
			axios.post('/api/slogan/getall')
			.then(response=>{
				for(let i=0;i<response.data.length;i++)
				{
					if(response.data[i].active == 1)
						response.data[i].active = true;
					else
						response.data[i].active = false;
				}
				this.listSlogan = response.data;
			})
		},
		updateActive(slogan)
		{
			const fd = new FormData();
			fd.append('id',slogan.id);
			axios.post('/api/slogan/update-active',fd)
			.then(response=>{
				slogan.active = !slogan.active;
			})
		},
		addSlogan(){
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					let image = document.getElementById('image').files[0];

					const fd = new FormData();
					fd.append('author',this.author);
					fd.append('image',image);
					fd.append('description',this.description);
					fd.append('slogan',this.slogan);

					axios.post('/api/slogan/add',fd)
					.then(response=>{
						thongbao('success','Thêm thành công');
					})
					.catch(error=>{
						thongbao('error',error.response.data);
					})
				}
			});
		},
		removeSlogan(slogan)
		{
			const fd = new FormData();
			fd.append('id',slogan.id);
			axios.post('/api/slogan/remove',fd)
			.then(response=>{
				this.listSlogan.splice(this.listSlogan.indexOf(slogan),1);
			})
		},
		getCurrentSlogan()
		{
			let url = location.href.split('/');
			if(url[url.length-2] == 'edit')
			{
				if(url[url.length - 1])
				{
					let id = url[url.length - 1];
					const fd = new FormData();
					fd.append('id',id);
					axios.post('/api/slogan/getcurrent',fd)
					.then(response=>{
						response.data[0].showEditImage = false;
						response.data[0].uploadImage = false;
						this.sloganEdit = response.data[0];
					})
					.catch(error=>{
						window.location.href = '/404';
					})
				}
				else
				{
					window.location.href = '/404';
				}

			}
		},
		reviewImage(sloganEdit)
		{
			let image = event.target.files[0];
			if(image == null)
        	{
        		
        		document.getElementById('image-review').src = 'upload/product/slogan/'+sloganEdit.image;
        		sloganEdit.uploadImage = false;
        		thongbao('warning','Chọn ảnh muốn thêm');
        		return;
        	}
			let reader = new FileReader(image);
			reader.readAsDataURL(image);
			reader.onload = e => {
				document.getElementById('image-review').src = e.target.result;
				sloganEdit.uploadImage = !sloganEdit.uploadImage;
			}
		},
		hideEditImage(sloganEdit)
		{

			sloganEdit.showEditImage = !sloganEdit.showEditImage;
			sloganEdit.uploadImage = false;
		},
		saveEdit(sloganEdit)
		{
			this.$validator.validate('sloganUpdate').then(valid=>{
				if(valid)
				{
					const fd = new FormData();
					fd.append('id',sloganEdit.id);
					fd.append('author',sloganEdit.author);
					fd.append('description',sloganEdit.description);
					fd.append('content',sloganEdit.content);
					axios.post('/api/slogan/update',fd)
					.then(response=>{
						thongbao('success','Cập nhật thành công');
					})
					.catch(error=>{
						thongbao('error','Thất bại');
					})
				}
			});
		},
		updateImage(sloganEdit)
		{
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					let image = document.getElementById('image-edit').files[0];
					const fd = new FormData();
					fd.append('id',sloganEdit.id);
					fd.append('image',image);
					axios.post('/api/slogan/update_image',fd)
					.then(response=>{
						sloganEdit.image = response.data;
						sloganEdit.showEditImage = false;
						thonngbao('success','Thêm thành công');
					})
					.catch(error=>{
						thongbao('error',error.response.data);
					})
				}
			});
		}
	},
	mounted()
	{
		this.getAllSlogan();
		this.getCurrentSlogan();
	}
});
