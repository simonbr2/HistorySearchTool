# dependency: sqlite3
# sqlite 3 can be installed using 'sudo apt-get install sqlite3'

puts "=> Welcome to the internet search history widget!"
puts "=> Which keyword or phrase would you like to search for?"

keywords = gets.chomp.downcase

def keyword_finder(keywords, url, hash)
  # system('clear')
  counter = `curl -s #{url}`.downcase.scan(keywords).length
  # puts "your keyword '#{keywords}' appears #{counter} times in the following url:"
  # puts "#{url}"
  if counter > 0
    hash["#{url}"] = counter
  end
end

def history_iterator(keywords)
  positive_hits = Hash.new
  history = `(cd ~/.mozilla/firefox; for a in */places.sqlite; do sqlite3 $a "select h.visit_date,p.url from moz_historyvisits as h, moz_places as p where p.id == h.place_id order by h.visit_date"; done)`.split('|')
  history.each do |link|
    # p positive_hits.sort { |a1,a2| a2[1] <=> a1[1] }
    keyword_finder(keywords, link, positive_hits)
    # enter_to_continue
  end
  p positive_hits.sort { |a1,a2| a2[1] <=> a1[1]  }
end

def enter_to_continue
  puts "press enter to proceed"
  gets.chomp
end

history_iterator(keywords)