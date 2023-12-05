class AddUserFk < ActiveRecord::Migration[7.0]
  def change
    # belongs_to :projects, :newusers, foreign_key: :true
    add_reference :projects, :newuser, foreign_key: true
  end
end
