class Restaurant < ActiveRecord::Base
  has_many :business_days
  has_many :average_prices
end
