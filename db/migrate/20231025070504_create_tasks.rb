class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|

      t.text :description
      t.string :ticketNo
      t.string :task_type
      t.date :ending_date
      t.integer :priority

      t.belongs_to :project, foreign_key: true




      t.timestamps
    end
  end
end
