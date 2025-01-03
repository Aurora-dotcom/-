# 模块配置
SKIPMOUNT=false
LATESTARTSERVICE=true
POSTFSDATA=true
PROPFILE=true

# 打印的信息
Manufacturer=$(getprop ro.product.vendor.manufacturer)
Codename=$(getprop ro.product.device)
Model=$(getprop ro.product.vendor.model)
Build=$(getprop ro.build.version.incremental)
AndroidVersion=$(getprop ro.build.version.release)
CPU_ABI=$(getprop ro.product.cpu.abi)
HyperOS=$(getprop ro.miui.ui.version.code)

# 操作路径
target_module="hyperos_plugin_and_launcher_pro"
modules=/data/adb/modules
modules_update=/data/adb/modules_update/

# 定义颜色代码
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # 恢复默认颜色

# 在需要打印彩色字体的地方使用颜色代码
# echo -e "${RED}Error:${NC} Something went wrong."  # 输出红色字体
# echo -e "${GREEN}Success:${NC} Operation completed successfully."  # 输出绿色字体
# echo -e "${YELLOW}Warning:${NC} Please proceed with caution."  # 输出黄色字体

# 打印信息，模块安装脚本自动调用
print_modname() {
	ui_print "=================================================="
	sleep 0.05
	ui_print "- 模块脚本作者: 酷安@吃饱饭饭好睡觉(Cooperate)"
	sleep 0.05
	ui_print "- 主题官改增强: 酷安@MonetCarlos(Author)"
	sleep 0.05
	ui_print "- 重建缓存脚本: 酷安@诺蓝(Cooperate)"
	sleep 0.05
	ui_print "- 官改系统合作: 酷安@Ming_Official(Cooperate)"
	sleep 0.05
	ui_print "=================================================="
	sleep 0.05
	ui_print "- 系统界面组件: 酷安@Marius(Ref)、酷安@Mr_Bocchi(Ref)、EGLIFE(Ref)"
	sleep 0.05
	ui_print "- 堆叠层次代码: 酷安@TAT趙、酷安@Xposeded(Ref)"
	sleep 0.05
	ui_print "- 堆叠桌面合作: 酷安@Xiaobingbing、酷安@贝斯做不导6(Ref)、酷安@Nao(Ref)"
	sleep 0.05
	ui_print "- 莫奈取色引用: 酷安@binbinzhishao、酷安@诺蓝、酷安@元気な枯れ木.＆JerryZhouYG(Ref)"
	sleep 0.05
	ui_print "- 锁屏通知下沉: 酷安@hrsthrt74(ref)"
	sleep 0.05
	ui_print "- 白条跟随应用: 酷安@hrsthrt74(ref)"
	sleep 0.05
	ui_print "- 聚合广告注入: 酷安@閃電Flashh(ref)、酷安@沃德天泥维森陌菈莫帅(ref)、酷安@MonetCarlos(monet、language switch)"
	sleep 0.05
	ui_print "=================================================="
	sleep 0.05
	ui_print "- 当前模块版本: V9.2"
	sleep 0.05
	ui_print "- 模块更新日期: 2025.01.01"
	sleep 0.05
	ui_print "- 模块依赖环境: China ROM｜HyperOS"
	sleep 0.05
	ui_print "- 系统桌面版本: RELEASE-5.39.31.10438-12162101"
	sleep 0.05
	ui_print "- 系统界面组件版本: V16.0.2.53.1"
	sleep 0.05
	ui_print "- 莫奈取色版本: V16.0(A15)"
	sleep 0.05
	ui_print "- 模块依赖权限: 核心破解全开"
	sleep 0.05
	ui_print "- 如模块不生效: 禁用shamiko模块"
	ui_print "=================================================="
	sleep 0.05
	ui_print "- 设备型号: $Model"
	sleep 0.05
	ui_print "- 设备厂商: $Manufacturer"
	sleep 0.05
	ui_print "- API级别: $API"
	sleep 0.05
	ui_print "- Android版本: $AndroidVersion"
	sleep 0.05
	ui_print "- OS版本: MIUI $HyperOS(HyperOS)"
	sleep 0.05
	ui_print "- Build版本: $Build"
	sleep 0.3
	ui_print "- 依赖环境: 高级材质(刷入前请开启高级材质)"
	sleep 0.3
	ui_print "- 推荐处理器: 骁龙8+或天玑8300+"
	sleep 0.3
	ui_print "（低配设备如卡顿自行删除system.prop里的关于处理器填空的行)"
	sleep 0.3
	ui_print "=================================================="
	sleep 0.05
	ui_print "* 请确保你的设备处于安卓15环境下的HyperOS系统并核心破解选项全开"
	ui_print "(部分设备需手动编译framework.jar和service.jar进行彻底核心破解)"
	ui_print "* 刷之前自备TWRP或自动救砖模块，出现卡第二屏，会自动禁用所有模块重启"
	ui_print "* 开机或者手动挂载系统分区rw权限，/data/adb/modules/路径下删除模块"
	ui_print "* 使用过程中如果控制中心等界面异常，尝试使用默认主题解决"
	ui_print "* 卸载模块后重启设备以恢复系统"
	ui_print "* ‖ 免责申明：模块来源不正规的不建议安装，安装前自行检查下脚本，公开未加密且带中文注释，如使用被篡改版引起的问题与贡献者无关"
	ui_print "=================================================="
		echo -e "${RED}*如果不符合条件，请立即退出安装！！！."
		echo "❗点击音量上+退出安装"
		echo "❗点击音量下-继续安装"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在退出安装"
				exit 1
				;;
			*)
				echo "❗*正在继续安装"
				;;
		esac
}

