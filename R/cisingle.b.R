
# This file is a generated template, your changes will not be overwritten

ciSingleClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "ciSingleClass",
    inherit = ciSingleBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)
            x <-self$data[,self$options$dep]
            ciLevel <- self$options$ciWidth/100
            ci <- signif(t.test(x, conf.level = ciLevel)$conf.int,4)
            
            output <- paste0(ciLevel*100,"% Confidence interval:",ci[1], " to ",ci[2])
            
            self$results$text$setContent(output)
        })
)
