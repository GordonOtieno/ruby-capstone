class Item
    attr_accessor :publish_date, :source, :author, :label
    attr_reader :genre, :archived
    def initialize(publish_date)
        @id=Random.rand (1..100),
        @archived =false
        @author = nil
        @source = nil
        @label = nil
        @genre = nil
        @publish_date = publish_date

    end
    
    def can_be_archived? 
        result = Time.now.year - @publish_date
        result>10 
    end
    private :can_be_archived?
    def move_to_archive
        @archived = true if can_be_archived?
    end
    def genre = (genre)
        @genre=genre
        genre.items.push(self) unless genre.items.include?(self)
end
instance_item = Item.new("23/4/2022")