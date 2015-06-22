require 'faraday'

CLIENT_ID = ENV['client_id']
CLIENT_SECRET = ENV['client_secret']

foursquare_api = "https://api.foursquare.com/v2/"

category_url = "venues/categories"

conn = Faraday.new(:url => foursquare_api) do |faraday|
  faraday.request  :url_encoded             # form-encode POST params
  # faraday.response :logger                  # log requests to STDOUT
  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
end

res = conn.get do |req|
  req.url category_url
  req.params['client_id'] = CLIENT_ID
  req.params['client_secret'] = CLIENT_SECRET
  req.params['v'] = "20150622"
  req.headers['Accept-Language'] = 'ja'
end

categories = JSON.parse(res.body)
categories['response']['categories'].each do |array|
  if array['id'] == "4d4b7105d754a06374d81259"
    array['categories'].each do |category|
      master_genre = MasterGenre.new
      master_genre.foursquare_id = category['id']
      master_genre.name = category['name']
      master_genre.save
      # デバッグ用の出力
      puts master_genre.attributes
      if category['categories'].present?
        category['categories'].each do |c|
          master_genre_child = MasterGenre.new
          master_genre_child.foursquare_id = c['id']
          master_genre_child.name = c['name']
          master_genre_child.save
          # デバッグ用の出力
          puts master_genre_child.attributes
        end
      end
    end
  end
end
