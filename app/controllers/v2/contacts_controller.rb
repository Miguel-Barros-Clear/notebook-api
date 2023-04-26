module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show edit update destroy ]

    # GET /contacts or /contacts.json
    def index
      @contacts = Contact.all
      
      render json: @contacts #, methods: :birthdate_br
    end

    # GET /contacts/1 or /contacts/1.json
    def show
      render json: @contact, include: [:kind, :address, :phones] #, meta: { author: "Miguel" }
    end

    # GET /contacts/new
    def new
      @contact = Contact.new
    end

    # GET /contacts/1/edit
    def edit
    end

    # POST /contacts or /contacts.json
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1 or /contacts/1.json
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1 or /contacts/1.json
    def destroy
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def contact_params
        # params.require(:contact).permit(
        #   :name, :email, :birthdate, :kind_id,
        #   phones_attributes: [:id, :number, :_destroy],
        #   address_attributes: [:id, :street, :city]
        # )
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end