namespace :scraping do
  require 'open-uri'
  require 'nokogiri'
  require 'capybara'
  require 'capybara/poltergeist'

  desc ""
  task :artist_info => :environment do

    #Capybara.register_driver :chrome do |app|
      #Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :timeout => 1000 })
    #end

    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :chrome)
    end
    Capybara.default_selector = :xpath
    session = Capybara::Session.new(:selenium)
    #session.driver.headers = { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

    url = 'http://lead-idol.com/'
    charset = nil
    session.visit url
    #入力
    session.fill_in('idolSuggest',:with=>'愛乙女☆DOLL')
    #タブクリック
    session.find(:xpath, '//ul/li', match: :first).text
    #検索クリック
    # session.click_on('ng-pristine')
    #session.html
    #nokogiri
    #each → info
    # loop do
    #   doc = Nokogiri::HTML.parse(session.html, nil, charset)
    #   doc.css('.event-list').each do |item|
    #     title = item.css('.title').text
    #     position = item.css("//span[@class='ng-scope']").text
    #   end
    #   # session.find("//li[@class='u-cf']").each do |node|
    #   #   p node.css("span[@class='ng-binding']").text
    #   # end
    #   session.find("//p[@class='next']").click
    # end
  end
end
