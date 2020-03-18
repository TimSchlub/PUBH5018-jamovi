
# This file is a generated template, your changes will not be overwritten

histogramClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "histogramClass",
    inherit = histogramBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)

          image <- self$results$plot
          dep <- self$options$dep
          data <- self$data
          
          plotData <- data.frame(x = data[[dep]])
          
          image$setState(plotData)
        },
        .plot=function(image,...) {
          plotData <- image$state
          plot <- ggplot(plotData, aes(x=x)) +
            geom_histogram(binwidth = self$options$binwidth, boundary=self$options$anchor,color="black",fill="yellow") +
            xlab(self$options$dep) + 
            ylab("Frequency")
          print(plot)
          TRUE
        })
)
