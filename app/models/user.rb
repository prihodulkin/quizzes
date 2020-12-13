class User < ApplicationRecord
  validates :phone, presence: true, uniqueness: {case_sensitive: true}
  has_secure_password
  has_many :questions
  has_many :passed_questions
  


  
  mount_uploader  :avatar, UserAvatarUploader
  mount_base64_uploader  :avatar, UserAvatarUploader

  def self.from_token_request(request)
    phone = request.params&.[]('auth')&.[]('phone')
    find_by phone: phone
  end



end