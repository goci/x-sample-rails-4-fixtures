require 'spec_helper'

describe Post do
  let(:fixture) { File.open(File.dirname(__FILE__) + "/../fixtures/post.txt") }
  let(:fixture_unicode) { File.open(File.dirname(__FILE__) + "/../fixtures/À♛.txt") }
  let(:fixture_unicode_2) { File.open(File.dirname(__FILE__) + "/../fixtures/banièrebetalogo3 ][ (1).txt") }
  subject { post }

  context "with unicode" do
    let(:post) { Post.new(title: 'post', body: File.read(fixture_unicode)) }
    its(:body) { should eq('♜Ƈ') }
  end

  context "with unicode 2" do
    let(:post) { Post.new(title: 'post', body: File.read(fixture_unicode_2)) }
    its(:body) { should eq('Hey.') }
  end

  context "with ascii" do
    let(:post) { Post.new(title: 'post', body: File.read(fixture)) }
    its(:body) { should eq('Hey, How are you?') }
  end
end
