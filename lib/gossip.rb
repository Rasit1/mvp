require "csv"
require "pp"

class Gossip
	attr_accessor :author, :content, :myhash, :all_gossips

	def initialize(author, content)
		@author = author
		@content = content
	end
	def save
		@myhash = Hash.new
		@myhash[@author] = @content
		CSV.open("db/gossip.csv", "a") do |csv|
			@myhash.to_a.each {|elem| csv << elem}
		end
	end
	def destroy
		table = CSV.table("db/gossip.csv")
		table.delete_if do |row|
  			row[:params] == 'true'
  		end
	end
	def self.all
      @my_csv = CSV.read("db/gossip.csv")
  	  puts @my_csv.inspect
	end
end
