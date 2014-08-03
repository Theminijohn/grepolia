module Api
  module V1
    class PlayersController < ApplicationController
      respond_to :json

      def index
				@players = Player.all
      end

      def show
        @player = Player.find(params[:id])
      end

    end
  end
end
