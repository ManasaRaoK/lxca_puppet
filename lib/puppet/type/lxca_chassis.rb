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

Puppet::Type.newtype(:lxca_chassis) do

  ensurable do
    
    newvalue(:discover_all) do
      Puppet.notice "Fetching all the LXCA chassis elements. Results displayed below\n"
      provider.discover_all
    end

    newvalue(:discover_managed) do
      Puppet.notice "Fetching all the LXCA managed chassis elements. Results displayed below\n"
      provider.discover_managed_chassis
    end

    newvalue(:discover_unmanaged) do
      Puppet.notice "Fetching all the LXCA unmanaged chassis elements. Results displayed below\n"
      provider.discover_unmanaged_chassis
    end
 
    newvalue(:filter_by_uuid) do
      Puppet.notice "Fetching LXCA chassis filtered by UUID. Results displayed below\n"
      provider.filter_by_uuid
    end
    
  end
                                  
  newparam(:name, :namevar => true) do
    desc "Name of the lxca chassis resource"
  end
                                              
  newparam(:base_url) do
    desc "Base URL of the lxca chassis resource"
  end
                                                      
  newparam(:login_user) do
    desc "The username to be used to login into LXCA"
  end
                                                              
  newparam(:login_password) do
    desc "The password to be used to login into LXCA"
  end
                                                                      
  newparam(:verify_ssl) do
    desc "Whether to verify SSL when connecting to the LXCA"
    defaultto 'NONE'
  end

  newparam(:uuid) do
    desc "UUID of the chassis"
  end

  validate do
    required_parameters = [
      :base_url,
      :login_user,
      :login_password,
    ]
    required_parameters.each do |param|
      if param.nil? or param == ""
        raise Puppet::Error, _("Attribute #{param} is mandatory and should not be empty")
      end
    end
  end
 
end

