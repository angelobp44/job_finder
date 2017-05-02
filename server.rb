require 'sinatra'
require "httparty"
require 'nokogiri'
url = "https://www.indeed.com/jobs?q=software+engineer&l=Boca+Raton%2C+FL"

response = HTTParty.get url
# puts response.body


dom = Nokogiri::HTML(response.body)

get '/' do
  job_titles =

  dom.css('.jobtitle').map do |obj|
    obj.content
  end
  p job_titles
end 
