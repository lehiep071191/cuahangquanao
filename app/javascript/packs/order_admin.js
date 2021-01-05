	$(document).on('turbolinks:load', function(){
		var checkall = $('input[name="checkall"]')
		checkall.click(function(){
			if (checkall.is(':checked')){
				$('input[name="update-status"]').prop("checked", true)
			} else{
				$('input[name="update-status"]').prop("checked", false)
			}
		})
	})

	$(document).on("turbolinks:load", function(){
		$('.update_status').click(function(){
			var status = $(this).data('status')
			var order_ids = new Array
			$('input[name="update-status"]:checked').each(function(){
				order_ids.push($(this).val())
			}) 
			$.ajax({
				url: '/admin/orders/'+ order_ids,
				dataType: 'json',
				method: 'put',
				data: {
					authenticity_token: $('[name="csrf_token"]').content,
					status: status
				},
				success: function(data){
					debugger
					order_ids.forEach(function(id, index){
						$('#order_status-'+id).text(data.data_update_order)
						$('#checkitem-'+id).prop('checked', false)
					})
					$('input[name="checkall"]').prop('checked', false)
					$('#admin_noitice_order').html('<span style = "color:red; font-weight: bold"> update hoàn tất</span>')
					setTimeout(function(){$('#admin_noitice_order').html("")},5000)
				}
			})
		})
	})
