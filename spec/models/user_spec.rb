require "rails_helper"

RSpec.describe User do
  context "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_presence_of(:username) }

    context "uniqueness" do
      before { create(:user) }

      it { is_expected.to validate_uniqueness_of(:email) }
      it { is_expected.to validate_uniqueness_of(:username) }
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

    context "when the user already recommended it" do
      it "returns falsy" do
        television_show = create(:television_show)
        user = create(:user)

        user.recommend(television_show)
        result = user.recommend(television_show)

        expect(result).to be_falsy
      end
    end
  end
end
