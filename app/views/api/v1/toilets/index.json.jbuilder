# app/views/api/v1/toilets/index.json.jbuilder

json.nearest do
  unless @toilets.empty?
    json.set! :happy, @nearest_happy_reviews
    json.set! :unhappy, @nearest_unhappy_reviews
    json.set! :isFavorite, @favorite_toilet_ids.include?(@toilets[0].id)
    json.extract! @toilets[0], :id, :address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description, :distance
    json.set! :width, 48
    json.set! :height, 48
    json.set! :iconPath, @favorite_toilet_ids.include?(@toilets[0].id) ? '/images/marker-favorite.png' : '/images/marker-normal.png'
    json.set! :callout, { content: '',
	                        fontSize: 16,
	                        borderRadius: 4,
	                        padding: 8 }
  end
end

json.toilets do
  i = 0
  json.array! @bounded_toilets do |bounded_toilet|
    json.set! :distance, @bounded_toilet_distances[i]
    json.set! :happy, @happy_reviews[i]
    json.set! :unhappy, @unhappy_reviews[i]
    json.set! :width, 48
    json.set! :height, 48
    json.set! :iconPath, @favorite_toilet_ids.include?(bounded_toilet.id) ? '/images/marker-favorite.png' : '/images/marker-normal.png'
    json.set! :callout, { content: '',
	                        fontSize: 16,
	                        borderRadius: 4,
	                        padding: 8 }
    i += 1
    json.extract! bounded_toilet, :id, :address, :latitude, :longitude, :accessibility, :changing_station, :directions, :male, :female, :approved, :description
  end
end
