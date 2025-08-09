Your existence is to help me customize my Zed configuration, mainly keybindings.

Documentation
- Read @doc/key_bindings.md and @doc/vim_mode.md for Zed's documentation.
- @doc/default_keybinding.json is a JSON file that contains the default keybindings for Zed. It will be overridden by @keymap.json, which is the file we'll be editing.
- Go to Zed's documentation website if needed: https://zed.dev/docs

Some information you may need to know:
- I am a NeoVim and VSCode user.
- Vim Mode is enabled.

Agent Guidelines:
- When editing keybindings, ask me to provide Keyboard Context if needed.
- Refer to @TASKS.md for tasks. You can edit it to add subtasks, modify existing ones, delete at my request, tag them as completed, etc.
- During our conversation, if there's any insight you feel like worth noting down for future reference or there's any misunderstanding you had before but now you understand better, please remind me to update your memory, i.e., update @CLAUDE.md.


- Based on the documentation, here's a visual tree representation of Zed's keyboard context hierarchy:

  Workspace (root)
  ├── os=macos/linux/windows
  ├── keyboard_layout=...
  │
  ├── Pane
  │   └── Editor
  │       ├── mode=full/split
  │       ├── extension=md/js/rs/...
  │       ├── inline_completion
  │       └── vim_mode=normal/insert/visual/replace/operator/waiting
  │           ├── vim_operator=d/c/y/...
  │           └── VimControl (alias for normal || visual || operator)
  │
  ├── Dock
  │   ├── ProjectPanel
  │   │   └── not_editing
  │   ├── Terminal
  │   ├── AssistantPanel
  │   ├── ChatPanel
  │   ├── GitPanel
  │   └── NotificationsPanel
  │
  └── Panels
      ├── SearchPanel
      ├── DiagnosticsPanel
      └── CommandPalette
          └── menu (when active)

  Key Context Rules:

  1. Hierarchy: Child contexts inherit from parents
    - Editor bindings work inside Pane and Workspace
    - More specific contexts take precedence
  2. Boolean Logic:
    - && (and): Editor && vim_mode == normal
    - || (or): vim_mode == normal || vim_mode == visual
    - ! (not): !menu
    - () (grouping): (Editor || Terminal) && !menu
  3. Parent-Child Matching:
    - > operator: Workspace > Editor (Editor inside Workspace)
  4. Common Vim Contexts:
    - VimControl: Normal, visual, or operator mode
    - vim_mode == normal: Normal mode only
    - vim_mode == insert: Insert mode only
    - vim_operator == d: After pressing d (delete operator)
  5. Special Attributes:
    - extension=md: Markdown files only
    - not_editing: In panels, not actively editing
    - menu: When menus/dropdowns are open
