class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #associations
  has_many :jobs
  has_many :asks
  has_many :shares
  has_many :resources
  has_many :influencers
  has_many :visions
  has_many :value
  
  
  def latest_vision
    visions.order("saved DESC").first # query to get whatever record it is you want
  end
  
  
  
  ROLES= %w[admin student fellow company]


   after_create
    :assign_role

    def assign_role
      self.role ||= Role.find_by_name('student')
    end

end
