class Tenant < ActiveRecord::Base

  has_many :generic_images, foreign_key: :generic_id, dependent: :destroy
  accepts_nested_attributes_for :generic_images

  validates :nombre, presence: true
  validates :apellido_paterno, presence: true
  validates :apellido_materno, presence: true

  def self.created_today
    where('created_at >= ?', 1.day.ago)
  end

  def self.updated_today
    where('updated_at >= ? AND updated_at != created_at', 1.day.ago)
  end

  def self.generalSearch(search)
    sql=""
    search.split(" ").each_with_index do |val, index|
      unless index == search.split(" ").size - 1
        sql = "#{sql} nombre   LIKE '%#{val}%'  OR apellido_paterno LIKE  '%#{val}%' OR apellido_materno LIKE  '%#{val}%' OR telefono_casa LIKE  '%#{val}%' OR telefono_movil LIKE  '%#{val}%' OR delegacion LIKE  '%#{val}%' OR codigo_postal LIKE  '%#{val}%' OR no_exterior LIKE  '%#{val}%' OR colonia LIKE  '%#{val}%' OR ciudad LIKE  '%#{val}%' OR domicilio LIKE  '%#{val}%' OR curp LIKE  '%#{val}%' OR ife LIKE  '%#{val}%' OR estado_civil LIKE  '%#{val}%' OR nombre_aval LIKE  '%#{val}%' OR"
      else
        sql = "#{sql} nombre   LIKE '%#{val}%'  OR apellido_paterno LIKE  '%#{val}%' OR apellido_materno LIKE  '%#{val}%' OR telefono_casa LIKE  '%#{val}%' OR telefono_movil LIKE  '%#{val}%' OR delegacion LIKE  '%#{val}%' OR codigo_postal LIKE  '%#{val}%' OR no_exterior LIKE  '%#{val}%' OR colonia LIKE  '%#{val}%' OR ciudad LIKE  '%#{val}%' OR domicilio LIKE  '%#{val}%' OR curp LIKE  '%#{val}%' OR ife LIKE  '%#{val}%' OR estado_civil LIKE  '%#{val}%' OR nombre_aval LIKE  '%#{val}%'"
      end
    end
    where(sql)
  end

  def self.recents
    where('created_at >= ? OR updated_at >= ?',5.day.ago, 5.day.ago).limit(15)
  end

  def self.search(search)
    if search
      generalSearch(search)
    else
      recents
    end
  end
end
