export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git)

source $ZSH/oh-my-zsh.sh

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
SPACESHIP_CHAR_SYMBOL="➜ "
# ➜ ➔ ➘ ➙ ➚ ➛ ➝ ➞ ⇒ ⊶ ⋗ ✕
SPACESHIP_CHAR_SUFFIX=""

ZINIT_HOME=${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git
[ ! -d $ZINIT_HOME ] && mkdir -p $(dirname $ZINIT_HOME)
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git $ZINIT_HOME
source ${ZINIT_HOME}/zinit.zsh

zinit light-mode for \
	zdharma-continuum/z-a-rust \
	zdharma-continuum/z-a-as-monitor \
	zdharma-continuum/z-a-patch-dl \
	zdharma-continuum/z-a-bin-gem-node \
	zdharma-continuum/zinit-annex-as-monitor \
	zdharma-continuum/zinit-annex-bin-gem-node \
	zdharma-continuum/zinit-annex-patch-dl \
	zdharma-continuum/zinit-annex-rust \
	zdharma/fast-syntax-highlighting \
	zsh-users/zsh-autosuggestions \
	zsh-users/zsh-completions

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
