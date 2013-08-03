$('li.upload .upload-trigger').on 'click', ->
	$('#user_upload_file').click()

$('#user_upload_file').on 'change', ->
	console.log 'yo'
	$(@).closest('form').submit()