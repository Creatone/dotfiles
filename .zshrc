export GODTOOLS_CONFIG="env:KfX5SYK9PtH0bLpgpQOUJ5M+NCzoEEHvlv+IGL+0KPWnP12ix3UtJGg9epldwL3eQ4yunt0A8yKQVF5I83KL7ypXpXiPnpC+JGVbD8AFWOF4b5nEAsp0ilADrb5RTSq2qgsjWg+aUERPZEWFKQgD5F7gZlL18pWPIB353nEdm4P2gzLX1TEbZSvF1tDIy328xl7FFJIMMbb+0O7DDFEjSNgyVtTWlF6wYm80lYqAkxGnAR78stecxqXceff1jUWxJ+EWaWO60r+Awx51MmWb29by9by5QpOKDE4tak7UPw/xgaf7KZiZ4HJcQnY8ArXQVhbdHnIo5nfNBO/sTh4m+pq3CfJrqI9TrSQVz1aIFrCeg9My7PTdBxvF1DmGGkqrE8qaoks0Rpd2NN+ilx2BwH5kYdWvFnOiHZEe+waniONOOMUbCpmpYQ0aQgxW3rkXPUjbiFYbVlGEE6FvGLqXOeSBQARhd5MYaFzlxBIYIfKhWQOZ/xkR4/U9shICQg9/9Pm9rD/mCF1krks1OGqzP5lZVrpvNoKjoyBuT9akBuKes2KwwQJkXbVu5FTGAcwGfHXko81W4P8thqT+L0O4RQWtna9xj6NLYMBNftPUDkRc8FC5X3Jv4X7W+rrNC2g5Mg3MHpG52bfJXmFr+ZR9qd4yroHprkBARTDihvt/D1zaP9cPrVbp18n31YzGm89p3ZKICJl8vM/k418hzPRGpAGMFkMQ0DSMup86U+Bnz13Mg9M5ShZZ7Ejo+nqPKT4sih227C4n7YpTSV/ZGGg27uHa24I0xJTSIWqVren08irFn+wxOgy5kDOOeP8ZAwoZd+7CS6AMIj+w2AAhZr5LNTAAMdNYUw0ydIJnYjuYKKmUYIY2dlMq3K+VmUHA/jlEss1sZPjn2bQKoZg+QM3glcJA29O9SbJb/EYMlOpd9NtZtX6wRtZbLaCS64fIXaduJztT7Pt9JK02Q/1TXrwSr0OYx+r68NwNusl/cAB7fVP0BCFeDotyJ/rgt9pbbs/d4Qkeih3QdgLRCe+pmu59f1gnxnoXfWWJ2+b2SVPmKjpp3//1/9fEQKk+hcf/GeZwwaOLKpLOl/bpLc/X/4pLdAPNKDxzY5KnnLGIp5ZqjYyd/9/Z641hsWl8WeYvxuBhB0T+vO+ohoVSFdVSqJnSoCtROnXOIR3P78LsSdWQkv6yplXFdW0nNo2UkNtZVbvO9jJMPyDmHmqj6soqcFH2zB7CtgxD9Iwiql4JeXi4i7SQizSt2scEcGIG3PbWkf87hoDDaDuQQJcwxxu41SDxcFcaBrYgZ2DZfmrBta2jbE5qO+Nlwqu2CXQnIzdmwhTtGdsF4PswVOADiT6aGyXWYGooMHjK4PyjjCC6b8MWiqRLVsGFG+QBjfrvncJN3Mbnwbl/n5+8cFCLV4NVFmXS+kqSatj9gxbXkVIVnh07F9UZBPz4a4nU45yvIgtz69Q39x3LhFYrE+xz/nWftCIgGsihgI4q5k38YkfT4AGG63VPZcTMRobclr5gOMtaAv2eF6z7+bIQQOhFVPhyPipde2V8qCx6MqAldPD2Hwu81ZRtdtR2ZId/XAHMJWmE6QIqxLvUNJuM+zCTNrlKK5rUvTWUIpuE8jOQ95kELN0CTW4a+o2rL7OlTq2O6b4O2XYo2d9C/2il/LUv6vuZadyUGX+HTNj2XSuv+x6HRuCnnCQjamlKDR17TaDtBYEq9jMNrVrw7BqAWwHhiTH9fPXGnn0Wc6EvPyvJR1QB0L0PhpwMuyexT+F9eE0Na8O1MelNeWtjD41NC1drCCMfrZN/JYl+VF1hZRdK6Zg1LhDE7bk8n9m9AuQkcanymZXIJKKspsylGq+wFr5sWNhOhu6mGqVVJCuXoRHcED/kHRJCnxcFImi3i3U="
export GODTOOLS_KEY=vpmGCX9MzS+KTYvHm1tLxgPhPeqxIVMbQLfLIQhzb5A=
export ZSH="$HOME/.oh-my-zsh"
export GIT_EDITOR="nvim"
export KUBE_EDITOR="nvim"

