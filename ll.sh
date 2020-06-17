#!/bin/bash
#
# AWS流量阈值脚本副脚本
#
# Copyright (c) 2020.



beikong1_chushihua(){
    echo "查看当天流量"
    vnstat -d
    }
beikong2_chushihua(){
    echo "查看本周流量"
    vnstat -w
    }
beikong3_chushihua(){
    echo "查看当月流量"
    vnstat -m
    }
beikong4_chushihua(){
    echo "刷新统计流量"
    vnstat -u -i eth0
    }
beikong5_chushihua(){
    echo "清空统计流量"
    bash /root/.awsll/vnstat.sh
    read -p "是否重启（重启后在执行本脚本刷新一次流量即可）[y/N]" down_files_1
	if [[ "$down_files_1" =~ ^[yY]$ ]]; then
		echo "正在重启"
        reboot
	fi
    }
    beikong6_chushihua(){
    echo "查看流量监控进程"
    ps aux|grep /root/.awsll/
    }
beikong6_chushihua(){
    echo "开启秒级更新"
    nohup /root/.awsll/second.sh >> /dev/null 2>&1 &
	echo "正在添加自启任务"
	wget https://raw.githubusercontent.com/54665/awspro/master/aws2048-zq.sh -O /root/.awsll/aws2048-zq.sh
	chmod +x /root/.awsll/aws2048-zq.sh
	chmod +x /etc/rc.d/rc.local
	echo "/root/.awsll/aws2048-zq.sh >/root/.awsll/aws2048.py.log 2>&1" >> /etc/rc.d/rc.local
    }


echo && echo -e " AWS流量阈值副脚本

 ${Green_font_prefix}1.${Font_color_suffix} 查看当天流量
 ${Green_font_prefix}2.${Font_color_suffix} 查看本周流量
 ${Green_font_prefix}3.${Font_color_suffix} 查看当月流量
 ${Green_font_prefix}4.${Font_color_suffix} 刷新统计流量
 ${Green_font_prefix}5.${Font_color_suffix} 清空统计流量
 ${Green_font_prefix}6.${Font_color_suffix} 查看流量监控进程" && echo
stty erase '^H' && read -p " 请输入数字 [1-2]:" num
case "$num" in
	1)
	beikong1_chushihua
	;;
	2)
	beikong2_chushihua
	;;
	3)
	beikong3_chushihua
	;;
	4)
	beikong4_chushihua
	;;
	5)
	beikong5_chushihua
	;;
	6)
	beikong6_chushihua
	;;
	
	*)
	echo "请输入正确数字 [1-6]"
	;;
esac