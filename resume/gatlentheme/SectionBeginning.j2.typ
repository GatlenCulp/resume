== ((* if emoji_icon *))<<emoji_icon>> ((* elif emoji_icons and emoji_icons|length > 0 *))<<emoji_icons[0]>> ((* endif *))<<section_title>>
((* if not design.entries.allow_page_break_in_sections *))
#block(
  [
((* endif *))
((* if entry_type in ["NumberedEntry", "ReversedNumberedEntry"] *))
#one-col-entry(
  content: [
  ((* if entry_type == "ReversedNumberedEntry" *))
    #let rev-enum-items = (
  ((* endif *))
((* endif *))
