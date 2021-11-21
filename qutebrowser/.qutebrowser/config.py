# Load existing settings made via :set
config.load_autoconfig()

c.colors.webpage.preferred_color_scheme = "dark"
#c.colors.webpage.darkmode.enabled = True
c.tabs.show = "multiple"
c.tabs.position = "bottom"
#c.statusbar.show = "never"
c.fonts.default_family = "Source Code Pro"
c.fonts.default_size = "13pt"

c.url.start_pages = ["https://github.com/"]
c.url.searchengines = {
    "DEFAULT": "https://google.com/search?hl=en&q={}",
    "!a": "https://www.amazon.de/s?k={}",
    "!e": "https://www.ebay.com/sch/i.html?_nkw={}",
    "!f": "https://www.facebook.com/s.php?q={}",
    "!g": "https://google.com/search?hl=en&q={}",
    "!h": "https://github.com/search?o=desc&q={}&s=stars",
    "!i": "https://www.instagram.com/explore/tags/{}",
    "!m": "https://www.google.com/maps/search/{}",
    "!n": "https://news.google.com/search?q={}",
    "!r": "https://www.reddit.com/search?q={}",
    "!t": "https://twitter.com/search?q={}",
    "!w": "https://en.wikipedia.org/wiki/{}",
    "!y": "https://www.youtube.com/results?search_query={}",
    "!ddg": "https://duckduckgo.com/?ia=web&q={}",
    "!gi": "https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1",
    "!gist": "https://gist.github.com/search?q={}",
    "!wk": "https://en.wiktionary.org/wiki/{}",
}
