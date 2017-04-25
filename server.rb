require 'Sinatra'
require "httparty"
url = "https://www.indeed.com/jobs?q=software+engineer&l=Boca+Raton%2C+FL"



response = HTTParty.get url
# puts response.body


dom = Sinatra::HTML(response.body)

job_titles =
  dom.css('.jobtitle').map do |obj|
    obj.content
  end
  p job_titles


  get '/' do
    "Hello! "
  end
  get '/' do
    "Welcome to my website!"
  end
