class ChangeProduct < ActiveRecord::Migration
  def change
  	change_table(:products) do |t|
  		t.column :photo, :string, limit: 100
  	end
  end
end
