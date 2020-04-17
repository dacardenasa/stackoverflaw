class AddUserIdToPregunta < ActiveRecord::Migration[6.0]
  def change
    add_reference :pregunta, :user, foreign_key: true
  end
end
