# frozen_string_literal: true

module Api
  class HealthCheckController < ApplicationController
    skip_before_action :check_xhr_header
    def index
      render json: { message: 'Success Check!' }, status: :ok
    end
  end
end
