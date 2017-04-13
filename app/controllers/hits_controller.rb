class HitsController < ApplicationController

  before_action :set_hit, only: [:show, :edit, :update]

  def index
    @hits = Hit.all
  end


  def show  
  end


  def new
    @hit = Hit.new
  end


  def create
    @hit = Hit.new(hit_params)

    

    @hit.player_id = params[:digit_left].to_i*10 + params[:digit_right].to_i
    

    if params[:head_state]
      @hit.head = 1
    else
      @hit.head=0
    end

    if @hit.save
      flash[:success] = "Hit was created successfully"
      redirect_to hit_path(@hit)
    else
      render 'new'
    end
  end


  def edit
  end


  def update
    if @hit.update(hit_params)
      flash[:success] = "Hit was updated successfully"
      redirect_to hit_path(@hit)
    else
      render 'edit'
    end
  end


  def destroy
    @hit = Hit.find(params[:id]).destroy
    flash[:success] = "Hit deleted successfully"
    redirect_to hit_path
  end



private

  def set_hit
    @hit = Hit.find(params[:id])    
  end

  def hit_params
    params.require(:hit).permit(:head_state, :chest, :back, :digit_left, :digit_right)    
  end

end