class CreateSkillLevels < ActiveRecord::Migration
  def change
    create_table :skill_levels do |t|
      t.integer :level
      t.integer :user_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
