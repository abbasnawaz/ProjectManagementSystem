class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|

      t.string :project_name
      t.date :starting_date
       t.date :ending_date


      #  t.belongs_to :newusers, foreign_key: true


      t.timestamps
    end
  end
end
