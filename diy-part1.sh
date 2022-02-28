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

# 修改主机名字，把Unicorn修改你喜欢的就行（不能纯数字或者使用中文）
sed -i '/uci commit system/i\uci set system.@system[0].hostname='Unicorn'' package/lean/default-settings/files/zzz-default-settings

svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
#svn co https://github.com/vernesong/OpenClash/branches/dev/luci-app-openclash package/luci-app-openclash
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/luci-app-aliyundrive-webdav
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser package/luci-app-filebrowser
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-ipsec-server package/luci-app-ipsec-server
svn co https://github.com/Lienol/openwrt-package/trunk/luci-app-fileassistant package/luci-app-fileassistant
#svn co https://github.com/kenzok8/small-package/trunk/luci-app-openvpn-server package/luci-app-openvpn-server
#svn co https://github.com/kenzok8/small-package/trunk/openvpn-easy-rsa-whisky package/openvpn-easy-rsa-whisky
svn co https://github.com/Lienol/openwrt-luci/trunk/applications package/ocserv
mv package/ocserv/luci-app-ocserv package
rm -rf package/ocserv

#git clone https://github.com/frainzy1477/luci-app-clash.git package/luci-app-clash
#git clone https://github.com/chenhw2/luci-app-aliddns.git package/luci-app-aliddns
#git clone https://github.com/jerrykuku/luci-app-vssr.git  package/luci-app-vssr
#git clone https://github.com/jerrykuku/lua-maxminddb.git package/lua-maxminddb
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
git clone https://github.com/iwrt/luci-app-ikoolproxy.git package/luci-app-ikoolproxy
git clone https://github.com/lisaac/luci-app-dockerman package/luci-app-dockerman
git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
