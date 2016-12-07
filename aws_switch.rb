#!/usr/bin/env ruby

# This is a utility to allow you to easily switch AWS profiles and populate the
# standard AWS environment variables in your current shell.
#
# Installing this tool:
#
# 1. Set up AWS profiles by running:
#     aws configure --profile prod
#     aws configure --profile dev
#     etc.
#
# 2. Add this to your ~/.bash_profile
#     export PATH="${PATH}:/path_to_this_script"
#
# 3. Add this to your ~/.bashrc
#     function aws_switch { source <(aws_switch.rb $1 $2); }
#
# Usage:
#     aws_switch [AWS profile] [AWS region]
#
# Example:
#     aws_switch dev us-east-1

require 'inifile'

configs = IniFile.load(File.join(File.expand_path('~'), '.aws', 'credentials'))

id = configs["#{ARGV[0]}"]['aws_access_key_id']
key = configs["#{ARGV[0]}"]['aws_secret_access_key']

puts "export AWS_ACCESS_KEY_ID=#{id}"
puts "export AWS_SECRET_ACCESS_KEY=#{key}"
puts "export AMAZON_ACCESS_KEY_ID=#{id}"
puts "export AMAZON_SECRET_ACCESS_KEY=#{key}"
puts "export AWS_ACCESS_KEY=#{id}"
puts "export AWS_SECRET_KEY=#{key}"
if "#{ARGV[1]}" != ''
  puts "export AWS_REGION=#{ARGV[1]}"
end
