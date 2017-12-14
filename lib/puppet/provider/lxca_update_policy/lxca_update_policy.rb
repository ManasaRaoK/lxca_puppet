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

Puppet::Type.type(:lxca_update_policy).provide(:lxca_update_policy) do
  desc 'Compliance policy provider for LXCA resource'
  
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

  def discover_update_policy
    create_client if @client.nil?
    @client.discover_update_policy.map do |policy|
      policy.instance_variables.each do |att|
        puts "#{att} - #{policy.instance_variable_get att}"
      end
    end
  end

  def discover_application_firmware
    create_client if @client.nil?
    @client.discover_application_firmware.map do |policy|
      policy.instance_variables.each do |att|
        puts "#{att} - #{policy.instance_variable_get att}"
      end
    end
  end

  def discover_persisted_compare_results
    create_client if @client.nil?
    @client.discover_persisted_compare_results.map do |policy|
      policy.instance_variables.each do |att|
        puts "#{att} - #{policy.instance_variable_get att}"
      end
    end
  end

  def discover_compare_results
    create_client if @client.nil?
    if @resource[:jobid].nil?
      raise Puppet::Error, _("Attribute jobid is mandatory for the ensurable discover_compare_results")
    end

    @client.discover_compare_results({"jobid":"#{@resource[:jobid]}"}).map do |policy|
      policy.instance_variables.each do |att|
        puts "#{att} - #{policy.instance_variable_get att}"
      end
    end
  end

  def assign_compliance_policy
    create_client if @client.nil?
    if @resource[:policy_name].nil?
      raise Puppet::Error, _("Attribute policy_name is mandatory for the ensurable assign_compliance_policy")
    end
    if @resource[:type].nil?
      raise Puppet::Error, _("Attribute type is mandatory for the ensurable assign_compliance_policy")
    end
    if @resource[:uuid].nil?
      raise Puppet::Error, _("Attribute uuid is mandatory for the ensurable assign_compliance_policy")
    end
  
    @client.assign_compliance_policy("#{@resource[:policy_name]}", "#{@resource[:type]}", "#{@resource[:uuid]}", "#{@resource[:keep]}", "#{@resource[:auto_assign]}")
  end

  def delete_compliance_policy
    create_client if @client.nil?
    if @resource[:policy_name].nil?
      raise Puppet::Error, _("Attribute policy_name is mandatory for the ensurable delete_compliance_policy")
    end
    if @resource[:remove_package].nil?
      raise Puppet::Error, _("Attribute remove_package is mandatory for the ensurable delete_compliance_policy")
    end    
    
    @client.delete_compliance_policy("#{@resource[:policy_name]}", "#{@resource[:remove_package]}")
  end

end


