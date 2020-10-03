class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  
  with_options presence: true do
    @zenkaku = /\A[ぁ-んァ-ン一-龥]/
    @kana    = /\A[ァ-ヶー－]+\z/
    validates :nickname
    validates :email,            uniqueness: { case_sensitive: true },
                                 format: { with: /@/ }
    validates :password,         length: { minimum: 6 },
                                 format: { with: /\A[0-9a-zA-Z]/ }
    validates :family_name,      format: { with: @zenkaku }
    validates :first_name,       format: { with: @zenkaku }
    validates :family_name_kana, format: { with: @kana }
    validates :first_name_kana,  format: { with: @kana }
    validates :birth_day
  end
end
