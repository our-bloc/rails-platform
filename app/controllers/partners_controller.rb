class PartnersController < ApplicationController
    respond_to :html, :json
    before_action :authenticate_user!, :only => [:dashboard]
    before_action :set_partner, only: [:show, :edit, :update, :destroy]
    protect_from_forgery except: :webhook

    
    def dashboard
        @partner = Partner.find_by_companyurl(params[:companyurl])
        @user = current_user
        
        #managing resources 
        @org_users = User.where(:company => @partner.company)
        @jobs = Job.where(:user_id => @user.id)
        @events = Event.where(:user_id => current_user.id).order("created_at DESC")
        @rsvps = Rsvp.where(:event_id => params[:event_id])

        
        
        #stats 
        @student_count = User.where(role: "Student", company: "All Star Code").count || 0 
        
        
        #design assets
        @logo = @partner.logo 
        @banner = @partner.banner || "img/bgimages.jpg"
        
        #event manager
        @event = Event.new
    end

    def new 
        @partner = Partner.new 
    end 
    
    def edit
    end
    
    def send_email 
      ## sending to...
      
      if params[:test] == nil 
        users = User.where(:company => :partner_company , :role => "Student")
        sender = current_user
        subject = params[:email_subject]
        body = params[:body]
        logo = params[:logo]
        jobs = params[:include_jobs]
        
        WeeklyPlaylist.mail_method(users,sender,subject,body,logo,jobs).deliver
        
      else  #send test email to current user
        users = current_user
        sender = current_user
        subject = params[:email_subject]
        body = params[:body]
        logo = params[:logo]
        jobs = params[:include_jobs]
        
        WeeklyPlaylist.mail_method(users,sender,subject,body,logo,jobs).deliver
      end
    end
    
    def create 
        @partner = Partner.create(partner_params)
        
    respond_to do |format|
      if @partner.save
        format.html { redirect_to @partner, notice: 'partner was successfully created.' }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
    end 
    
    def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to @partner, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
    end
  
    def webhook  #update registration every month
        event = Stripe::Event.retrieve(params["id"])
    
        case event.type
          when "invoice.payment_succeeded" #renew subscription
            Partner.find_by_customer_id(event.data.object.customer).renew
        end
        render status: :ok, json: "success"
    end
    
    def renew
        update_attibute :end_date, Date.today + 1.month
    end
    
    
    private
    
    def set_partner
      @partner = Partner.find(params[:id])
    end
    
    def partner_params
      params.require(:partner).permit(:company, :admin_name, :banner, :logo, :color, :companyurl)
    end
end
