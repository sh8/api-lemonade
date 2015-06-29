class Restaurant < ActiveRecord::Base
  has_many :business_days
  has_many :average_prices

  def self.search(lat, lon)
    self.select("*", "abs(lat - #{lat}) + abs(lon - #{lon}) as dist").order("dist asc").all.first(6)
  end

  def self.near(lat, lon, start=0, limit=20, query="")
    if query.present?
      self.select("*", "abs(lat - #{lat}) + abs(lon - #{lon}) as dist").order("dist asc").all.where('name like ?', "%#{query}%").offset(start.to_i).first(limit.to_i)
    else
      self.select("*", "abs(lat - #{lat}) + abs(lon - #{lon}) as dist").order("dist asc").all.offset(start.to_i).first(limit.to_i)
    end
  end
end

