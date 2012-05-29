require "spec_helper"
require "objectify/config/injectables"

describe "Objectify::Config::Injectables" do
  before do
    @injectables = Objectify::Config::Injectables.new
  end

  it "accepts new resolvers" do
    @injectables.add_resolver(:a, :b)
    @injectables.get(:a).should == [:resolver, :b]
  end

  it "accepts new implementations" do
    @injectables.add_implementation(:a, :b)
    @injectables.get(:a).should == [:implementation, :b]
  end

  it "accepts new values" do
    @injectables.add_value(:a, :b)
    @injectables.get(:a).should == [:value, :b]
  end

  it "returns unknown if the value is unknown" do
    @injectables.get(:c).should == [:unknown, :c]
  end

  it "can merge configs" do
    @injectables = Objectify::Config::Injectables.new :a => [:implementation, :b]
    @injectables2 = Objectify::Config::Injectables.new :a => [:implementation, :c]
    @injectables.merge(@injectables2).get(:a).should == [:implementation, :c]
  end
end
