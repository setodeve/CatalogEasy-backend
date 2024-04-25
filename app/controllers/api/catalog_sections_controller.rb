# frozen_string_literal: true

module Api
  class CatalogSectionsController < ApplicationController
    before_action :authenticate_api_user!, only: [:index]
    def index
      @catalog_sections = CatalogSection.eager_load(:catalog).where(catalogs: { id: current_api_user.id })
    end
  end
end
