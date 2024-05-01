# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if "production" == Rails.env
      origins 'https://app.catlogeasy.site/'
    else
      origins '*'
    end

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             expose: %w[access-token expiry token-type uid client]
  end
end
