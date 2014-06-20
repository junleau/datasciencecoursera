#This is the ui code for the data product project

library(shiny)


shinyUI(pageWithSidebar(
  headerPanel("Dynamic Histogram and Confidence Interval"),
  sidebarPanel(

sliderInput('samplesize','Sample size:',500,min=50, max = 1000, step=5),
 br(), 
selectInput('dist',"Distribution:",choices=c('Binomial','Normal','Poisson','Uniform')),
conditionalPanel(
    condition='input.dist=="Poisson"',
    sliderInput('lambda','Population Mean:',50,min=0, max = 100, step=1)
    ),      
conditionalPanel(
    condition='input.dist=="Uniform"',
    sliderInput('lb','Lower Bound:',0,min=-10, max = 10, step=0.5),
    sliderInput('rng','Range:', 1,min=0.1, max = 20  , step=0.1)
    ),      
conditionalPanel(
    condition='input.dist=="Binomial"',
    sliderInput('N','Number of Trials:',10,min=3, max = 100, step=1),
    sliderInput('p','Probability of Success:',0.5,min=0.01, max = 1, step=0.01)
    ),      
conditionalPanel(
    condition='input.dist=="Normal"',
    sliderInput('mu','Population Mean:',50,min=0, max = 100, step=1) ,
    sliderInput('sigma','Standard Deviation:',1,min=0.1, max = 20, step=0.1)   
    ),      
 br(), 
sliderInput('alpha','Significance Level (alpha) [0.001-0.2]',0.05,min=0.001, max = 0.2,step=0.001),

      br(), p("Please keep in mind that"),
code(" alpha = (1- confidence level (C))/2")
) ,
  mainPanel(
    h3('What is the confidence interval for the population mean?'),
plotOutput("sampleHist"),

verbatimTextOutput("ci")



)

      ))
