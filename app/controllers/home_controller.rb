class HomeController < ApplicationController
  def index
  	@filename ="/Users/rohanraja/Documents/Rails_Projects/development/songsite/public/audios/didi.mp3"

	send_file(@filename, :filename => "test2.mp3")
  end
end
