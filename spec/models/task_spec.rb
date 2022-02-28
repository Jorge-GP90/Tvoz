require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Task Validation' do
    context 'Task with empty title' do
      it 'Validation title does not exist' do
        empty_title = FactoryBot.build(:task, title: nil)
        expect(empty_title).not_to be_valid
      end
    end
    context 'Task with title' do
      it 'Validation pass' do
        task_title = FactoryBot.build(:task, title: 'I have a title')
        expect(task_title).to be_valid
      end
    end
  end

  describe "Upload files" do
    context "No image attached " do    
      it "No image is attached" do   
        @task= FactoryBot.build(:task, title: 'Testing', image: nil, audio: nil)     
        expect(@task.image).not_to be_attached
      end
    end

    context "image attached " do  
      it "Has one image attached" do
        @task= FactoryBot.build(:task)
        @task.image.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpeg')),
          filename: 'test.jpeg',
          content_type: 'image/jpeg'
        )         
        expect(@task.image).to be_attached
      end
    end

    context "No audio attached " do    
      it "No audio is attached" do
        @task= FactoryBot.build(:task, title: 'Testing', audio: nil)    
        expect(@task.audio).not_to be_attached
      end
    end

    context "No audio attached " do    
      it "No audio is attached" do
        @task= FactoryBot.build(:task)
        @task.audio.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'audios', 'test_audio.m4a')),
          filename: 'test_audio.m4a',
          content_type: 'audio/m4a'
        )    
        expect(@task.audio).to be_attached
      end
    end  
  end
end