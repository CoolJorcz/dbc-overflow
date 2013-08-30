class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.string       :question_text, null: false
      t.timestamps
    end
  end
end
