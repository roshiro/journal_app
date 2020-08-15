class Entry < ApplicationRecord
  belongs_to :instrument

  before_validation { |e| e.instrument = Instrument.find_or_create_by(name: e.instrument_name.strip.upcase) }

  attr_accessor :instrument_name

end
