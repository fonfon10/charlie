class HitsController < ApplicationController

  before_action :set_hit, only: [:show, :edit, :update]

  def index
    @hits = Hit.all
  end


  def show
    last_id = Hit.last.id
    if @hit.id > 1
      @previous_hit = Hit.find(@hit.id - 1)
    end
    if @hit.id < last_id
      @next_hit = Hit.find(@hit.id + 1)
    end

  end


  def new
    @hit = Hit.new
  end


  def create
    @hit = Hit.new(hit_params)

    @hit.player_id = @hit.digit_left.to_i*10 + @hit.digit_right.to_i


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

    @hit.player_id = @hit.digit_left.to_i*10 + @hit.digit_right.to_i


    if @hit.update(hit_params)
      flash[:success] = "Hit was updated successfully"

          @hit.player_id = @hit.digit_left.to_i*10 + @hit.digit_right.to_i
          @hit.update(hit_params)


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
    params.require(:hit).permit(:comments, :head, :chest, :back, :digit_left, :digit_right, :slurring)    
  end

end