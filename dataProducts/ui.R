#This is the ui code for the data product project

library(shiny)


shinyUI(pageWithSidebar(
  headerPanel("Project for Developing Data Products!"),
  sidebarPanel(
p("Please enter your desired sample size (this is a simple demo, so please limit your sample size between 50 and 1000."),
numericInput('samplesize','Sample size [50-1000]',50,min=50, max = 1000, step=1),
h6("By clicking this button, we generate a random sample and the histogram of this sample is displayed on the right."),

p("Please choose the task you would like to implement from below"),
checkboxGroupInput("task","Choose the task:",
                 c("Confidence Interval"="ci", "Hypothesis Testing"="ht")),
h6("How about the significance level you would like to use?"),
numericInput('alpha','Significance Level (alpha) [0.001-0.2]',0.05,min=0.001, max = 0.2,step=0.001),
p("Here we use 0.05 as default, but you may move the slide bar to your desired one. Please keep in mind that"),
code(" alpha = 1- confidence level (C)"),
p("For hypothesis testing, which value would you like to test?"),
numericInput('mu0','Population mean to be tested',48,min=0, max = 100,step=1),
submitButton("submit")
)  ,
  mainPanel(
    h3('Welcome to our Demo page!'),
p("For a random sample of "),
verbatimTextOutput("osamplesize"),
p("the histogram is"),
plotOutput("sampleHist"),
verbatimTextOutput("otask"),
p("Please find the"),verbatimTextOutput("oC"),
p(" confidence interval from the plot."),
p("At"),verbatimTextOutput("oalpha"),
p("significance level, we get the conclusion that"),
verbatimTextOutput("omu0")
  )
))
