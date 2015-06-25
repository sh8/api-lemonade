require 'faraday'
require 'csv'
require 'logger'

log = Logger.new("#{Rails.root}/script/api/script.log")

CLIENT_ID = ENV['client_id']
CLIENT_SECRET = ENV['client_secret']

foursquare_api = "https://api.foursquare.com/v2/"

search_url = "venues/search"

conn = Faraday.new(:url => foursquare_api) do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  # faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

TOKYO = "13"
master_genres = MasterGenre.all
CSV.foreach("#{Rails.root}/script/api/station_data.csv", "r") do |row|
  num = $.
  puts num
  log.info(num)
  if num < 5487
    next
  end
  if row[6] == TOKYO
    puts row[2]
    log.info("station name is #{row[2]}")
    master_genres.each do |m_g|
      res = conn.get do |req|
        req.url search_url
        req.params['client_id'] = CLIENT_ID
        req.params['client_secret'] = CLIENT_SECRET
        req.params['v'] = "20150622"
        req.params['ll'] = "#{row[10]},#{row[9]}"
        req.params['categoryId'] = m_g.foursquare_id
        req.params['limit'] = "50"
        req.params['radius'] = '30000'
        req.headers['Accept-Language'] = 'ja'
      end

      begin
        restaurants = JSON.parse(res.body)
      rescue => e
        log.warn(e.message)
        next
      end

      if restaurants['response']['venues'].nil?
        next
      end
      puts "ok" if restaurants['response']['venues'].present?
      restaurants["response"]["venues"].each do |r|
        if Restaurant.where('foursquare_id = ?', r['id']).last.present?
          puts "skip"
        else
          restaurant = Restaurant.new
          restaurant.foursquare_id = r['id']
          restaurant.name = r['name'].force_encoding('utf-8')
          restaurant.tel = r['contact']['formattedPhone']
          restaurant.lat = r['location']['lat']
          restaurant.lon = r['location']['lng']
          restaurant.address = r['location']['address']
          restaurant.country = r['location']['country']
          restaurant.state = r['location']['state']
          restaurant.city = r['location']['city']
          restaurant.cc = r['location']['cc']

          unless restaurant.master_genre_id = MasterGenre.where('foursquare_id = ?', r['categories'][0]['id']).last.try(:id)
            restaurant.master_genre_id = 0
          end

          begin
            restaurant.save!
            puts restaurant.attributes
            log.info(restaurant.attributes)
          rescue => e
            puts e.message
            log.warn(e.message)
          end
          puts restaurant.attributes
        end
      end
    end
  end
end
