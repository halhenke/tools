# -*- coding: utf-8 -*-
# ======================================================================
# A CHEAP WAY TO LOAD PRY INSTEAD OF IRB WITHOUT MODIFYING RAILS IN PARTICULAR
# ======================================================================
if %x(uname) =~ /Linux/
  begin
    require "pry"
    Pry.start
    exit
  rescue LoadError => e
    warn "=> Unable to load pry"
  end
end


# -*- coding: utf-8 -*-
# IRB.conf[:PROMPT][:DEMO] = {:PROMPT_I => "normal> ", :PROMPT_S => "string_continue> ", :PROMPT_C => "statement_continue> ", :PROMPT_N => "indent> ", :RETURN => "<< %s >>\n" }
# IRB.conf[:PROMPT][:DEFAULT][:PROMPT_I] = "bacon"
# require ‘irb/ext/save-history’
#require ‘irb/ext/save-history’IRB.conf[:SAVE_HISTORY] = 2000IRB.conf[:HISTORY_FILE] = “#{ENV['HOME']}/.irb-history”

# Enable auto-completion in irb
require 'irb/completion'

# Makes output look great
require "awesome_print"
AwesomePrint.irb!

# MetaProgramming Methods
require "~/code/myLib/Ruby/meta_methods"
include MetaMethods

# If we are running rails console then store command history in the Rails app, directory
IRB.conf[:SAVE_HISTORY] = 100000
if defined? Rails
  puts "You are running Rails in #{Rails.env}"
  # Really should put development files in their own file also but this will be backwards compatible for now
  if Rails.env == "development"	
    puts "Using a generic Rails console history file" + "#{Rails.root}/.rails-console-history"	
    IRB.conf[:HISTORY_FILE]     = "#{Rails.root}/.rails-console-history"
  else
    puts "Using an environment specific Rails console history file: " + "#{Rails.root}/.rails-console-#{Rails.env}-history"	
    IRB.conf[:HISTORY_FILE]     = "#{Rails.root}/.rails-console-#{Rails.env}-history"
  end
else
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
end


