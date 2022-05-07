#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# 修改openwrt登陆地址,把下面的192.168.2.22修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.2.22/g' package/base-files/files/bin/config_generate

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/luci-app-aliyundrive-webdav
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-dockerman package/luci-app-dockerman
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-docker package/luci-app-docker
svn co https://github.com/immortalwrt/luci/trunk/applications/luci-app-smartdns package/luci-app-smartdns
svn co https://github.com/immortalwrt/packages/trunk/net/smartdns package/smartdns

git clone https://github.com/jerrykuku/luci-app-vssr.git  package/luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy

sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall;luci' feeds.conf.default

# Update feeds
./scripts/feeds update -a

sudo mv package/luci-app-docker/* feeds/luci/applications/luci-app-docker
sudo mv package/luci-app-dockerman/* feeds/luci/applications/luci-app-dockerman
sudo mv package/luci-app-smartdns/* feeds/luci/applications/luci-app-smartdns
sudo mv package/smartdns/* feeds/packages/net/smartdns

# Install feeds
./scripts/feeds install -a
