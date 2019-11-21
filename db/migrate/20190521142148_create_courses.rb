class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses, {:id => false} do |t|
      t.string :professore
      t.string :materia
      t.date :dataInizio
      t.date :dataFine
      t.timestamps
    end
    add_index :courses, :materia, unique: true
  end
end
