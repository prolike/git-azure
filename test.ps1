$currentBranchName = git branch | grep \* | cut -d ' ' -f2- 
$parentBranch = git branch -vv | grep '$currentBranchName' | awk '{print $4}'


Write-Host $currentBranchName
Write-Host $parentBranch

try{
	git checkout $currentBranchName
	git rebase $parentBranch 2>&1 | Write-Host
	git checkout $parentBranch
	git merge $currentBranchName --ff-only
	git push origin $parentBranch
}
catch{
	Write-Host "ERROR CATHCED"
	Write-Host $_
}

pause