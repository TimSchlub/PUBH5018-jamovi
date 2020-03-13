
# This file is a generated template, your changes will not be overwritten

ciSingleClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "ciSingleClass",
    inherit = ciSingleBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)
            
            group <- self$options$group
            data <- self$data
            data[[group]] <- as.factor(data[[group]])
          
            for (dep in self$options$deps) {
              # Do T-test
              x <- data[,dep]
              ciLevel <- self$options$ciWidth/100
              ttest <- t.test(x, conf.level = ciLevel)
              
              # Display confidence level
              disp_tx <- paste0("Confidence level = ",ciLevel*100, "%")
              self$results$conflevel$setContent(disp_tx)
              
              # Populate table of results
              table <- self$results$citable
              table$setRow(rowKey=dep, values=list(
                var   = dep
                ,mean = ttest$estimate
                ,lb   = ttest$conf.int[1]
                ,ub   = ttest$conf.int[2]
              ))
            }

        })
)
