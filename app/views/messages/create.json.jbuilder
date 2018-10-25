json.extract! @message, :id, :content
json.image_url @message.image_url
json.image_name @message.image_identifier
# json.id @message.id
# json.content @message.content
# json.image @message.image
json.user_name @message.user.name
json.created_at @message.created_at.strftime('%Y/%m/%d %H:%M:%S')