# 安装的具体操作，模块安装脚本自动调用
on_install() {
		ui_print "=================================================="
		ui_print "- 请根据模块的要求来选择是否刷入，完全按照你自愿授权进行"
		ui_print "- 正在释放文件，如想返回，请进TWRP删除后重启"
		sleep 0.05
		ui_print "- 正在开启Hyper2.0高级材质2.0"
		sleep 0.05
		ui_print "- 正在强制开启GPU渲染"
		sleep 0.05
		ui_print "- 正在强制开启下拉渐进模糊渲染"
		sleep 0.05
		ui_print "- 正在强制开启国内部分游戏启动动画加速"
		sleep 0.05
		ui_print "- 正在强制开启高性能模式"
		sleep 0.05
		ui_print "- 正在强制开启AI预加载"
		sleep 0.05
		ui_print "- 正在强制开启部分选项新界面"
		sleep 0.05
		ui_print "- 正在载入安卓原生Monet动态取色Overlay叠加层"
		sleep 0.05
		ui_print "- 正在强制开启手机管家高级功能"
		sleep 0.05
		ui_print "- 正在强制JPG图像优化"
		sleep 0.05
		ui_print "- 正在强制开启FBO存储空间"
		sleep 0.05
		ui_print "- 正在强制开启超级剪贴板"
		sleep 0.05
		ui_print "- 正在强制开启旗舰手机性能选项"
		sleep 0.05
		ui_print "- 正在强制开启部分音效增强"
		sleep 0.05
		ui_print "- 正在强制开启视频工具箱高级功能"
		sleep 0.05
		ui_print "- 正在强制开启刷新率最低1hz（aod）"
		sleep 0.05
		ui_print "- 正在强制开启核心分配优化(默认禁用，需8Gen2、3)"
		sleep 0.05
		ui_print "- 正在强制开启HDR支持"
		sleep 0.05
		ui_print "- 正在强制开启三重音频"
		sleep 0.05
		ui_print "- 正在强制开启杜比"
		sleep 0.05
		ui_print "- 正在强制开启扬声器清理支持"
		sleep 0.05
		ui_print "- 正在强制开启影像增强"
		sleep 0.05
		ui_print "- 正在强制开启头部追踪与影响风格2.0"
		sleep 0.05
		ui_print "- 正在强制开启游戏音质优化"
		sleep 0.05
		ui_print "- 正在刷入起源架构V22主题全局引擎"
		sleep 0.05
		ui_print "- (推荐在小米主题商店搜索 MonetCarlos 并关注)"
		sleep 0.05
		ui_print "- 正在刷入起源伴生体"
		sleep 0.05
		ui_print "- 正在刷入Marius版定制系统界面组件"
		sleep 0.05
		ui_print "- 正在刷入起源伴生音效"
		sleep 0.05
		ui_print "- 正在刷入MonetCarlos定制开机动画"
		sleep 0.05
		ui_print "- 正在刷入经典锁屏通知下沉"
		sleep 0.05
		ui_print "- 正在刷入酷安@閃電Flashh的广告聚合"
		sleep 0.05
		ui_print "- 正在刷入HyperOS2音乐触感"
		sleep 0.05
		ui_print "- 正在刷入100+第三方APP全局界面适配"
		sleep 0.05
		ui_print "- 正在开启系统设置无障碍页触控反馈高级选项"
		sleep 0.05
		ui_print "- 正在刷入Xposeded堆叠桌面代码"
		sleep 0.05
		ui_print "- 正在尝试开启澎湃2.0视频景深"
		sleep 0.02
		ui_print "- (请同时升级“息屏与锁屏编辑”与“壁纸”才可开启视频景深)"
		sleep 0.05
		ui_print "- 正在刷入全局弹窗圆角优化"
		sleep 0.05
		ui_print "- 正在优化aod耗电功耗"
		sleep 0.05
		ui_print "- 正在刷入酷安主题overlay"
		sleep 0.05
		ui_print "- 正在去除超级小爱水印"
		sleep 0.05
		ui_print "- 正在优化融合设备中心显示"
		sleep 0.05
		ui_print "- 正在安装底部全面屏键盘优化"
		sleep 0.05
		ui_print "- 正在开启音质音效声音视效"
		sleep 0.05
		ui_print "- 正在开启系统Dex预加载提升跟手性"
		sleep 0.05
		ui_print "- 正在尝试躲避momo等检测(可能无法规避所有检测)"
		sleep 0.05
		ui_print "- 正在尝试优化澎湃OS2通知栏音乐播放器混色(YuKongA)"
		sleep 0.05
		ui_print "=================================================="
		clean_cache || abort "清理缓存出错"
		unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2 || abort "解压挂载文件至System出错，可能由于你系统system分区为erofs只读文件系统引起的，咨询你刷入的ROM作者解决或者更换爱玩机等程序重新刷入"
		sleep 0.05
		unzip -o "$ZIPFILE" 'rely/*' -d $MODPATH >&2 || abort "解压依赖文件出错"
		sleep 0.05
		unzip -o "$ZIPFILE" 'rely/isKeyguardLocked.dex' -d $MODPATH >&2 || abort "解压 dex 文件出错"
		sleep 0.05
		unzip -o "$ZIPFILE" 'rely/shizuku_starter' -d $MODPATH >&2 || abort "解压 shizuku_starter 出错"
		sleep 0.1
		install_bootanimation
		sleep 0.1
		install_ios_icons
		sleep 0.1
		install_ios_status_bar
		sleep 0.1
		install_status_bar_down
		sleep 0.1
		install_system_settings
		sleep 0.1
		install_bika_picacg
		sleep 0.1
		install_qq_theme
		sleep 0.1
		install_lockscreen_xbt
		sleep 0.1
		install_xbt_chenjin
		sleep 0.1
		install_xtjmzj
		sleep 0.1
		install_ddzm
}

