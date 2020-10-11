RSpec.describe 'Instance of', Sentiment::HttpRequest do

  subject{ Sentiment::HttpRequest.new text: "shit" }

  context 'should respond to' do
    it('#uri'){ expect(subject.respond_to? :uri).to be_truthy }
    it('#protocol'){ expect(subject.respond_to? :protocol).to be_truthy }
    it('#request'){ expect(subject.respond_to? :request).to be_truthy }
  end

  describe '#start' do
    context 'with text' do
      it 'should return an instance of Net::HTTPOK' do
        expect(subject.start).to be_kind_of(Net::HTTPOK)
      end
    end

    context 'with no text' do
      subject{ Sentiment::HttpRequest.new text: "" }

      it 'should generate an internal server error instance' do
        expect(subject.start).to be_kind_of(Net::HTTPInternalServerError)
      end
    end
  end
end