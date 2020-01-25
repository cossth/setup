echo "Remove Files if exist"
rm githubkeys
rm userkeys
echo "Download keys from github" 
curl -L https://github.com/cossth.keys > githubkeys
echo "Move key"
mv authorized_keys userkeys
echo "Sort Keys"
sort -mu githubkeys userkeys > authorized_keys
echo "Cleanup"
rm githubkeys
rm userkeys
