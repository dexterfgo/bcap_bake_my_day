require 'fileutils'
require 'date'
require 'logger'

class Tracer
	def self.log
		if @logger.nil?
			@logger = Logger.new(@filename, Logger::DEBUG)
		end
		@logger
	end

	def self.create (debug)
		@dbg = debug

		pwd = Dir.pwd.split('/').last.to_s

		# Do not store in lib.
		if pwd == "lib"
			path = "../log/"
		else
			path = "./log/"
		end

		if @dbg
			path += "debug"
		else
			path += "prod"
		end
				
		unless File.directory?(path)
			FileUtils.mkdir_p(path)
			puts path + " created." if @dbg
		end
			
		@filename = path + "/" + DateTime.now.to_s.sub('/','_') + ".log"

		puts @filename if @dbg
	end

	def self.flash(display_string)
		self.log.unknown(display_string)
		puts display_string
	end

	def self.prompt(display_string)
		self.log.unknown(display_string)
		print display_string
	end

	def self.info(info_string)
		self.log.info(info_string)
		puts info_string
	end

	def self.debug(debug_string)
		self.log.debug(debug_string)
		puts debug_string if @dbg
	end

	def self.warn(warn_string)
		self.log.warn(warn_string)
		puts warn_string if @dbg
	end
end