# OpenWrt / ImmortalWrt 软件包：quick-start
#
# 仿 PandaWrt 的登录快速启动菜单。安装后：
#   - /usr/bin/quick-start       交互式菜单脚本
#   - /etc/profile.d/quick-start.sh  登录时自动弹出（可配置关闭）
#
# 放到你的 fork 源码的  package/quick-start/  目录下，
# 并在 .config 中启用  CONFIG_PACKAGE_quick-start=y 即可打进固件。

include $(TOPDIR)/rules.mk

PKG_NAME:=quick-start
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/quick-start
	SECTION:=utils
	CATEGORY:=Utilities
	SUBMENU:=System
	TITLE:=Interactive Quick Start menu (PandaWrt style) for ImmortalWrt
	URL:=https://github.com/immortalwrt/immortalwrt
	DEPENDS:=
	PKGARCH:=all
endef

define Package/quick-start/description
	仿 PandaWrt 的登录快速启动菜单：显示 CPU/内存/会话/客户端/IP 信息，
	提供设 LAN IP、static<->DHCP 切换、查看接口/进程/在线客户端等操作。
endef

define Build/Compile
endef

define Package/quick-start/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/quick-start $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/etc/profile.d
	$(INSTALL_BIN) ./files/quick-start.profile $(1)/etc/profile.d/quick-start.sh
endef

$(eval $(call BuildPackage,quick-start))
