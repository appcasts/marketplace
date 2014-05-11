require 'spec_helper'

describe User do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }

  it { should have_and_belong_to_many :categories }
  it { should have_many :skills }
  it { should have_many :skill_levels }
end
