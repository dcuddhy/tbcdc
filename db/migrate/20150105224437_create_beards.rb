class CreateBeards < ActiveRecord::Migration
  def change
    create_table :beards do |t|
      t.integer :length
      t.integer :rating
    end
  end
end
