class Post < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
end
