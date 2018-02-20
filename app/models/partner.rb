class Partner < ApplicationRecord
    has_many :users
  
    
    after_create :add_companyurl 
    
    has_many :users 
    
    mount_uploader :banner, ImageUploader
    mount_uploader :logo, ImageUploader
    
    def add_companyurl
        companyurl = self.company.gsub(/\s+/, "").delete('.').downcase
        self.update_attribute(:companyurl, companyurl )
    
    end
    
    def process_payment
        customer_data = {email: email, card: card_token}
                        .merge((self.plan.blank?)? {}: {plan: self.plan})
                        
        customer = Stripe::Customer.create customer_data
    
        Stripe::Charge.create customer: customer.id,
                              amount: params[:price] * 100,
                              description: event_id ,
                              currency: 'usd'
                              
        customer_id = customer.id

    end
    



end
