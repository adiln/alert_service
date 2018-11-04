# frozen_string_literal: true

# Ticket Model
class Ticket < ApplicationRecord
  validates :request_number, presence: true
  validates :sequence_number, presence: true
  has_many :excavators, inverse_of: 'ticket'
end
