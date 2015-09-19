#---
# Excerpted from "Ruby on Rails, 2nd Ed."
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.editions-eyrolles.com/Livre/9782212120790/ for more book information.
#---
Dir["**/*.rb"].each do |f|
#[  "rails/activerecord/lib/active_record/base.rb" ] .each do |f|
  state = :looking
  comment = []
  File.foreach(f) do |line|
#    puts "#{state}: #{line}"
    case line
    when /^\s*#/
      unless state == :comment
        comment = []
        state = :comment
      end
      comment << line
      
    when /^\s*$/
      ;
      
    when /cattr_accessor/
      puts f
      if state == :comment
        puts comment
      end
      puts line
      puts "\n\n"
      state = :looking
    
    when /\bconfig\./
      puts f
      puts "+++" + line
      puts "\n\n"
      
    else
      state = :looking
    end
    
  end
end