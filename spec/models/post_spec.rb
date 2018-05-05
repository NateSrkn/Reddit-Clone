require 'rails_helper'

RSpec.describe Post, type: :model do
  # Creates new instance of the Post class
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body")}

  # Testing to see whether post has title and body.
  describe "attributes" do 
    it "has title and body attributes" do
      expect(post).to have_attributes(title:"New Post Title", body: "New Post Body")
    end
  end
end
