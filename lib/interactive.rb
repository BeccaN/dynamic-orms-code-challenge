class InterActive
    def initialize(hash = {})
      hash.each do |key, value|
        self.send("#{key}=", value)
      end 
    end 

    def save
        sql = <<-SQL
        INSERT INTO #{self.class.to_s.downcase}s (self.instance_variables.map {|key| key.to_s.gsub("@", "")}.join(", "))
        VALUES (("?, " * self.instance_variables.count).chomp(", "))
        SQL
        binding.pry
        DB[:conn].execute(sql, *self.instance_variables.map {|key| self.send(key.to_s.gsub("@", ""))})
        
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM agents")[0][0]
    end
end 