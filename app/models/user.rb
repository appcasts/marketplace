class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :categories
  has_many :skill_levels
  has_many :skills, through: :skill_levels

  accepts_nested_attributes_for :skill_levels, allow_destroy: true

  enum role: [:user, :vip, :admin]

  validates :name, presence: true

  after_initialize :set_default_role, :if => :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
