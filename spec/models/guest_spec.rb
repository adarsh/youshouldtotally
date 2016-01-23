require "spec_helper"
require_relative "../../app/models/guest"

RSpec.describe Guest do
  context "#following?" do
    it "returns false" do
      guest = Guest.new

      expect(guest.following?("someone")).to eq false
    end
  end
end
