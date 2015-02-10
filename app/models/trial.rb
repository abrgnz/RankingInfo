class Trial < ActiveRecord::Base

  has_many :trial_alerts

  has_many :sub_trials, class_name: 'Trial', :foreign_key => :trial_id
  belongs_to :trial

  has_many :users, through: :assignments
  has_many :assignments

  has_many :generic_images, foreign_key: :generic_id, dependent: :destroy
  accepts_nested_attributes_for :generic_images, reject_if: proc { |a| a[:document].blank? || a[:description].blank? },allow_destroy: true

  has_many :promotions, dependent: :destroy
  accepts_nested_attributes_for :promotions, reject_if: proc {|a| a[:comment].blank? },allow_destroy: true

  has_many :notifications, dependent: :destroy
  accepts_nested_attributes_for :notifications, reject_if: proc {|a| a[:comment].blank? },allow_destroy: true


  validates :actor_nombre, presence: true
  validates :actor_apellido_paterno, presence: true
  validates :actor_apellido_materno, presence: true

  validates :demandado_nombre, presence: true
  validates :demandado_apellido_paterno, presence: true
  validates :demandado_apellido_materno, presence: true

  validates :tipo_juicio, presence: true
  validates :numero_expediente, presence: true
  validates :juzgado, presence: true

  validates :distrito_judicial, presence: true
  validates :juzgado, presence: true
  validates :fecha_vencimiento_termino, presence: true
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.numero_expediente,
      :start => fecha_vencimiento_termino,
      :url => Rails.application.routes.url_helpers.trial_path(id)
    }
  end

  def self.created_today
    where('created_at >= ?', 1.day.ago)
  end

  def self.mine(session,privileges)
    privileges == "1"? Trial.all : joins(:assignments).where('assignments.user_id = ?', session)
  end

  def self.expire (session,privileges)
    privileges > "1"? joins(:assignments).where('assignments.user_id = ? AND fecha_vencimiento_termino >= ? AND fecha_vencimiento_termino <= ?',session, Date.today, Date.today+15) : where('fecha_vencimiento_termino >= ? AND fecha_vencimiento_termino <= ?', Date.today, Date.today+15)
  end

  def self.non_expire(session,privileges)
    privileges > "1"? joins(:assignments).where.not('assignments.user_id = ? AND fecha_vencimiento_termino >= ? AND fecha_vencimiento_termino <= ?',session, Date.today, Date.today+15) : where.not('fecha_vencimiento_termino >= ? AND fecha_vencimiento_termino <= ?', Date.today, Date.today+15)

  end


  def self.generalSearch(search)
    sql=""
    search.split(" ").each_with_index do |val, index|
      unless index == search.split(" ").size - 1
        sql = "#{sql} actor_nombre   LIKE '%#{val}%'  OR actor_apellido_paterno LIKE  '%#{val}%' OR actor_apellido_materno LIKE  '%#{val}%' OR abogado_patrono_nombre LIKE  '%#{val}%' OR abogado_patrono_apellido_paterno LIKE  '%#{val}%' OR abogado_patrono_apellido_materno LIKE  '%#{val}%' OR demandado_nombre LIKE  '%#{val}%' OR demandado_apellido_paterno LIKE  '%#{val}%' OR demandado_apellido_materno LIKE  '%#{val}%' OR tipo_juicio LIKE  '%#{val}%' OR numero_expediente LIKE  '%#{val}%' OR juzgado LIKE  '%#{val}%' OR distrito_judicial LIKE  '%#{val}%' OR estado_procesal LIKE  '%#{val}%' OR comentario LIKE  '%#{val}%' OR"
      else
        sql = "#{sql} actor_nombre   LIKE '%#{val}%'  OR actor_apellido_paterno LIKE  '%#{val}%' OR actor_apellido_materno LIKE  '%#{val}%' OR abogado_patrono_nombre LIKE  '%#{val}%' OR abogado_patrono_apellido_paterno LIKE  '%#{val}%' OR abogado_patrono_apellido_materno LIKE  '%#{val}%' OR demandado_nombre LIKE  '%#{val}%' OR demandado_apellido_paterno LIKE  '%#{val}%' OR demandado_apellido_materno LIKE  '%#{val}%' OR tipo_juicio LIKE  '%#{val}%' OR numero_expediente LIKE  '%#{val}%' OR juzgado LIKE  '%#{val}%' OR distrito_judicial LIKE  '%#{val}%' OR estado_procesal LIKE  '%#{val}%' OR comentario LIKE  '%#{val}%'"
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

  def self.updated_today
    where('updated_at >= ? AND updated_at != created_at', 1.day.ago)
  end
end
