class Entry < ApplicationRecord
  belongs_to :instrument
  belongs_to :strategy
  belongs_to :setup

  def image_urls_extracted_from_content
    @image_urls ||= CGI.unescapeHTML(content).match(/(https?:\/\/[^\"]+)/).to_a.uniq
  end
end
