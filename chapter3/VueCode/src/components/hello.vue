<template>
  <div>
    <div id="myChart" :style="{width: '400px', height: '300px'}">
    </div>
    <button v-on:click="refreshCharts()">刷新表格</button>
  </div>


</template>

<script>
    export default {
      name: "hello",
      data() {
        return {
          msg: 'Welcome to Your Vue.js App'
        }
      },
      mounted() {
        this.drawLine();
      },
      methods: {
        drawLine() {
          // 基于准备好的dom，初始化echarts实例
          let myChart = this.$echarts.init(document.getElementById('myChart'))
          // 绘制图表
          myChart.setOption({
            title: {text: '在Vue中使用echarts'},
            tooltip: {},
            xAxis: {
              data: ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
            },
            yAxis: {},
            series: [{
              name: '销量',
              type: 'bar',
              data: [5, 20, 36, 10, 10, 20]
            }]
          });
        },
        async  refreshCharts () {
          let myChart = this.$echarts.init(document.getElementById('myChart'))
         // const res = await  this.$axios.get('/api/line')
          const res = await  this.$http.get('http://127.0.0.1:9000/line')
          console.log(res)
         // var num1 = 33+ Math.random()*100
         // var num2 = 20+ Math.random()*80
            myChart.setOption({ // 更新数据
            xAxis: {
              data:res.data.legend_data
            },
            series: {
              type: 'line',
              //data:[80,num1,108,29,70,103,num2]
              data: res.data.xAxis_data
            }
          })

        }

      }
    }
</script>

<style scoped>

</style>
