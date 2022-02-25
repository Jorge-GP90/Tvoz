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
  factory :task_image do
    title { 'Image' }
    audio { '' }
    after(:build) do |attached|
      attached.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test2.jpg')), filename: 'test2.jpg', content_type: 'image/jpg')
    end
    # image { './storage/test2.jpg' }
    association :user
  end
  
end