class BrowserStakeout
  class Browsers
    class Firefox
      class << self
        def refresh(filename)
          "open -g -a Firefox.app #{filename}"
        end
      end
    end
  end
end