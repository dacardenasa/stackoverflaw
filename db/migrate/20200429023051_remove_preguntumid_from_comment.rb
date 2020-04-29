class RemovePreguntumidFromComment < ActiveRecord::Migration[6.0]
  def change
    
    remove_column :comments, :preguntum_id, :integer
  end
end
