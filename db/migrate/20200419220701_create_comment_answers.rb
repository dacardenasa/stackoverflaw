class CreateCommentAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :comment_answers do |t|
      t.references :answer, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
