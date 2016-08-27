namespace :scraping do
  require 'open-uri'
  require 'nokogiri'
  require 'capybara'
  require 'capybara/poltergeist'
  require 'geocoder'

  desc ""
  task :artist_info => :environment do

    Geocoder.configure(:language  => :ja,	:units => :km)

    #Capybara.register_driver :chrome do |app|
    #Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :timeout => 1000 })
    #end

    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    Capybara.default_selector = :xpath
    session = Capybara::Session.new(:selenium)
    #session.driver.headers = { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }
    number = 1
    charset = nil
    loop do
      url = "http://lead-idol.com/search/result?idolIds%5B%5D=#{number}"
      number += 1
      session.visit url
      current_position = 0
      loop do
        session.execute_script("window.scroll(#{current_position},#{current_position + 300});")
        current_position += 300
        sleep(1)
        if current_position >= 5000
          break
        end
      end
      doc = Nokogiri::HTML.parse(session.html, nil, charset)

      artist_name = doc.css('.idols').text.remove("\t").remove("\n")
      artist = Artist.create(:name => artist_name)


      doc.css('.event-list li.ng-scope').each do |item|
        title = item.css('.title').text
        positions = item.css('.u-cf div')[3].text.remove("\t").remove("\n")
        hybrid_positions = String.new
        until positions == hybrid_positions
          hybrid_positions = positions
          positions = positions.sub(/\(.*?\)/,"").strip
        end
        detail = item.css('.action-area').css('a').attribute('href').value
        detail_page = "http://lead-idol.com/#{detail}"
        date = item.css('.date.ng-binding').text.remove("\t").remove("\n").remove("(月)").remove("(火)").remove("(水)").remove("(木)").remove("(金)").remove("(土)").remove("(日)")
        artist.positions << Position.create(:event_title => title, :name => positions, :event_url => detail_page, :in_there_at => date)
      end
      if number > 1615
        break
      end
    end
  end
end
#ジオコーダー
#1615がmax
