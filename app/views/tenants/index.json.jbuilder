json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :nombre, :apellido_paterno, :apellido_materno, :domicilio, :calle, :no_interior, :no_exterior, :colonia, :ciudad, :estado, :codigo_postal, :municipio, :delegacion, :telefono_casa, :telefono_movil, :curp, :ife, :estado_civil, :arrendador_actual, :arrendador_anterior, :domicilio_anterior, :nombre_aval, :domicilio_aval, :telefono_aval
  json.url tenant_url(tenant, format: :json)
end
