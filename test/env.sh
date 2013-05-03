COOK_DIR="$( readlink -f -- "${0%/*}" )/../"
KITCHEN_DIR="${COOK_DIR}/.kitchen"
GEM_HOME="${HOME}/.gem"
PATH="${HOME}/.gem/bin:$PATH"
VAGRANT_HOME="${HOME}/.vagrant_cookbooks"
echo $COOK_DIR

export COOK_DIR KITCHEN_DIR GEM_HOME VAGRANT_HOME PATH
