class GpsTruck < ApplicationRecord
    attr_accessor :imei_number, :latitude, :longitude, :engine, :address, :status_text 
    validates :latitude, presence: true

    def initialize(imei_number, latitude, longitude, engine, address, status_text)
        @imei_number = imei_number
        @latitude = latitude
        @longitude = longitude
        @engine = engine
        @address = address
        @status_text = status_text
    end
end
