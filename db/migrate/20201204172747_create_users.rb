class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''
      t.string :surname, null: false, default: ''
      t.string :phone, null: false, default: ''
      t.string :password_digest
      t.integer :right_answers, default: 0
      t.integer :total_answers, default: 0
      t.integer :passed_quizes, default: 0
      t.integer :won_quizes, default: 0
      t.integer :position, default: 0
      t.integer :rating, default: 0
      t.string :avatar, default: ''
      t.timestamps
    end
  end
end
