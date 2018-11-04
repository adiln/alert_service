# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable BlockLength
RSpec.describe TicketsController, type: :controller do
  let!(:ticket) { FactoryBot.create(:ticket) }
  let!(:excavator) { FactoryBot.create :excavator, ticket: ticket }

  describe 'GET index' do
    before do
      get :index
    end

    it 'returns a success' do
      expect(response).to be_success
      expect(ticket.request_number).not_to be_empty
    end

    it 'returns a ticket resource' do
      expect(ticket.request_number).not_to be_empty
    end
  end

  describe 'POST create' do
    before do
      # rubocop:disable LineLength
      @json_data = File.read(Rails.root.join('public', 'inputdata', 'ticket.json'))
      # rubocop:enable LineLength
    end

    subject { post :create, params: { json_text: @json_data.to_json } }

    it 'creates a ticket and redirect to index page' do
      expect(subject).to redirect_to action: :index
    end
  end

  describe 'GET show' do
    subject { get :show, params: { id: 1 } }
    it 'returns a success' do
      expect(response).to be_success
    end
  end
end
# rubocop:enable BlockLength
