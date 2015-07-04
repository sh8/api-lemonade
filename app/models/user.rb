class User < ActiveRecord::Base
  has_secure_password validations: false
  validates :password, presence: true, length: { minimum: 6 }, unless: :login_with_sns?
  has_many :user_sns_types

  def login_with_sns?
    self.uid.present?
  end

end
