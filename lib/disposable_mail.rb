module DisposableMail

  MAILS_LIST = 'data/disposable-email-domains/disposable_email_blacklist.conf'.freeze

  class << self
    # Returns a list with the disposable mail domains
    def list
      @list ||= File.new(File.expand_path(File.join(File.dirname(__FILE__), '..', MAILS_LIST))).readlines.map(&:strip)
    end

    # Check if a mail is disposable (if it's domain is in the list)
    def include?(mail)
      list.include?(mail[/@(.+)/, 1])
    end
  end
end
