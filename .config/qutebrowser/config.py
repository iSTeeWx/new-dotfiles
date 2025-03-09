import catppuccin

config.load_autoconfig(False)
catppuccin.setup(c, "Mocha", True)
c.content.site_specific_quirks.enabled = True
c.colors.webpage.preferred_color_scheme = "dark"
c.auto_save.session = True


c.fonts.default_size = "14pt"
c.fonts.default_family = "Source Code Pro"
c.statusbar.position = "top"

c.tabs.max_width = 400
c.tabs.title.alignment = "center"
c.tabs.title.format = "{audio}[{index}]{current_title}"
c.tabs.indicator.padding = {"bottom": 4, "left": 0, "right": 4, "top": 4}

config.unbind("+")
config.bind("<ctrl-=>", "zoom-in")

config.unbind("-")
config.bind("<ctrl-->", "zoom-out")
