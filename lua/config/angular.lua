--INFO: This cmd is related to where you install your npm packages globally.
--For this we need to install @angular-language-server + typescript.
local angular_cmd = {
  "ngserver",
  "--ngProbeLocations",
  "./",
  "--tsProbeLocations",
  "./",
  "--stdio",
}

return {
  cmd = angular_cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = angular_cmd
  end,
}
