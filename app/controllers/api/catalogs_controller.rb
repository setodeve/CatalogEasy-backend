class Api::CatalogsController < ApplicationController
  before_action :authenticate_api_user!, only: [:index,:create,:show]
  def index
    tmp = Catalog.eager_load(:user).where(users: {id: current_api_user.id})
    @catalogs = {}
    tmp.each do |t|
      id = encrypt(t.id)
      @catalogs[id] = t
    end
    render json: @catalogs
  end

  def create
  end

  def show
    tmp = Catalog.find(decrypt(params[:id]))
    return render json: {"products" => []} if tmp.user_id != current_api_user.id
    @catalog = []
    (tmp.products).each do |t|
      image_key = t.image_assignments.first.image_key
      image_url = url_for(ActiveStorage::Blob.find_by(key: image_key))
      @catalog << t.as_json.merge(:image => image_url)
    end
    render json:  @catalog
  end

end
