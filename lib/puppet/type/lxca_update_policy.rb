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

Puppet::Type.newtype(:lxca_update_policy) do

  ensurable do
    
    newvalue(:discover_update_policy) do
      Puppet.notice "Retrieve information for compliance policies. Results displayed below\n"
      provider.discover_update_policy
    end

    newvalue(:discover_application_firmware) do
      Puppet.notice "Retrieve information about firmware that is applicable to each managed device."
      provider.discover_application_firmware
    end
   
    newvalue(:discover_persisted_compare_results) do
      Puppet.notice "Retrieve the persisted compare result for servers to which a compliance policy is assigned."
      provider.discover_persisted_compare_results
    end

    newvalue(:discover_compare_results) do
      Puppet.notice "Determine whether devices are compliant with the assigned compliance policy using the job or task ID that was returned when the compliance policy was assigned."
      provider.discover_compare_results
    end 
 
    newvalue(:assign_compliance_policy) do
      Puppet.notice "Assign a compliance policy to one or more devices and to return the job ID and task IDs for monitoring the status of the job and tasks."
      provider.assign_compliance_policy
    end

    newvalue(:delete_compliance_policy) do
      Puppet.notice "Deletes one or more compliance policies"
      provider.delete_compliance_policy
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

  newparam(:jobid) do
    desc "The job ID that was returned while assigning the compliance policy"
  end

  newparam(:policy_name) do
    desc "The name of the compliance-policy to be assigned or deleted."
  end

  newparam(:type) do
    desc "The device type. This can be one of the following values: CMM, IOSwitch, RACKSWITCH, SERVER, STORAGE"
  end

  newparam(:uuid) do
    desc "The UUID of the device to which you want to assign the compliance policy."
  end

  newparam(:keep) do
    desc "Indicates when to return results when monitoring the status of the assignment job or task. 1)true - Wait for the policy assignment to complete before returning the status. 2)false - Return current status immediately even if the assignment is not complete."
    defaultto 'true'
  end

  newparam(:auto_assign) do
    desc "Indicates whether to automatically assign the specified compliance policy when a new device of the specified type is detected. 1) true - Automatically assign the specified compliance policy. 2) false - Do not automatically assign the specified compliance policy."
    defaultto 'false'
  end

  newparam(:remove_package) do
    desc "Identifies whether to delete the firmware-update packages that are associated with the specified compliance policies if the packages are not associated with another compliance policy. 1) true - Deletes the firmware-update packages. 2) false - Does not delete the firmware-update packages"
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

