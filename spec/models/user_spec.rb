require "rails_helper"

RSpec.describe User do
  context "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }

    context "uniqueness" do
      before { create(:user) }

      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end

  context "associations" do
    it { is_expected.to have_many(:recommended_items) }
    it { is_expected.to have_many(:television_shows) }
  end

  context "#recommend" do
    it "adds a television show to a user's recommendations" do
      television_show = create(:television_show)
      user = create(:user)

      user.recommend(television_show)

      user.reload
      expect(user.television_shows).to eq [television_show]
    end
  end
end
