class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: true }, format: { with: /@/ }
  # パスワード2回入力はdeviseの基本バリデーション
  validates :password, presence: true,
                       length: { minimum: 6 },
                       format: { with: /\A[0-9a-zA-Z]/ }
  validates :family_name, presence: true,
                          format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, presence: true,
                               format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day, presence: true
end
