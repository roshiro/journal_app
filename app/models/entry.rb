class Entry < ApplicationRecord
  belongs_to :instrument
  belongs_to :strategy
  belongs_to :setup

  before_create :increment_trade_number

  def image_urls_extracted_from_content
    @image_urls ||= CGI.unescapeHTML(content).match(/(https?:\/\/[^\"]+)/).to_a.uniq
  end

  private

  def increment_trade_number
    self.trade_number = (Entry.last&.trade_number || 0) + 1
  end
end
