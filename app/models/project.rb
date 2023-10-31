class Project < ApplicationRecord


  belongs_to :user, class_name: 'User'
  has_many :tasks

  validates :project_name, presence: true, uniqueness: { case_sensitive: false }
  validates :starting_date, presence: true
  validates :ending_date, presence: true

  # def all
  #   # puts id
  #   # data = Project.joins(:tasks).where("tasks.project_id = ? ",id)
  #   # data = Project.includes(:tasks).find(id)
  #   data = Task.includes(:project).where('tasks.project_id = ?', id)
  #   # puts data.tasks.value
  #   data.each do |d|
  #     puts "The name of project is #{d.project.pname}"
  #     puts "The Task with type : #{d.task_type}"
  #     puts "The Task priority was  : #{d.value}"
  #   end
  #   # data.each do |d|

  #   #     puts d

  #   # end
  #   # return data
  # end



end
