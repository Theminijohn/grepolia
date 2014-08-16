class PlayersController < ApplicationController
  def index
		@players = Player.all.order("rank asc").paginate(:page => params[:page], :per_page => 30)
  end

  def show
		@player = Player.find(params[:id])
  end

  def follow
    @player = Player.find(params[:id])
    current_user.follow(@player)
    redirect_to :back
  end

  def unfollow
    @player = Player.find(params[:id])
    current_user.stop_following(@player)
    # Delete Activities that have been created
    PublicActivity::Activity.where(owner: @player, recipient: current_user).delete_all
    redirect_to :back
  end

end
