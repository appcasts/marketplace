require 'spec_helper'

describe "Freelance Profile" do
  let!(:user) { create(:user, :logged_in) }

  describe "categories" do
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

    def check_category(category)
      page.check("user_category_ids_#{category.id}")
    end

    def uncheck_category(category)
      page.uncheck("user_category_ids_#{category.id}")
    end
  end

  describe "skills" do
    let!(:ruby) { Skill.create(name: "ruby") }
    let!(:rails) { Skill.create(name: "ruby-on-rails") }
    let!(:java) { Skill.create(name: "java") }

    before do
      visit edit_freelance_profile_path
    end

    it "autocompletes", js: true do
      find(".skill-level-search").set("rub")
      expect(page).to have_content "ruby"
      expect(page).to have_content "ruby-on-rails"
      expect(page).to_not have_content "java"
    end

    it "adds skills", js: true do
      find(".skill-level-search").set("rub")
      expect(page).to have_content "ruby-on-rails"
      find("a", text: "ruby-on-rails").click
      page.execute_script("$('.range-slider input').val(10)")
      click_button "Save Categories & Skills"

      expect(page).to have_text "ruby-on-rails"
      expect(page).to have_content("10")
      expect(user.skills).to include(rails)
    end

    it "allows skills to be removed", js: true do
      user.skill_levels.create(level: 2, skill: java)
      visit edit_freelance_profile_path
      expect(page).to have_content "2"

      find(".remove-button").click
      click_button "Save Categories & Skills"
      expect(page).to_not have_content "2"

      expect(user.skills).to be_empty
    end

    it "doesn't allow duplicate skills", js: true do
      find(".skill-level-search").set("rub")
      find("a", text: "ruby-on-rails").click
      find(".skill-level-search").set("rub")
      find("a", text: "ruby-on-rails").click
      page.execute_script("$('.range-slider input').val(10)")

      click_button "Save Categories & Skills"
      expect(page).to have_content "ruby-on-rails"
      expect(user.skills.count).to eq 1
    end
  end
end
