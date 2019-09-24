const dictionary = {
	custom: {
		name: {
			required: () => 'Tên danh mục không được để trống',
			max: () => 'Tên tác giả không hợp lệ',
		},
		image:{
			required: () => 'Hình ảnh không được để trống',
			image: () => 'Tệp đã chọn không phải hình ảnh'
		},
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


var catagory = new Vue({
	el: '#container',
	data(){
		return{
			name: '',
			catagories: [],
			catagoryEdit: {}
		}
	},
	methods: {
		getAllCatagory(){
			axios.post('/api/catagory/get_all')
			.then(response=>{
				this.catagories = response.data;
			})
		},
		addCatagory(){
			this.$validator.validate().then(valid=>{
				if(valid)
				{
					let image = document.getElementById('image').files[0];
					const fd = new FormData();
					fd.append('image',image);
					fd.append('name',this.name);
					axios.post('/api/catagory/add_catagory',fd)
					.then(response=>{
						thongbao('success','Thêm thành công');
					})
					.catch(error=>{
						thongbao('error',error.response.data);
					})
				}
			});
		},
		getCurrentCatagory()
		{
			let url = location.href.split('/');
			if(url[url.length-2] == 'edit')
			{
				if(url[url.length - 1])
				{
					let id = url[url.length - 1];
					const fd = new FormData();
					fd.append('id',id);
					axios.post('/api/catagory/current_catagory',fd)
					.then(response=>{
						response.data.showEditImage = false;
						response.data.uploadImage = false;
						this.catagoryEdit = response.data;
					})
					.catch(error=>{
						console.log(error);
						window.location.href = '/404';
					})
				}
				else
				{
					swindow.location.href = '/404';
				}

			}
		},
		reviewImage(catagoryEdit)
		{
			let image = event.target.files[0];
			if(image == null)
        	{
        		
        		document.getElementById('image-review').src = catagoryEdit.image;
        		catagoryEdit.uploadImage = false;
        		thongbao('warning','Chọn ảnh muốn thêm');
        		return;
        	}
			let reader = new FileReader(image);
			reader.readAsDataURL(image);
			reader.onload = e => {
				document.getElementById('image-review').src = e.target.result;
				catagoryEdit.uploadImage = !catagoryEdit.uploadImage;
			}
		},
		hideEditImage(catagoryEdit)
		{

			catagoryEdit.showEditImage = !catagoryEdit.showEditImage;
			catagoryEdit.uploadImage = false;
		},
		updateImage(catagoryEdit)
		{
			this.$validator.validateAll('uploadImage').then(valid=>{
				if(valid)
				{
					let image = document.getElementById('image-edit').files[0];
					const fd = new FormData();
					fd.append('id',catagoryEdit.id);
					fd.append('image',image);
					axios.post('/api/catagory/update_image',fd)
					.then(response=>{
						catagoryEdit.image = response.data;
						catagoryEdit.showEditImage = false;
						thongbao('success','Sửa thành công');
					})
					.catch(error=>{
						thongbao('error','Lỗi');
					})
				}
			});
		},
		editCatagory(catagoryEdit){
			this.$validator.validateAll('updateName').then(valid=>{
				if(valid)
				{
					const fd = new FormData();
					fd.append('id',catagoryEdit.id);
					fd.append('name',catagoryEdit.name);
					axios.post('/api/catagory/update_name',fd)
					.then(response=>{
						thongbao('success','Sửa thành công');
					})
					.catch(error=>{
						thongbao('error','Lỗi');
					})
				}
			});
		},
		removeCatagory(catagory)
		{
			const fd = new FormData();
			fd.append('id',catagory.id);
			axios.post('/api/catagory/remove',fd)
			.then(response=>{
				this.catagories.splice(this.catagories.indexOf(catagory),1);
			})
		},
		updateRank(catagory)
		{
			const fd = new FormData();
			fd.append('id',catagory.id);
			fd.append('rank',catagory.rank);
			axios.post('/api/catagory/update_rank',fd)
			.then(response=>{
				thongbao('success','Cập nhật thành công');
			})
			.catch(error=>{
				thongbao('error','Lỗi');
			})
		}
	},
	mounted(){
		this.getAllCatagory();
		this.getCurrentCatagory();
	}
});

