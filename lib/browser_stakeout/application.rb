class BrowserStakeout
  class Application
    class << self
      def run!(*arguments)
        options = BrowserStakeout::Options.new(arguments)
        
        if options[:invalid_argument]
          $stderr.puts "Invalid argument: #{options[:invalid_argument]}"
          options[:show_help] = true
        end

        if options[:show_help]
          $stderr.puts options.opts
          return 1
        end
        
        unless options.files.size >= 1
          $stderr.puts "broken"
          $stderr.puts options.opts
          return 1
        end

        files = build_mtimes_hash(options.files)

        trap('INT') do
          puts "\nIt's quittin time..."
          exit
        end

        # Check to see if the file being refreshed is on the files list.
        index_file = options.find_index(files)

        puts %{#{File.basename($0)} is reporting for duty! 
        Currently watching #{files.collect {|k,v| File.basename(k)}.join(', ')}\n\n}

        loop do
          sleep 1
        
          changed_file, last_changed = files.find do |file, last_changed|
            File.mtime(file) > last_changed
          end
        
          if changed_file
            files[changed_file] = File.mtime(changed_file)
            puts "#{Time.now} => #{File.basename(changed_file)} changed"
            options.browsers.each do |b|
              system("#{options[:command]} -a #{b} #{index_file||changed_file}")
            end
          end
        end
      end

      def build_mtimes_hash(arguments)
        files = {}
        arguments.each do |a|
          Dir[a].each do |file|
            files[file] = File.mtime(file)
          end
        end
        files
      end
    end
  end
end