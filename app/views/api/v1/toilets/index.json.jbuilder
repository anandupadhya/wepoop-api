# app/views/api/v1/toilets/index.json.jbuilder
json.toilets do
  json.array! @toilets do |toilet|
    json.extract! toilet, :id, :address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description, :distance
  end
end
