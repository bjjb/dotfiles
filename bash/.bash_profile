# Include /opt/homebrew, if it exists, on Darwin
[ -f "$HOME/.profile" ] && . "$HOME/.profile"
[ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"

# Initializes GnuPG
hash gpg 2>/dev/null && export GPG_TTY="$(tty)"

# Initializes starship (the fancy prompt)
hash starship 2>/dev/null && . <(starship init bash)
hash direnv 2>/dev/null && . <(direnv hook bash)

if [ "$(uname)" != "Darwin" ]; then
	hash xclip 2>/dev/null && pbcopy() { xclip -selection clipboard -i; }
	hash xclip 2>/dev/null && pbpaste() { xclip -selection clipboard -o; }
fi

# A function to generate a random string, (using jot and rs).
hash random 2>/dev/null || { hash jot 2>/dev/null && hash rs 2>/dev/null; } && random() {
	jot -r -c "${1:-16}" A z | rs -g 0 "${1:-16}"
}

# Completion from asdf and the system
hash brew 2>/dev/null && [ -r "$(brew --prefix)/etc/bash_completion" ] && . "$(brew --prefix)/etc/bash_completion"
[ -r "/etc/profile.d/bash_completion.sh" ] && . "/usr/local/etc/profile.d/bash_completion.sh"
[ -r "/usr/local/share/bash-completion/bash_completion.sh" ] && . "/usr/local/share/bash-completion/bash_completion.sh"
[ -f "$HOME/.asdf/completions/asdf.bash" ] && . "$HOME/.asdf/completions/asdf.bash"

# Completion for apps that output their own completion (i.e., go cobra apps)
for x in minikube kubectl cntb fluxctl gopass glab
do
	hash "$x" 2>/dev/null && . <($x completion bash)
done

# Special completion for apps with *_completer binaries (like aws)
for x in aws
do
	hash "$x" 2>/dev/null && complete -C "${x}_completer" "$x"
done

# Additional gopass shortcuts using fzf
if hash pass 2>/dev/null
then
	pw() { find "$HOME/.password-store/" -type f -not -name '.*' | awk -F "//" '{ print $2 }' | sed 's/\.gpg$//' | fzf -1 -q "$1" | xargs pass show -c; }
	otp() { find "$HOME/.password-store/" -type f -not -name '.*' | awk -F "//" '/otp\.gpg$/ { print $2 }' | sed 's/\.gpg$//' | fzf -1 -q "$1" | xargs pass otp -c; }
fi

if hash gopass 2>/dev/null
then
	pass() { gopass list --flat | fzf -1 -q "$1" | xargs gopass -o -c; }
	otp() { gopass list --flat | grep 'otp$' | fzf -1 -q "$1" | xargs gopass otp -o -c; }
fi

# Initializes docker from minikube
# if hash minikube  2>/dev/null
# then
# 	. <(minikube docker-env)
# fi

# Ignore duplicate commands in history.
export HISTIGNORE="&"

# Uses jq to URL encode the input
urlenc() {
	jq -srR '@uri' | sed 's/%0A$//'
}


# Runs a shell in a one-shot k8s pod in the current namespace
k8srun() {
	image="${1:-public.ecr.aws/docker/library/alpine}"
	args=""
	[ -n "$PORT" ] && args="--port $PORT"
	kubectl run "${USER}-$(date +%s)" --rm --image "$image" \
		--overrides '
			{
				"apiVersion": "v1",
				"metadata": {
					"annotations": {
						"sidecar.istio.io/inject": "false"
					}
				}
			}' \
		-it $args -- sh
}

# Runs a psql session in a pod. Needs PGHOST, PGUSER, PGDATABASE and PGPASSWORD
# set.
k8spsql() {
	image="public.ecr.aws/docker/library/postgres:alpine"
	kubectl run "${USER}-$(date +%s)" --rm --image "$image" \
		--env "PGHOST=${PGHOST}" \
		--env "PGPORT=${PGPORT:-5432}" \
		--env "PGUSER=${PGUSER:-postgres}" \
		--env "PGPASSWORD=${PGPASSWORD}" \
		--env "PGDATABASE=${PGDATABASE:-postgres}" \
		--overrides '
			{
				"apiVersion": "v1",
				"metadata": {
					"annotations": {
						"sidecar.istio.io/inject": "false"
					}
				}
			}' \
		-it $args -- psql
}

# Gets database passwords from the current namespace
k8sdbcreds() {
	if [ "$1" != "" ]
	then
		creds="$(kubectl get secret/${1}-secret-postgres -o json | jq -r '.data')"
		host="$(echo "$creds" | jq -r '.POSTGRES_HOST' | base64 -d)"
		port="$(echo "$creds" | jq -r '.POSTGRES_PORT' | base64 -d)"
		user="$(echo "$creds" | jq -r '.POSTGRES_USERNAME' | base64 -d)"
		pass="$(echo "$creds" | jq -r '.POSTGRES_PASSWORD' | base64 -d)"
		echo "POSTGRES_HOST=${host/-rw./-ro.}"
		echo "POSTGRES_PORT=$port"
		echo "POSTGRES_USERNAME=$user"
		echo "POSTGRES_PASSWORD=$pass"
		echo "PGHOST=$host"
		echo "PGPORT=$port"
		echo "PGUSER=$user"
		echo "PGPASSWORD=$pass"
		echo "PGDATABASE=$1"
		echo "export PGHOST PGPORT PGUSER PGPASSWORD PGDATABASE"
		echo "# You can set these variables with:"
		echo "# . <(${FUNCNAME[0]} $1)"
	else
		echo "Usage: ${FUNCNAME[0]} <service>"
		echo "   where service is one of:"
		kubectl get secret -o name | awk '/-secret-postgres$/ {print $1}' \
			| cut -d/ -f2 | sed 's/-secret-postgres//'
	fi
}

# Forwards connections in the current namespace using socat.
k8socat() {
	target="${1?target (HOST:PORT) required}"
	listen="${2?listener port required}"
	name="${3?-socat-${USER}}"
	kubectl run "${name}-$(date +%s)" --port "$port" --image public.ecr.aws/docker/library/alpine \
		--overrides '{"apiVersion":"v1","metadata":{"annotations":{"sidecar.istio.io/inject":"false"}}}' \
		-- sh -c "apk add socat ; socat -dd 'tcp4-listen:$listen,fork,reuseaddr' 'tcp4:$target'"
}

# Gets a NewStore token
nstoken() {
	u="bbuckley@newstore.com"
	p="$(gopass -o websites/newstore.net/$u)"
	$HOME/src/gitlab.com/newstore/engineering/checkout/clients/token/cmd/token/token -U \
		"https://$u:$p@${2?tenant required}.${1?stage required}.newstore.net/v0"
}

# Makes a call to GitLab
gl() {
	token="$(git lab token)"
	path="${1?path required}"
	curl -gs -H "Authorization: Bearer ${token}" \
		"https://gitlab.com/api/v4/$path"
}

# Makes a call to PagerDuty
pd() {
	token="$(gopass -o pagerduty.com/bbuckley@newstore.com/token)"
	path="${1?path required}"
	curl -gs -H "Authorization: Token token=${token}" \
		"https://api.pagerduty.com/$path"
}

# Re-reads this file
reinitialize() {
	. ~/.bash_profile
}

# Assumes an EKS role
assume_eks_role() {
	d="$(kubectl get deployments -o name | fzf)"
	a="$(kubectl get "$d" -o go-template='.spec.template.spec.serviceAccount')"
	r="$(kubectl get serviceaccount "sa" -o go-template='.metadata.annotations["eks.amazonaws.com/role-arn"]')"
	c="$(kubectl get "$d" -o json | jq -r '.spec.template.spec.containers[].name')"
	t="$(kubectl exec "$d" -c "$c" -- cat /var/run/secrets/eks.amazonaws.com/serviceaccount/token)"
	aws sts assume-role-with-web-identity \
		--role-arn $r --role-session-name $USER-$(date +%s) \
		--web-identity-token "$t" \
		--query '[Credentials.AccessKeyId,Credentials.SecretAccessKey,Credentials.SessionToken]' \
		--output text \
		| xargs printf "export AWS_ACCESS_KEY_ID='%s'
export AWS_SECRET_ACCESS_KEY='%s'
export AWS_SESSION_TOKEN='%s'"
}

# Lists paths up to this one. For example:
# $ paths a/b/c
# a
# a/b
# a/b/c
paths() {
	case "$1" in
		"") paths "$(pwd)" ;;
		"/") echo "/"; return ;;
		".") return ;;
		*) paths "$(dirname "$1")" ;;
	esac
	echo "$1"
}

