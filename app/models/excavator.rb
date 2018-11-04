# frozen_string_literal: true

# Excavator Model
class Excavator < ApplicationRecord
  validates :company_name, presence: true
  validates :address, presence: true
  belongs_to :ticket
end
