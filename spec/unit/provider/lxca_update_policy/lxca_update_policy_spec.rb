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

describe Puppet::Type.type(:lxca_update_policy).provider(:lxca_update_policy) do

  before :each do
    described_class.stubs(:suitable?).returns true
    Puppet::Type.type(:lxca_update_policy).stubs(:defaultprovider).returns described_class
  end

  let :update_policy do
    Puppet::Type.type(:lxca_update_policy).new(
      :name => 'lxca_update_policy',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
    )
  end
  
  let :update_policy_with_jobid do
    Puppet::Type.type(:lxca_update_policy).new(
      :name => 'lxca_update_policy',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :jobid => '5',
    )
  end

  let :update_policy_with_policy_name do
    Puppet::Type.type(:lxca_update_policy).new(
      :name => 'lxca_config_pattern',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :policy_name => 'test',
    )
  end

  let :update_policy_with_policy_name_and_type do
    Puppet::Type.type(:lxca_update_policy).new(
      :name => 'lxca_config_pattern',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :policy_name => 'test',
      :type => 'SERVER',
    )
  end

  let :update_policy_for_assign do
    Puppet::Type.type(:lxca_update_policy).new(
      :name => 'lxca_config_pattern',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :policy_name => 'test',
      :type => 'SERVER',
      :uuid => 'AB6C2B0F827811E29C8B3440B5EAB968',
      :auto_assign => 'true',
    )
  end

  let :update_policy_for_delete do
    Puppet::Type.type(:lxca_update_policy).new(
      :name => 'lxca_config_pattern',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :policy_name => 'test',
      :remove_package => 'true',
    )
  end

  describe "provider instance type" do
    it "without jobid, policy_name, type, uuid, auto_assign and remove_package should be an instance of provider ruby" do
      expect(update_policy.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_policy).provider(:lxca_update_policy)
    end
    it "with jobid should be an instance of provider ruby" do
      expect(update_policy_with_jobid.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_policy).provider(:lxca_update_policy)
    end
    it "with policy_name should be an instance of provider ruby" do
      expect(update_policy_with_policy_name.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_policy).provider(:lxca_update_policy)
    end
    it "with policy_name and type should be an instance of provider ruby" do
      expect(update_policy_with_policy_name_and_type.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_policy).provider(:lxca_update_policy)
    end
    it "with policy_name, type, uuid and auto_assign should be an instance of provider ruby" do
      expect(update_policy_for_assign.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_policy).provider(:lxca_update_policy)
    end
    it "with policy_name and remove_package should be an instance of provider ruby" do
      expect(update_policy_for_delete.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_policy).provider(:lxca_update_policy)
    end
  end

  describe "for ensurable discover_compare_results" do
    it "should have jobid as a parameter" do
      expect {update_policy.provider.discover_compare_results}.to raise_error(Puppet::Error, /Attribute jobid is mandatory for the ensurable discover_compare_results/)
    end
  end

  describe "for ensurable assign_compliance_policy" do
    it "should have policy_name as a parameter" do
      expect {update_policy.provider.assign_compliance_policy}.to raise_error(Puppet::Error, /Attribute policy_name is mandatory for the ensurable assign_compliance_policy/)
    end
  end

  describe "for ensurable assign_compliance_policy" do
    it "should have type as a parameter" do
      expect {update_policy_with_policy_name.provider.assign_compliance_policy}.to raise_error(Puppet::Error, /Attribute type is mandatory for the ensurable assign_compliance_policy/)
    end
  end

  describe "for ensurable assign_compliance_policy" do
    it "should have uuid as a parameter" do
      expect {update_policy_with_policy_name_and_type.provider.assign_compliance_policy}.to raise_error(Puppet::Error, /Attribute uuid is mandatory for the ensurable assign_compliance_policy/)
    end
  end

  describe "for ensurable delete_compliance_policy" do
    it "should have policy_name as a parameter" do
      expect {update_policy.provider.delete_compliance_policy}.to raise_error(Puppet::Error, /Attribute policy_name is mandatory for the ensurable delete_compliance_policy/)
    end
  end

  describe "for ensurable delete_compliance_policy" do
    it "should have remove_package as a parameter" do
      expect {update_policy_with_policy_name.provider.delete_compliance_policy}.to raise_error(Puppet::Error, /Attribute remove_package is mandatory for the ensurable delete_compliance_policy/)
    end
  end

  describe "for discover_update_policy" do
    it "should return an array as a result" do
      expect(update_policy.provider.discover_update_policy).to be_instance_of(Array)
    end
  end

  describe "for discover_application_firmware" do
    it "should return an array as a result" do
      expect(update_policy.provider.discover_application_firmware).to be_instance_of(Array)
    end
  end

  describe "for discover_persisted_compare_results" do
    it "should return an array as a result" do
      expect(update_policy.provider.discover_persisted_compare_results).to be_instance_of(Array)
    end
  end

  describe "for discover_compare_results" do
    it "should return an array as a result" do
      expect(update_policy_with_jobid.provider.discover_compare_results).to be_instance_of(Array)
    end
  end

  describe "for assign_compliance_policy" do
    it "should return 200 as status" do
      expect(update_policy_for_assign.provider.assign_compliance_policy.status).to eq(200)
    end
  end

  describe "for delete_compliance_policy" do
    it "should return 200 as status" do
      expect(update_policy_for_delete.provider.delete_compliance_policy.status).to eq(200)
    end
  end

end
