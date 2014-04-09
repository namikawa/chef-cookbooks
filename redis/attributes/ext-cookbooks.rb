########## limits.conf ##########
default["security"]["limits"]["domains"]["*"] = {
  "nofile" => {
    "soft" => "16384",
    "hard" => "32768",
  },
  "stack" => {
    "soft" => "16384",
    "hard" => "32768",
  }
}

