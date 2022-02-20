class StudentAudio < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_one_attached :audio_student
end
