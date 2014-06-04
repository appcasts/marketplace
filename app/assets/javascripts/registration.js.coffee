$ ->

  $('#user_picture_url').change (e, data) ->
    url = e.originalEvent.fpfile.url
    $('.filepicker-preview').attr('src', url)
