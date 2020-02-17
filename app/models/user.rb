class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[github]

    validates :name, presence: true 

    has_many :appointments
    has_many :patients, through: :appointments

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.name = auth.info.name 
            user.email = auth.info.email 
            user.password = Devise.friendly_token[0, 20]   
        end 
    end 
    

end
