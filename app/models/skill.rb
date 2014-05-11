class Skill < ActiveRecord::Base
  has_many :skill_levels
  has_many :users, through: :skill_levels

  validates :name, presence: true, uniqueness: true
end
