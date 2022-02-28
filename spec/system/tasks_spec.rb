require 'rails_helper'

RSpec.describe 'Tasks', type: :system do
  describe 'Task  function teacher' do
    let!(:teacher_user) { FactoryBot.create(:teacher_user) }
    let!(:user) { FactoryBot.create(:user) }
    before do
      sign_in(teacher_user)
      teacher_user.follow(user)
      user.follow(teacher_user)
    end
    context 'Teachers new task screen' do
      before do
        visit profile_user_path(teacher_user.id)
        find('.fa-plus').click
      end
      it 'will display new task screen' do      
        expect(page).to have_content 'New Task'
      end
    end
    context 'Teachers new task create (only title)' do
      before do
        visit profile_user_path(teacher_user.id)
        find('.fa-plus').click
        fill_in 'task[title]', with: 'test'
        find('.btn-primary').click
      end
      it 'create a task only with a title' do
        expect(page).to have_content 'test'
      end
    end
    context 'Teachers tasks screen from header' do
      before do
        visit profile_user_path(teacher_user.id)
        find('.fa-house').click  
      end
      it 'will display the task index screen' do
        expect(page).to have_content 'Tasks'
      end
    end
    # context 'Teachers new task create with audio and image' do
    #   before do
    #     visit profile_user_path(teacher_user.id)
    #     find('.fa-plus').click
    #     @task= FactoryBot.build(:task)
    #     @task.image.attach(
    #       io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpeg')),
    #       filename: 'test.jpeg',
    #       content_type: 'image/jpeg'
    #     )
    #   end
    #   it 'create a task only with a title' do
    #     expect(page).to have_content 'title 1'
    #   end
    # end
  end
end

# attach_file 'プロフィール画像', "#{Rails.root}/spec/factories/images/test.jpg"