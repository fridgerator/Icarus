$li = $('#user_file_<%= @user_upload.id %>')
$li.find('input[name="name"]').val('').hide()
$li.find('a.filename').text("<%= @user_upload.file_file_name %>")