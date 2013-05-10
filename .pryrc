# Makes output look great
require "awesome_print"
AwesomePrint.irb!

# MetaProgramming Methods
require "~/code/myLib/Ruby/meta_methods"
include MetaMethods

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
