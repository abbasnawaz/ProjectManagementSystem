class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|

      t.string :specilization
      t.string :name
      t.integer :age
      t.string :phoneNo
      t.string :email


      # t.belongs_to :task, foreign_key: true



      t.timestamps
    end
  end
end
