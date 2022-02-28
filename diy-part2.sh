#删除重复包
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/packages/net/aliyundrive-webdav
rm -rf feeds/luci/applications/luci-app-ocserv
mv package/luci-app-ocserv feeds/luci/applications
rm -rf feeds/luci/applications/luci-app-dockerman
rm -rf feeds/packages/multimedia/UnblockNeteaseMusic
rm -rf feeds/luci/applications/luci-app-unblockmusic
#rm -rf feeds/luci/applications/luci-app-openvpn-server
rm -rf feeds/packages/multimedia/UnblockNeteaseMusic-Go
rm -rf feeds/luci/applications/luci-app-aliyundrive-webdav
