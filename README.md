# CommitWithBranchName
A swift script that would allow to prepend the branch name to the commit message. This is specifically useful for projects that use Atlassian environment, where the ticket name in JIRA is linked to the branch. In such cases by appending the branch name to the commit message would give a quick link to the ticket when viewed on bitbucket console.
Any other environment that has such functionality can use this.

For example, lets say the project abbrevation on JIRA is MYPROJ. Its ticket would have convention like MYPROJ-123. When a branch is created related to that ticket in Bitbucket then by having commits such as: `MYPROJ-123 initial commit` would link that commit to the ticket. You can also navigate from bitbucket commit link to the JIRA ticket directly if the commit is in this format.

# Usage

The command line name of this tool has been kept vcommit. It is advised to `git add` your changes that need to be committed. Then type the command: `vcommit <message>`, without the branch name.

Examples:

`-> MyProject git: (MYPROJ-123) vcommit "update readme to describe usage"`

Quotes are not necessary in the commit message:
``` 
-> CommitWithBranchName git:(master) ✗ vcommit add committing functionality
[master 4996cf0] master add committing functionality
 1 file changed, 6 insertions(+), 3 deletions(-)
 ```

**Note**: Bitbucket itself allows link detection for different formats of branch names.
For example, if the branch name is `feature/MYPROJ-123-task-description` then the `MYPROJ-123` part of the commit message would appear as a link (and it redirects to the linked JIRA ticket)


# Installation
1. Clone the repo to your machine:

`git clone https://github.com/DIY-Team/CommitWithBranchName/`

2. checkout the repository folder:

`cd CommitWithBranchName`

Next:

### Method 1
install using command:
`swift run Install`

By default the tool is named as `bcommit`. If you wish to keep a different name, use something like this:
`swift run Install <desired-name>`

### Method 2
run `sh install.sh`

# Delete the tool

`rm -rf /usr/local/bin/<tool-name>`

e.g. `rm -rf /usr/local/bin/bcommit` 

# References
for creating a tool: https://www.swiftbysundell.com/articles/building-a-command-line-tool-using-the-swift-package-manager/

for runnig bash commands from swift script: https://gist.github.com/andreacipriani/8c3af3719da31c8fae2cdfa8c21e17ba
