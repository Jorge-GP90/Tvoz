# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |n|
    name = Faker::Games::SuperMario.character
    email = Faker::Internet.email
    password = 'password'
    # avatar = File.open("#{Rails.root}/public/images/default_student.png")
    role = 'student'
    User.create!(name: name,
                 email: email,
                 password: password,
                #  avatar: avatar,
                 role: role)
end

5.times do |n|
    name = Faker::JapaneseMedia::DragonBall.character
    email = Faker::Internet.email
    password = 'password'
    # avatar = File.open("#{Rails.root}/public/images/default_avatar.png")
    role = 'teacher'
    title = 'ABC...'
    # image = File.open(Rails.root.join('public/images/A.jpeg') )
    # audio = File.open(Rails.root.join('public/audio/A.m4a'))
    userid = "#{16+n}"

    User.create!(name: name,
                 email: email,
                 password: password,
                #  avatar: avatar,
                 role: role)
    
    Task.create!(title: title,
                #  image: image,
                #  audio: audio, 
                 user_id: userid
                 )
    
    
end

User.create!(name: 'admin_user',
               email: 'admin@mail.com',
               password: 'password',
            #    avatar: File.open("#{Rails.root}/public/images/admin_default.png"),
               role: 'teacher',
               admin: true)
