FactoryBot.define do
  factory :user, class: User do
    name { "student_user" }
    email { "general_user@test.com" }
    password { "11111111" }
    password_confirmation { "11111111" }
    role { 'student' }
    admin { false }
  end
  
  factory :teacher_user, class: User do
    name { 'teacher_user7' }
    email { 'teacher_user@test.com' }
    password { '11111111' }
    password_confirmation { '11111111' }
    role { 'teacher' }
    admin { false }
  end

  factory :admin_user, class: User do
    name { 'admin_test' }
    email { 'admin_test@test.com' }
    password { 'password' }
    password_confirmation { 'password' }
    role { 'teacher' }
    admin { true }
  end

end