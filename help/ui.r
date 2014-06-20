#This is the ui code for the data product project help

library(shiny)


shinyUI(fluidPage(
  headerPanel("Dynamic Histogram and Confidence Interval"),




    
  mainPanel(
    h3('What is the confidence interval for the population mean?'),
h4("It looks like a simple question. But if you have only a sample from the population, how would you estimate the population mean?"),
      h4("This WebApp gives you a general idea:"),
withMathJax(),
      br(),
      h5("First, choose from the left panel the desired sample size. As this is a simple demo, we limit the sample size to between 50 and 1000."),
      br(),
      h5("Then, choose from the distribution list. Which distribution you want to sample from?"),      
      h5("Different distribution has different parameters, choose the ones for your specified distribution"),
      p("Normal:"), withMathJax("$$y\\sim N(\\mu,\\sigma)$$"), 
      helpText("where \\(\\mu\\) is the population mean and \\(\\sigma\\) is the standard deviation."),

      p("Poisson:"), withMathJax("$$y\\sim Pois(\\lambda)$$"), 
      helpText("where \\(\\lambda\\) is the population mean and \\(\\sqrt\\lambda\\) is the standard deviation."),
      p("Binomial:"), withMathJax("$$y\\sim Bin(N,p)$$"), 
      helpText("where \\(N\\) is the number of trials and \\(p\\) is the possibility of success. The population mean is calculated as \\(\\mu\\)=np."),
      p("Uniform:"), withMathJax("$$y\\sim Unif(A,B)$$"), 
      helpText("where A and B are lower and upper bound, and \\(\\mu\\) is the average of A and B."),
      br(),
      h5("The last input from you is the significance level. This is the area on the tail of the distribution density. "),      
      helpText("Usually, this number is indicated as \\(\\alpha\\). It can be used to find the confidence level"),
      helpText("\\(C = (1-\\alpha)\\times 100 \\%\\)"),
      helpText("where C is the confidence level."),
      h5("The main panel displays corresponding plot with both population mean and confidence interval indicated as you change these values.")
)

     ))
