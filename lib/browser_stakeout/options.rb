class BrowserStakeout
  class Options < Hash
    attr_reader :opts, :orig_args, :browsers, :files
    
    def initialize(args)
      super()
      
      @orig_args = args.clone
      self[:safari]  = true
      self[:firefox] = false
      self[:index]   = "index\.htm[l]?"
      self[:command] = "open -g"
      
      @opts = OptionParser.new do |o|
        o.banner = "Usage: #{File.basename($0)} [options] files-to-watch"
        
        o.on("-i", "--[no-]index FILENAME", 
                "Specify the file to refresh whenever changes are found") do |i|
          self[:index] = i
        end
        
        o.on("-s", "--[no-]safari", "Reload the page(s) in Safari") do |s|
          self[:safari] = s
        end
          
        o.on("-f", "--[no-]firefox", "Reload the page(s) in Firefox") do |f|
          self[:firefox] = f
        end
          
        o.on_tail("-h", "--help", "Show this message") do
          self[:show_help] = true
        end
      end
      
      begin
        @opts.parse!(args)
        @files = args
      rescue OptionParser::InvalidOption => e
        self[:invalid_argument] = e.message
      end
      

      # Decide which browsers need to be refreshed.
      # TODO: How can this be extended to include other browsers easily?
      @browsers = []
      @browsers << "Safari.app" if self[:safari]
      @browsers << "Firefox.app" if self[:firefox]
      raise "Zero browsers? Come on. Is that really what you want to do?" if @browsers.length == 0
    end
    
    def find_index(files)
      files.keys.find {|f| f =~ /#{self[:index]}/}
    end
  end
end