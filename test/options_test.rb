require 'test_helper'

class TestOptions < Test::Unit::TestCase

  def setup_options(*arguments)
    @options = BrowserStakeout::Options.new(arguments)
  end
  
  def self.for_options(*options)
    context options.join(' ') do
      setup { setup_options *options }
      yield
    end
  end

  context "default options" do
    setup { setup_options }

    should 'refresh Safari' do
      assert @options[:safari]
    end

    should 'not refresh Firefox' do
      assert !@options[:firefox]
    end

    should 'try to refresh index.htm[l]? by default' do
      assert_equal "index\.htm[l]?", @options[:index]
    end
    
    should 'refresh using the osx open command by default' do
      assert_equal 'open -g', @options[:command]
    end
  end
  
  for_options '--firefox' do
    should 'refresh Firefox' do
      assert @options[:firefox]
    end
  end

  for_options '--help' do
    should 'show help' do
      assert @options[:show_help]
    end
  end

  for_options '-h' do
    should 'show help' do
      assert @options[:show_help]
    end
  end
  
  for_options '--invalid' do
    should 'be an invalid argument' do
      assert @options[:invalid_argument]
    end
  end
  
  new_index = 'foo.html'
  for_options "--index", new_index do
    should "try to refresh #{new_index}" do
      assert_equal new_index, @options[:index]
    end
  end

  new_index = 'foo.html'
  for_options "-i", new_index do
    should "try to refresh #{new_index}" do
      assert_equal new_index, @options[:index]
    end
  end
end
