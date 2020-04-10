=Dotnet Publish=
`dotnet publish -c release -r linux-x64 --self-contained false`

=Copy Files=
`scp.exe -r publish\* root@cossth.com:/var/www/domain.com`
