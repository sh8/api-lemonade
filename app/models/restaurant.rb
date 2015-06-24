class Restaurant < ActiveRecord::Base
  has_many :business_days
  has_many :average_prices

  def self.search(lat, lon, limit=6, offset=0)
    self.select("*", "abs(lat - #{lat}) + abs(lon - #{lon}) as dist").order("dist asc").all.offset(offset).first(limit)
  end

end
