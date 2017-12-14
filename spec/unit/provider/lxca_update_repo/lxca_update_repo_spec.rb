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

describe Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo) do

  before :each do
    described_class.stubs(:suitable?).returns true
    Puppet::Type.type(:lxca_update_repo).stubs(:defaultprovider).returns described_class
  end

  let :update_repo do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
    )
  end
  
  let :update_repo_invalid_key do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :key => 'dummy',
    )
  end

  let :update_repo_valid_key do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :key => 'lastRefreshed',
    )
  end

  let :update_repo_with_scope do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :scope => 'all',
    )
  end

  let :update_repo_for_refresh do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :scope => 'all',
      :mt => ["7167"],
    )
  end

  let :update_repo_for_acquire do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :scope => 'payloads',
      :fixids => ["brcd_fw_bcsw_nos5.0.1_anyos_noarch","brcd_fw_cna_3.2.4.0_linux_32-64","brcd_fw_cna_3.2.3.0_linux_32-64","lenovo_fw_dsa_dsyte2f-9.61_anyos_32-64"],
      :mt => '0000',
    )
  end

  let :update_repo_with_file_types do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :file_types => 'all',
    )
  end

  let :update_repo_with_fixids_and_file_types do
    Puppet::Type.type(:lxca_update_repo).new(
      :name => 'lxca_update_repo',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :fixids => ["brcd_fw_bcsw_nos5.0.1_anyos_noarch","brcd_fw_cna_3.2.4.0_linux_32-64","brcd_fw_cna_3.2.3.0_linux_32-64","lenovo_fw_dsa_dsyte2f-9.61_anyos_32-64"],
      :file_types => 'all',
    )
  end

  describe "provider instance type" do
    it "without key, scope, mt, fixids and file_types, should be an instance of provider ruby" do
      expect(update_repo.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo)
    end
    it "with invalid key and without scope, mt, fixids and file_types, should be an instance of provider ruby" do
      expect(update_repo_invalid_key.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo)
    end
    it "with valid key and without scope, mt, fixids and file_types, should be an instance of provider ruby" do
      expect(update_repo_valid_key.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo)
    end
    it "with scope and without key, mt, fixids and file_types, should be an instance of provider ruby" do
      expect(update_repo_with_scope.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo)
    end
    it "with scope and mt and without key, fixids and file_types, should be an instance of provider ruby" do
      expect(update_repo_for_refresh.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo)
    end
    it "with scope, fixids and mt and without key and file_types, should be an instance of provider ruby" do
      expect(update_repo_for_acquire.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo)
    end
    it "without key, scope, mt and with fixids and file_types, should be an instance of provider ruby" do
      expect(update_repo_with_fixids_and_file_types.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_repo).provider(:lxca_update_repo)
    end
  end

  describe "for ensurable discover_update_repo" do
    it "should have key as a parameter" do
      expect {update_repo.provider.discover_update_repo}.to raise_error(Puppet::Error, /Attribute key is mandatory for the ensurable discover_update_repo/)
    end
  end

  describe "for ensurable discover_update_repo" do
    it "should have valid value for key parameter" do
      expect {update_repo_invalid_key.provider.discover_update_repo}.to raise_error(Puppet::Error, /Attribute key is mandatory for the ensurable discover_update_repo and can have the following values: supportedMts, lastRefreshed, size, importDir, publicKeys, updates, updatesByMt, updatesByMtByComp/)
    end
  end

  describe "for ensurable refresh_update_repo" do
    it "should have scope as a parameter" do
      expect {update_repo.provider.refresh_update_repo}.to raise_error(Puppet::Error, /Attribute scope is mandatory for the ensurable refresh_update_repo/)
    end
  end

  describe "for ensurable refresh_update_repo" do
    it "should have mt as a parameter" do
      expect {update_repo_with_scope.provider.refresh_update_repo}.to raise_error(Puppet::Error, /Attribute mt is mandatory for the ensurable refresh_update_repo/)
    end
  end

  describe "for ensurable acquire_firmware_updates" do
    it "should have scope as a parameter" do
      expect {update_repo.provider.acquire_firmware_updates}.to raise_error(Puppet::Error, /Attribute scope is mandatory for the ensurable acquire_firmware_updates/)
    end
  end

  describe "for ensurable acquire_firmware_updates" do
    it "should have mt as a parameter" do
      expect {update_repo_with_scope.provider.acquire_firmware_updates}.to raise_error(Puppet::Error, /Attribute mt is mandatory for the ensurable acquire_firmware_updates/)
    end
  end

  describe "for ensurable acquire_firmware_updates" do
    it "should have fixids as a parameter" do
      expect {update_repo_for_refresh.provider.acquire_firmware_updates}.to raise_error(Puppet::Error, /Attribute fixids is mandatory for the ensurable acquire_firmware_updates/)
    end
  end

  describe "for ensurable delete_firmware_updates" do
    it "should have fixids as a parameter" do
      expect {update_repo_with_file_types.provider.delete_firmware_updates}.to raise_error(Puppet::Error, /Attribute fixids is mandatory for the ensurable delete_firmware_updates/)
    end
  end

  describe "for ensurable delete_firmware_updates" do
    it "should have file_types as a parameter" do
      expect {update_repo_for_acquire.provider.delete_firmware_updates}.to raise_error(Puppet::Error, /Attribute file_types is mandatory for the ensurable delete_firmware_updates/)
    end
  end

  describe "for ensurable export_firmware_updates" do
    it "should have fixids as a parameter" do
      expect {update_repo_with_file_types.provider.export_firmware_updates}.to raise_error(Puppet::Error, /Attribute fixids is mandatory for the ensurable export_firmware_updates/)
    end
  end

  describe "for ensurable export_firmware_updates" do
    it "should have file_types as a parameter" do
      expect {update_repo_for_acquire.provider.export_firmware_updates}.to raise_error(Puppet::Error, /Attribute file_types is mandatory for the ensurable export_firmware_updates/)
    end
  end

  describe "for discover_update_repo" do
    it "should return an array as a result" do
      expect(update_repo_valid_key.provider.discover_update_repo).to be_instance_of(Array)
    end
  end
      
  describe "for read_update_repo" do
    it "should return status as 200" do
      expect(update_repo.provider.read_update_repo.status).to eq(200)
    end
  end

  describe "for refresh_update_repo" do
    it "should return status as 200" do
      expect(update_repo_for_refresh.provider.refresh_update_repo.status).to eq(200)
    end
  end

  describe "for acquire_firmware_updates" do
    it "should return status as 200" do
      expect(update_repo_for_acquire.provider.acquire_firmware_updates.status).to eq(200)
    end
  end

  describe "for delete_firmware_updates" do
    it "should return status as 200" do
      expect(update_repo_with_fixids_and_file_types.provider.delete_firmware_updates.status).to eq(200)
    end
  end

  describe "for export_firmware_updates" do
    it "should return status as 200" do
      expect(update_repo_with_fixids_and_file_types.provider.export_firmware_updates.status).to eq(200)
    end
  end

end
