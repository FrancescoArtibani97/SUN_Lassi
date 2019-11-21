class CreateEnrolls < ActiveRecord::Migration[5.2]
  def change
    create_table :enrolls, {:id => false} do |t|
      t.integer :matricola
      t.string :materia
      t.timestamps
    end
    add_index :enrolls, [:matricola, :materia], unique: true
  end
end
