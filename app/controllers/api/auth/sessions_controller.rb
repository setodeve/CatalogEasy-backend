# frozen_string_literal: true

module Api
  module Auth
    class SessionsController < ApplicationController
      def index
        if current_api_user
          render json: { is_login: true, data: current_api_user }
        else
          render json: { is_login: false, message: 'ユーザーが存在しません' }
        end
      end
    end
  end
end
