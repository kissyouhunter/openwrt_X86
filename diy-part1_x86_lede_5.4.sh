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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# echo '删除重复插件'
rm -rf ./package/lean/luci-app-netdata
rm -rf ./package/lean/luci-app-jd-dailybonus
rm -rf ./package/lean/luci-lib-docker
rm -rf ./package/lean/luci-app-cpufreq
rm -rf ./package/lean/luci-app-dockerman

# 替换index.htm文件 X86
wget -O ./package/lean/autocore/files/x86/index.htm https://raw.githubusercontent.com/kissyouhunter/openwrt_X86/main/diy/x86_lede/index_x86.htm

# 替换banner
wget -O ./package/base-files/files/etc/banner https://raw.githubusercontent.com/kissyouhunter/openwrt_X86/main/diy/x86_lede/banner

# 替换内核
sed -i 's/PATCHVER:=5.10/PATCHVER:=5.4/g' ./target/linux/x86/Makefile

# 内核替换成 kernel 5.4.175

sed -i 's/LINUX_KERNEL_HASH-5.4.175 = ac901bdffb1488d6c730ca7ab42322163dd331b240e2f06ad83d199e251a4840/LINUX_KERNEL_HASH-5.4.180 = 1639b5d8a60038f3b81f549f194642778035b758c06c74ef5f69e48bd9ab931d/g' ./include/kernel-5.4

sed -i 's/LINUX_VERSION-5.4 = .175/LINUX_VERSION-5.4 = .180/g' ./include/kernel-5.4
