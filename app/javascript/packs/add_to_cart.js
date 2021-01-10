$(document).on('turbolinks:load', function(){
		var quantity = parseInt($('input[name="quantity_product"]').val())
		var old_quantity = parseInt($('input[name="old_quantity"]').val())
		var cart_product_id = parseInt($('input[name="cart_product_id"]').val())
		$('#create_cart_product').click(function(){
			$.ajax({
				url: '/add_to_carts',
				method: 'post',
				dataType: 'json',
				data:  {
					authenticity_token:  $('meta[name="csrf-token"]').attr('content') ,
					product_id: $('input[name="product_id"]').val(),
					cart_id: $('input[name="cart_id"]').val(),
					quantity: quantity
				},
				success: function(){
					alert("bạn đã đặt hàng thành công")
					$('#create_cart_product').attr("disabled","disabled")
				}
			})
		})
		$('#update_cart_product').click(function(){
			$.ajax({
				url: '/add_to_carts/' + cart_product_id,
				method: 'put',
				dataType: 'json',
				data:  {
					authenticity_token:  $('meta[name="csrf-token"]').attr('content') ,
					product_id: $('input[name="product_id"]').val(),
					cart_id: $('input[name="cart_id"]').val(),
					quantity: quantity + old_quantity
				},
				success: function(){
					alert("bạn thêm số lượng sản phẩm trong giỏ hàng")
				}
			})
		})
	})