package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"math/rand"
)

func main() {
	fmt.Printf("launch")
	r := gin.Default()

	r.GET("/user/:name/*action", GetParamPath)

	r.GET("/welcome",GetQueryParmeters)

	r.POST("/form_post",Formpost)

	r.LoadHTMLGlob("templates/*")
	//router.LoadHTMLFiles("templates/template1.html", "templates/template2.html")
	r.GET("/index", func(c *gin.Context) {
		c.HTML(http.StatusOK, "index.tmpl", gin.H{
			"title": "Main website",
		})
	})

	r.GET("/line", func(c *gin.Context) {
		legendData := []string{"周一", "周二", "周三", "周四", "周五", "周六", "周日"}
		xAxisData := []int{120, 240, rand.Intn(500), rand.Intn(500), 150, 230, 180}
		c.JSON(200, gin.H{
			"legend_data": legendData,
			"xAxis_data":  xAxisData,
		})
	})

	r.Run(":9000")
}

func GetParamPath(c *gin.Context)  {
	name := c.Param("name")
	action := c.Param("action")
	message := name + " is " + action
	c.JSON(http.StatusOK, message)

}

func GetQueryParmeters(c *gin.Context)  {
	firstname := c.DefaultQuery("firstname", "Guest")
	lastname := c.Query("lastname") // shortcut for c.Request.URL.Query().Get("lastname")
	c.String(http.StatusOK, "Hello %s %s", firstname, lastname)

}

func Formpost(c *gin.Context)  {
	message := c.PostForm("message")
	nick := c.DefaultPostForm("nick", "anonymous")

	c.JSON(200, gin.H{
		"status":  "posted",
		"message": message,
		"nick":    nick,
	})

}
