# frozen_string_literal: true

json.array! @catalogs do |catalog|
  json.extract! catalog, :id, :created_at, :updated_at, :name, :user_id
end
