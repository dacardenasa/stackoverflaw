class CreateVoteanswers < ActiveRecord::Migration[6.0]
  def change
    create_table :voteanswers do |t|
      t.references :user, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
