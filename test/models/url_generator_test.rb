require 'test_helper'

class UrlGeneratorTest < ActiveSupport::TestCase
  test "is_valid_url? should return true for valid url" do
    actual_url = "http://www.google.com"
    url = UrlGenerator.new(actual_url)
    assert_equal url.is_valid_url?, true, "valid Url"
  end

  test "is_valid_url? should return false for non-valid url" do
    actual_url = "ABCD"
    url = UrlGenerator.new(actual_url)
    assert_equal url.is_valid_url?, false, "valid Url"
  end
end
