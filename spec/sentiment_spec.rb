RSpec.describe SentimentAl do
  it "has a version number" do
    expect(SentimentAl::VERSION).not_to be nil
  end
end

RSpec.describe sentiment_al do
  it "should be SentimentAl::Service" do
    expect(sentiment_al).to be(SentimentAl::Service)
  end
end
