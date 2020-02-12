class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: %i[google_oauth2]
    validates :email, presence: true 
    validates :name, presence: true 
    has_many :user_patients 
    has_many :patients, through: :user_patients 

end
