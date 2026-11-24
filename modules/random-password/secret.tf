## ----------------------------------------------------------------------------
## Copyright 2026 Raring Group LLC
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## ----------------------------------------------------------------------------

locals {
  secrets = {
    "${var.keyname_password}" = join("", random_password.password.*.result)
  }

}

module "secret" {
  source  = "../../"
  context = module.context.self


  description                     = var.description
  create_sns                      = var.create_sns
  kms_key_deletion_window_in_days = var.kms_key_deletion_window_in_days
  kms_key_enable_key_rotation     = var.kms_key_enable_key_rotation
  secret_ignore_changes           = var.secret_ignore_changes
  secret_read_principals          = var.secret_read_principals
  secret_string                   = jsonencode(merge(local.secrets, var.additional_secrets))
  sns_pub_principals              = var.sns_pub_principals
  sns_sub_principals              = var.sns_sub_principals
}
