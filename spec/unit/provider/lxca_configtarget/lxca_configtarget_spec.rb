################################################################################
# <LENOVO COPYRIGHT TO BE INSERTED>
#
# <The below Apache License information to be reviewed by legal
# and modified if need be>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# You may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

require 'spec_helper'

describe Puppet::Type.type(:lxca_configtarget).provider(:lxca_configtarget) do

  before :each do
    described_class.stubs(:suitable?).returns true
    Puppet::Type.type(:lxca_configtarget).stubs(:defaultprovider).returns described_class
  end

  let :configtarget do
    Puppet::Type.type(:lxca_configtarget).new(
      :name => 'lxca_configtarget',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
    )
  end

  let :configtarget_with_id do
    Puppet::Type.type(:lxca_configtarget).new(
      :name => 'lxca_configtarget',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '65'
    )
  end

  describe "provider instance type" do
    it "with id should be an instance of provider ruby" do
      expect(configtarget_with_id.provider).to be_an_instance_of Puppet::Type.type(:lxca_configtarget).provider(:lxca_configtarget)
    end
  end

  describe "for ensurable filter_by_id" do
    it "should have id as a parameter" do
      expect {configtarget.provider.filter_by_id}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable filter_by_id/)
    end
  end

  describe "for filter_by_id" do
    it "should return an array as a result" do
      expect(configtarget_with_id.provider.filter_by_id).to be_instance_of(Array)
    end
  end

end
