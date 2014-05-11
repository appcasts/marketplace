# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["Web Developer", "Designer", "SEO Expert",
 "Writer", "Mobile Developer", "Virtual Assistant"].each do |name|
  Category.create(name: name)
end

File.open("lib/skills.json", "r") do |f|
  skill_data = JSON.load(f)

  skill_data["skills"].each do |skill|
    Skill.create(name: skill)
  end
end

