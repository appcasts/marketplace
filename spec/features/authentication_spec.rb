require "spec_helper"

describe "authentication" do
  let(:password) { Faker::Internet.password(8) }
  let!(:user) { create(:user, password: password) }

  before do
    visit root_path
    click_link "Login"
  end

  it "allows user to sign in" do
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Sign in"
    expect(page).to have_content "Signed in successfully"
  end

  it "displays errors with invalid sign in" do
    fill_in "Email", with: user.email
    fill_in "Password", with: "obviously wrong"
    click_button "Sign in"
    expect(page).to have_content "Invalid email or password"
  end
end
