class Newuser < ApplicationRecord

  has_many :projects
  has_many :developers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable





  validates :email, presence: true, uniqueness: { case_sensitive: false }
  # validates :phone, presence: true, length: {maximum: 13}
  # validates :f_name, presence: true, length: {maximum: 13}
  # validates :l_name, presence: true, length: {maximum: 13}






end
