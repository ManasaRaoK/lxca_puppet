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

describe Puppet::Type.type(:lxca_configprofile).provider(:lxca_configprofile) do

  before :each do
    described_class.stubs(:suitable?).returns true
    Puppet::Type.type(:lxca_configprofile).stubs(:defaultprovider).returns described_class
  end

  let :configprofile do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
    )
  end
  
  let :configprofile_with_id do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68'
    )
  end

  let :configprofile_rename do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68',
      :profile_name => 'New name from type'
    )
  end

  let :configprofile_activate do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68',
      :endpoint_uuid => '46920C143355486F97C19A34ABC7D746_bay10',
      :restart => 'immediate'
    )
  end

  let :configprofile_activate1 do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68',
      :endpoint_uuid => '46920C143355486F97C19A34ABC7D746_bay10',
    )
  end

  let :configprofile_unassign do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68',
      :power_down => 'False',
      :reset_imm => 'False',
      :force => 'False'
    )
  end

  let :configprofile_unassign1 do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68',
      :reset_imm => 'False',
      :force => 'False'
    )
  end

  let :configprofile_unassign2 do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68',
      :power_down => 'False',
      :force => 'False'
    )
  end

  let :configprofile_unassign3 do
    Puppet::Type.type(:lxca_configprofile).new(
      :name => 'lxca_configprofile',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '68',
      :power_down => 'False',
      :reset_imm => 'False'
    )
  end


  describe "provider instance type" do
    it "without id, profile_name, endpoint_uuid, restart, power_down, reset_imm and force should be an instance of provider ruby" do
      expect(configprofile.provider).to be_an_instance_of Puppet::Type.type(:lxca_configprofile).provider(:lxca_configprofile)
    end
    it "with id should be an instance of provider ruby" do
      expect(configprofile_with_id.provider).to be_an_instance_of Puppet::Type.type(:lxca_configprofile).provider(:lxca_configprofile)
    end
    it "with id and profile_name should be an instance of provider ruby" do
      expect(configprofile_rename.provider).to be_an_instance_of Puppet::Type.type(:lxca_configprofile).provider(:lxca_configprofile)
    end
    it "with id, endpoint_uuid and restart should be an instance of provider ruby" do
      expect(configprofile_activate.provider).to be_an_instance_of Puppet::Type.type(:lxca_configprofile).provider(:lxca_configprofile)
    end
    it "with id, power_down, reset_imm and force should be an instance of provider ruby" do
      expect(configprofile_unassign.provider).to be_an_instance_of Puppet::Type.type(:lxca_configprofile).provider(:lxca_configprofile)
    end
  end

  describe "for ensurable filter_by_id" do
    it "should have id as a parameter" do
      expect {configprofile.provider.filter_by_id}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable filter_by_id/)
    end
  end

  describe "for ensurable delete_configprofile" do
    it "should have id as a parameter" do
      expect {configprofile.provider.delete_configprofile}.to raise_error(Puppet::Error, /Attribute id is mandatory when ensure is set to delete_configprofile/)
    end
  end

  describe "for ensurable rename_configprofile" do
    it "should have id as a parameter" do
      expect {configprofile.provider.rename_configprofile}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable rename_configprofile/)
    end
  end

  describe "for ensurable rename_configprofile" do
    it "should have profile_name as a parameter" do
      expect {configprofile_with_id.provider.rename_configprofile}.to raise_error(Puppet::Error, /Attribute profile_name is mandatory for the ensurable rename_configprofile/)
    end
  end

  describe "for ensurable activate_configprofile" do
    it "should have id as a parameter" do
      expect {configprofile.provider.activate_configprofile}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable activate_configprofile/)
    end
  end

  describe "for ensurable activate_configprofile" do
    it "should have endpoint_uuid as a parameter" do
      expect {configprofile_with_id.provider.activate_configprofile}.to raise_error(Puppet::Error, /Attribute endpoint_uuid is mandatory for the ensurable activate_configprofile/)
    end
  end

  describe "for ensurable activate_configprofile" do
    it "should have restart as a parameter" do
      expect {configprofile_activate1.provider.activate_configprofile}.to raise_error(Puppet::Error, /Attribute restart is mandatory for the ensurable activate_configprofile/)
    end
  end

  describe "for ensurable unassign_configprofile" do
    it "should have id as a parameter" do
      expect {configprofile.provider.unassign_configprofile}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable unassign_configprofile/)
    end
  end

  describe "for ensurable unassign_configprofile" do
    it "should have power_down as a parameter" do
      expect {configprofile_unassign1.provider.unassign_configprofile}.to raise_error(Puppet::Error, /Attribute power_down is mandatory for the ensurable unassign_configprofile/)
    end
  end

  describe "for ensurable unassign_configprofile" do
    it "should have reset_imm as a parameter" do
      expect {configprofile_unassign2.provider.unassign_configprofile}.to raise_error(Puppet::Error, /Attribute reset_imm is mandatory for the ensurable unassign_configprofile/)
    end
  end

  describe "for ensurable unassign_configprofile" do
    it "should have force as a parameter" do
      expect {configprofile_unassign3.provider.unassign_configprofile}.to raise_error(Puppet::Error, /Attribute force is mandatory for the ensurable unassign_configprofile/)
    end
  end

  describe "for discover_all" do
    it "should return an array as a result" do
      expect(configprofile.provider.discover_all).to be_instance_of(Array)
    end
  end

  describe "for filter_by_id" do
    it "should return an array as a result" do
      expect(configprofile_with_id.provider.filter_by_id).to be_instance_of(Array)
    end
  end

  describe "for activate_configprofile" do
    it "should return an array as a result" do
      configprofile_activate.provider.activate_configprofile
      expect(configprofile_activate.provider.activate_configprofile).to be_instance_of(Array)
      expect(configprofile_activate.provider.activate_configprofile.status).to eq(200)
    end
  end

  describe "for unassign_configprofile" do
    it "should return status as 200" do
      expect(configprofile_unassign.provider.unassign_configprofile.status).to eq(200)
    end
  end

  describe "for rename_configprofile" do
    it "should return status as 200" do
      expect(configprofile_rename.provider.rename_configprofile.status).to eq(204)
    end
  end

  describe "for delete_configprofile" do
    it "should return status as 200" do
      puts configprofile_with_id.provider
      expect(configprofile_with_id.provider.delete_configprofile.status).to eq(200)
    end
  end

end