ns() {
	cmd="${1:-otp}"
	shift
	case "$cmd" in
		otp)
			# Uses the OTP function 👆 to get the newstore-sso.okta.com OTP
			otp newstoreoktabb
			return 0
			;;
		*)
			printf 'Unknown command %s' "$cmd" > /dev/stderr
			return 1
			;;
	esac
}

# Decodes a JWT using jq(1).
jwt () { 
	jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' $@
}

# Gets the CPU temperature
how_hot_is_the_core() {
	os="$(uname)"
	case "$os" in
		"FreeBSD") sysctl -a dev.cpu | grep temperature ;;
		"Linux") cat /sys/class/thermal/thermal_zone?/temp ;;
		"Darwin") sudo powermetrics --samplers smc ;;
		*) printf "I don't know how to get the temperature on %s\n" os ;;
	esac
}

# Refresh your AWS cached credentials
reaws() {
	ns; env -u AWS_PROFILE aws --profile "${AWS_PROFILE?required}" sts get-caller-identity
}

hash brew 2>/dev/null && [ -d "$(brew --prefix)/opt/postgresql@15/bin" ] && PATH="${PATH}:$(brew --prefix)/opt/postgresql@15/bin"
hash psql 2>/dev/null || psql () {
	docker run --rm -it -e PGHOST=$PGHOST -e PGUSER=$PGUSER -e PGPASSWORD=$PGPASSWORD -e PGDATABASE=$PGDATABASE postgres:alpine psql $@
}
# vi:ft=bash
