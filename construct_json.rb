require 'json'
require 'open-uri'

# toilets
puts "creating toilets..."

lat = 31.200
long = 121.425

all_toilets = []
toilet_ids = []

40.times do |x|
  40.times do |y|
    puts "searching for toilets... square kilometer #{x}, #{y}"
    url = "https://apis.map.qq.com/ws/place/v1/search?page_size=20&keyword=%E5%8E%95%E6%89%80&key=3SFBZ-Y6KKF-OQVJW-JN6UB-S24C6-5HBWQ&boundary=nearby(#{lat + (x.to_f / 1000)},#{long + (y.to_f / 1000)},1000,1)"
    raw_data = URI.open(url).read
    toilet_data = JSON.parse(raw_data)["data"]
    sleep 0.5

    next if toilet_data.nil?

    toilet_data.each do |toilet|
      next if toilet_ids.include?(toilet["id"])

      toilet_ids << toilet["id"]
      all_toilets << toilet
    end
  end
end

File.write('./tencent_toilets.json', JSON.dump(all_toilets))
