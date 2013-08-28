class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user
      t.references :commentable, polymorphic: true
      t.text       :question_text
      t.timestamps
    end
  end
end
