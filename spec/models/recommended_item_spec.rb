require "rails_helper"

RSpec.describe RecommendedItem do
  it { is_expected.to belong_to(:television_show) }
  it { is_expected.to belong_to(:user) }
end
