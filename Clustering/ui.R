library(shiny)

shinyUI(pageWithSidebar(
    headerPanel('Iris k-means clustering'),
    sidebarPanel(
        selectInput('xcol', 'X Variable', names(iris)),
        selectInput('ycol', 'Y Variable', names(iris),
                    selected=names(iris)[[3]]),
        numericInput('clusters', 'Number of clusters', 5,
                     min = 1, max = 9)
    ),
    mainPanel(
        plotOutput('plot1'),
        h2("Documentation"),
        p("This app produces a clustering of the Iris dataset using k-means. To use this app your should:"),
        p("     1. Choose the X and Y variable which you want to cluster."),
        p("     2. Select the number of cluster to grouped the data."),
        p("After that, the plot will refresh automatically.")
    )
))
