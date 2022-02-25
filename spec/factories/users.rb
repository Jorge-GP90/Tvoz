FactoryBot.define do
  factory :user, class: User do
    name { 'user01' }
    email { 'user01@mail.com' }
    password { 'password' }
    role { 'teacher' }
    admin { false }
  end
  factory :user02, class: User do
    name { 'user02' }
    email { 'user02@mail.com' }
    password { 'password' }
    role { 'student' }
    admin { false }
  end
  factory :user03, class: User do
    name { 'user03' }
    email { 'user03@mail.com' }
    password { 'password' }
    role { 'teacher' }
    admin { false }
  end
  factory :admin_user, class: User do
    name { 'admin' }
    email { 'admin@mail.com' }
    password { 'password' }
    role { 'teacher' }
    admin { true }
  end

end