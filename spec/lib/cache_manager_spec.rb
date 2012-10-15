require "spec_helper"

describe Fragmented::CacheManager do

  context "fetch list" do
    before :each do
      @cache = double("Cache")
      @manager = Fragmented::CacheManager.new(@cache)
    end

    it "should return empty array when all objects are cached" do
      @cache.stub!(:exist?).and_return(true)
      @manager.build_fetch_list([1,2,3]).should be_empty
    end

    it "should return the non existing members" do
      @cache.stub!(:exist?).and_return(true, true, false)
      @manager.build_fetch_list([1,2,3]).should == [3]
    end

    it "should generate the cache key with the given block" do
      @cache.should_receive(:exist?).with("a_1")

      @manager.build_fetch_list([1]) do |i|
        "a_#{i}"
      end
    end

    it "should simply pass the key without a block" do
      @cache.should_receive(:exist?).with(1)

      @manager.build_fetch_list([1])
    end
  end

end