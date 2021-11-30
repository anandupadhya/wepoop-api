# app/views/api/v1/toilets/show.json.jbuilder
json.extract! @toilet, :id, :address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description, :user_id
json.reviews @toilet.reviews do |review|
  json.extract! review, :id, :user_id, :toilet_id, :happy, :status, :comment
  json.date review.created_at.strftime("%m/%d/%y")
end
