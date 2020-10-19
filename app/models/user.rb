class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]/}
  validates :last_name, presence: true, format: {with:/\p{katakana}/}
  validates :first_name_kana, presence: true, format: {with:/\p{katakana}/}
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true
  
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       format: { with: /\A(?=.&#042;?[a-z])(?=.&#042;?\d)[a-z\d]+\z/i },
                       confirmation: true
end
