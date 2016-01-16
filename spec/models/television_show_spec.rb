require "rails_helper"

RSpec.describe TelevisionShow do
  it { is_expected.to validate_presence_of(:title) }

  context "uniqueness" do
    before { create(:television_show) }

    it { is_expected.to validate_uniqueness_of(:title) }
  end
end
