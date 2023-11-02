class Task < ApplicationRecord

  belongs_to :project
  belongs_to :developer

  enum :task_type, [:feature, :bug]

  validates :ending_date, presence: true
  validates :description, presence: true ,length: {minimum: 20, maximum: 200}
  validates :task_type, presence: true
  # , inclusion: { in: ["feature", "bug"],
      # message: "%{value} can be either Feature or a Bug" }

  validates :ticketNo, presence: true

  validates :priority, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10,
    message: "must be between 1 and 10"
  }



end
