module Load

  def loadMap(map)
    x = Array.new
    begin
      File.open(map) do |f|
        while (line = f.gets)
          line = line.chomp
          y = Array.new
          for char in line.split(',')
            y << char
          end
          x << y
        end

      end
    rescue 
      puts "File does not exist or is corrupt"
    end

    return x
  end

end



