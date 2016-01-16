require "rails_helper"

RSpec.describe User do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password_digest) }

  context "uniqueness" do
    before { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
