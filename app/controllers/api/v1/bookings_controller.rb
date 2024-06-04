class Api::V1::BookingsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
    @bookings = Booking.all
      respond_to do |format|
      format.html
      format.xml { render xml: @bookings.as_json }
      end
    end

    # def new
    #     @booking = Booking.new
    #     respond_to do |format|
    #       format.html
    #       format.xml { render xml: @booking.as_json }
    #     end
    #   end
    

    def create
        room = Room.find_or_create_by!(room_number: params[:room_number], room_type: params[:room_type])
        client = Client.find_or_create_by!(name: params[:client_name], email: params[:client_email])
        booking = Booking.new(client: client, room: room, check_in_date: params[:check_in_date], total_amount: params[:total_amount])
        if booking.save
          render xml: booking.as_json
        else
          render xml: { error: "Failed to create booking" }.as_json, status: :unprocessable_entity
        end
      end

    # def create
    #     room = Room
    # end

end
