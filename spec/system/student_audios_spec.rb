require 'rails_helper'

RSpec.describe 'StudentAudios', type: :system do
  describe 'Task  function teacher' do
    let!(:teacher_user) { FactoryBot.create(:teacher_user) }
    let!(:user) { FactoryBot.create(:user) }
    before do
      sign_in(teacher_user)
      teacher_user.follow(user)
      user.follow(teacher_user)
      visit profile_user_path(teacher_user.id)
      find('.fa-plus').click
      fill_in 'task[title]', with: 'test'
      attach_file('task[audio]', 'spec/factories/audios/test_audio.m4a')
      attach_file('task[image]', 'spec/factories/images/test.jpeg')
      find('.btn-primary').click
      visit root_path
      find('#logout').click
      sign_in(user)
    end
    context 'access to a Tvoz home ' do
      before do
        visit profile_user_path(user.id)
        find('.fa-house').click  
      end

      it 'will display the task index screen' do
        expect(page).to have_content 'Tasks'
      end
    end

    context 'Audio upload screen' do
      before do
        visit profile_user_path(teacher_user.id)
        find('.fa-house').click
        find('#audio-tvoz').click
        find('.btn-light').click        
      end
      it 'will display New Student Audio screen' do
        expect(page).to have_content 'New Student Audio'
      end
    end

    context 'Student audio upload' do
      before do
        visit profile_user_path(teacher_user.id)
        find('.fa-house').click
        find('#audio-tvoz').click
        find('.btn-light').click
        attach_file('student_audio[audio_student]', 'spec/factories/audios/test_audio.m4a')
        find('.btn-primary').click
        
      end
      it 'will display New Student Audio screen' do
        expect(page).to have_content 'Student audio was successfully created.'
      end
    end
  end
end