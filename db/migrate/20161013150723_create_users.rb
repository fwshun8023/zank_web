class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar
      t.string :email
      t.string :phone
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :sex_type
      t.string :province

      t.timestamps
    end
  end
end
