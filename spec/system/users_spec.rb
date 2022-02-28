require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user){ FactoryBot.build(:user)}
  let!(:teacher_user){ FactoryBot.build(:teacher_user)}
  let!(:admin_user){ FactoryBot.build(:admin_user)}
  describe 'Student user test registration' do
    context 'if you create a new student user' do
      before do
        visit new_user_registration_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        page.find("#user_role").find("option[value='student']").select_option
        find('.actions').click
      end
      it 'will create a new student user' do
        expect(page).to have_content  "student_user"
      end
    end

    context 'Users that are not login  can not access' do
      before do
        visit root_path
      end
      it 'The login screen  will be display' do
        expect(page).to have_content 'Login'
      end
    end
  end

  describe 'Teacher User Test registration' do
    context 'if you create a new student user' do
      before do
        visit new_user_registration_path
        fill_in 'user[name]', with: teacher_user.name
        fill_in 'user[email]', with: teacher_user.email
        fill_in 'user[password]', with: teacher_user.password
        fill_in 'user[password_confirmation]', with: teacher_user.password_confirmation
        page.find("#user_role").find("option[value='teacher']").select_option
        find('.actions').click
      end
      it 'will create a new teacher user' do
        expect(page).to have_content "teacher_user"
      end
    end
      
    context 'teacher users that are not login  can not access' do
      before do
        visit root_path
      end
      it 'The login screen  will be display' do
        expect(page).to have_content 'Login'
      end
    end
  end

  describe 'Sessions function test' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('#login').click
    end
    context 'After login' do
      it 'will display the user profile' do
        expect(page).to have_content "general_user@test.com"
      end
      it ' will Log out (Session finish)' do
        find('#logout').click
        expect(page).to have_content "Signed out successfully."
      end
      it 'do not allow if you are not loggin in first' do
        find('#logout').click
        visit tasks_path
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end
  end

  describe 'Admin fucntion' do
    let!(:admin_user) { FactoryBot.create(:admin_user) }
    context 'admin user access' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: admin_user.email
        fill_in 'user[password]', with: admin_user.password
        find('#login').click
      end

      it 'admin user display' do
        expect(page).to have_content "admin_test"
      end

      it 'will be display the admin screen' do
        find('#admin_screen').click
        expect(page).to have_content "Site Administration"
      end

      it ' will Log out (Session finish)' do
        visit root_path
        find('#logout').click
        expect(page).to have_content "Signed out successfully."
      end
    end
  end

  describe 'Guest function' do
    context 'guest teacher user access' do
      before do
        visit new_user_session_path
        find('#guest').click
      end

      it 'display guest user' do
        expect(page).to have_content "Teacher guest"
      end

      it ' will Log out (Session finish)' do
        visit root_path
        find('#logout').click
        expect(page).to have_content "Signed out successfully."
      end
    end
  end
  
  describe 'Guest Admin fucntion' do
    context 'guest teacher user access' do
      before do
        visit new_user_session_path
        find('#admin_guest').click
      end

      it 'display guest admin user' do
        expect(page).to have_content "guest.admin@example.com"
      end

      it 'will be display the admin screen' do
        find('#admin_screen').click
        expect(page).to have_content "Site Administration"
      end

      it ' will Log out (Session finish)' do
        visit root_path
        find('#logout').click
        expect(page).to have_content "Signed out successfully."
      end
    end
  end
end