App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # if($('#message_body').value
    
    console.log(data.mod_message)
    $('#message-container').append data.mod_message
    $('#message_body').val ""
    scrool_bottom()
