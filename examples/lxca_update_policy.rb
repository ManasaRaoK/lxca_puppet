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

# This manifest contains some sample invocations of lxca_update_policy resource type

lxca_update_policy{'discover_update_policy':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'discover_update_policy',
}

lxca_update_policy{'discover_application_firmware':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'discover_application_firmware',
}

lxca_update_policy{'discover_persisted_compare_results':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'discover_persisted_compare_results',
}

lxca_update_policy{'discover_compare_results':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'discover_compare_results',
  jobid => '5'
}

lxca_update_policy{'assign_compliance_policy':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'assign_compliance_policy',
  policy_name => 'mantest',
  type => 'SERVER',
  uuid => 'AB6C2B0F827811E29C8B3440B5EAB968',
  auto_assign => 'true',
}

lxca_update_policy{'delete_compliance_policy':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'delete_compliance_policy',
  policy_name => 'valid2',
  remove_package => 'true',
}
