class RecommendedItem < ActiveRecord::Base
  belongs_to :television_show
  belongs_to :user

  delegate :title, to: :television_show, prefix: true
  delegate :username, to: :user

  def self.newest_first
    order(created_at: :desc)
  end
end
