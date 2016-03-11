require 'bundler/gem_tasks'

task :test do
  $LOAD_PATH.unshift('lib', 'test')
  require './test/disposable_mail_tests.rb'
end

task default: :test

namespace :disposable_mail do
  desc "outputs the current disposable domains"
  task :puts_domains do
    blacklist_path = 'data/disposable-email-domains/disposable_email_blacklist.conf'
    blacklist = File.expand_path(File.join(File.dirname(__FILE__), blacklist_path))
    puts File.new(blacklist).readlines.map(&:strip).to_s.gsub(/,/, ",\n")
  end
end
