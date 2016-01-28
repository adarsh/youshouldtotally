require "rails_helper"

RSpec.describe RecommendedItem do
  context ".newest_first" do
    it "returns newest items first" do
      older = create(:recommended_item)
      newer = create(:recommended_item)

      expect(RecommendedItem.newest_first).to eq [newer, older]
    end
  end
end
