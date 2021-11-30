# app/views/api/v1/stories/index.json.jbuilder
json.toilets do
  json.array! @toilets do |toilet|
    json.extract! toilet, :id, :address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description, :user_id
  end
end
