module Api
  module V1
    class TownsController < ApplicationController
      respond_to :json

      def index
        @towns = Town.all
      end

      def show
        @town = Town.find(params[:id])
      end

    end
  end
end
