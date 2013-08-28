class AddTitleToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :title, :string
  end

  def down
    remove_column :questions, :title
  end
end