# 自定义安装开机动画
install_bootanimation() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装开机动画"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装开机动画"
					rm -rf /$modules/$target_module/system/product/media/bootanimation.zip || abort "删除开机动画出错"
					rm -rf /$modules_update/$target_module/system/product/media/bootanimation.zip || abort "删除开机动画出错"
				;;
			*)
				echo "❗*已安装开机动画"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装主题桌面图标
install_ios_icons() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装iOS桌面图标"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装iOS桌面图标"
					rm -rf /$modules/$target_module/system/product/media/theme/default/icons || abort "删除iOS桌面图标出错"
					rm -rf /$modules_update/$target_module/system/product/media/theme/default/icons || abort "删除iOS桌面图标出错"
				;;
			*)
				echo "❗*已安装iOS桌面图标"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装iOS状态栏
install_ios_status_bar() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装iOS状态栏"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装iOS状态栏样式"
					rm -rf /$modules/$target_module/system/product/media/theme/default/com.android.systemui || abort "删除iOS状态栏样式出错"
					rm -rf /$modules_update/$target_module/system/product/media/theme/default/com.android.systemui || abort "删除iOS状态栏样式出错"
				;;
			*)
				echo "❗*已安装iOS状态栏样式"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装状态栏下沉
install_status_bar_down() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装状态栏下沉"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装状态栏下沉"
					rm -rf /$modules/$target_module/system/product/media/theme/default/framework-res || abort "删除状态栏下沉出错"
					rm -rf /$modules_update/$target_module/system/product/media/theme/default/framework-res || abort "删除状态栏下沉出错"
				;;
			*)
				echo "❗*已安装状态栏下沉"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装系统设置页主题
