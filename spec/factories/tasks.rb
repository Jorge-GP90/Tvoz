FactoryBot.define do
  factory :task do
    title { 'title 1 ' }
    audio { '' }
    image { '' }
    association :user
  end  
  factory :task_audio do
    title { 'audio' }
    audio { './storage/test_audio.m4a' }
    image {  '' }
    association :user
  end    
end