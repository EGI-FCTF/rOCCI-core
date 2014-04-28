module Occi
  module Core
    describe Resource do
      let(:resource){ resource = Occi::Core::Resource.new 
        resource.link target
        resource.attributes.occi!.core!.summary = "Resource Summary"
        resource }
      let(:target){ target = Occi::Core::Resource.new }
      
      context '#link' do
        it "creates the appropriate No. of links" do
          expect(resource.links).to have(1).link
        end

        it "has the correct kind" do
          expect(resource.links.first).to be_kind_of Occi::Core::Link
        end

        it 'sets the right target' do
          expect(resource.links.first.target).to eql target.to_s
        end
      end

      context '#summary' do
        it 'gets the summary attribute corectly' do
          expected = "Resource Summary"
          expect(resource.summary).to eql expected
        end
      end
    end
  end
end
