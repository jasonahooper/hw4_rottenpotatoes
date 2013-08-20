require 'spec_helper'

describe MoviesController do

  describe 'showing movies with same director' do
    it 'should call the model method that does the search' do
      Movie.should_receive(:find_same_director).with('1')
      get :same_director, {:id => '1'}
    end
    describe 'after successful search' do
      before :each do
        @fake_results = [double('movie1'), double('movie2')]
        Movie.stub(:find_same_director).with('1').
          and_return(@fake_results)
        get :same_director, {:id => '1'}
      end
      it 'should render the page with the search results' do
        response.should render_template('same_director')
      end
      it 'should make the search results available to the page' do
        assigns(:movies).should == @fake_results
      end
    end
  end
end
