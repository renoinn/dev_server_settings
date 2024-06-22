return {
   -- ref: https://wezfurlong.org/wezterm/config/lua/SshDomain.html
   ssh_domains = {},

   -- ref: https://wezfurlong.org/wezterm/multiplexing.html#unix-domains
   unix_domains = {},

   -- ref: https://wezfurlong.org/wezterm/config/lua/WslDomain.html
   wsl_domains = {
      {
         name = 'WSL:Ubuntu',
         distribution = 'Ubuntu',
         default_cwd = '/home/renoinn',
         default_prog = { '/usr/bin/env', 'zsh', '-l', '-c', 'exec /usr/bin/env zsh' },
      },
   },
}
