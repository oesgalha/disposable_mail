require 'bundler/gem_tasks'

task :test do
  $LOAD_PATH.unshift('lib', 'test')
  require './test/disposable_mail_tests.rb'
end

task default: :test

namespace :disposable_mail do
  desc "outputs the current disposable domains"
  task :update do
    # Update submodule
    system("cd data/disposable-email-domains; git pull")

    # Parse list
    blacklist_path = 'data/disposable-email-domains/disposable_email_blocklist.conf'
    new_list = File.readlines(blacklist_path).map(&:strip).sort.to_s.gsub(",", ",\n     ")
    new_list = new_list.sub("]", "\n    ]")
    new_list = new_list.sub("[", "[\n      ")

    # Rewrite the ruby file
    ruby = File.read("lib/disposable_mail/disposable.rb")
    ruby.sub!(/\[.+?\]/m, new_list)
    File.write("lib/disposable_mail/disposable.rb", ruby)
  end
end
