require "rails_helper"

feature "A User makes a recommendation" do
  scenario "and sees it on their profile" do
    title = "Breaking Bad"
    user = create(:user)

    visit root_path(as: user)
    fill_form_and_submit :television_show, title: title
    click_on t("application.header.my_profile")

    expect(page).to have_text(title)
  end

  scenario "and cannot recommend the same show twice" do
    title = "Breaking Bad"
    user = create(:user)

    visit root_path(as: user)
    2.times do
      fill_form_and_submit :television_show, title: title
    end

    expect(page).to have_text t("television_shows.create.cannot_recommend_twice")
  end

  scenario "and can recommend a show that someone else recommended" do
    title = "Breaking Bad"
    television_show = create(:television_show, title: title)
    user = create(:user)
    user.recommend(television_show)
    other_user = create(:user)

    visit root_path(as: other_user)
    fill_form_and_submit :television_show, title: title

    expect(page).to have_text title
  end
end
