# frozen_string_literal: true

require 'aws-sdk-core'

Aws.config.update({ credentials: Aws::ECSCredentials.new }) if ENV['AWS_ACCESS_KEY_ID'].blank? && Rails.env.production?
