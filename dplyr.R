## Data Manipulation

library(dplyr)
data('mtcars')
data("iris")

mydata <- mtcars
head(mydata)

#creating a local dataframe. Local data frame are easier to read
mynewdata <- tbl_df(mydata)
myirisdata <- tbl_df(iris)

#now data will be in tabular structure
mynewdata

#use filter to filter data with required condition
filter(mynewdata, cyl > 4 & gear > 4 )
filter(mynewdata, cyl > 4)
filter(myirisdata, Species %in% c('setosa', 'virginica'))

#use select to pick columns by name
select(mynewdata, cyl,mpg,hp)
#here you can use (-) to hide columns
select(mynewdata, -cyl, -mpg ) #this will select all columns except these
#hide a range of columngs
select(mynewdata, -c(cyl,mpg))

#chaining or pipelining - a way to perform multiple operations
#in one line
mynewdata %>%
        select(cyl, wt, gear)%>%
        filter(wt > 2)

#arrange can be used to reorder rows
mynewdata%>%
        select(cyl, wt, gear)%>%
        arrange(wt)

mynewdata %>%
        select(mpg, cyl)%>%
        mutate(newvariable = mpg*cyl)


myirisdata%>%
        group_by(Species)%>%
        summarise_each(funs(mean, n()), Sepal.Length, Sepal.Width)

myirisdata%>%
        group_by(Sepal.Width, Petal.Width)%>%
        tally(sort = TRUE)

#Rename
mynewdata %>% rename(miles = mpg)
