module SkillHelper
  def skill_search(f)
    user = f.object
    skill_level = user.skill_levels.build
    id = skill_level.object_id

    fields = f.simple_fields_for(:skill_levels, skill_level, child_index: id) do |builder|
      render('skill_fields', s: builder)
    end

    text_field_tag("", "", class: "skill-level-search",
                           data: {id: id, fields: fields.gsub("\n", "")},
                           placeholder: "Search for a skill to add...")
  end
end
