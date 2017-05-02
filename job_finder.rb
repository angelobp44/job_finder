require 'sinatra'
require "httparty"
require 'nokogiri'


get '/' do
  job = params["job"]
    url = "https://miami.craigslist.org/search/#{job}"

  response = HTTParty.get url
  # puts response.body


  dom = Nokogiri::HTML(response.body)

  jobs_ary =
  dom.css('.hdrlnk').map do |el|
    el.content
  end

  jobs_ary
end
