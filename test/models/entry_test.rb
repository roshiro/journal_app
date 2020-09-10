require "test_helper"

describe Entry do
  should belong_to(:instrument)
  should belong_to(:strategy)
end