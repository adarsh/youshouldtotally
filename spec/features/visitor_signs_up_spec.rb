require "rails_helper"

feature "Visitor signs up" do
  scenario "successfully" do
    visit root_path

    click_on t("pages.landing.start_now")
    fill_form_and_submit :user,
      email: "ann_e_body@example.com",
      password: "password"

    expect(page).to be_signed_in
  end
end
