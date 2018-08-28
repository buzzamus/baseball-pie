class Game < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
def self.import(file)
  CSV.foreach(file.path, headers: true) do |line|
    if line[6] == "CHN"
    Game.create(park: line[6], home_team: "Chicago National", away_team: "#{line[3]} #{line[4]}", home_homeruns: line[53], away_homeruns: line[25], total_homeruns: (line[53] + line[3]))
    end
    # do a case statement to translate each team name, park
  end
end

  def set_homeruns(arg)
    self.homeruns += arg
  end
end


# def self.my_import(file)
#   seasons = []
#   CSV.open(file.path, col_sep: ",").each do |line|
#     if line[6] == "CHN"
#       self.set_homeruns(line[53].to_i)
#     #seasons << Season.new(row[55].to_h)
#     end
#     if line[3] == "CHN"
#       self.set_homeruns(line[25].to_i)
#     end
#   end
#   Season.import seasons, recursive: true
# end
