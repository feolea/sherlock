# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { 'Some fun product' }
    description { 'An awesome description' }
    country { 'Brazil' }
    price { 19.99 }
    tags { 'cheap, fun' }
  end
end
