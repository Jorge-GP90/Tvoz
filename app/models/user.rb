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
