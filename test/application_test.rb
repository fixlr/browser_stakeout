require 'test_helper'

class TestOptions < Test::Unit::TestCase
  def run_application(*arguments)
    original_stdout = $stdout
    original_stderr = $stderr
    
    fake_stdout = StringIO.new
    fake_stderr = StringIO.new
    
    $stdout = fake_stdout
    $stderr = fake_stderr
    
    result = nil
    begin
      result = BrowserStakeout::Application.run!(*arguments)
    ensure
      $stdout = original_stdout
      $stderr = original_stderr
    end
    
    @stdout = fake_stdout.string
    @stderr = fake_stderr.string
    
    result
  end
  
  def self.should_exit_with_code(code)
    should "exit with code #{code}" do
      assert_equal code, @result
    end
  end
  
  context "called without any args" do
    setup { @result = run_application }
    
    should_exit_with_code 1
    
    should 'display usage on stderr' do
      assert_match 'Usage:', @stderr
    end
    
    should 'not display anything on stdout' do
      assert_equal '', @stdout.squeeze.strip
    end
  end

  context "called with -h" do
    setup { @result = run_application }

    should_exit_with_code 1
    
    should 'display usage on stderr' do
      assert_match 'Usage:', @stderr
    end
    
    should 'not display anything on stdout' do
      assert_equal '', @stdout.squeeze.strip
    end
  end
      
  context "called with --invalid-argument" do
    setup do
      assert_nothing_raised do
        @result = run_application("--invalid-argument")
      end
    end
    
    should_exit_with_code 1
    
    should 'display invalid argument' do
      assert_match '--invalid-argument', @stderr
    end
    
    should 'display usage on stderr' do
      assert_match 'Usage:', @stderr
    end
    
    should 'not display anything on stdout' do
      assert_equal '', @stdout.squeeze.strip
    end
  end
end
