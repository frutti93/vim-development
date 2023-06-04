set -e

# Initialize the ssh agent and add all ssh keys to allow access to remote repos
eval "$(ssh-agent -s)" > /dev/null

for possiblekey in ${HOME}/.ssh/*; do
    if grep -q PRIVATE "$possiblekey"; then
        eval ssh-add "$possiblekey" &> /dev/null
    fi
done

# Run bash for the interactive development session
/bin/bash