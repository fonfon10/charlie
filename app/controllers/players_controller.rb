class PlayersController < ApplicationController

  before_action :set_player, only: [:show, :edit, :update]

  def show
    hits = Hit.all
    @individual_hits = @player.hits
    
  end



private

  def set_player
    @player = Player.find(params[:id])    
  end

  def player_params
    params.require(:player).permit(:name)    
  end


end