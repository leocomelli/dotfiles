function __kube
  set -l ctx (kubectl config current-context 2>/dev/null)
  if [ $status -ne 0 ]
    set ctx "-"
  end

  set -l ns (kubectl config view -o "jsonpath={.contexts[?(@.name==\"$ctx\")].context.namespace}")
  [ -z $ns ]; and set -l ns 'default'

  set ctx_abbr (string split "/" -- $ctx)[2]

  echo -s "k8s:" (set_color b16286) "$ctx_abbr/" (set_color d3869b) "$ns" (set_color normal)
end

function __terraform
  set -l wks (terraform workspace show 2>/dev/null)
  if [ -z "$wks" ]
    set wks "-"
  end
  echo -s "tf:" (set_color 458588) "$wks" (set_color normal)
end

function __aws_profile
  set -l aws "-"
  if [ ! -z "$AWS_PROFILE" ]
    set aws $AWS_PROFILE
  end
  echo -s "aws:" (set_color d65d0e) "$aws" (set_color normal)
end

function __infra_prompt
  echo -s " ["(__aws_profile)"|"(__terraform)"|"(__kube)"]"
end

function infra_ps -a toggle
  if test "$toggle" = "on"
    set -U __infra_ps_enabled 1
    return
  end

  if test "$toggle" = "off"
    set -U __infra_ps_enabled 0
    return
  end
end

function fish_prompt
  if test -z "$__infra_ps_enabled"; or test $__infra_ps_enabled -ne 1
    echo -n -s (set_color $fish_color_cwd --bold) (basename $PWD)(set_color normal) (fish_git_prompt) " "
    return
  end

  echo -n -s (set_color $fish_color_cwd --bold) (basename $PWD)(set_color normal) (__infra_prompt) (fish_git_prompt) " "
end

