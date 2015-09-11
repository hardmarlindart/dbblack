class CreateXmls < ActiveRecord::Migration
  def change
    create_table :xmls do |t|
      t.string :alvo
      t.string :nome
      t.string :operacao
      t.integer :fase

      t.timestamps null: false
    end
    add_attachment :xmls, :gpx
  end
end
