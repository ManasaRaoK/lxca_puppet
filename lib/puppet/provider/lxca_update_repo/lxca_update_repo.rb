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

require 'xclarity_client'

Puppet::Type.type(:lxca_update_repo).provide(:lxca_update_repo) do
  desc 'Firmware update repository provider for LXCA resource'
  
  def create_client
    conf=XClarityClient::Configuration.new(
      :username => @resource['login_user'],
      :password => @resource['login_password'],
      :host => @resource['host'],
      :port => @resource['port'],
      :auth_type => @resource['auth_type'],
      :verify_ssl => @resource['verify_ssl']
    )
    @client = XClarityClient::Client.new(conf)
  end

  def exists?
    return if @client.nil?
  end

  def create
    create_client
  end

  def destroy
    @client = nil
  end

  def discover_update_repo
    create_client if @client.nil?
    if @resource[:key].nil?
      raise Puppet::Error, _("Attribute key is mandatory for the ensurable discover_update_repo")
    end
    key = "#{@resource[:key]}"
    if key != "supportedMts" and key != "size" and key != "lastRefreshed" and key != "importDir" and key != "publicKeys" and key != "updates" and key != "updatesByMt" and key != "updatesByMtByComp"
      raise Puppet::Error, _("Attribute key is mandatory for the ensurable discover_update_repo and can have the following values: supportedMts, lastRefreshed, size, importDir, publicKeys, updates, updatesByMt, updatesByMtByComp")
    end

    @client.discover_update_repo({"key":"#{@resource[:key]}"}).map do |repo|
      repo.instance_variables.each do |att|
        puts "#{att} - #{repo.instance_variable_get att}"
      end
    end
  end
 
  def read_update_repo
    create_client if @client.nil?
    @client.read_update_repo
  end
 
  def refresh_update_repo
    create_client if @client.nil?
    if @resource[:scope].nil?
      raise Puppet::Error, _("Attribute scope is mandatory for the ensurable refresh_update_repo")
    end
    if @resource[:mt].nil?
      raise Puppet::Error, _("Attribute mt is mandatory for the ensurable refresh_update_repo")
    end

    @client.refresh_update_repo("#{@resource[:scope]}", @resource[:mt], "#{@resource[:os]}")
  end

  def acquire_firmware_updates
    create_client if @client.nil?
    if @resource[:scope].nil?
      raise Puppet::Error, _("Attribute scope is mandatory for the ensurable acquire_firmware_updates")
    end
    if @resource[:mt].nil?
      raise Puppet::Error, _("Attribute mt is mandatory for the ensurable acquire_firmware_updates")
    end
    if @resource[:fixids].nil?
      raise Puppet::Error, _("Attribute fixids is mandatory for the ensurable acquire_firmware_updates")
    end

    @client.acquire_firmware_updates("#{@resource[:scope]}", @resource[:fixids], @resource[:mt])
  end

  def delete_firmware_updates
    create_client if @client.nil?
    if @resource[:file_types].nil?
      raise Puppet::Error, _("Attribute file_types is mandatory for the ensurable delete_firmware_updates")
    end
    if @resource[:fixids].nil?
      raise Puppet::Error, _("Attribute fixids is mandatory for the ensurable delete_firmware_updates")
    end

    @client.delete_firmware_updates("#{@resource[:file_types]}", @resource[:fixids])
  end

  def export_firmware_updates
    create_client if @client.nil?
    if @resource[:file_types].nil?
      raise Puppet::Error, _("Attribute file_types is mandatory for the ensurable export_firmware_updates")
    end
    if @resource[:fixids].nil?
      raise Puppet::Error, _("Attribute fixids is mandatory for the ensurable export_firmware_updates")
    end

    @client.export_firmware_updates("#{@resource[:file_types]}", @resource[:fixids])
  end

end

