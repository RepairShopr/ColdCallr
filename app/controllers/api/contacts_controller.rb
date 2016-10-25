class Api::ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :external_contacts, :edit, :update, :destroy]
  protect_from_forgery :except => [:update]

  # GET /contacts
  # GET /contacts.json
  def index
    if params[:status].present?
      if params[:status] == 'open'
        scoped = Contact.is_open
      elsif params[:status] == "all"
        scoped = Contact.any_status
      elsif params[:status] == 'new'
        scoped = Contact.is_new
      elsif params[:status] == 'call_back'
        scoped = Contact.is_callback
      end
    end

    scoped ||= Contact.is_open
    active_lists = List.where(enabled: true).pluck(:id)

    scoped =  scoped.where(list_id: active_lists).order(:id).includes(:activities => :user)
    if params[:current_contact]
      scoped = scoped.where("id > ?",params[:current_contact].to_i).order(:id).includes(:activities => :user)
    end

    if params[:timezone].present?
      scoped = scoped.where(state: Contact.state_mapping[params[:timezone]])
      puts "COUNT: #{scoped.count}"
    end

    @contacts = scoped.paginate(per_page: (params[:per_page] || 50), page: params[:page])
    render json: @contacts, :meta => {:total_pages => @contacts.total_pages, :page => (params[:page] || 1).to_i}
  end


  # GET /contacts/1
  # GET /contacts/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact }
    end
  end

  def external_contacts
    external_api_endpoint = ENV["EXTERNAL_API_ENDPOINT"]
    api_token = ENV["API_TOKEN"]

    if external_api_endpoint.blank? or api_token.blank?
      puts "External API Not Configured" if Rails.env.development?
      render json: {external_contacts: []} and return
    end

    postal = @contact.properties['postal']
    city = @contact.properties['city']
    phone = @contact.phone
    full_api_call = "#{external_api_endpoint}?postal=#{postal.to_s.split("-")[0]}&city=#{city}&phone=#{phone}&token=#{api_token}"
    result = Faraday.get(full_api_call)
    render json: result.body
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render json: @contact, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params.slice(:status))
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_params
    params.require(:contact).permit(:name, :phone, :status, :user_id, :properties)
  end
end
