require "rails_helper"

feature "A User follows another user" do
  scenario "and the current user sees that they follow the other user" do
    follower = create(:user)
    followed = create(:user)

    visit user_path(followed, as: follower)
    click_on t("users.show.follow")

    expect(page).to have_button_with_text(t("users.show.unfollow"))
  end

  scenario "and then unfollows the followed user" do
    follower = create(:user)
    followed = create(:user)

    visit user_path(followed, as: follower)
    click_on t("users.show.follow")
    click_on t("users.show.unfollow")

    expect(page).to have_button_with_text(t("users.show.follow"))
  end
end
