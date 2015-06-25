class Post < ActiveRecord::Base
  mount_uploader :photo_url, ImageUploader
end
