class Item
  attr_reader :genre, :archived
  attr_accessor :publish_date, :source, :author, :label, :items

  def initialize(publish_date)
    @archived = false
    @author = nil
    @source = nil
    @label = nil
    @genre = nil
    @items = []
    @publish_date = publish_date
  end

  def can_be_archived?
    result = Time.now.year - @publish_date
    result > 10
  end
  private :can_be_archived?
  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
