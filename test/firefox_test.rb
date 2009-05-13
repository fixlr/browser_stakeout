require 'test_helper'

class TestFirefoxBrowser < Test::Unit::TestCase

  context "foo.txt" do
    setup do
      @browser = BrowserStakeout::Browsers::Firefox
    end
    
    should "refresh foo.txt" do
      assert_equal "open -g -a Firefox.app foo.txt", @browser.refresh("foo.txt")
    end
  end
end
