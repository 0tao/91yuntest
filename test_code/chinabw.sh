chinabw()
{
	#获得相关数据
	wget --no-check-certificate https://raw.githubusercontent.com/91yun/speedtest-cli/master/speedtest_cli.py 1>/dev/null 2>&1
	bd=`python speedtest_cli.py --server $1`
    latency=`echo "$bd" | awk -F ':' '/Hosted/{print $2}'`
	download=`echo "$bd" | awk -F ':' '/Download/{print $2}'`
	upload=`echo "$bd" | awk -F ':' '/Upload/{print $2}'`
	hostby=`echo "$bd" | grep 'Hosted'`
    rm -rf speedtest_cli.py

	#显示在屏幕上
    if [ -n "$latency" ]
    then
        printf "%-18s%-18s%-20s%-12s\n" "$2" "$upload" "$download" "$latency"
    fi


	#写入日志文件
	echo "===开始测试国内带宽===">>${dir}/$logfilename
	echo "$2|$upload|$download|$latency">>${dir}/$logfilename
	echo -e "===国内带宽测试结束==\n\n">>${dir}/$logfilename
}
next
printf "%-18s%-18s%-20s%-12s\n" " Node Name" "Upload Speed" "Download Speed" "Latency"
chinabw '3633' '上海 电信'
chinabw '4741' '北京 电信'
chinabw '7509' '杭州 电信'
chinabw '4624' '成都 电信'
chinabw '5083' '上海 联通'
chinabw '4863' '西安 联通'
chinabw '5726' '重庆 联通'
chinabw '4665' '上海 移动'
chinabw '4575' '成都 移动'
chinabw '6168' '昆明 移动'
chinabw '6611' '广东 移动'
