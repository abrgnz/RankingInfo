module TrialsHelper
  def localeChange(date)
    Time.parse(date.to_s).strftime('%d-%m-%Y')
  end
end
