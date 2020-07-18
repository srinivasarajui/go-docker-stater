package main

import (
	"fmt"
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {

	e := echo.New()
	e.GET("/hi", func(c echo.Context) error {
		return c.String(http.StatusOK, "hi")
	})
	e.GET("/:id", func(c echo.Context) error {
		response := fmt.Sprintf("Hello, %q", c.Param("id"))
		return c.String(http.StatusOK, response)
	})
	e.Logger.Fatal(e.Start(":8081"))

}
