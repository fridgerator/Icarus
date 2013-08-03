$('#user_file_<%= @user_upload.id %>, #music_<%= @user_upload.id %>, #photo_<%= @user_upload.id %>').fadeOut 'fast', ->
	$(@).remove()