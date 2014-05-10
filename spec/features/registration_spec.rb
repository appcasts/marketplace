require "spec_helper"

describe "registration" do
  before do
    visit root_path
    click_link "Sign up"
  end

  it "allows a user to register" do
    fill_in "Email", with: "ryan@appcasts.io"
    fill_in "Name", with: "Ryan Boland"
    fill_in "Password", with: "a great PW", match: :prefer_exact
    fill_in "Password confirmation", with: "a great PW"

    click_button "Sign up"
    expect(page).to have_content "You have signed up successfully"
  end

  it "shows error messages if invalid input" do
    fill_in "Email", with: "ryan@appcasts.io"
    fill_in "Password", with: "a great PW", match: :prefer_exact
    fill_in "Password confirmation", with: "not matching"

    click_button "Sign up"
    expect(page).to have_content "doesn't match Password"
    expect(page).to have_content "can't be blank"
  end
end
