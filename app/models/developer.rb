class Developer < ApplicationRecord

  belongs_to :newuser, foreign_key: 'newuser_id'
  has_one :task

  validates :specilization, presence: true
  validates :name, presence: true
  validates :age, presence: true
  validates :phoneNo, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :normalize_phoneNo






  private
  def normalize_phoneNo
      if self.phoneNo[0..2] == "+92"
          self.phoneNo = self.phoneNo

      else
          self.phoneNo = "+92"+self.phoneNo

      end
  #   self.phoneNo = +92
  end

end
