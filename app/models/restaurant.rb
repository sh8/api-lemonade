class Restaurant < ActiveRecord::Base
  has_many :business_days
  has_many :average_prices

  def self.search(lat, lon)
    self.select("*", "abs(lat - #{lat}) + abs(lon - #{lon}) as dist").order("dist asc").all.first(6)
  end

  def self.near(lat, lon, start=0, limit=20)
    self.select("*", "abs(lat - #{lat}) + abs(lon - #{lon}) as dist").order("dist asc").all.offset(start).first(limit)
  end

end
