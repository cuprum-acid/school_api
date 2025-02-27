class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.references :school, null: false, foreign_key: true
      t.references :class, null: false, foreign_key: { to_table: :school_classes }
      t.string :auth_token
      t.timestamps
    end
  end
end
