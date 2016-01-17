require "rails_helper"

feature "A Visitor views a profile" do
  scenario "and sees recommendations" do
    recommended_item = create(:recommended_item)
    recommending_user = recommended_item.user
    television_show = recommended_item.television_show

    visit user_path(recommending_user)

    expect(page).to have_text(television_show.title)
  end
end
