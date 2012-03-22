module Company
  class AccountsController < ::ApplicationController
    # GET /accounts
    # GET /accounts.json
    def index
      @accounts = Account.paginate(:page => params[:page], :per_page => 5).where("name #{like} ?", "#{params[:char]}%").order(params[:sort])
      @contacts = Crm::Contact.where("name #{like} ? and id not in(select contact_id from crm_account_contacts)", "%#{params[:q]}%")
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @contacts.map(&:attributes)}
      end
    end
  
    # GET /accounts/1
    # GET /accounts/1.json
    def show
      @account = Account.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @account }
      end
    end
  
    # GET /accounts/new
    # GET /accounts/new.json
    def new
      @account = Account.new
      @account.addresses.build
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @account }
      end
    end
  
    # GET /accounts/1/edit
    def edit
      @account = Account.find(params[:id])
      @account.addresses.empty? ? @account.addresses.build : @account.addresses.first
    end
  
    # POST /accounts
    # POST /accounts.json
    def create
      @account = Account.new(:name => params[:account][:name],
                             :email => params[:account][:email],
                              :phone => params[:account][:phone],
                              :contact_tokens => params[:account][:contact_tokens])
      @account.addresses.build(params[:account][:addresses_attributes]["0"])
      respond_to do |format|
        if @account.save
          format.html { redirect_to accounts_path, notice: 'Account was successfully created.' }
          format.json { render json: @account, status: :created, location: @account }
        else
          format.html { render action: "new" }
          format.json { render json: @account.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PUT /accounts/1
    # PUT /accounts/1.json
    def update
      @account = Account.find(params[:id])
  
      respond_to do |format|
        if @account.update_attributes(:name => params[:account][:name],
                                      :email => params[:account][:email],
                                      :phone => params[:account][:phone],
                                      :contact_tokens => params[:account][:contact_tokens])
          @account.addresses.empty? ? @account.addresses.create(params[:account][:addresses_attributes]["0"]) : @account.addresses.first.update_attributes(params[:account][:addresses_attributes]["0"])
          format.html { redirect_to accounts_path, notice: 'Account was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @account.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /accounts/1
    # DELETE /accounts/1.json
    def destroy
      @account = Account.find(params[:id])
      @account.destroy
  
      respond_to do |format|
        format.html { redirect_to accounts_url }
        format.json { head :no_content }
      end
    end
  
    def get_contacts
      @account = Account.find(params[:id])
      @contacts = @account.contacts
    end
  end
end
