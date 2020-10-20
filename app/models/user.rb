class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true,
                         format: {with:/\A[ぁ-んァ-ン一-龥]+\z/}
  validates :last_name, presence: true,
                        format: {with:/\A[ぁ-んァ-ン一-龥]+\z/}             
  validates :first_name_kana, presence: true, format: {with:/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/}
  validates :last_name_kana, presence: true, format: {with:/[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/}
  validates :birth_date, presence: true
  
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       length: { minimum: 6 },
                       format: { with: /\A[a-z0-9]+\z/i },
                       confirmation: true
end
