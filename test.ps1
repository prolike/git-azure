$currentBranchName = git branch | grep \* | cut -d ' ' -f2- 

Write-Host $currentBranchName

try{
	git checkout $currentBranchName
	git rebase master 2>&1 | Write-Host
	git checkout master
	git merge $currentBranchName --ff-only
	git push origin master
}
catch{
	Write-Host "ERROR CATHCED"
	Write-Host $_
}

pause