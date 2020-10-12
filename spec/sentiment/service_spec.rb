RSpec.describe SentimentAl::Service do

  subject { SentimentAl::Service }

  describe '#call' do
    context 'bad request' do
      it 'empty text should generate a internal server error instance' do
        expect(subject.call(text: '').response).to be_kind_of(Net::HTTPInternalServerError)
      end

      it 'lost :text params should raise an Exception' do
        expect{ subject.call(salon: '').response }.to raise_error(Exception)
      end

      it 'no presence of params should raise an Exception' do
        expect{ subject.call.response }.to raise_error(Exception)
      end
    end

    context '200 OK request' do
      it 'should return SentimentAl::Service with the process' do
        expect(subject.call text: 'Shit').to be(SentimentAl::Service)
      end

      it 'should generate an #response method in singleton' do
        expect(subject.call(text: 'Shit').response).to be_kind_of(Net::HTTPOK)
      end
    end
  end

  describe '#successfully?' do
    it 'should return true if text param contain text' do
      expect(subject.call(text: 'Shit').successfully?).to be_truthy
    end

    it 'empty text should return false' do
      expect( subject.call(text: '').successfully? ).to be(false)
    end
  end
end