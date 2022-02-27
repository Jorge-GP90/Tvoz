require 'rails_helper'

RSpec.describe StudentAudio, type: :model do
  describe "Upload files" do
    context "No audio attached " do    
      it "No audio is attached" do        
        @student= FactoryBot.build(:student_audio, audio_student: nil )    
        expect(@student.audio_student).not_to be_attached
      end
    end
  
    context " audio attached " do    
      it "audio is attached" do        
        @student= FactoryBot.build(:student_audio)
        @student.audio_student.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'audios', 'test_audio.m4a')),
          filename: 'test_audio.m4a',
          content_type: 'audio/m4a'
        )    
        expect(@student.audio_student).to be_attached
      end
    end
  end  
end
