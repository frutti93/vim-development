set -e

eval "$(ssh-agent -s)" > /dev/null

for possiblekey in ${HOME}/.ssh/*; do
    if grep -q PRIVATE "$possiblekey"; then
        eval ssh-add "$possiblekey" &> /dev/null
    fi
done

/bin/bash