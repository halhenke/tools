# Makes output look great
require "awesome_print"
AwesomePrint.pry!
# _pry_.refresh - if you change print method later you will have to call this

# MetaProgramming Methods
require "~/code/myLib/Ruby/meta_methods"
include MetaMethods
# ======================================================================
# RAILS STUFF

if defined? Rails
  # load Rails Console helpers like reload
  require 'rails/console/app'
  require 'rails/console/helpers'
  extend Rails::ConsoleMethods
  puts 'Rails Console Helpers loaded'
  
  # Lets try to get the history files going according to Rails status  
  puts "You are running Rails in #{Rails.env}"
  # Really should put development files in their own file also but this will be backwards compatible for now
  if Rails.env == "development"	
    puts "Pry is using a generic Rails console history file" + "#{Rails.root}/.rails-console-history"	
    Pry.config.history.file     = "#{Rails.root}/.rails-console-history"
  else
    puts "Pry is using an environment specific Rails console history file: " + "#{Rails.root}/.rails-console-#{Rails.env}-history"	
    Pry.config.history.file     = "#{Rails.root}/.rails-console-#{Rails.env}-history"
  end
else
  Pry.config.history.file = "#{ENV['HOME']}/.pry_history"
end

# ======================================================================

# ======================================================================
# Some Stuff I got off the InterWebs
# - mostly pedagogical it seems
# ======================================================================
# Pry.config.commands.import Pry::ExtendedCommands::Experimental

# Pry.config.pager = false
# Pry.config.color = false

# Pry.config.commands.alias_command "lM", "ls -M"

Pry.config.commands.command "add", "Add a list of numbers together" do |*args|
  output.puts "Result is: #{args.map(&:to_i).inject(&:+)}"
end

# Pry.config.history.should_save = false

Pry.config.editor = "emacs"

# A better prompt is something like this
# Pry.config.prompt = [ proc { |obj, nest_level, _| "#{obj}:#{nest_level}> " },
#                       proc { "     | " }]

Pry.config.prompt_name = File.basename(Dir.pwd)

# Disable pry-buggy-plug:
# Pry.plugins["buggy-plug"].disable!

# ======================================================================
