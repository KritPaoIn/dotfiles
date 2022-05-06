#!/usr/bin/env python3

"""
iTerm2 Dynamic Dark Mode
"""

import iterm2


async def change_theme(connection, parts):
    """
    Change Theme
    """
    theme_dark = "ayu Dark"
    theme_light = "ayu Light"

    if "dark" in parts:
        preset = await iterm2.ColorPreset.async_get(connection, theme_dark)
    else:
        preset = await iterm2.ColorPreset.async_get(connection, theme_light)

    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)


async def main(connection):
    app = await iterm2.async_get_app(connection)
    initial_theme = await app.async_get_theme()
    await change_theme(connection, initial_theme)

    async with iterm2.VariableMonitor(
        connection, iterm2.VariableScopes.APP, "effectiveTheme", None
    ) as mon:
        while True:

            theme = await mon.async_get()
            parts = theme.split(" ")
            await change_theme(connection, parts)


iterm2.run_forever(main)
