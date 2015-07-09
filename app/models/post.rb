class Post < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  belongs_to :user
  belongs_to :restaurant
end
