class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def follow_profile
    @profile = Profile.find(params[:id])
    current_user.profile.follow(@profile.id)
    redirect_to profile_path
  end

  def unfollow_profile
    @profile = Profile.find(params[:id])
    current_user.profile.unfollow(@profile.id)
    redirect_to profile_path
  end
end
