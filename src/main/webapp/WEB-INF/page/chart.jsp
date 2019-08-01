<%--
  Created by IntelliJ IDEA.
  User: 26257
  Date: 2019/3/31
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>echart使用情况</title>
</head>
<script type="text/javascript" src="/plugs/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
<body>
<div id="echartApplication" style="width: 600px; height: 400px;"></div>
<div><input type="button" class="btn" value="查询"/></div>
<script type="text/javascript">
    $(function(){
        $('.btn').click(function() {
            var xData = [];
            var yData = [];
            //获取数据
            $.ajax({
                type: "get",
                url: "/chartData",
                dataType: "json",
                data: {
                },
                success: function (data) {
                    var length = data.length;
                    for (var i = 0; i < length; i++) {
                        if (data[i]['级别'] !== null) {
                            xData.push(data[i]['级别'])
                        }
                        if (data[i]['数量'] !== null) {
                            yData.push(data[i]['数量']);
                        }
                    }
                    postChart();
                }
            });

            //学员职务统计图
            function postChart() {
                //这个echarts对象应该是在echarts-all.js文件里面初始化好的，所以直接拿来用，
                var myChart = echarts.init(document.getElementById('echartApplication'));
                var option = {
                    title: {
                        text: '学员职务统计',
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['数量','级别']
//                data:["科员","副科级","正科级","副处级","处级"]
                    },

                    calculable: true,
                    xAxis: [
                        {
                            type: 'category',
                            data: xData
//                    data : ["科员","副科级","正科级","副处级","处级"],
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value'
                        }
                    ],
                    series: [
                        {
//                    name:'人数',数量
                            name: '数量',
                            type: 'bar',
                            data: yData,
//                    data:[13,9,5,4,2],
                        },

                    ]
                };
                myChart.setOption(option);
            }
        });
    });
</script>
</body>
</html>
