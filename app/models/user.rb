class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :recommended_items
  has_many :television_shows, through: :recommended_items

  has_many :following_relationships,
    class_name: "Relationship", foreign_key: :follower_id
  has_many :following, through: :following_relationships, source: :followed

  def recommend(television_show)
    unless television_shows.include?(television_show)
      television_shows << television_show
    end
  end

  def follow(user)
    following << user
  end

  def unfollow(user)
    following_relationships.find_by(followed: user).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
