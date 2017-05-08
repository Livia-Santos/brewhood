class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resources)
    profile = Profile.find_by_user_id(current_user.id)
     if profile.nil?
       "/profiles/new"
     else
       @profile = Profile.find_by_user_id(current_user.id)
       "/beers"
     end
   end

end
