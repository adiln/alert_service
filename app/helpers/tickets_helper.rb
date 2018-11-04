# frozen_string_literal: true

# TicketsHelper
module TicketsHelper
  # rubocop:disable LineLength
  def get_date_times(date_times)
    "RequestTakenDateTime:  #{date_times['RequestTakenDateTime']}
    TransmissionDateTime:  #{date_times['TransmissionDateTime']}
    LegalDateTime:  #{date_times['LegalDateTime']}
    RestakeDate:  #{date_times['RestakeDate']}
    ExpirationDate:  #{date_times['ExpirationDate']}
    LPMeetingAcceptDueDate:  #{date_times['LPMeetingAcceptDueDate']}
    OverheadBeginDate:  #{date_times['OverheadBeginDate']}"
  end

  def get_service_area(service_area)
    "PrimaryServiceAreaCode: #{service_area['PrimaryServiceAreaCode']['SACode']} and
     AdditionalServiceAreaCodes: #{service_area['AdditionalServiceAreaCodes']['SACode'].join(',')}"
  end
  # rubocop:enable LineLength
end
