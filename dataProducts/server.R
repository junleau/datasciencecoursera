#This is the server code for the data product project

library(car)
library(shiny)
library(manipulate)

confInv <- function (xbar, s, n, alpha){

    t = abs(qt(alpha,n-1))
    bounds = c(xbar-t*s/sqrt(n), xbar + t*s/sqrt(n))
#  cat(bounds)
    bounds
}

shinyServer( function(input, output) {



 vr  <- reactive({     switch(input$dist,
         Poisson=  rpois(input$samplesize,input$lambda),
Uniform =            runif(input$samplesize,input$lb,input$rng+input$lb),
           Binomial = rbinom(input$samplesize,input$N,input$p),
           Normal= rnorm(input$samplesize,input$mu,input$sigma))
                   })
        

    param <- reactive({
    switch(input$dist,
         Poisson=  paste('Mean',input$lambda),
Uniform = paste('Lower Bound',input$lb,'and Upper Bound',input$lb+input$rng),
           Binomial = paste('Trial',input$N,'and Probability',input$p),
           Normal= paste('Mean',input$mu,'and Standard Deviation',input$sigma))
})

        distName = reactive({recode(input$dist, "
                  'Poisson' = 'Poisson';
                  'Binomial' = 'Binomial';
                  'Uniform' = 'Uniform';
                  else = 'Normal'")})

    mn =reactive({ switch(input$dist,
         Poisson=input$lambda, Normal=  input$mu,
         Uniform = input$rng/2+input$lb,
           Binomial = input$N*input$p)})

   CI = reactive({
       format(confInv(mean(vr()),sd(vr()),input$samplesize,input$alpha),nsmall=2,digits=3)
   })

  al = reactive({input$alpha})

 output$sampleHist = renderPlot({
     vr = vr()
     distn=distName()
     prm = param()
     mn=mn()
   par(cex=1.2,lwd=2)
        ret=hist(vr ,main=paste('Histogram of a Random Sample of',input$samplesize,'from',distn,'Distribution with',prm),
         xlab='data',freq=F)
    ht = max(ret$density)
    nht = min(ret$density)
    abline(v=mn,col=2,lwd=2)


     conf = CI()

    abline(v=conf[1],col=3,lwd=3,lty=20)

    abline(v=conf[2],col=3,lwd=3,lty=20)        


     legend("topright", legend=c(paste("Population Mean=",mn),paste(format((1-al()*2)*100,digit=2),"% Confidence Interval")),col=2:3,lty=19:20)
 })

 output$ci = renderText({
     conf = CI()
    citext=paste("The confidence interval of the population mean at significant level",
     {input$alpha},"is [",conf[1],",",conf[2],"]")
     citext
})



})



