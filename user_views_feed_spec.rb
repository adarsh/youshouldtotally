require "rails_helper"

feature "A User views their feed" do
  scenario "and sees who made each recommendation" do
    user = create(:user)
    recommended_item = create(:recommended_item)
    recommending_user = recommended_item.user
    television_show = recommended_item.television_show

    sign_in(user)
    visit root_path

    expect(page).to have_text(television_show.title)
    expect(page).to have_text(recommending_user.username)
  end
end
