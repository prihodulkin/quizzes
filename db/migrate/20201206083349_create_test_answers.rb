class CreateTestAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :test_answers do |t|
      t.belongs_to :question
      t.string :answer, null: false
      t.timestamps
    end
  end
end
