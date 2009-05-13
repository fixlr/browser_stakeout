class BrowserStakeout
  class Browsers
    class Safari
      class << self
        def refresh(filename)
          "open -g -a Safari.app #{filename}"
        end
      end
    end
  end
end