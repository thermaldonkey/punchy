class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.date :current_date,   null: false
      t.string :department,   null: false
      t.string :initials,     null: false
      t.date :week_end_date,  null: false
      t.string :issue,                    default: ""
      t.string :description,              default: ""
      t.time :start_time,     null: false
      t.time :end_time,       null: false
      t.string :activity,     null: false
      t.text :notes,                      default: ""
      t.integer :user_id,     null: false

      t.timestamps
    end
  end
end
