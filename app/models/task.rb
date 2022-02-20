class Task < ApplicationRecord  
  belongs_to :user
  has_one_attached :audio
  has_one_attached :audio_record
  has_one_attached :image
end
