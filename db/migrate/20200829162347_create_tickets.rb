class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :name, null: false
      t.string :body, null: false
      t.string :status, null: false
      t.integer :project_id

      t.timestamps
    end
  end
end
