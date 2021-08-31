class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_friends, class_name:  "Friend",
            foreign_key: "follower_id",
            dependent:   :destroy
  has_many :passive_friends, class_name:  "Friend",
  foreign_key: "followed_id",
  dependent:   :destroy

  has_many :following, through: :active_friends, source: :followed
  has_many :followers, through: :passive_friends, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_friends.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  validates :name, presence: true
end
