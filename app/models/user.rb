class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :items
  has_many :buying

  with_options presence: true do
    validates :nickname,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）フリマ太郎"}
    validates :first_name,format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）山田"}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）隆太郎"}
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）ヤマダ"}
    validates :last_name_kana,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "例）リクタロウ"}
    validates :birth_day
    validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "PC・携帯どちらでも可"}
    validates :password,format: { with: /\A[a-z0-9]+\z/i, length: {minimun: 6}, message: "6文字以上の半角英数字"}
  end
end
