class ModifyMembers2 < ActiveRecord::Migration
  def change
    add_column :members, :occupation_number, :interger
    add_column :members, :occupation_name, :stirng
  end
end

