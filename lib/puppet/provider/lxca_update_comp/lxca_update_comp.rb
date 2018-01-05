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

Puppet::Type.type(:lxca_update_comp).provide(:lxca_update_comp) do
  desc 'Updatable components provider for LXCA resource'
  
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

  def discover_firmware_update_status
    create_client if @client.nil?
    @client.discover_firmware_update_status.map do |update|
      update.instance_variables.each do |att|
        puts "#{att} - #{update.instance_variable_get att}"
      end
    end
  end

  def discover_updatable_device_comp
    create_client if @client.nil?
    @client.discover_updatable_device_comp.map do |update|
      update.instance_variables.each do |att|
        puts "#{att} - #{update.instance_variable_get att}"
      end
    end
  end

  def apply_firmware_update
    create_client if @client.nil?

    @client.apply_firmware_update(@resource[:activation_mode], @resource[:force_update_mode], @resource[:on_error_mode], @resource[:server], @resource[:switch], @resource[:storage], @resource[:cmm])
  end

  def cancel_firmware_update
    create_client if @client.nil?
   
    @client.cancel_firmware_update(@resource[:server], @resource[:switch], @resource[:storage], @resource[:cmm])
  end

  def modify_power_state
    create_client if @client.nil?

    @client.modify_power_state(@resource[:server], @resource[:switch], @resource[:storage], @resource[:cmm])
  end

end

