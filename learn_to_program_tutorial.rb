#! /usr/bin/env ruby


#-----------------------------------------------#
#               Learn to Program                #
#                 by Chris Pine                 #
#             Copyright (c) 2003-2006           #
#                 chris@pine.fm                 #
#-----------------------------------------------#


require 'cgi'
require 'stringio'

Dir.glob('learn_to_program_tutorial/*').each { |file| require file }

LINKADDR   = '/LearnToProgram/'
FRLTP_ADDR = 'http://pragmaticprogrammer.com/titles/fr_ltp'

class LearnToProgramTutorial
  include LearnToProgram
  include FormattingPage
  include Setup
  include Numbers
  include Letters
  include Variables
  include Conversion
  include Methods
  include FlowControl
  include Arrays
  include Classes
  include BlocksProcs
  include Beyond
  
  include Menu
  include Main      
end
