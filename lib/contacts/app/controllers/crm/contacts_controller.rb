module Crm
  class ContactsController < ::ApplicationController
    #caches_page :index, :show
    # cache_sweeper :contact_sweeper
    before_filter(only: [:index, :show]) { @page_caching = true }
    # GET /contacts
    # GET /contacts.json
    def index
      @contacts = Contact.conditional_pagesort(params)
      @accounts = Company::Account.where("name #{like} ?", "%#{params[:q]}%")
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @accounts.map(&:attributes)}
      end
    end
  
    # GET /contacts/1
    # GET /contacts/1.json
    def show
      @contact = Contact.find(params[:id])
      fresh_when etag: @contact, last_modified: @contact.updated_at
    end
  
    # GET /contacts/new
    # GET /contacts/new.json
    def new
      @contact = Contact.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @contact }
      end
    end
  
    # GET /contacts/1/edit
    def edit
      @contact = Contact.find(params[:id])
    end
  
    # POST /contacts
    # POST /contacts.json
    def create
      @contact = Contact.new(params[:contact])
  
      respond_to do |format|
        if @contact.save
          sweep
          format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
          format.json { render json: @contact, status: :created, location: @contact }
        else
          format.html { render action: "new" }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /contacts/1
    # PUT /contacts/1.json
    def update
      @contact = Contact.find(params[:id])
  
      respond_to do |format|
        if @contact.update_attributes(params[:contact])
          sweep
          format.html { redirect_to contacts_path, notice: 'Contact was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @contact.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /contacts/1
    # DELETE /contacts/1.json
    def destroy
      @contact = Contact.find(params[:id])
      @contact.destroy
      sweep
      respond_to do |format|
        format.html { redirect_to contacts_url }
        format.json { head :no_content }
      end
    end
    
private
    def sweep
      #expire_page contacts_path
      #expire_page contact_path(@contact)
      #rescue
      #expire_page "/"
      FileUtils.remove_dir "#{page_cache_directory}/crm/contacts", true
      puts "sweeper called ............................."
      puts "#{page_cache_directory}/crm/contacts"
      puts "--------------------------------------------"
    end
  end
end
