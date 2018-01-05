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

describe Puppet::Type.type(:lxca_update_comp).provider(:lxca_update_comp) do

  before :each do
    described_class.stubs(:suitable?).returns true
    Puppet::Type.type(:lxca_update_comp).stubs(:defaultprovider).returns described_class
  end

  let :update_comp do
    Puppet::Type.type(:lxca_update_comp).new(
      :name => 'lxca_update_comp',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
    )
  end
  
  let :update_comp_apply_firmware do
    Puppet::Type.type(:lxca_update_comp).new(
      :name => 'lxca_update_comp',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :activation_mode => 'immediate',
      :server => [{"UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488","Components"=> [{"Fixid"=> "ibm_fw_imm2_1aoo78j-6.20_anyos_noarch","Component"=> "IMM2 (Primary)"}]}],
    )
  end

  let :update_comp_with_server1 do
    Puppet::Type.type(:lxca_update_comp).new(
      :name => 'lxca_update_comp',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :server => [{"UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488","Components"=> [{"Fixid"=> "ibm_fw_imm2_1aoo78j-6.20_anyos_noarch","Component"=> "IMM2 (Primary)"}]}],
    )
  end
  
  let :update_comp_with_server2 do
    Puppet::Type.type(:lxca_update_comp).new(
      :name => 'lxca_update_comp',
      :host => 'https://10.240.29.217',
      :port => '443',
      :login_user => 'USERID',
      :login_password => 'Passw0rd',
      :verify_ssl => 'NONE',
      :server => [{"PowerState"=> "powerOn","UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488"}]
    )
  end

  describe "provider instance type" do
    it "without activation_mode, force_update_mode, on_error_mode, server, storage, switch and cmm should be an instance of provider ruby" do
      expect(update_comp.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_comp).provider(:lxca_update_comp)
    end
    it "with activation_mode and server should be an instance of provider ruby" do
      expect(update_comp_apply_firmware.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_comp).provider(:lxca_update_comp) 
    end
    it "with server should be an instance of provider ruby" do
      expect(update_comp_with_server1.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_comp).provider(:lxca_update_comp)
    end
    it "with server with power state modification information should be an instance of provider ruby" do
      expect(update_comp_with_server2.provider).to be_an_instance_of Puppet::Type.type(:lxca_update_comp).provider(:lxca_update_comp)
    end
  end

  describe "for discover_firmware_update_status" do
    it "should return an array as a result" do
      expect(update_comp.provider.discover_firmware_update_status).to be_instance_of(Array)
    end
  end

  describe "for discover_updatable_device_comp" do
    it "should return an array as a result" do
      expect(update_comp.provider.discover_updatable_device_comp).to be_instance_of(Array)
    end
  end

  describe "for apply_firmware_update" do
    it "should return 200 as status" do
      expect(update_comp_apply_firmware.provider.apply_firmware_update.status).to eq(200)
    end
  end

  describe "for cancel_firmware_update" do
    it "should return 200 as status" do
      expect(update_comp_with_server1.provider.cancel_firmware_update.status).to eq(200)
    end
  end

  describe "for modify_power_state" do
    it "should return 200 as status" do
      expect(update_comp_server2.provider.modify_power_state.status).to eq(200)
    end
  end

end
