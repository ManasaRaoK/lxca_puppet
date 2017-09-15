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

describe Puppet::Type.type(:lxca_configprofile) do

  before do
    @configprofile_example = {
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
    }
   
    @provider = stub('provider', :class => described_class.defaultprovider, :clear => nil)
    described_class.defaultprovider.stubs(:new).returns(@provider)
  end

  it "should have :name be its namevar" do
    described_class.key_attributes.should == [:name]
  end

  describe "when validating attributes" do
    [:name, :provider, :host, :port, :login_user, :login_password, :verify_ssl].each do |param|
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
      expect { described_class.new(:name => 'lxca_configprofile', :ensure => 'foo') }.to raise_error(Puppet::Error, /Invalid value "foo"/)
    end

    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile')[:ensure].should == nil
    end
    
  end

  describe "for host" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile')[:host].should == nil
    end
  end

  describe "for port" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile')[:port].should == nil
    end
  end

  describe "for login_user" do
    it "should not have a default value" do
        described_class.new(:name => 'lxca_configprofile')[:login_user].should == nil
    end
  end

  describe "for login_password" do
    it "should not have a default value" do
        described_class.new(:name => 'lxca_configprofile')[:login_password].should == nil
    end
  end

  describe "for verify_ssl" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile')[:verify_ssl].should == nil
    end
  end

  describe "for auth_type" do
    it "should have a default value of 'basic_auth" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'discover_all')[:auth_type].should == 'basic_auth'
    end
  end

  describe "for csrf_token" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile')[:csrf_token].should == nil
    end
  end

  describe "for id" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'filter_by_id')[:id].should == nil
    end
  end

  describe "for id" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'rename_configprofile')[:id].should == nil
    end
  end

  describe "for profile_name" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'rename_configprofile')[:profile_name].should == nil
    end
  end

  describe "for id" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'activate_configprofile')[:id].should == nil
    end
  end

  describe "for endpoint_uuid" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'activate_configprofile')[:endpoint_uuid].should == nil
    end
  end

  describe "for restart" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'activate_configprofile')[:restart].should == nil
    end
  end

  describe "for id" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'unassign_configprofile')[:id].should == nil
    end
  end

  describe "for power_down" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'unassign_configprofile')[:power_down].should == nil
    end
  end

  describe "for reset_imm" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'unassign_configprofile')[:reset_imm].should == nil
    end
  end

  describe "for force" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'unassign_configprofile')[:force].should == nil
    end
  end

  describe "for id" do
    it "should not have a default value" do
      described_class.new(:name => 'lxca_configprofile', :ensure => 'delete_configprofile')[:id].should == nil
    end
  end

end 
