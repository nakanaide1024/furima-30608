class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :Products

  with_options presence: true do 
    validates :nickname
    
    VALID_PASSWORD_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
    validates :first_name, format: {with: VALID_PASSWORD_NAME_REGEX}
    validates :last_name, format: {with: VALID_PASSWORD_NAME_REGEX}             
    
    VALID_PASSWORD_KANA_REGEX = /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/
    validates :first_name_kana, format: {with: VALID_PASSWORD_KANA_REGEX}
    validates :last_name_kana, format: {with: VALID_PASSWORD_KANA_REGEX}
    validates :birth_date
  
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 6 },
                           format: { with: /\A[a-z0-9]+\z/i },
                           confirmation: true
  end                         
end