export GOPATH="$HOME/go"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:/usr/local/go/bin:$PATH:$GOPATH/bin:$HOME/.local/bin"

ZSH_THEME="lambda"

source $ZSH/oh-my-zsh.sh

function kubectl() {
	if ! type __start_kubectl >/dev/null 2>&1; then
		source <(command kubectl completion zsh)
	fi
	command kubectl "$@"
}

# This command is used a LOT both below and in daily life
alias k=kubectl

# Execute a kubectl command against all namespaces
alias kca='f(){ kubectl "$@" --all-namespaces;  unset -f f; }; f'

# Apply a YML file
alias kaf='kubectl apply -f'

# Drop into an interactive terminal on a container
alias keti='kubectl exec -ti'

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc='kubectl config use-context'
alias kcsc='kubectl config set-context'
alias kcdc='kubectl config delete-context'
alias kccc='kubectl config current-context'

# List all contexts
alias kcgc='kubectl config get-contexts'

# General aliases
alias kdel='kubectl delete'
alias kdelf='kubectl delete -f'

# Pod management.
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpw='kgp --watch'
alias kgpwide='kgp -o wide'
alias kep='kubectl edit pods'
alias kdp='kubectl describe pods'
alias kdelp='kubectl delete pods'

# get pod by label: kgpl "app=myapp" -n myns
alias kgpl='kgp -l'

# Service management.
alias kgs='kubectl get svc'
alias kgsa='kubectl get svc --all-namespaces'
alias kgsw='kgs --watch'
alias kgswide='kgs -o wide'
alias kes='kubectl edit svc'
alias kds='kubectl describe svc'
alias kdels='kubectl delete svc'

# Ingress management
alias kgi='kubectl get ingress'
alias kgia='kubectl get ingress --all-namespaces'
alias kei='kubectl edit ingress'
alias kdi='kubectl describe ingress'
alias kdeli='kubectl delete ingress'

# Namespace management
alias kgns='kubectl get namespaces'
alias kens='kubectl edit namespace'
alias kdns='kubectl describe namespace'
alias kdelns='kubectl delete namespace'
alias kcn='kubectl config set-context $(kubectl config current-context) --namespace'

# ConfigMap management
alias kgcm='kubectl get configmaps'
alias kgcma='kubectl get configmaps --all-namespaces'
alias kecm='kubectl edit configmap'
alias kdcm='kubectl describe configmap'
alias kdelcm='kubectl delete configmap'

# Secret management
alias kgsec='kubectl get secret'
alias kgseca='kubectl get secret --all-namespaces'
alias kdsec='kubectl describe secret'
alias kdelsec='kubectl delete secret'

# Deployment management.
alias kgd='kubectl get deployment'
alias kgda='kubectl get deployment --all-namespaces'
alias kgdw='kgd --watch'
alias kgdwide='kgd -o wide'
alias ked='kubectl edit deployment'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'
alias ksd='kubectl scale deployment'
alias krsd='kubectl rollout status deployment'
kres(){
    kubectl set env $@ REFRESHED_AT=$(date +%Y%m%d%H%M%S)
}

# Rollout management.
alias kgrs='kubectl get rs'
alias krh='kubectl rollout history'
alias kru='kubectl rollout undo'

# Statefulset management.
alias kgss='kubectl get statefulset'
alias kgssa='kubectl get statefulset --all-namespaces'
alias kgssw='kgss --watch'
alias kgsswide='kgss -o wide'
alias kess='kubectl edit statefulset'
alias kdss='kubectl describe statefulset'
alias kdelss='kubectl delete statefulset'
alias ksss='kubectl scale statefulset'
alias krsss='kubectl rollout status statefulset'

# Port forwarding
alias kpf="kubectl port-forward"

# Tools for accessing all information
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'

# Logs
alias kl='kubectl logs'
alias kl1h='kubectl logs --since 1h'
alias kl1m='kubectl logs --since 1m'
alias kl1s='kubectl logs --since 1s'
alias klf='kubectl logs -f'
alias klf1h='kubectl logs --since 1h -f'
alias klf1m='kubectl logs --since 1m -f'
alias klf1s='kubectl logs --since 1s -f'

# File copy
alias kcp='kubectl cp'

