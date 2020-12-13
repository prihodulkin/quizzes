class CreatePassedQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :passed_questions do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.timestamps
      t.boolean :success, default: false
    end
  end
end
