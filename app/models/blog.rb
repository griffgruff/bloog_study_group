class Blog
  attr_writer :post_source

  def initialize(entry_fetcher=Post.public_method(:all))
    @entry_fetcher = entry_fetcher
  end

  def title
    "watching paint dry"
  end

  def subtitle
    "The trusted source for drying paint"
  end

  def new_post(*args)
    post_source.call(*args).tap do |p|
      p.blog = self
    end
  end

  def add_entry(entry)
    entry.save
  end

  def entries
    fetch_entries.sort_by{|e| e.pubdate}.reverse.take(10)
  end

  def post_source
    @post_source ||= Post.public_method(:new)
  end

  private

  def fetch_entries
    @entry_fetcher.()
  end


end
