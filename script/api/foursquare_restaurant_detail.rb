require 'faraday'
require 'logger'

log = Logger.new("#{Rails.root}/script/api/restaurants_info.log")

CLIENT_ID = ENV['client_id']
CLIENT_SECRET = ENV['client_secret']

foursquare_api = "https://api.foursquare.com/v2/"


conn = Faraday.new(:url => foursquare_api) do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  # faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

restaurants = Restaurant.all

restaurants.each do |r|

  if r.business_days.present?
    next
  end

  log.info("restarant_name is #{r.name}")
  log.info("restaurant_id is #{r.id}")
  puts("restaurant_id is #{r.id}")

  if r.id < 33744
    next
  end

  venue_url = "venues/#{r.foursquare_id}"

  res = conn.get do |req|
    req.url venue_url
    req.params['client_id'] = CLIENT_ID
    req.params['client_secret'] = CLIENT_SECRET
    req.params['v'] = "20150622"
    req.headers['Accept-Language'] = 'ja'
  end

  begin
    restaurant = JSON.parse(res.body)
  rescue => e
    log.error(e)
  end

  restaurant_info = restaurant['response']['venue']

  if restaurant_info.nil?
    next
  end

  days = {"日" => 0, "月" => 1, "火" => 2, "水" => 3, "木" => 4, "金" => 5, "土" => 6 }
  if restaurant_info['popular'].present?
    restaurant_info['popular']['timeframes'].each do |t_f|
      business_day = r.business_days.build
      business_day.day = days[t_f['days']].to_i
      business_day.save
      puts business_day.attributes
      log.info(business_day.attributes)

      if t_f['open'].present?
        t_f['open'].each do |open|
          open_time = open['renderedTime']
          if open_time.nil?
            next
          end
          open_array = open_time.split("–")
          puts open_array
          business_hour = business_day.business_hours.build
          if open_array[0].present?
            business_hour.start = open_array[0]
          else
            business_hour.start = "00:00"
          end
          if open_array[1].present?
            business_hour.end = open_array[1]
          else
            business_hour.end = "24:00"
          end
          business_hour.save
          puts business_hour.attributes
          log.info(business_hour.attributes)
        end
      end
    end
  end

  restaurant_info['attributes']['groups'].each do |g|
    if g['type'] == "price"
      average_price = r.average_prices.build
      average_price.price = g['summary'].count('¥') * 1000
      average_price.master_meal_time_id = 0
      average_price.save
      puts average_price.attributes
      log.info(average_price.attributes)
    end
  end
end
