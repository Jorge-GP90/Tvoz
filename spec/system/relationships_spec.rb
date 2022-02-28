require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  describe 'Follow function' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:teacher_user) { FactoryBot.create(:teacher_user) }
    before do
      sign_in(user)
    end
    context 'If student follow the teacher' do
      before do
        visit user_path(teacher_user.id)
        find('#follow').click  
      end
      
      it 'will change the follow button to unfollow' do
        expect(page).to have_button 'unfollow'
      end

      it 'will unfollow the user' do
        expect(page).to have_button 'follow'
      end
    end

    context 'Unfollow a teacher' do
      before do
      visit user_path(teacher_user.id)
      user.follow(teacher_user)
      visit user_path(teacher_user.id)
      find('#unfollow').click
      end
      it ' will unfollow the user and the button will change the follow' do
        expect(page).to have_button 'follow'
      end
    end

    context 'Connect teacher student' do
      before do
      teacher_user.follow(user)
      visit user_path(teacher_user.id)
      find('#follow').click
      end
      it ' will appears connect button ' do
        expect(page).to have_selector(:id, 'connect')
      end
    end

    context 'Connect function' do
      before do
      teacher_user.follow(user)
      user.follow(teacher_user)
      visit user_path(teacher_user.id)
      end
      it 'appears connect button ' do
        expect(page).to have_selector(:id, 'connect')
      end
    end


    context 'Unconnect teacher student' do
      before do
      teacher_user.follow(user)
      user.follow(teacher_user)
      visit user_path(teacher_user.id)
      find('#unfollow').click
      end
      it ' will disappear the connect  button ' do
        expect(page).to have_button 'follow'
      end
    end
  end
end