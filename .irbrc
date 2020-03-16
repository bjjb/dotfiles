# frozen_string_literal: true

require 'irb/completion'
require 'irb/ext/save-history'

begin
  IRB.conf[:AUTO_INDENT] = true
  IRB.conf[:SAVE_HISTORY] = 200
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
rescue StandardError => e
  warn "There was an error configuring IRB : #{e}"
end
