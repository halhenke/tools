# -*- coding: utf-8 -*-
# IRB.conf[:PROMPT][:DEMO] = {:PROMPT_I => "normal> ", :PROMPT_S => "string_continue> ", :PROMPT_C => "statement_continue> ", :PROMPT_N => "indent> ", :RETURN => "<< %s >>\n" }
# IRB.conf[:PROMPT][:DEFAULT][:PROMPT_I] = "bacon"
# require ‘irb/ext/save-history’
#require ‘irb/ext/save-history’IRB.conf[:SAVE_HISTORY] = 2000IRB.conf[:HISTORY_FILE] = “#{ENV['HOME']}/.irb-history”

# Makes output look great
require "awesome_print"
AwesomePrint.irb!

# If we are running rails console then store command history in the Rails app, directory
IRB.conf[:SAVE_HISTORY] = 10000
if defined? Rails
  puts "You are running Rails in #{Rails.env}"
  IRB.conf[:HISTORY_FILE] = "#{Rails.root}/.rails-console-history"
else
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
end
