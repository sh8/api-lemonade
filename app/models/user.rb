class User < ActiveRecord::Base
  has_secure_password validations: false
  validates :password, presence: true, length: { minimum: 6 }, if: :sign_up_with_form?
  has_many :user_sns_types

  def sign_up_with_form?
    self.uid.nil?
  end

end