# Node Management
alias kgno='kubectl get nodes'
alias keno='kubectl edit node'
alias kdno='kubectl describe node'
alias kdelno='kubectl delete node'

# PVC management.
alias kgpvc='kubectl get pvc'
alias kgpvca='kubectl get pvc --all-namespaces'
alias kgpvcw='kgpvc --watch'
alias kepvc='kubectl edit pvc'
alias kdpvc='kubectl describe pvc'
alias kdelpvc='kubectl delete pvc'

alias vi=vim
alias vim=nvim
alias wca="cd $HOME/Repositories/workload-collocation-agent; source env/bin/activate"
alias gowca="cd $HOME/Repositories/gowca-scheduler"
alias prm="cd $HOME/Repositories/platform-resource-manager/prm; pipenv shell"
alias proxy="sudo systemctl start proxy"
alias lab="sudo openvpn ~/Documents/Work/igk-pf1-TCP-443-pszulik/igk-pf1-TCP-443-pszulik.ovpn"
alias runc="cd $HOME/Repositories/runc" 
alias cadvisor="cd $HOME/Repositories/cadvisor"
alias goland="/opt/GoLand-2023.1/bin/goland.sh"
alias cnode="ssh pawel@100.65.112.11"
alias prometheus="cd $HOME/Repositories/prometheus"

function to_node() {
	command ssh "pszulik@100.64.176.$@"
}

PROG=barman
_CLI_ZSH_AUTOCOMPLETE_HACK=1
source $HOME/.config/zsh_autocomplete.txt
plugins=(docker docker-compose)
### Fix for making Docker plugin work
autoload -U compinit && compinit
###
function gothic2() {
	cp "$HOME/.wine/drive_c/Program Files/JoWooD/Gothic II/System/correct.gothic.ini" "$HOME/.wine/drive_c/Program Files/JoWooD/Gothic II/System/gothic.ini"
	wine "$HOME/.wine/drive_c/Program Files/JoWooD/Gothic II/System/Gothic2.exe"
}
#compdef helm

# zsh completion for helm                                 -*- shell-script -*-

__helm_debug()
{
    local file="$BASH_COMP_DEBUG_FILE"
    if [[ -n ${file} ]]; then
        echo "$*" >> "${file}"
    fi
}

