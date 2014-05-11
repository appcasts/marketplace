require 'spec_helper'

describe "Freelance Profile" do
  describe "categories" do
    let!(:user) { create(:user, :logged_in) }
    let!(:category1) { create(:category) }
    let!(:category2) { create(:category) }
    let!(:category3) { create(:category) }

    it "can be changed" do
      visit edit_freelance_profile_path

      check_category(category1)
      click_button "Save"
      expect(user.reload.categories).to include(category1)

      check_category(category2)
      uncheck_category(category1)
      click_button "Save"
      expect(user.reload.categories).to include(category2)
    end
  end

  def check_category(category)
    page.check("user_category_ids_#{category.id}")
  end

  def uncheck_category(category)
    page.uncheck("user_category_ids_#{category.id}")
  end
end
