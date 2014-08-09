module Api
  module V1
    class ConquersController < ApplicationController
      respond_to :json

      def index
				@conquers = Conquer.all
      end

      def show
        @conquer = Conquer.find(params[:id])
      end

    end
  end
end
