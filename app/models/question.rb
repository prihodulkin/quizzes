class Question < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :test_answers

  mount_uploader  :picture, QuestionPictureUploader
  mount_base64_uploader :picture, QuestionPictureUploader
end