require 'rspec'
require 'capybara'
require 'capybara/dsl'


module Integrations
	
	module ScanHelpers
		def open_page(post)
			visit post
		end
		
		def scan_page(link_text, file)
			#format timestamps
			log_time = Time.now.strftime('%Y-%m-%d')
			run_start = Time.now.strftime('%H:%M:%S')
			#create a log file using current date as the filename
			log_file = File.new(File.dirname(__FILE__) + "/logs/#{log_time}.log", "w")
			#write the start of the scan
			log_file.puts "Scan started on: #{run_start}\n\n"
			text = page.has_content?(link_text)
			begin
				while text == true
				#get the current URL
				url = URI.parse(current_url)
				puts "Checking: #{url}"
				log_page = "Keyword found in: #{url}\n"
				#reads from file and store
					array = File.read(file).split(",").map(&:strip)
					array.each do |key|
						scan = page.has_content?(key)
							if scan == true
								File.open(File.dirname(__FILE__) + "/logs/#{log_time}.log", "a") { |l| l.write(log_page)}
								puts log_page
							end
					end
				#click all the the links
				click_link(link_text)
				end
			#handling exceptions
			rescue 
				if text == false 
					raise ex
				end
			end
		end
	end
end


