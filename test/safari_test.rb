require 'test_helper'

class TestSafariBrowser < Test::Unit::TestCase

  context "foo.txt" do
    setup do
      @browser = BrowserStakeout::Browsers::Safari
    end
    
    should "refresh foo.txt" do
      assert_equal "open -g -a Safari.app foo.txt", @browser.refresh("foo.txt")
    end
  end
end
