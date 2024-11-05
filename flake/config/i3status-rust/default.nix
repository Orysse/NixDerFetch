{ ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars.default = {
      blocks = [
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "memory";
            interval = 1;
            format = " $icon $mem_used.eng(prefix:Mi)/$mem_total.eng(prefix:Mi)($mem_used_percents.eng(w:2)) ";
          }
          {
            block = "disk_space";
            path = "/";
            info_type = "available";
          }
          {
            block = "load";
            interval = 1;
            format = " $icon $1m ";
          }
          {
            block = "sound";
            click = [{
              button = "left";
              cmd = "pavucontrol";
            }];
          }
          {
            block = "custom";
            interval = 1;
            command = ''date "+%a %d/%m %H:%M:%S"'';
          }
        ];

      settings = {
        theme = {
          theme = "ctp-mocha";
        };
      };
      icons = "awesome6";
      theme = "ctp-mocha";
    };
  };
}
