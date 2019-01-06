require 'net/http'
require 'json'

page = ARGV[0] || 1
per_page = ARGV[1] || 30

res_csv = ''
res = Net::HTTP.get(URI.parse("https://api.github.com/repos/rails/rails/issues?page=#{page}&per_page=#{per_page}"))
issues = JSON.parse(res)
issues.each do |i|
  res_csv += "#{i['title'].slice(0, 30)},#{i['body'].slice(0, 50)},#{i['comments_url']}\n"
end

print res_csv
