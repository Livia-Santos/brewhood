class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    if params[:search]
      @profiles = Profile.search(params[:search]).order("created_at DESC")
    else
      @profiles = Profile.all.order("created_at DESC")
    end
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
    @profile = current_user.profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    current_user.destroy
    respond_to do |format|
      format.html { redirect_to beers_path, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
    sign_out current_user
  end

  def my_profile
    @profile = current_user.profile
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:user_id, :avatar, :first_name, :last_name, :birth, :description, :address, :city, :state, :country_code, :brewing_since, :facebook, :twitter, :instagram)
    end
end
