#!/usr/bin/env ruby

require 'cgi'
require 'stringio'
require 'learn_to_program_tutorial'

cgi = CGI.new

LearnToProgramTutorial.handle_request cgi