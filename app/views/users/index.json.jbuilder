# json.array! @users do |user|
#   json.extract! user, :id, :name
# end

json.array! @users do |user|
  json.userId     user.id
  json.userName   user.name
end
