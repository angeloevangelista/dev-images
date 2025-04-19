ZSH_THEME="robbyrussell"

# it makes sure spaceship theme is loaded only outside warp terminal
if [[ $TERM_PROGRAM != "WarpTerminal" ]]; then
	ZSH_THEME="spaceship"
fi

# it allows Fn keys to work normally on external keyboard for macos
if [[ -f /sys/module/hid_apple/parameters/fnmode ]]; then
  echo 0 > /sys/module/hid_apple/parameters/fnmode
fi

### Zinit's stuff beginning
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
		print -P "%F{33} %F{34}Installation successful.%f%b" || \
		print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
	zdharma-continuum/zinit-annex-as-monitor \
	zdharma-continuum/zinit-annex-bin-gem-node \
	zdharma-continuum/zinit-annex-patch-dl \
	zdharma-continuum/zinit-annex-rust

zinit light-mode for \
	spaceship-prompt/spaceship-prompt \
	zdharma/fast-syntax-highlighting \
	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-completions
### Zinit's stuff end

### NVM's stuff beginning
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
### NVM's stuff end

### Spaceship's stuff beginning
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="➔ "
# ➜ ➔ ➘ ➙ ➚ ➛ ➝ ➞ ⇒ ⊶ ⋗ ✕
SPACESHIP_CHAR_SUFFIX=""
### Spaceship's stuff end

function configure_git_user() {
	if [ -z "$SKIP_GIT_USER_CONFIG" ] && [ -f ~/.gitconfig ] && ! grep -q '^\[user\]' ~/.gitconfig; then
		echo "Howdy, champ! Are you Angelo or not? (Y/N)"

		read -r -k 1 YN

		if [[ $YN =~ [Yy] ]]; then
			git config --global user.name "Angelo Evangelista"
			git config --global user.email "angeloevan.ane@gmail.com"
		else
			git config --global user.name "dev-42"
			git config --global user.email "dev-42@mail.com"
		fi

		echo "\nHave a great day, sir!"
	fi
}

configure_git_user
