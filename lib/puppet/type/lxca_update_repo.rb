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

Puppet::Type.newtype(:lxca_update_repo) do

  ensurable do
    
    newvalue(:discover_update_repo) do
      Puppet.notice ""
      provider.discover_update_repo
    end

    newvalue(:read_update_repo) do
      Puppet.notice "Reloads the repository files. The clears the update information in cache and reads the update file again from the repository."
      provider.read_update_repo
    end

    newvalue(:refresh_update_repo) do
      Puppet.notice "Retrieves information about the latest available firmware updates from the Lenovo XClarity Support website, and stores the information to the firmware-updates repository."
      provider.refresh_update_repo
    end

    newvalue(:acquire_firmware_updates) do
      Puppet.notice "Downloads the specified firmware updates from Lenovo XClarity Support website, and stores the updates to the firmware-updates repository."
      provider.acquire_firmware_updates
    end

    newvalue(:delete_firmware_updates) do
      Puppet.notice "Deletes the specified firmware updates from the firmware-updates repository."
      provider.delete_firmware_updates
    end
 
    newvalue(:export_firmware_updates) do
      Puppet.notice "Compresses the specified firmware updates from the firmware-updates repository into a ZIP file, and downloads the ZIP file to your local system."
      provider.export_firmware_updates
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

  newparam(:key) do
    desc "This is a required parameter for the ensurable discover_update_repo. This can have the following values: supportedMts, lastRefreshed, size, importDir, publicKeys, updates, updatesByMt, updatesByMtByComp"
  end

  newparam(:scope) do
    desc "The scope of the action. This can be one of the following values: 1) all - When ensurable is refresh_update_repo, this parameter returns information about all versions of all firmware updates that are available for all supported devices. 2) latest - When ensurable is refresh_update_repo, this parameter returns information about the most current version of all firmware updates for all supported devices. 3) payloads - When ensurable is acquire_firmware_updates, this parameter returns information about specific firmware updates."
  end

  newparam(:mt) do
    desc "A list of machine types for which updates are to be refreshed, separated by a comma"
  end

  newparam(:os) do
    desc "This value must be empty"
    defaultto ''
  end

  newparam(:fixids) do
    desc "The list of firmware-update IDs to be acquired, deleted or exported, separated by a comma."
  end

  newparam(:file_types) do
    desc "When action=delete or action=export is specified, this parameter is used. You can specify one of the following values: 1) all - Deletes selected update-package files (payload, change history, readme, and metadata files) 2) payloads - Deletes only the selected payload (image) files."
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

