class SkillsController < ApplicationController
  def index
    skills = Skill.where("name LIKE ?", "%#{params["term"]}%")
                  .where.not(id: current_user.skill_ids)

    skill_data = skills.map do |skill|
      { name: skill.name, label: skill.name, id: skill.id }
    end

    render json: skill_data
  end
end
