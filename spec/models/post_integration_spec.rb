require_relative '../spec_helper_full'
require_relative '../../config/initializers/blog'

describe Post do
  include SpecHelpers
  before do
    setup_database
    @blog = Blog.new
  end

  after do
    teardown_database
  end

  def make_post(attrs)
    attrs[:title] ||= "Post #{attrs.hash}"
    post = @blog.new_post(attrs)
    post.publish.must_equal(true)
    post
  end


  it "defaults body to 'Nothing to see here'" do
    post = make_post(body: '')  #make_post does not exist?
    post.body.must_equal("Nothing to see here")
  end
end
