#!/bin/sh
# ImmortalWrt Quick Start —— 登录时自动显示菜单（放到 /etc/profile.d/quick-start.sh）
#
# 仅在交互式终端登录时触发，非交互/脚本/管道下不会弹出，避免干扰。
# 关闭自动弹出：
#   uci set quickstart.@global[0].auto='0'; uci commit quickstart
# 或临时跳过： QS_SKIP=1 （已在 shell 中时不会重复进入）

# 非交互终端直接返回
[ -t 0 ] || return 0
[ -t 1 ] || return 0
[ -z "$QS_SKIP" ] || return 0

auto=1
if command -v uci >/dev/null 2>&1 && [ -f /etc/config/quickstart ]; then
    v=$(uci get quickstart.@global[0].auto 2>/dev/null)
    [ -n "$v" ] && auto="$v"
fi

[ "$auto" = "0" ] && return 0

# 进入一次菜单，返回后继续正常 shell
export QS_SKIP=1
command -v quick-start >/dev/null 2>&1 && quick-start
unset QS_SKIP
