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
    context 'Teachers new task screen from header' do
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
    context 'Teachers tasks screen from Tvoz home' do
      before do
        visit profile_user_path(teacher_user.id)
        find('.fa-house').click  
      end
      it 'will display the task index screen' do
        expect(page).to have_content 'Tasks'
      end
    end

  
    context 'Teachers new task create with audio and image' do
      before do
        visit profile_user_path(teacher_user.id)
        find('.fa-plus').click
        fill_in 'task[title]', with: 'test'
        attach_file('task[audio]', 'spec/factories/audios/test_audio.m4a')
        attach_file('task[image]', 'spec/factories/images/test.jpeg')
        find('.btn-primary').click
      end
    
      it 'create a task  attached' do
        expect(page).to have_content 'test'
      end
    
      it 'created task succesfully ' do
        expect(page).to have_content 'Task was successfully created.'
      end
    end
  end
end

# attach_file 'プロフィール画像', "#{Rails.root}/spec/factories/images/test.jpg"



# @task = FactoryBot.build(:task)

# @task.audio.attach(
#   io: File.open(Rails.root.join('spec', 'factories', 'audios', 'test_audio.m4a')),
#   filename: 'test_audio.m4a',
#   content_type: 'audio/m4a'
# ) 
# @task.image.attach(
#   io: File.open(Rails.root.join('spec', 'factories', 'images', 'test.jpeg')),
#   filename: 'test.jpeg',
#   content_type: 'image/jpeg'

# expect(task.image).to be_attached
        # expect(attach_file('test.jpeg', 'spec/factories/images/test.jpeg')).to be 
        # expect(task.image.attach_file('test.jpeg', 'spec/factories/images/test.jpeg')).to be_attached
# )

# expect(page.attach_file).no_to be_nil


   #   it 'create a task with image attached' do
    #     expect(page).to have_content 'test'
    #     expect(task.attach_file('test.jpeg', 'spec/factories/images/test.jpeg').not_to be _nil
    #     expect(task.attach_file('test_audio.m4a', 'spec/factories/audios/test_audio.m4a').not_to be _nil
    #   end

    # expect(task.audio.attach_file('test_audio.m4a', 'spec/factories/audios/test_audio.m4a')).to be_attached