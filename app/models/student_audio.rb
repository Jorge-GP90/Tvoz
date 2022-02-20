class StudentAudio < ApplicationRecord
  belongs_to :user
  belongs_to :task
end
