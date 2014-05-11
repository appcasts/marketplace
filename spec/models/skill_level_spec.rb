require 'spec_helper'

describe SkillLevel do
  it { should validate_uniqueness_of(:user_id).scoped_to(:skill_id) }
  it { should validate_presence_of(:level) }
  it { should ensure_inclusion_of(:level).in_range(1..10) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:skill) }

  it { should belong_to :user }
  it { should belong_to :skill }
end
