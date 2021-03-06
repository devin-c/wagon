require 'wagon/directory'

module Wagon
  class Ward < Page
    def name
      @name ||= self.at('a.channeltitle[href^="/units/home"]').inner_text.strip
    end
    
    def ward_id
      @ward_id ||= @url.sub(%r{^.+\-(\d+),\d+\.html$}, '\1')
    end
    
    def directory_path
      @directory_path ||= "/units/a/directory/photoprint/1,10357,605-1-7-#{ward_id},00.html"
    end
    
    def directory
      @directory ||= Directory.new(connection, directory_path, self)
    end
    
    def households
      directory.households
    end
    
    def members
      households.collect(&:members).flatten()
    end
    
    def to_pdf(options)
      directory.to_pdf(options)
    end
  end
end
