class PlayersController < ApplicationController
  def index
		@players = Player.all.order("rank asc").paginate(:page => params[:page], :per_page => 30)
  end

  def show
		@player = Player.find(params[:id])
  end

end
