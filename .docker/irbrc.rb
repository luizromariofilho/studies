# frozen_string_literal: true

require 'awesome_print'
require 'irb/ext/save-history'

AwesomePrint.irb!

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['PWD']}/.irb-history"
