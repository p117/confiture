class CreateCustomer < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	t.string :name,			:null => false
    	t.string :email,			:null => false
    	t.string :phone,			:null => false
    	t.timestamps
    end
  end
end
