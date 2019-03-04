require 'test_helper'

class UrlHashGeneratorTest < ActiveSupport::TestCase
  test ".generate_random_key should return two different keys" do
    key1 = UrlHashGenerator.new.generate_random_key
    key2 = UrlHashGenerator.new.generate_random_key
    assert_not_equal key1, key2, "Random keys generated"
  end  

end
