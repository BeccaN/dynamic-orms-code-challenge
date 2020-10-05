class Agent < InterActive
    # Agent has many Listings
    attr_reader :id
    attr_accessor :telephone, :yrs_experience, :name 
    
    def listings 
      Listing.all.select {|listing| listing.agent == self}
    end   
    
    def add_listing(location, price, status)
      new_listing = Listing.new(location, price, status)
      new_listing.agent = self
    end   
  
    def self.create_table
      sql = <<-SQL
      CREATE TABLE IF NOT EXISTS agents (
          id INTEGER PRIMARY KEY,
          name TEXT,
          telephone TEXT,
          yrs_experience INTEGER,
      )
      SQL
  
      DB[:conn].execute(sql)
  end
  

  
  end  