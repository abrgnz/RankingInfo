class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :actor_nombre
      t.string :actor_apellido_paterno
      t.string :actor_apellido_materno
      t.string :abogado_patrono_nombre
      t.string :abogado_patrono_apellido_paterno
      t.string :abogado_patrono_apellido_materno
      t.string :demandado_nombre
      t.string :demandado_apellido_paterno
      t.string :demandado_apellido_materno
      t.string :tipo_juicio
      t.string :numero_expediente
      t.string :juzgado
      t.string :distrito_judicial_string
      t.string :ultima_actuacion
      t.string :estado_procesal
      t.date :fecha_vencimiento_termino
      t.text :comentario
      t.integer :trial_id

      t.timestamps
    end
  end
end
