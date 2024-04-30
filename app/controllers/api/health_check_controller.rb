module Api
    class HealthCheckController < ApplicationController
      def index
        render json: { message: "Success Check!" }, status: :ok
      end
    end
end