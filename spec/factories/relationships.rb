FactoryBot.define do
  factory :relationship do
    follower_id    { FactoryBot.create(:user).id }
    followed_id    { FactoryBot.create(:teacher_user).id }
    follower_id    { FactoryBot.create(:teacher_user).id }
    followed_id    { FactoryBot.create(:user).id }
    follower_id    { FactoryBot.create(:admin_user).id }
    followed_id    { FactoryBot.create(:teacher_user).id }
    follower_id    { FactoryBot.create(:teacher_user).id }
    followed_id    { FactoryBot.create(:admin_user).id }
  end
end