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

Puppet::Type.newtype(:lxca_update_comp) do

  ensurable do
    
    newvalue(:discover_firmware_update_status) do
      Puppet.notice "Fetching the status of firmware updates that are in progress. Results displayed below\n"
      provider.discover_firmware_update_status
    end

    newvalue(:discover_updatable_device_comp) do
      Puppet.notice "Fetching a list of devices and components that can be updated. Results displayed below\n"
      provider.discover_updatable_device_comp
    end
   
    newvalue(:apply_firmware_update) do
      Puppet.notice "Applies the associated firmware to the submitted components."
      provider.apply_firmware_update
    end

    newvalue(:cancel_firmware_update) do
      Puppet.notice "Cancels the firmware update request to the selected components"
      provider.cancel_firmware_update
    end 
 
    newvalue(:modify_power_state) do
      Puppet.notice "Performs a power operation on the specified device."
      provider.modify_power_state
    end

  end
                                  
  newparam(:name, :namevar => true) do
    desc "Name for the lxca configuration pattern resource"
  end
                                              
  newparam(:host) do
    desc "LXCA Host to connect to"
  end

  newparam(:port) do
    desc "Port of LXCA to connect to"
  end

  newparam(:login_user) do
    desc "The username to be used to login into LXCA"
  end

  newparam(:login_password) do
    desc "The password to be used to login into LXCA"
  end

  newparam(:verify_ssl) do
    desc "Whether to verify SSL when connecting to the LXCA"
  end

  newparam(:auth_type) do
    desc "The authorization type used to connect to LXCA. Defaults to basic_auth"
    defaultto 'basic_auth'
  end

  newparam(:csrf_token) do
    desc "The CSRF token to be used in case authentication type is set to token"
  end

  newparam(:activation_mode) do
    desc "Indicates when to activate the update. This can be one of the following values: 1)immediate - Uses Immediate Activation mode when applying firmware updates to the selected devices. 2) delayed - Uses Delayed Activation mode when applying firmware updates to the selected devices."
    defaultto 'immediate'
  end

  newparam(:force_update_mode) do
    desc "Indicates whether to apply the update if firmware is already compliant. This can be one of the following values: 1)true - Applies the firmware update to the selected devices even if the firmware is compliant. 2) false - Skips the firmware update on the selected devices if the firmware is already compliant."  
    defaultto 'false'
  end

  newparam(:on_error_mode) do
    desc "Indicates how to handle errors during the firmware update. This can be one of the following values: 1) stopOnError - Stops all firmware updates within the selected devices if an error is encountered. 2) stopdeviceOnError - Stops all firmware updates on a specific device if an error is encountered and continues with the other devices. 3) continueOnError - Ignores errors and continues firmware updates on the devices."
    defaultto 'stopdeviceOnError'
  end

  newparam(:server) do
    desc "List of servers on which the firmware update is to be applied, cancelled or the power state modified"
    defaultto []
  end

  newparam(:switch) do
    desc "List of switches on which the firmware update is to be applied, cancelled or the power state modified"
    defaultto []
  end

  newparam(:storage) do
    desc "List of storage devices on which the firmware update is to be applied, cancelled or the power state modified"
    defaultto []
  end

  newparam(:cmm) do
    desc "List of cmms on which the firmware update is to be applied, cancelled or the power state modified"
    defaultto []
  end

  validate do
    required_parameters = [
      :host,
      :port,
      :login_user,
      :login_password,
      :verify_ssl,
    ]
    required_parameters.each do |param|
      if param.nil? or param == ""
        raise Puppet::Error, _("Attribute #{param} is mandatory and should not be empty")
      end
    end
  end    

end

