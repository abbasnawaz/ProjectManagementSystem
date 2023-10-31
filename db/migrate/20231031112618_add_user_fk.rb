class AddUserFk < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :newusers, foreign_key: :true
  end
end
