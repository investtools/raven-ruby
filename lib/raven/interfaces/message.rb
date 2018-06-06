require 'raven/interface'

module Raven
  class MessageInterface < Interface
    attr_accessor :message, :params

    def initialize(*arguments)
      self.params = []
      super(*arguments)
    end

    def unformatted_message
      begin
        Array(params).empty? ? message : message % params
      rescue
        "#{message} % #{params}"
      end
    end

    def self.sentry_alias
      :logentry
    end
  end
end
