class CreateCircles < ActiveRecord::Migration[5.0]
  def change
    create_table :circles do |t|
      t.string :name
      t.string :descript
      t.string :cover_url

      t.timestamps
    end
  end
end
