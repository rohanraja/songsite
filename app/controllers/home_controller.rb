class HomeController < ApplicationController
  def index
  end


  def download

  	sitem = SongItem.find(params[:file_id])

 	@filename = sitem.path

	send_file(@filename, :filename => "stream.mp3", :type=>"audio/mp3")

  end


  def crawl

  	require 'find'
  	require "mp3info"
 
	Find.find("/Volumes/Mlion/Users/") do |f|
   # print file and path to screen if filename ends in ".mp3"
   		#logger.info f if f.match(/\.mp3\Z/)
   		begin

	   		if f.match(/\.mp3\Z/)
	   			@filename = f.to_s
	   			logger.info @filename + "************"
	   			Mp3Info.open(@filename) do |mp3info|

	   				sng = SongItem.new

	   				sng.path = @filename

		   			sng.title = mp3info.tag.title
		   			sng.album = mp3info.tag.album
		   			sng.artist = mp3info.tag.artist
		   			sng.genre = mp3info.tag.genre_s

		   			sng.save	  			
			 	end

	   		end
	   	rescue

	   		logger.info "Error #{$!} with file : " + f

	   	end

   		
	end




  	render :text => @filename

  	#send_file(@filename, :filename => "testcrawl.mp3", :type=>"audio/mp3")
  end



    def searchq

	  	qry = params[:qry]

	    words = qry.split(' ')

	    qrystr = "title LIKE '%#{words[0]}%'"

	    words.each do |s|

	      if s.length > 1

	        qrystr += " AND title LIKE '%#{s}%'" 
	      end

	    end

	    @s_items = SongItem.where(qrystr).take(10)

	    logger.info @s_items.count

	    logger.info @s_items.to_yaml

	  	@q = qry

	  	render @s_items

	  	

	  

 	end


end
