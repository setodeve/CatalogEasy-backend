# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Rails.application.routes.url_helpers
  before_action :set_encryptor
  before_action do
    I18n.locale = :ja
  end

  protected
  def set_encryptor
    # secret_key = Rails.application.credentials.secret_key_base[0, 32]
    @encryptor = ActiveSupport::MessageEncryptor.new(Base64.decode64(ENV['APP_HASH_SALT']))
  end

  def encrypt(data)
    @encryptor.encrypt_and_sign(data)
  end

  def decrypt(data)
    @encryptor.decrypt_and_verify(data)
  end
end
