class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def show
    record = ''
    self.attributes.each do |attribute, value|
      record = record + "#{attribute} : #{value}, "
    end
    puts(record)
  end
end
