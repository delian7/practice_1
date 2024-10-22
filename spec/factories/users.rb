# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'MyString' }
    email { Faker::Internet.email }
    password_digest { 'MyString' }
  end
end
