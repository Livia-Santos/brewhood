class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @beers = Beer.all.order("created_at DESC")
  end

  def show
    @comments = Comment.where(beer_id: @beer)
    @profile =  @beer.profile


  end

  def new
    @beer = current_user.beers.build
  end

  def edit
  end

  def create
    @beer = current_user.beers.build(beer_params)

    respond_to do |format|
      if @beer.save
        format.html { redirect_to @beer, notice: 'Beer was successfully created.' }
        format.json { render :show, status: :created, location: @beer }
      else
        format.html { render :new }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { render :show, status: :ok, location: @beer }
      else
        format.html { render :edit }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url, notice: 'Beer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @beer.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @beer.downvote_by current_user
    redirect_to :back
  end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    def beer_params
      params.require(:beer).permit(:name, :image, :beer_type, :description, :unit_type, :quantity, :price)
    end
end
