
# Another method for quick change directories.
# Add this to your ~/.zshrc, then just enter “cd …./dir”
#
# rationalise-dot() {
#   if [[ $LBUFFER = *.. ]]; then
#     LBUFFER+=/..
#   else
#     LBUFFER+=.
#   fi
# }
# zle -N rationalise-dot
# bindkey . rationalise-dot
# The first comes back in directory history (Alt+Left), the second let the user
cdUndoKey() {
  popd      > /dev/null
  zle       reset-prompt
  echo
  ls
  echo
}

zle -N                 cdParentKey
bindkey '^[[1;3A'      cdParentKey

# go to the parent directory (Alt+Up). They also display the directory content.
cdParentKey() {
  pushd .. > /dev/null
  zle      reset-prompt
  echo
  ls
  echo
}

zle -N                 cdUndoKey
bindkey '^[[1;3D'      cdUndoKey
# move inside a directory in bash you would type cd foo. In zsh you can just
# type foo if you add this line to your .zshrc:
setopt AUTO_CD
# Move through parent folders conveniently
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
