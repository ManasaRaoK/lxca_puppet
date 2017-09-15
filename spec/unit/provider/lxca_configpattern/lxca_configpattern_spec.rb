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

describe Puppet::Type.type(:lxca_configpattern).provider(:lxca_configpattern) do

  before :each do
    described_class.stubs(:suitable?).returns true
    Puppet::Type.type(:lxca_configpattern).stubs(:defaultprovider).returns described_class
  end

  let :configpattern do
    Puppet::Type.type(:lxca_configpattern).new(
      :name => 'lxca_configpattern',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
    )
  end
  
  let :configpattern_with_id do
    Puppet::Type.type(:lxca_configpattern).new(
      :name => 'lxca_configpattern',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '59'
    )
  end

  let :configpattern_deploy do
    Puppet::Type.type(:lxca_configpattern).new(
      :name => 'lxca_configpattern',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '59',
      :endpoints => 'B918EDCA1B5F11E2803EBECB82710ADE',
      :restart => 'pending',
      :etype => 'node'
    )
  end

  let :configpattern_deploy1 do
    Puppet::Type.type(:lxca_configpattern).new(
      :name => 'lxca_configpattern',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '59',
      :restart => 'pending',
      :etype => 'node'
    )
  end

  let :configpattern_deploy2 do
    Puppet::Type.type(:lxca_configpattern).new(
      :name => 'lxca_configpattern',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '59',
      :endpoints => 'B918EDCA1B5F11E2803EBECB82710ADE',
      :etype => 'node'
    )
  end

  let :configpattern_deploy3 do
    Puppet::Type.type(:lxca_configpattern).new(
      :name => 'lxca_configpattern',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :id => '59',
      :endpoints => 'B918EDCA1B5F11E2803EBECB82710ADE',
      :restart => 'pending'
    )
  end

  let :configpattern_import do
    Puppet::Type.type(:lxca_configpattern).new(
      :name => 'lxca_configpattern',
      :host => 'https://10.240.29.220',
      :port => '443',
      :login_user => 'TEST',
      :login_password => 'CME44ibm',
      :verify_ssl => 'NONE',
      :import_json => '{"template_type" : "SystemInfo","template" : {"contact" : "contact","description" : "Pattern created by ruby test API ","location" : "location","name" : "Learned-System_Info-99","systemName" : {"autogen" : "Disable","hyphenChecked" : "FALSE"},"type" : "SystemInfo","uri" : "\/config\/template\/62","userDefined" : "TRUE"}}'
    )
  end

  describe "provider instance type" do
    it "without id, endpoints, restart, etype and import_json should be an instance of provider ruby" do
      expect(configpattern.provider).to be_an_instance_of Puppet::Type.type(:lxca_configpattern).provider(:lxca_configpattern)
    end
    it "with id should be an instance of provider ruby" do
      expect(configpattern_with_id.provider).to be_an_instance_of Puppet::Type.type(:lxca_configpattern).provider(:lxca_configpattern)
    end
    it "with id, endpoints, restart, etype should be an instance of provider ruby" do
      expect(configpattern_deploy.provider).to be_an_instance_of Puppet::Type.type(:lxca_configpattern).provider(:lxca_configpattern)
    end
    it "with import_json should be an instance of provider ruby" do
      expect(configpattern_import.provider).to be_an_instance_of Puppet::Type.type(:lxca_configpattern).provider(:lxca_configpattern)
    end
  end

  describe "for ensurable filter_by_id" do
    it "should have id as a parameter" do
      expect {configpattern.provider.filter_by_id}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable filter_by_id/)
    end
  end

  describe "for ensurable export_configpattern" do
    it "should have id as a parameter" do
      expect {configpattern.provider.export_configpattern}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable export_configpattern/)
    end
  end

  describe "for ensurable deploy_configpattern" do
    it "should have id as a parameter" do
      expect {configpattern.provider.deploy_configpattern}.to raise_error(Puppet::Error, /Attribute id is mandatory for the ensurable deploy_configpattern/)
    end
  end

  describe "for ensurable deploy_configpattern" do
    it "should have endpoints as a parameter" do
      expect {configpattern_deploy1.provider.deploy_configpattern}.to raise_error(Puppet::Error, /Attribute endpoints is mandatory for the ensurable deploy_configpattern/)
    end
  end

  describe "for ensurable deploy_configpattern" do
    it "should have restart as a parameter" do
      expect {configpattern_deploy2.provider.deploy_configpattern}.to raise_error(Puppet::Error, /Attribute restart is mandatory for the ensurable deploy_configpattern/)
    end
  end

  describe "for ensurable deploy_configpattern" do
    it "should have etype as a parameter" do
      expect {configpattern_deploy3.provider.deploy_configpattern}.to raise_error(Puppet::Error, /Attribute etype is mandatory for the ensurable deploy_configpattern/)
    end
  end

  describe "for ensurable import_configpattern" do
    it "should have import_json as a parameter" do
      expect {configpattern.provider.import_configpattern}.to raise_error(Puppet::Error, /Attribute import_json is mandatory for the ensurable import_configpattern/)
    end
  end

  describe "for discover_all" do
    it "should return an array as a result" do
      expect(configpattern.provider.discover_all).to be_instance_of(Array)
    end
  end

  describe "for filter_by_id" do
    it "should return an array as a result" do
      expect(configpattern_with_id.provider.filter_by_id).to be_instance_of(Array)
    end
  end

  describe "for export_configpattern" do
    it "should return an array as a result" do
      expect(configpattern_with_id.provider.export_configpattern).to be_instance_of(Array)
    end
  end

  describe "for deploy_configpattern" do
    it "should return an array as a result" do
      expect(configpattern_deploy.provider.deploy_configpattern.status).to eq(200)
    end
  end

  describe "for import_configpattern" do
    it "should return status as 200" do
      expect(configpattern_import.provider.import_configpattern.status).to eq(200)
    end
  end

end
