# frozen_string_literal: true

module EncryptionHelpers
  def encrypt(data)
    secret_key = Base64.urlsafe_decode64(Rails.application.credentials.salt)
    encryptor = ActiveSupport::MessageEncryptor.new(secret_key[0, 32])
    encrypted_data = encryptor.encrypt_and_sign(data)
    Base64.urlsafe_encode64(encrypted_data)
  end

  def decrypt(data)
    secret_key = Base64.urlsafe_decode64(Rails.application.credentials.salt)
    encryptor = ActiveSupport::MessageEncryptor.new(secret_key[0, 32])
    decoded_encrypted_data = Base64.urlsafe_decode64(data)
    encryptor.decrypt_and_verify(decoded_encrypted_data)
  end
end
