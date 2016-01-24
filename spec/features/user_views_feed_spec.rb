require "rails_helper"

feature "A User views their feed" do
  scenario "and sees who made each recommendation" do
    user = create(:user)
    recommended_item = create(:recommended_item)
    recommending_user = recommended_item.user
    television_show = recommended_item.television_show
    user.follow(recommending_user)

    visit root_path(as: user)

    expect(page).to have_text(television_show.title)
    expect(page).to have_text(recommending_user.username)
  end

  scenario "and sees recommendations only from people they follow" do
    user = create(:user)
    followee = create(:user)
    follower = create(:user)
    followee_television_show = create(:television_show)
    follower_television_show = create(:television_show)
    followee.recommend(followee_television_show)
    follower.recommend(follower_television_show)
    user.follow(followee)

    visit root_path(as: user)

    expect(page).to have_text(followee_television_show.title)
    expect(page).not_to have_text(follower_television_show.title)
  end

  context "when user is not following anybody" do
    scenario "and sees some suggested people to follow" do
      user = create(:user)
      suggested_users = create_list(:user, 3)
      not_suggested_user = create(:user)

      visit root_path(as: user)

      expect(page).to have_text t("homes.show.not_following_anyone")
      suggested_users.each do |suggested_user|
        expect(page).to have_link(
          suggested_user.username,
          href: user_path(suggested_user),
        )
      end
      expect(page).not_to have_text not_suggested_user.username
      expect(page).not_to have_text user.username
    end
  end
end