_helm()
{
    local shellCompDirectiveError=1
    local shellCompDirectiveNoSpace=2
    local shellCompDirectiveNoFileComp=4
    local shellCompDirectiveFilterFileExt=8
    local shellCompDirectiveFilterDirs=16

    local lastParam lastChar flagPrefix requestComp out directive comp lastComp noSpace
    local -a completions

    __helm_debug "\n========= starting completion logic =========="
    __helm_debug "CURRENT: ${CURRENT}, words[*]: ${words[*]}"

    # The user could have moved the cursor backwards on the command-line.
    # We need to trigger completion from the $CURRENT location, so we need
    # to truncate the command-line ($words) up to the $CURRENT location.
    # (We cannot use $CURSOR as its value does not work when a command is an alias.)
    words=("${=words[1,CURRENT]}")
    __helm_debug "Truncated words[*]: ${words[*]},"

    lastParam=${words[-1]}
    lastChar=${lastParam[-1]}
    __helm_debug "lastParam: ${lastParam}, lastChar: ${lastChar}"

    # For zsh, when completing a flag with an = (e.g., helm -n=<TAB>)
    # completions must be prefixed with the flag
    setopt local_options BASH_REMATCH
    if [[ "${lastParam}" =~ '-.*=' ]]; then
        # We are dealing with a flag with an =
        flagPrefix="-P ${BASH_REMATCH}"
    fi

    # Prepare the command to obtain completions
    requestComp="${words[1]} __complete ${words[2,-1]}"
    if [ "${lastChar}" = "" ]; then
        # If the last parameter is complete (there is a space following it)
        # We add an extra empty parameter so we can indicate this to the go completion code.
        __helm_debug "Adding extra empty parameter"
        requestComp="${requestComp} \"\""
    fi

    __helm_debug "About to call: eval ${requestComp}"

    # Use eval to handle any environment variables and such
    out=$(eval ${requestComp} 2>/dev/null)
    __helm_debug "completion output: ${out}"

    # Extract the directive integer following a : from the last line
    local lastLine
    while IFS='\n' read -r line; do
        lastLine=${line}
    done < <(printf "%s\n" "${out[@]}")
    __helm_debug "last line: ${lastLine}"

    if [ "${lastLine[1]}" = : ]; then
        directive=${lastLine[2,-1]}
        # Remove the directive including the : and the newline
        local suffix
        (( suffix=${#lastLine}+2))
        out=${out[1,-$suffix]}
    else
        # There is no directive specified.  Leave $out as is.
        __helm_debug "No directive found.  Setting do default"
        directive=0
    fi

    __helm_debug "directive: ${directive}"
    __helm_debug "completions: ${out}"
    __helm_debug "flagPrefix: ${flagPrefix}"

    if [ $((directive & shellCompDirectiveError)) -ne 0 ]; then
        __helm_debug "Completion received error. Ignoring completions."
        return
    fi

    local activeHelpMarker="_activeHelp_ "
    local endIndex=${#activeHelpMarker}
    local startIndex=$((${#activeHelpMarker}+1))
    local hasActiveHelp=0
    while IFS='\n' read -r comp; do
        # Check if this is an activeHelp statement (i.e., prefixed with $activeHelpMarker)
        if [ "${comp[1,$endIndex]}" = "$activeHelpMarker" ];then
            __helm_debug "ActiveHelp found: $comp"
            comp="${comp[$startIndex,-1]}"
            if [ -n "$comp" ]; then
                compadd -x "${comp}"
                __helm_debug "ActiveHelp will need delimiter"
                hasActiveHelp=1
            fi

            continue
        fi

        if [ -n "$comp" ]; then
            # If requested, completions are returned with a description.
            # The description is preceded by a TAB character.
            # For zsh's _describe, we need to use a : instead of a TAB.
            # We first need to escape any : as part of the completion itself.
            comp=${comp//:/\\:}

            local tab="$(printf '\t')"
            comp=${comp//$tab/:}

            __helm_debug "Adding completion: ${comp}"
            completions+=${comp}
            lastComp=$comp
        fi
    done < <(printf "%s\n" "${out[@]}")

    # Add a delimiter after the activeHelp statements, but only if:
    # - there are completions following the activeHelp statements, or
    # - file completion will be performed (so there will be choices after the activeHelp)
    if [ $hasActiveHelp -eq 1 ]; then
        if [ ${#completions} -ne 0 ] || [ $((directive & shellCompDirectiveNoFileComp)) -eq 0 ]; then
            __helm_debug "Adding activeHelp delimiter"
            compadd -x "--"
            hasActiveHelp=0
        fi
    fi

    if [ $((directive & shellCompDirectiveNoSpace)) -ne 0 ]; then
        __helm_debug "Activating nospace."
        noSpace="-S ''"
    fi

    if [ $((directive & shellCompDirectiveFilterFileExt)) -ne 0 ]; then
        # File extension filtering
        local filteringCmd
        filteringCmd='_files'
        for filter in ${completions[@]}; do
            if [ ${filter[1]} != '*' ]; then
                # zsh requires a glob pattern to do file filtering
                filter="\*.$filter"
            fi
            filteringCmd+=" -g $filter"
        done
        filteringCmd+=" ${flagPrefix}"

        __helm_debug "File filtering command: $filteringCmd"
        _arguments '*:filename:'"$filteringCmd"
    elif [ $((directive & shellCompDirectiveFilterDirs)) -ne 0 ]; then
        # File completion for directories only
        local subdir
        subdir="${completions[1]}"
        if [ -n "$subdir" ]; then
            __helm_debug "Listing directories in $subdir"
            pushd "${subdir}" >/dev/null 2>&1
        else
            __helm_debug "Listing directories in ."
        fi

        local result
        _arguments '*:dirname:_files -/'" ${flagPrefix}"
        result=$?
        if [ -n "$subdir" ]; then
            popd >/dev/null 2>&1
        fi
        return $result
    else
        __helm_debug "Calling _describe"
        if eval _describe "completions" completions $flagPrefix $noSpace; then
            __helm_debug "_describe found some completions"

            # Return the success of having called _describe
            return 0
        else
            __helm_debug "_describe did not find completions."
            __helm_debug "Checking if we should do file completion."
            if [ $((directive & shellCompDirectiveNoFileComp)) -ne 0 ]; then
                __helm_debug "deactivating file completion"

                # We must return an error code here to let zsh know that there were no
                # completions found by _describe; this is what will trigger other
                # matching algorithms to attempt to find completions.
                # For example zsh can match letters in the middle of words.
                return 1
            else
                # Perform file completion
                __helm_debug "Activating file completion"

                # We must return the result of this command, so it must be the
                # last command, or else we must store its result to return it.
                _arguments '*:filename:_files'" ${flagPrefix}"
            fi
        fi
    fi
}

# don't run the completion function when being source-ed or eval-ed
if [ "$funcstack[1]" = "_helm" ]; then
    _helm
fi
compdef _helm helm

