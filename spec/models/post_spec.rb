require 'spec_helper'

describe Post do
  let(:fixture) { File.open(File.dirname(__FILE__) + "/../fixtures/post.txt") }
  let(:post) { Post.new(title: 'post', body: File.read(fixture)) }
  subject { post }

  context "fixture loading" do
    it "should work" do
      p fixture
    end
  end

  its(:body) { should eq('Hey, How are you?') }
end
