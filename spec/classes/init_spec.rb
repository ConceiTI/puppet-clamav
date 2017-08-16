require 'spec_helper'
describe 'clamav' do
  context 'with default values for all parameters' do
    it { should contain_class('clamav') }
  end
end
