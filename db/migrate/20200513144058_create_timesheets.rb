class CreateTimesheets < ActiveRecord::Migration[6.0]
  def change
    create_table :timesheets do |t|
      t.string :user
      t.string :clock
      t.datetime :time
      t.references :employee, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
