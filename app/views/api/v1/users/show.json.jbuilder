# app/views/api/v1/users/show.json.jbuilder
json.extract! current_user
json.reviews current_user.reviews do |review|
  json.extract! review, :id, :user_id, :toilet_id, :happy, :status, :comment
  json.date review.created_at.strftime("%m/%d/%y")
end
json.favorites current_user.favorites do |favorite|
  json.extract! favorite, :id, :user_id, :toilet_id
  json.date favorite.created_at.strftime("%m/%d/%y")
end