install_system_settings() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装系统设置页主题"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装系统设置页主题"
					rm -rf /$modules/$target_module/system/product/media/theme/default/framework-res || abort "删除系统设置页主题出错"
					rm -rf /$modules_update/$target_module/system/product/media/theme/default/framework-res || abort "删除系统设置页主题出错"
				;;
			*)
				echo "❗*已安装系统设置页主题"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装哔咔漫画主题及界面简中翻译
install_bika_picacg() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装哔咔漫画美化主题及简中翻译"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装哔咔漫画美化主题及简中翻译"
					rm -rf /$modules/$target_module/system/product/media/theme/default/com.picacomic.fregata || abort "删除哔咔漫画主题模块出错"
					rm -rf /$modules_update/$target_module/system/product/media/theme/default/com.picacomic.fregata || abort "删除哔咔漫画主题模块出错"
				;;
			*)
				echo "❗*已安装哔咔漫画美化主题及简中翻译"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装QQ美化模块
install_qq_theme() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装QQ美化模块"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装QQ美化模块"
					rm -rf /$modules/$target_module/system/product/media/theme/default/com.tencent.mobileqq || abort "删除QQ美化模块出错"
					rm -rf /$modules_update/$target_module/system/product/media/theme/default/com.tencent.mobileqq || abort "删除QQ美化模块出错"
				;;
			*)
				echo "❗*已安装QQ美化模块"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装锁屏常驻小白条
install_lockscreen_xbt() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装锁屏常驻小白条"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装锁屏常驻小白条"
				;;
			*)
				echo "❗*正在安装锁屏常驻小白条"
					su -c device_config put systemui nav_bar_handle_show_over_lockscreen true default || abort "关闭锁屏常驻小白条失败"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装小白条沉浸
install_xbt_chenjin() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装小白条沉浸overlay"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装小白条沉浸"
					rm -rf /$modules/$target_module/system/product/overlay/GestureLineOverlay.apk || abort "删除小白条沉浸出错"
					rm -rf /$modules_update/$target_module/system/product/overlay/GestureLineOverlay.apk || abort "删除小白条沉浸出错"
				;;
			*)
				echo "❗*已安装小白条沉浸"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装系统界面组件
install_xtjmzj() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装系统界面组件"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装系统界面组件"
					rm -rf /$modules/$target_module/system/product/app/MIUISystemUIPlugin/MIUISystemUIPlugin.apk || abort "删除系统界面组件出错"
					rm -rf /$modules_update/$target_module/system/product/app/MIUISystemUIPlugin/MIUISystemUIPlugin.apk || abort "删除系统界面组件出错"
				;;
			*)
				echo "❗*已尝试安装系统界面组件"
				ui_print "=================================================="
				;;
		esac
}

# 自定义安装堆叠桌面
install_ddzm() {
		ui_print "=================================================="
		echo "❗点击音量上+不安装"
		echo "❗点击音量下-安装堆叠桌面"
		ui_print "=================================================="
		key_click=""
		while [ "$key_click" = "" ]; do
			key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
			sleep 0.05
		done
		case "$key_click" in
			"KEY_VOLUMEUP")
				echo "❗*正在取消安装堆叠桌面"
					rm -rf /$modules/$target_module/system/product/priv-app/MiuiHome/MiuiHome.apk || abort "删除堆叠桌面出错"
					rm -rf /$modules_update/$target_module/system/product/priv-app/MiuiHome/MiuiHome.apk || abort "删除堆叠桌面出错"
				;;
			*)
				echo "❗*已尝试安装堆叠桌面"
				ui_print "=================================================="
				;;
		esac
}

# 安装前清缓存
clean_cache() {
	rm -rf /data/resource-cache/* || abort "删除资源缓存出错"
	rm -rf /data/system/package_cache/* || abort "删除系统包缓存出错"
	rm -rf /data/user/0/miui.systemui.plugin/* || abort "删除用户系统界面组件缓存出错"
	rm -rf /data/user_de/0/miui.systemui.plugin/* || abort "删除用户系统界面组件缓存出错"
	rm -rf /data/app/*/miui.systemui.plugin* || abort "删除系统界面组件缓存出错"
	rm -rf /data/app/miui.systemui.plugin* || abort "删除系统界面组件缓存出错"
}

# 设置权限，模块脚本自动调用
set_permissions() {
	set_perm_recursive $MODPATH 0 0 0755 0644 || true
	set_perm_recursive $MODPATH/rely/shizuku_starter 0 0 0755 0700 || true
}
