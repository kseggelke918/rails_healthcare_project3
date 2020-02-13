class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[github]

    validates :name, presence: true 

    has_many :user_patients 
    has_many :patients, through: :user_patients 

    def self.from_omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            byebug
            user.name = auth.info.name 
            user.email = auth.info.email 
            user.password = Devise.friendly_token[0, 20]
            
        end 
    end 

end
