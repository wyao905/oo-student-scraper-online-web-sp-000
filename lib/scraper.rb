require 'open-uri'
require 'pry'

class Scraper
  @@students = []
  @@student_info = []
  
  def self.students
    @@students
  end
  
  def self.student_info
    @@student_info
  end
  
  def self.scrape_index_page(index_url)
    html = Nokogiri::HTML(open(index_url))
    html.css(".student-card a").each do |student|
      students << {:name => student.css("h4.student-name").text,
                   :location => student.css("p.student-location").text,
                   :profile_url => student.values[0]}
    end
    students
  end

  def self.scrape_profile_page(profile_url)
<<<<<<< HEAD
    student_info = {}
    student = Nokogiri::HTML(open(profile_url)).css(".social-icon-container a")
    student.each do |info|
      if info.values[0].include?("twitter")
        student_info[:twitter] = info.values[0]
      elsif info.values[0].include?("linkedin")
        student_info[:linkedin] = info.values[0]
      elsif info.values[0].include?("github")
        student_info[:github] = info.values[0]
      elsif info.values[0] != ""
        student_info[:blog] = info.values[0]
      end
    end
    student_info[:profile_quote] = Nokogiri::HTML(open(profile_url)).css(".profile-quote").text
    student_info[:bio] = Nokogiri::HTML(open(profile_url)).css("p").text
    student_info
=======
    student = Nokogiri::HTML(open(profile_url)).css(".social-icon-container a")
    binding.pry
    student_info << {:twitter => student[0].values[0],
                     :linkedin => student[1].values[0],
                     :github => student[2].values[0],
                     :blog => "",
                     :profile_quote => "",
                     :bio => ""}
>>>>>>> 0cddf3298f1115a728e592d9ae804f73d027eb0e
  end
end