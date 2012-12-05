require 'spec_helper'

describe List do

	it { should validate_presence_of(:work) }
	
	it 'changes the number of works' do
		list = List.new(work: 'estudiar')
		expect { list.save}.to change { List.count }.by(1)
	end

	it 'raises an error if saved without a work' do
		list = List.new
		expect { list.save! }.to raise_error(ActiveRecord::RecordInvalid)
	end
end