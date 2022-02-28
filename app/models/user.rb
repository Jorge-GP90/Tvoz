class User < ApplicationRecord
  has_one_attached :avatar 

  validates :name, presence: true, length: { maximum: 50 }
  has_many :tasks, dependent: :destroy
  has_many :student_audios, dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followed_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  require './app/roles/role'
  enum role: Role.options_for_enum
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com', 
                       name: 'Teacher guest',
                       role: 'teacher'
                       ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest.admin@example.com',
                      name: 'Guest Admin',
                      role: 'teacher',
                      admin: true
                      ) do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update(params, *options)
    clean_up_passwords
    result
  end


  def follow(user)
    follower.create!(followed_id: user.id)
  end

  def unfollow(user)
    follower.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    follower.find_by(followed_id: user.id)
  end

  def connected?(other)
    self.following?(other) && other.following?(self) 
  end
end
