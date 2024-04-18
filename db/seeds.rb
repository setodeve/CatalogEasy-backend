# frozen_string_literal: true

User.create!([
  { name: "Alice", email: "alice@example.com", hashed_password: "password123", created_at: Time.now, updated_at: Time.now },
  { name: "Bob", email: "bob@example.com", hashed_password: "password456", created_at: Time.now, updated_at: Time.now },
  { name: "Charlie", email: "charlie@example.com", hashed_password: "password789", created_at: Time.now, updated_at: Time.now }
])