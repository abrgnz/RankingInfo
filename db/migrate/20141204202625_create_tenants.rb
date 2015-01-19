class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :domicilio
      t.string :calle
      t.string :no_interior
      t.string :no_exterior
      t.string :colonia
      t.string :ciudad
      t.string :estado
      t.string :codigo_postal
      t.string :municipio
      t.string :delegacion
      t.string :telefono_casa
      t.string :telefono_movil
      t.string :curp
      t.string :ife
      t.string :estado_civil
      t.string :arrendador_actual
      t.string :arrendador_anterior
      t.string :domicilio_anterior
      t.string :nombre_aval
      t.string :domicilio_aval
      t.string :telefono_aval

      t.timestamps
    end
  end
end
