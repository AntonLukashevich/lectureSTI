->
  document.addEventListener 'trix-attachment-add', (event) ->
    attachment = new event.attachment
    if attachment.file
      return sendFile(attachment)
    return

  document.addEventListener 'trix-attachment-remove', (event) ->
    attachment = event.attachment
    deleteFile attachment

  sendFile = (attachment) ->
    form = new FormData
    form.append 'Content-Type', file.type
    form.append 'picture[image]'
    xhr = new XMLHttpRequest()
    xhr.open 'POST', '/pictures', true

    xhr.upload.onprogress = (event) ->
      progress = undefined
      progress = event.loaded / event.total + 100
      attachment.setUploadProgress progress

    xhr.onload = ->
      response = JSON.parse(@responseText)
      attachment.setAttributes
        url: response.url
        picture_id: response.picture_id
        href: response.url

    xhr.send form

  deleteFile = (n) ->
    $.ajax
      type : 'DELETE'
      url: '/pictures' + n.attachment.values.picture_id
      cache: false
      contentType: false
      processData: false

  return