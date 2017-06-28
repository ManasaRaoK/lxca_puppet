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

describe Puppet::Type.type(:lxca_node) do

  before do
    @node_example = {
      :base_url => 'https://10.243.10.75',
      :login_user => 'Admin',
      :login_password => 'Admin123',
      :verify_ssl => 'NONE',
    }
   
    @provider = stub('provider', :class => described_class.defaultprovider, :clear => nil)
    described_class.defaultprovider.stubs(:new).returns(@provider)
  end

  it "should have :name be its namevar" do
    described_class.key_attributes.should == [:name]
  end

  describe "when validating attributes" do
    [:name, :provider, :base_url, :login_user, :login_password].each do |param|
      it "should have a #{param} parameter" do
        described_class.attrtype(param).should == :param
      end
    end
  
    [:ensure].each do |prop|
      it "should have a #{prop} property" do
        described_class.attrtype(prop).should == :property
      end
    end
  end

  describe "for ensure" do
    it "should not support other values" do
      expect { described_class.new(:name => 'lxca_node', :ensure => 'foo') }.to raise_error(Puppet::Error, /Invalid value "foo"/)
    end

    it "should not have a default value" do
      described_class.new(:name => 'lxca_node')[:ensure].should == nil
    end
    
  end

  describe "for base_url" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_node')[:base_url].should == nil
    end
  end

  describe "for login_user" do
    it "should not have a default value" do
        described_class.new(:name => 'lxca_node')[:login_user].should == nil
    end
  end

  describe "for login_password" do
    it "should not have a default value" do
        described_class.new(:name => 'lxca_node')[:login_password].should == nil
    end
  end

  describe "for verify_ssl" do
    it "should support for a default value of 'NONE'" do
      described_class.new(:name => 'lxca_node', :ensure => 'discover_all')[:verify_ssl].should == 'NONE'
    end
  end
end 
