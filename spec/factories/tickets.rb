# frozen_string_literal: true

FactoryBot.define do
  factory :ticket, class: 'Ticket' do
    sequence(:id) { |n| n }
    sequence(:request_number) { |n| "#{n}-00000#{n}" }
    sequence(:sequence_number)
    request_type 'Normal'
    date_times {}
    service_area {}
    digsiteinfo {}
  end
end
