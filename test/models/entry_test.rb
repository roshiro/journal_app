require "test_helper"

describe Entry do
  should belong_to(:instrument)
  should belong_to(:strategy)

  describe '#image_urls_extracted_from_content' do
    context 'when content has urls' do
    end
  end
end