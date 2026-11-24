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

resource "random_password" "password" {
  count = module.context.enabled ? 1 : 0

  length           = var.password_length
  keepers          = var.password_keepers
  lower            = var.password_include_lower
  min_lower        = var.password_min_lower
  min_numeric      = var.password_min_numeric
  min_special      = var.password_min_special
  min_upper        = var.password_min_upper
  override_special = var.password_override_special
  special          = var.password_include_special
  upper            = var.password_include_upper
}
