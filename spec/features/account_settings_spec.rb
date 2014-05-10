require "spec_helper"

describe "account settings" do
  let(:user) { create(:user, :logged_in) }

  before do
    visit edit_user_registration_path(user)
  end

  it "allows me to update my email" do
    fill_in "Email", with: "ryan@appcasts.io"
    fill_in "Current password", with: user.password
    click_button "Update"

    expect(page).to have_content "updated your account successfully"
    expect(user.reload.email).to eq "ryan@appcasts.io"
  end

  it "requires current password" do
    fill_in "Email", with: "ryan@appcasts.io"
    click_button "Update"

    expect(page).to have_content "can't be blank"
  end

  it "allows password update" do
    fill_in "Password", with: "new password", match: :prefer_exact
    fill_in "Password confirmation", with: "new password"
    fill_in "Current password", with: user.password
    click_button "Update"

    expect(page).to have_content "updated your account successfully"
  end

  it "allows account to be canceled" do
    click_link "Cancel your account"
    expect(page).to have_content "was successfully cancelled"
    expect(User.count).to eq(0)
  end
end
