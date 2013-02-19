class Helpers

  def self.populate_array_with_file_content(file_path)

    array = Array.new

    File.open(file_path).each do |line|
      array << line.to_i
    end
    return array
  end

end