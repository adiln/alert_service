# frozen_string_literal: true

require 'net/http'
# Main Controller
class TicketsController < ApplicationController
  before_action :json_date

  def index
    # rubocop:disable LineLength
    ###### JSON Api can be read like this and parse to get json data #####
    # Here I have placed json data in a file and read it and storing informations like
    # url = 'https://api.spotify.com/v1/search?type=artist&q=tycho'
    # uri = URI(url)
    # response = Net::HTTP.get(uri)
    # JSON.parse(response)
    # rubocop:enable LineLength

    @tickets = Ticket.includes(:excavators)
  end

  # create ticket and associated excavator records
  def create
    ticket_attributes, excavator_attributes = get_attributes(params)
    ticket = Ticket.create(ticket_attributes)
    ticket.excavators.create(excavator_attributes) if ticket.errors.blank?
    if ticket.errors.present?
      flash[:error] = 'Error while saving record!'
    else
      flash[:success] = 'Record save succesfully!'
    end
    redirect_to action: 'index'
  end

  def show
    @ticket = Ticket.find(params[:id])
    # Below line gives Polygon points
    @digsiteinfo = @ticket.digsiteinfo['WellKnownText']
  end

  # pull json data from ticket.json file
  def json_date
    @json_data =  File.read('public/inputdata/ticket.json')
  end

  private

  # setting attributes for ticket and excavator from json data
  # rubocop:disable LineLength
  def get_attributes(params)
    parsed_json = JSON.parse(params['json_text'])
    [get_ticket_attributes(parsed_json), get_excavator_attributes(parsed_json['Excavator'])]
  end

  def get_ticket_attributes(parsed_json)
    {
      request_number: parsed_json['RequestNumber'],
      sequence_number: parsed_json['SequenceNumber'],
      request_type: parsed_json['RequestType'],
      date_times: parsed_json['DateTimes'],
      service_area: parsed_json['ServiceArea'],
      digsiteinfo: parsed_json['ExcavationInfo']['DigsiteInfo']
    }
  end

  def get_excavator_attributes(excavator)
    {
      company_name: excavator['CompanyName'],
      address: "#{excavator['Address']}, #{excavator['City']}, #{excavator['State']}, #{excavator['Zip']}",
      crewonsite: excavator['CrewOnsite']
    }
  end
  # rubocop:enable LineLength
end
