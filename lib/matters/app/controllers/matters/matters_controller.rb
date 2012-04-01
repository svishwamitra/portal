module Matters
  class MattersController < ::ApplicationController

    before_filter :initialize_data

    def initialize_data
      Matter.searchable_columns :matters_matter_no => ["matters.matter_no", "Matter no."], :matters_ref_no => ["matters.ref_no", "Ref no."], :matters_name => ["matters.name", "Name"] #, :matters_matter_date => ["matters.matter_date", "Date"]
    end

    # GET /matters
    # GET /matters.json
    def index
      @matters = Matter.conditional_pagesort(params)
      @contacts = Crm::Contact.where("name #{like} ?", "%#{params[:q]}%")
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @contacts.map(&:attributes) }
      end
    end
  
    # GET /matters/1
    # GET /matters/1.json
    def show
      @matter = Matter.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @matter }
      end
    end
  
    # GET /matters/new
    # GET /matters/new.json
    def new
      @matter = Matter.new
      @matters = Matter.all
      @matter_contact = []
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @matter }
      end
    end
  
    # GET /matters/1/edit
    def edit
      @matter = Matter.find(params[:id])
      @matters = Matter.where("parent_id !=#{@matter.id}")
      @matter_contact = [@matter.contact]
    end
  
    # POST /matters
    # POST /matters.json
    def create
      @matter = Matter.new(params[:matter])
  
      respond_to do |format|
        if @matter.save
          format.html { redirect_to matters_path, notice: 'Matter was successfully created.' }
          format.json { render json: @matter, status: :created, location: @matter }
        else
          format.html { render action: "new" }
          format.json { render json: @matter.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /matters/1
    # PUT /matters/1.json
    def update
      @matter = Matter.find(params[:id])
  
      respond_to do |format|
        if @matter.update_attributes(params[:matter])
          format.html { redirect_to matters_path, notice: 'Matter was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @matter.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /matters/1
    # DELETE /matters/1.json
    def destroy
      @matter = Matter.find(params[:id])
      @matter.destroy
  
      respond_to do |format|
        format.html { redirect_to matters_url }
        format.json { head :no_content }
      end
    end
  end
end
