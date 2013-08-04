$('li.upload .upload-trigger').on 'click', ->
	$('#user_upload_file').click()

$('#user_upload_file').on 'change', ->
	$(@).closest('form').submit()

$('.file-list-item').on 'click', '.rename', ->
	$(@).closest('.file-list-item').find('#name').show()
	return false