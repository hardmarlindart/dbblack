class CreateDados < ActiveRecord::Migration
  def change
    create_table :dados do |t|
      t.references :tracksegment, index: true, foreign_key: true
      t.string :nome
      t.string :origem
      t.string :destino
      t.string :mensagem
      t.string :hora

      t.timestamps null: false
    end
  end
end
