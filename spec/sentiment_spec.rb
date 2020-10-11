RSpec.describe Sentiment do
  it "has a version number" do
    expect(Sentiment::VERSION).not_to be nil
  end
end

RSpec.describe sentiment_al do
  it "should be Sentiment::Service" do
    expect(sentiment_al).to be(Sentiment::Service)
  end
end
