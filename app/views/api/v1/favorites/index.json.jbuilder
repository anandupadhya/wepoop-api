# app/views/api/v1/users/favorites/index.json.jbuilder
json.favorites do
  json.array! @favorites do |favorite|
    json.extract! favorite, :toilet_id, :user_id
  end
end
