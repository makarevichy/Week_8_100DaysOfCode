# Solution exercises How to Visualize Data With Highcharter
# from https://www.r-exercises.com/2018/04/09/how-to-visualize-data-with-highcharter-exercises/
library(highcharter)
library(ggplot2)

# Exercise 1
hchart(object = mpg, 'scatter', hcaes('displ', 'hwy'))

# Exercise 2
hchart(object = mpg, 'scatter', hcaes('displ', 'hwy', group = 'class'))

# Exerise 3
highchart() %>%
  hc_chart(type = "column") %>%
  hc_add_series(data = sample(4:9, 4, F), name = "Series 1")

# Exercise 4
highchart() %>%
  hc_chart(type = "column") %>%
  hc_add_series(data = sample(4:9, 4, F), name = "Series 1") %>% 
  hc_title(text = 'Sample value')

# Exercise 5
highchart() %>%
  hc_chart(type = "column") %>%
  hc_add_series(data = sample(4:9, 4, F), name = "Sale") %>% 
  hc_title(text = 'Sample value') %>% 
  hc_xAxis(categoties = 2015:2018)

# Exercise 6
hchart(diamonds$cut, colorByPoint = TRUE, name = "Cut")

# Exercise 7
hchart(diamonds$cut, color = 'coral', name = "Cut")

# Exercise 8
library('forecast')
hchart(forecast(arima(AirPassengers, order = c(0, 1, 1), seasonal = list(order = c(0, 1, 1)))))

# Exercise 9
data(unemployment)
hcmap("countries/us/us-all-all", data = unemployment,
      name = "Unemployment", value = "value", joinBy = c("hc-key", "code"),
      borderColor = "transparent") %>%
  hc_colorAxis(dataClasses = color_classes(c(seq(0, 10, by = 2), 50))) %>%
  hc_legend(layout = "vertical", align = "right",
            floating = TRUE, valueDecimals = 0, valueSuffix = "%")

# Solution exercises How to Start Plotting Interactive Maps With Leaflet
# from https://www.r-exercises.com/2018/03/26/how-to-start-plotting-interactive-maps-with-leaflet-exercides/
library(leaflet)
library(magrittr)

# Exercise 1
leaflet() %>% 
  addTiles()

# Exercise 2
leaflet() %>% 
  addTiles() %>% 
  addMarkers(lng = 174.768, lat = -36.852, popup = "The birthplace of R")

# Exercise 3
df <- data.frame(lat = rnorm(10), long = rnorm(10))

# Exercise 4
leaflet(df) %>% 
  addCircles()

# Exercise 5
leaflet(df) %>% 
  addCircles(lng = ~long, lat = ~lat)

# Exercise 6
leaflet() %>% 
  addCircles(data = df, lat = ~ lat, lng = ~ long)

# Exercise 7
library(maps)
states <- map("state", fill = TRUE, plot = FALSE)
leaflet(data = states) %>% 
  addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = 0.8), stroke = FALSE)

# Exercise 8
states <- map("state", fill = FALSE, plot = TRUE)
leaflet(data = states) %>% 
  addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = 0.8), stroke = FALSE)

# Exercise 9
m <- leaflet() %>%
  addTiles()
df <- data.frame(
  lat = rnorm(100),
  lng = rnorm(100),
  size = runif(100, 5, 20),
  color = sample(colors(), 100)
)
m <- leaflet(df) %>%
  addTiles()
m %>%
  addCircleMarkers(radius = ~size, color = ~color, fill = T)
m %>%
  addCircleMarkers(radius = runif(100, 4, 10), color = c('red'))