## show projects
	- Orgin https://github.com/BEXIS2/GitTestProject
	- Fork https://github.com/DavidBlaa/ForkGitTestProject


## forks and pull requests
- Pull requests lassen sich direkt in git umsetzen und bei 		konflikten kann man die auch dort lösen.
- Pull Request beziehen sich immer auf einen Branch
	- das heißt, ein Task -> ein Branch

1. show how to update a forked project (pull request)
	- change something in the GitTestProject
	- get changes from Orgin -> Fork

2. show how to get changes from fork (pull request)
	- change something in the Fork GitTestProject
	- get changes from Fork -> Orgin

## patches
- patches beziehen sich auf commits, damit kann man bestimmten code aus einem branch weiter geben
	- je kleiner ein commit, desto besser
	- ein commit, sollte wirklich nur änderungen für einen Task beinhalten
- patches können auch auf einen branch gesetzt werden
- für patches müssen die projekte nicht verbunden (fork) sein

### Aufgabe mit mehreren Commits
- wenn ein aufgabe in einem branch mit mehreren commit gelöst wird, kann man den ganzen branch als patch erstellen
- Wenn branches zum dev zurück geführt werden, ist es schwer die commits auseinander zu halten, da sie nach datum sortiert werden. hier hilft die zuweisung zu den tasks in dem commit mit #id


1. show how to use a patch with git bash
	- create a commit
	- create a patch
	- apply patch

2. show how to use a patch with git tortoise
	- create a commit
	- create a patch
	- apply a patch
