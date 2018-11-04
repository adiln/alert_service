# frozen_string_literal: true

FactoryBot.define do
  factory :excavator do
    sequence(:id) { |n| n }
    company_name 'John Doe Construction'
    address '555 Some RD'
    crewonsite true
  end
end
