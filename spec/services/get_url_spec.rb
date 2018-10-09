require 'rails_helper'

describe GetUrl do
  context '.by_environment' do
    subject { described_class.by_environment }

    context 'test env' do
      before { Rails.env.stub(:test? => true)}
      it 'returns local url' do
        expect(subject).to eq 'http://localhost:3000/api/v1'
      end
    end

    context 'development env' do
      before { Rails.env.stub(:development? => true) }
      it 'returns local url' do
        expect(subject).to eq 'http://localhost:3000/api/v1'
      end
    end

    context 'production env' do
      before { Rails.env.stub(:production? => true)}
      it 'returns heroku url' do
        expect(subject).to eq 'https://limitless-taiga-55796.herokuapp.com/'
      end
    end
  end
end
