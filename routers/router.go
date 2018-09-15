package routers

import (
	"github.com/codedepottech/httpserver/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
}
