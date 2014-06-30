class DeviseChangeUsers < ActiveRecord::Migration
  def change
  	change_table(:users) do |t|
  		t.column :name, :string, limit: 30, :null=> false
  		t.column :phone, :string, limit: 30, :null=> false
  	end
  end
end
