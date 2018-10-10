require 'rails_helper'

describe GetUrl do
  context '.by_environment' do
    subject { described_class.by_environment }

    context 'test env' do
      before { allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('test'))}
      it 'returns local url' do
        expect(subject).to eq 'http://localhost:3000/api/v1'
      end
    end

    context 'development env' do
      before { allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('development'))}
      it 'returns local url' do
        expect(subject).to eq 'http://localhost:3000/api/v1'
      end
    end

    context 'production env' do
      before { allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production'))}
      it 'returns heroku url' do
        expect(subject).to eq 'https://limitless-taiga-55796.herokuapp.com/'
      end
    end
  end
end
