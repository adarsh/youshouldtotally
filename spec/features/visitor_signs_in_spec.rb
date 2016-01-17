require "rails_helper"

feature "Visitor signs in" do
  scenario "successfully" do
    user = create(:user)
    visit root_path

    click_on t("layouts.application.sign_in")
    fill_form(:user, email: user.email, password: "password")
    find("#content").click_on submit(:session)

    expect(page).to be_signed_in
  end
end
