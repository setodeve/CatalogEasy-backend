module Api
    class HealthCheckController < ApplicationController
      def index
        head 200
      end
    end
end