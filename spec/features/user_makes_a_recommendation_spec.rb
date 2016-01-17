require "rails_helper"

feature "A User makes a recommendation" do
  scenario "and sees it on their profile" do
    user = create(:user)
    sign_in(user)
    title = "Breaking Bad"

    visit root_path
    fill_form_and_submit :television_show, title: title
    click_on t("layouts.application.my_profile")

    expect(page).to have_text(title)
  end
end
