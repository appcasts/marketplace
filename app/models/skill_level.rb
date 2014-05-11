class SkillLevel < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  validates :user_id, uniqueness: { scope: :skill_id }
  validates :user, presence: true
  validates :skill, presence: true
  validates :level, presence: true, inclusion: 1..10
end
