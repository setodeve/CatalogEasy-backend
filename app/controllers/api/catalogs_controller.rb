class Api::CatalogsController < ApplicationController
  before_action :authenticate_api_user!, only: [:index,:create]
  def index
    @catalogs = Catalog.eager_load(:user).where(users: {id: current_api_user.id})
    render :index, formats: :json
  end

  def create
    @catalog = Catalog.new(user_id: current_api_user.id)
  end
end
