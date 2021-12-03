# app/views/api/v1/toilets/index.json.jbuilder
json.nearest do
  json.extract! @toilets[0], :id, :address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description, :distance
end

json.toilets do
  json.array! @bounded_toilets do |bounded_toilet|
    json.extract! bounded_toilet, :id, :address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description
  end
end
