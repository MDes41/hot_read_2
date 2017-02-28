class HandleRead


  def self.add_or_subtract(json, read)
    if(json['read'] == true)
      read.count += 1
      read.save
    else
      read.count -=1
      read.save
    end
  end
end