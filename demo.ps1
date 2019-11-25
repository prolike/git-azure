git checkout -b demo-1 --track origin/master
touch test
git add test
git commit -m "Testcommit"
git push origin/demo-1
git checkout -b demo-2 --track origin/demo-1
git touch test2
git add test2
git commit -m "Testcommit 2"
Start-Process Integration-robot.ps1
