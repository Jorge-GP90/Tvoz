FactoryBot.define do
  factory :student_audio do
    audio_student { nil }
    # user { nil }
    # task { nil }
    association :user
    association :task
  end
  factory :student_audio2 do
    audio_student { nil }
    association :user
    association :task
  end 
  factory :student_audio3 do
    audio_student { File.open(Rails.root.join('spec', 'factories', 'audios', 'test_audio.m4a'))}
    association :user
    association :task
  end 
end
