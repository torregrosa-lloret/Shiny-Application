library(shiny)
library(ggplot2)

shinyServer(function(input, output, session) {
    
    selectedData <- reactive({
        iris[, c(input$xcol, input$ycol)]
    })
    
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    output$plot1 <- renderPlot({
        palette(rainbow(9))
        centers=as.data.frame(clusters()$centers)
        par(mar = c(5.1, 4.1, 0, 1))
        g <- ggplot(selectedData(), aes(selectedData()[,1], selectedData()[,2], 
                                        col=as.factor(clusters()$cluster)))
        g + geom_point(size=5, alpha=0.5) + 
            geom_point(data=centers, shape = 4, size=7, stroke = 1.5, aes(centers[,1], centers[,2]), color = "black")  +
            labs(x=names(centers)[1], y=names(centers)[2], color="Clusters")
    })
    
})

