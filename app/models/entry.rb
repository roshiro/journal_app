class Entry < ApplicationRecord
  belongs_to :instrument

  before_validation :populate_instrument

  attr_accessor :instrument_name

  private

    def populate_instrument
      self.instrument = Instrument.find_or_create_by(name: symbol.strip.upcase)
    end
end
