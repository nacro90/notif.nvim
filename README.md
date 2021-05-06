# notif.nvim

Notification and reminder helper for Neovim.

**Currently this plugin is WIP. It may be useful for some cases but it is not
ready for daily usage now.**

## Features

- Set a notification for given duration with a message

## Installation

Use your favourite plugin manager.

## Usage

### Setup

Setup with default options:

```lua
require('notif').setup()
```

You can override the options like following:

```lua
require('notif').setup {
  create_commands = true,
  message_highlight = 'WarningMsg',
}
```

You can select your desired highlight with `:highlight` command.

## Create notification

Create a notification for 8 minutes with message `heyoo`:

```viml
:Notif 8m heyoo
```

Create a 12 seconds notification with a long message:

```viml
:Notif 12m
```

After pressing `<CR>`, you will be prompted for the notification message in the
command line.

The time suffixes (e.g 8m, 1s) are the same as the suffixes for Unix `sleep`
command. You can emmit the suffix, if so the notification assumes the duration
as seconds.


## TODO

- [X] Simple notifications with unix time suffixes
- [ ] Management of active and past timers
- [ ] Implement more alert types other than printing the message
- [ ] More comprehensive vim commands
- [ ] On notified event and callbacks
