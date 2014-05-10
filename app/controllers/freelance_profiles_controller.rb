class FreelanceProfilesController < ApplicationController
  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user)
  end
end
