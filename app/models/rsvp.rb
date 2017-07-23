class Rsvp < ApplicationRecord
    belongs_to :user
    belongs_to :event 
    
    def process_payment
        customer = Stripe::Customer.create email: email,
                                           source: card_token
    
        Stripe::Charge.create customer: customer.id,
                              amount: 500 ,
                              description: event_id ,
                              currency: 'usd'

  end
end
