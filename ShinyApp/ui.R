library(shiny)

shinyUI(fluidPage(
  titlePanel("NYSE visualization"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("symb", label = h3("Select NYSE Index to view :"), 
                  choices = list("NASDAQ" = 1, "DOW JONES" = 2), 
                  selected = 1),
    
      dateRangeInput("dates", 
        "Select date range to view :",
        start = "2014-01-01", 
        end = as.character(Sys.Date()))
      
    ),
    
    # Create two tabs, on3 for the output and one for the usage instructions
    mainPanel(
      tabsetPanel(
        
        # Main output tab
        tabPanel("Main", 
              plotOutput("plot")),
              br(),
              br(),
              br(),
              p(strong('Important Note:'),'The information presented in this application is intended for 
                informational purposes only and should not be used for business, comercial or other activities. 
                All financial trading has risk and includes the danger of financial losses. ',
                strong('ThemosP',style='color:blue'),' may not be held responsible for any damages which 
                may arise as a concsequence of the use of the data presented in this application or 
                from the use of the application itself.'),
        
        #Usage Instructions tab
        tabPanel("User Guide", 
                 h3('Simple usage instructions'),
                 br(),
                 p('This very simple application can be used to see a visual representation of historic data 
                    of the NYSE Dow Jones or NASDAQ index.'),
                 p('The user selects the INDEX she/he wishes  to view from a drop down box and then inputs or selects
                        the desired date range for the data, ',strong('in US date format (YYYY-mm-dd)'),'.'),
                 p('The application first reads the number of the user\'s INDEX selection and determins the 
                    correct symbol to use (',span('^IXIC',style='color:red'),' for NASDAQ or ',span('DJIA',
                    style='color:red'),' for Dow Jones). 
                    It then passes the ',span('INDEX',style='color=:red'),' symbol
                    and the ',span('date range',style='color=:red'),' to the  ', strong('getSymbols()'),
                    ' function of the ',strong('\"quantmod\"'),' R package. The
                    ', strong('getSymbols()'),
                   ' function is wrapped in a reactive function so that it returns different
                    results each time the users changes the inputs.'),
                 p('In the next step, a plot is created and returned to the ui.R script for printing.'),
                 br(),
                 
                 p(strong('Produced by '),strong('ThemosP',style='color:blue'))
          )
        )
      )
    )
  )
)