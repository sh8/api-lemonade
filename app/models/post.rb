class Post < ActiveRecord::Base
  mount_uploader :photo, ImageUploader
  belongs_to :user
  belongs_to :restaurant
  has_many :favorites

  def is_favorite(user)
    self.favorites.where('user_id = ?', user.id).first.present?
  end

end
