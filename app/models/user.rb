class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :username, presence: true, uniqueness: true

  has_many :recommended_items
  has_many :television_shows, through: :recommended_items

  def recommend(television_show)
    television_shows << television_show
  end
end
