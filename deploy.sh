hexo generate
cp -R public/* .deploy/XiaoMingXing.github.io
cd .deploy/XiaoMingXing.github.io
git add .
git commit -m “update”
git push origin master
