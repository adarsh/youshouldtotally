require "rails_helper"

feature "Visitor signs in" do
  scenario "successfully" do
    user = create(:user)
    visit root_path

    click_on t("application.header.sign_in")
    fill_form(:user, email: user.email, password: "password")
    find("#container").click_on submit(:session)

    expect(page).to be_signed_in
  end
end
