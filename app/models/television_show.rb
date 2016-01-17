class TelevisionShow < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true

  has_many :recommendations, as: :recommendable
end
