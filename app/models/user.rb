

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:microsoft_graph]
  
  has_many :enrolls
  has_many :courses, through: :enrolls

  has_many :collections
  has_many :notes, through: :collections

  self.primary_key = :matricola

  has_many :access_grants,
  class_name: 'Doorkeeper::AccessGrant',
  foreign_key: :resource_owner_id,
  dependent: :delete_all # or :destroy if you need callbacks

  has_many :access_tokens,
  class_name: 'Doorkeeper::AccessToken',
  foreign_key: :resource_owner_id,
  dependent: :delete_all # or :destroy if you need callbacks
  
  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID   
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.nome = auth.extra.raw_info.displayName
      user.matricola = matricola(auth.info.email)
      user.email = auth.info.email      user.password = Devise.friendly_token[0,20]
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end
end

def matricola(email)
  s = email.split("@")[0]
  matricola = s[s.length - 7, s.length]
end
