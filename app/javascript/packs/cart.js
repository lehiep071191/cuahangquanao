$(document).on('turbolinks:load', function(){
	var quantity_cart = $('input[name="quantity-cart"]')
	quantity_cart.mouseleave(function(){
		debugger
		const id = $(this).data('id')
		var subtotal = parseInt($('.subtotal').text())
		var old_total = parseInt($('#total-'+id).text())
		subtotal = subtotal - old_total
		$.ajax({
			url: '/cart_products/' + id,
			method: 'put',
			dataType: 'json',
			data: {
				authenticity_token: $('meta[name="csrf_token"]').val(),
				quantity: $(this).val()
			}, 
			success: function(data){
				var obj = data.data_cart_product
				var price = parseInt($('#price-'+id).text())
				var sum = 0
				var total = $('#total-'+ id)
				sum = (parseInt(obj.quantity) * price)
				$('#total-'+id).html(sum)
				$('.subtotal').text(subtotal+sum)
			}	
		})
	})
})