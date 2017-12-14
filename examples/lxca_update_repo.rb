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

# This manifest contains some sample invocations of lxca_update_repo resource type

lxca_update_repo{'discover_update_repo':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'discover_update_repo',
  key => 'lastRefreshed',
}

lxca_update_repo{'read_update_repo':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'read_update_repo',
}

lxca_update_repo{'refresh_update_repo':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'refresh_update_repo',
  scope => 'all',
  mt => ["7167"],
  os => '',
}

lxca_update_repo{'acquire_firmware_updates':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'acquire_firmware_updates',
  scope => 'payloads',
  fixids => ["brcd_fw_bcsw_nos5.0.1_anyos_noarch","brcd_fw_cna_3.2.4.0_linux_32-64","brcd_fw_cna_3.2.3.0_linux_32-64","lenovo_fw_dsa_dsyte2f-9.61_anyos_32-64"],
  mt => '0000',
}

lxca_update_repo{'delete_firmware_updates':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'delete_firmware_updates',
  file_types => 'all',
  fixids => ["lnvgy_fw_cmm_1aon12a-1.5.0a_anyos_noarch","lnvgy_fw_cmm_1aon10b-1.4.1b_anyos_noarch","lnvgy_fw_cmm_1aon10a-1.4.0a_anyos_noarch","lnvgy_fw_cmm_1aon08a-1.3.0a_anyos_noarch","lnvgy_fw_cmm_1aon06c-1.2.1c_anyos_noarch","lnvgy_fw_cmm_1aon04a-1.1.0a_anyos_noarch","lnvgy_fw_cmm_1aon16b-1.6.1_anyos_noarch","lnvgy_fw_cmm_1aon14a-1.6.0_anyos_noarch"],
}

lxca_update_repo{'export_firmware_updates':
  host => 'https://10.240.29.217',
  port => '443',
  login_user => 'USERID',
  login_password => 'Passw0rd',
  verify_ssl => 'NONE',
  ensure => 'export_firmware_updates',
  file_types => 'payloads',
  fixids => ["lnvgy_fw_cmm_1aon01k-1.0.0k_anyos_noarch"],
}

