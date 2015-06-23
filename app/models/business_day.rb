class BusinessDay < ActiveRecord::Base
  has_many :business_hours
end
