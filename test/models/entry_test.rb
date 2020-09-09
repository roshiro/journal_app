require "test_helper"

describe Entry do
  should belong_to(:instrument)
end