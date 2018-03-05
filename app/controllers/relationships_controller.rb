class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def follow_profile
    @profile = Profile.find(params[:id])
    if current_user.profile.follow(@profile.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def unfollow_profile
    @profile = Profile.find(params[:id])
    if current_user.profile.unfollow (@profile.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end
end
