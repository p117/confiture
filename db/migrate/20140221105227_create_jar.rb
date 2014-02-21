class CreateJar < ActiveRecord::Migration
  def change
    create_table :jars do |t|
    	t.float :price
      	t.string :text
    end
  end
end
