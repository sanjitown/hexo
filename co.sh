#!/bin/sh
cd /home/adiao;
rm -rf hexo;
cp -r blog hexo;
rm -rf hexo/themes/next/.git;
cd hexo;
git init;
git add .;
git commit -m "backup";
git remote add origin git@github.com:sanjitown/hexo.git;
git pull origin master;
git push -u origin master;



