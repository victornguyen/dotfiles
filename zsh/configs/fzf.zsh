# fzf config

# Set ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# Apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# base16-oceanicnext fzf colour scheme
# https://github.com/nicodebo/base16-fzf
_gen_fzf_default_opts() {
  local color00='#1B2B34'
  local color01='#343D46'
  local color02='#4F5B66'
  local color03='#65737E'
  local color04='#A7ADBA'
  local color05='#C0C5CE'
  local color06='#CDD3DE'
  local color07='#D8DEE9'
  local color08='#EC5f67'
  local color09='#F99157'
  local color0A='#FAC863'
  local color0B='#99C794'
  local color0C='#5FB3B3'
  local color0D='#6699CC'
  local color0E='#C594C5'
  local color0F='#AB7967'

  export FZF_DEFAULT_OPTS="
    --height 40% --border
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  "
}

_gen_fzf_default_opts
