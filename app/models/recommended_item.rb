class RecommendedItem < ActiveRecord::Base
  belongs_to :television_show
  belongs_to :user
end
