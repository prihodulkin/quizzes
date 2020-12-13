class CreateQuizQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_questions do |t|
      t.belongs_to :question
      t.belongs_to :quiz
      t.integer :position, null: false, default: 0
      t.datetime :time
      t.timestamps
    end
  end
end
