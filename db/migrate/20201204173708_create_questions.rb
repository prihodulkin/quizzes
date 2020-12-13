class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.belongs_to :user
      t.boolean :test,  null: false, default: false
      t.text :text, default: ''
      t.string :answer, default: ''
      t.string :picture, default: ''
      t.belongs_to :category
      t.timestamps
    end
  end
end
