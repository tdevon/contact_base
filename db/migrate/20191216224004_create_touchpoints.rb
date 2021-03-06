class CreateTouchpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :touchpoints do |t|
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
