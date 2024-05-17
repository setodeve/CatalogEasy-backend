# frozen_string_literal: true

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Rails.application.routes.url_helpers
  before_action :set_encryptor
  before_action do
    I18n.locale = :ja
  end
  before_action :check_xhr_header

 private
  def check_xhr_header
    return if request.xhr?

    render json: { error: 'forbidden' }, status: :forbidden
  end

  protected

  def set_encryptor
    secret_key = Rails.application.credentials.salt
    @encryptor = ActiveSupport::MessageEncryptor.new(secret_key[0, 32])
  end

  def encrypt(data)
    encrypted_data = @encryptor.encrypt_and_sign(data)
    Base64.urlsafe_encode64(encrypted_data)
  end

  def decrypt(data)
    decoded_encrypted_data = Base64.urlsafe_decode64(data)
    @encryptor.decrypt_and_verify(decoded_encrypted_data)
  end
end
