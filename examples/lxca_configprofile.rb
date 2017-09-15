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

# This manifest contains some sample invocations of lxca_configprofile resource type

lxca_configprofile{'list_all':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'discover_all',
}

lxca_configprofile{'filter_by_profileid':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'filter_by_id',
  id => '68',
}

lxca_configprofile{'activate_configprofile':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'activate_configprofile',
  id => '68',
  endpoint_uuid => '46920C143355486F97C19A34ABC7D746_bay10',
  restart => 'immediate',
}

lxca_configprofile{'rename_configprofile':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'rename_configprofile',
  id => '68',
  profile_name => 'name_from_puppet_type',
}

lxca_configprofile{'unassign_configprofile':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'unassign_configprofile',
  id => '68',
  power_down => 'False',
  reset_imm => 'False',
  force => 'False',
}

lxca_configprofile{'delete_configprofile':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'delete_configprofile',
  id => '68',
}
