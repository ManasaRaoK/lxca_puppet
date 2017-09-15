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

# This manifest contains some sample invocations of lxca_configpattern resource type

lxca_configpattern{'list_all':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'discover_all',
}

lxca_configpattern{'filter_by_patternid':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'filter_by_id',
  id => '59',
}

lxca_configpattern{'export_configpattern':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'export_configpattern',
  id => '59',
}

lxca_configpattern{'deploy_configpattern':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'deploy_configpattern',
  id => '59',
  endpoints => 'B918EDCA1B5F11E2803EBECB82710ADE',
  restart => 'pending',
  etype => 'node',
}

lxca_configpattern{'import_configpattern':
  host => 'https://10.240.29.220',
  port => '443',
  login_user => 'TEST',
  login_password => 'CME44ibm',
  verify_ssl => 'NONE',
  ensure => 'import_configpattern',
  import_json => '{"template_type" : "SystemInfo","template" : {"contact" : "contact","description" : "Pattern created by ruby test API ","location" : "location","name" : "Learned-System_Info-99","systemName" : {"autogen" : "Disable","hyphenChecked" : "FALSE"},"type" : "SystemInfo","uri" : "\/config\/template\/62","userDefined" : "TRUE"}}',
}


