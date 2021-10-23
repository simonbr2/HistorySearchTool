# the code below fetches the HTML code from the url in the 'url' variable and places it in the "TempWebsiteURLs" folder
# system("wget #{url} -P TempWebsiteURLs ")
puts "=> Welcome to the internet search history widget!"
puts "=> Which keyword or phrase would you like to search for?"

keywords = gets.chomp.downcase
url = "https://stackoverflow.com/questions/3742983/how-to-get-the-contents-of-a-webpage-in-a-shell-variable"

def keyword_finder(keywords, url)
  system('clear')
  counter = `curl -s #{url}`.downcase.scan(keywords).length
  puts "your keyword '#{keywords}' appears #{counter} times in the following url:"
  puts "#{url}"
end

keyword_finder(keywords,url)
