module Api
  module V1
    class PlayersController < ApplicationController
      respond_to :json

      def index
				@players = Player.limit(30)
      end

      def show
        @player = Player.find(params[:id])
      end

    end
  end
end
