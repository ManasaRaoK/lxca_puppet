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

# This manifest contains some sample invocations of lxca_update_comp resource type

lxca_update_comp{'discover_firmware_update_status':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'discover_firmware_update_status',
}

lxca_update_comp{'discover_updatable_device_comp':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'discover_updatable_device_comp',
}

lxca_update_comp{'apply_firmware_update':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'apply_firmware_update',
  activation_mode => 'immediate',
  server => [{"UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488","Components"=> [{"Fixid"=> "ibm_fw_imm2_1aoo78j-6.20_anyos_noarch","Component"=> "IMM2 (Primary)"}]}],
}

lxca_update_comp{'cancel_firmware_update':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'cancel_firmware_update',
  server => [{"UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488","Components"=> [{"Fixid"=> "ibm_fw_imm2_1aoo78j-6.20_anyos_noarch","Component"=> "IMM2 (Primary)"}]}],
}

lxca_update_comp{'modify_power_state':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'modify_power_state',
  server => [{"PowerState"=> "powerOn","UUID"=> "B6E2AB7AC3A411E08B8D5CF3FC6E2488"}],
}


