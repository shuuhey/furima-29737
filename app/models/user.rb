class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :nickname
  validates :email,  uniqueness: { case_sensitive: true }, format: { with: /@/ }
  # パスワード2回入力はdeviseの基本バリデーション
  validates :password, length: { minimum: 6 },
                       format: { with: /\A[0-9a-zA-Z]/ }
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day
  end
end
