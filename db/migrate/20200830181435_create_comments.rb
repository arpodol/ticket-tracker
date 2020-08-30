class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :creator, foreign_key: { to_table: :users}, null: false
      t.references :ticket, foreign_key: true, null: false
      t.string :body

      t.timestamps
    end
  end
end
