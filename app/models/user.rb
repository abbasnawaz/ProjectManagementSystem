class User < ApplicationRecord

  has_many :projects

  # validates :username, presence: true, length: {minimum: 3, maximum: 20}
  # validates :email, presence: true, uniqueness: { case_sensitive: false }
  # validates :phone, presence: true, length: {maximum: 13}
  # validates :f_name, presence: true, length: {maximum: 13}
  # validates :l_name, presence: true, length: {maximum: 13}

  # before_save :normalize_phoneNo
  # before_save :checkname


  private
  def normalize_phoneNo
      if self.phone[0..2] == "+92"
          self.phone = self.phone

      else
          self.phone = "+92"+self.phone

      end
  #   self.phone = +92
  end

  def checkname
    if self.f_name == self.l_name
      self.l_name = " "

    end
  end

end
