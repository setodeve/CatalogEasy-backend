class Api::CatalogsController < ApplicationController
  before_action :authenticate_api_user!, only: [:index,:create]
  def index
  end

  def create
  end
end
