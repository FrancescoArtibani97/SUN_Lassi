class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures, {:id => false} do |t|
      t.string :giorno
      t.string :oraInizio
      t.string :oraFine
      t.string :aula
      t.string :course
      t.timestamps
    end
    add_index :lectures, [:giorno, :oraInizio, :course], unique: true
  end
end
