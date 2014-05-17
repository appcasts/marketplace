class FreelanceProfilesController < ApplicationController
  def edit
    @user = current_user
    @skill_levels = @user.skill_levels.includes(:skill).order("created_at DESC")
  end

  def update
    @user = current_user
    @user.assign_attributes(user_params)
    remove_duplicate_skills
    @user.save
    redirect_to edit_freelance_profile_path
  end

  private

  def user_params
    params.require(:user)
          .permit category_ids: [],
                  skill_levels_attributes: [:skill_id, :_destroy, :level, :id]
  end

  def remove_duplicate_skills
    @user.skill_levels.each do |sl|
      next if sl.persisted?
      other_skill_levels = @user.skill_levels.to_a - [sl]
      @user.skill_levels.delete(sl) if other_skill_levels.map(&:skill_id)
                                                         .include?(sl.skill_id)
    end
  end
end
