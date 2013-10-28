class HomeController < ApplicationController
  def index
  end


  def download

  	if params[:file_id] == "2"
  		@filename ="/Volumes/Rohan\'s\ Third\ HDD/DCMP3/05\ Numb\ \[LOVER\'s\].mp3"
  	else
  		@filename ="/Volumes/Rohan\'s\ Third\ HDD/DCMP3/05\ Izzo-In\ The\ End\ \[LOVER\'s\].mp3"
  		
  	end


	send_file(@filename, :filename => "test2.mp3", :type=>"audio/mp3")

  end

end
