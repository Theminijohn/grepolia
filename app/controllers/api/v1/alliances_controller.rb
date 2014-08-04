module Api
  module V1
    class AlliancesController < ApplicationController
      respond_to :json

      def index
        @alliances = Alliance.all
      end

      def show
        @alliance = Alliance.find(params[:id])
      end

    end
  end
end
