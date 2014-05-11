class FreelanceProfilesController < ApplicationController
  def edit
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)
    redirect_to edit_freelance_profile_path
  end

  private

  def user_params
    params.require(:user).permit(category_ids: [])
  end
end
