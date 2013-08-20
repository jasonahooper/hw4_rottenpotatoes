require 'spec_helper'

describe Movie do

  describe 'showing movies with same director' do
    fixtures :movies
    it 'should call the model method that does the search' do
      Movie.should_receive(:find_same_director).with('3')
      Movie.find_same_director('3')
    end
    describe 'after successful search' do
      it 'should return results of the search'do
        Movie.find_same_director('1').count.should == 2
      end
    end
    describe 'after unsuccessful search' do
      it 'should return empty results' do
        Movie.find_same_director('3').should be_nil
      end
    end
  end
end
