---
  title: "HW2"
output: html_document
---
  #problem 1
  #Generate a vectorx<-1:1000
  #Write a for loop where the iterator varies from 1 to length of vector x
  #For each iteration multiply the value ofx[i]by 2
  #Report the computation time for the loop
t1 <- Sys.time()  
  x<-1:1000
  y <- rep(NA,length(x))
  for (i in 1:length(x)) {
    y[i] <- x[i] *2
  }
print(y)
t2 <- Sys.time()  

#For the same problem above use vector operationx<- x*2and compute the timetaken
t3 <- Sys.time() 
  x<-1:1000
  y2<-x*2
  print(y2)
t4 <- Sys.time() 

#compute run time
time_measure1 <- difftime(t2,t1,units = "secs")
time_measure2 <- difftime(t4,t3,units = "secs")

#Repeated the above steps forx<-1:100000
t5 <- Sys.time()  
x<-1:100000
y <- rep(NA,length(x))
for (i in 1:length(x)) {
  y[i] <- x[i] *2
}
print(y)
t6 <- Sys.time()  

t7 <- Sys.time() 
x<-1:1000
y2<-x*2
print(y2)
t8 <- Sys.time() 

time_measure3 <- difftime(t6,t5,units = "secs")
time_measure4 <- difftime(t8,t7,units = "secs")

#Repeated the above steps for x<-1:1000000
t9 <- Sys.time()  
x<-1:1000000
y <- rep(NA,length(x))
for (i in 1:length(x)) {
  y[i] <- x[i] *2
}
print(y)
t10 <- Sys.time()  

t11 <- Sys.time() 
x<-1:1000
y2<-x*2
print(y2)
t12 <- Sys.time() 

time_measure5 <- difftime(t10,t9,units = "secs")
time_measure6 <- difftime(t12,t11,units = "secs")
print(time_measure1)
print(time_measure2)
print(time_measure3)
print(time_measure4)
print(time_measure5)
print(time_measure6)

#Repeated the above steps for x<-1:10000000
t13 <- Sys.time()  
x<-1:10000000
y <- rep(NA,length(x))
for (i in 1:length(x)) {
  y[i] <- x[i] *2
}
print(y)
t14 <- Sys.time()  

t15 <- Sys.time() 
x<-1:1000
y2<-x*2
print(y2)
t16 <- Sys.time() 

time_measure5 <- difftime(t14,t13,units = "secs")
time_measure6 <- difftime(t16,t15,units = "secs")
print(time_measure5)
print(time_measure6)

# obeservations
# AS the length of x increases, itis not affect the running time on the method of vector operation very much\n'
'but time running increases obviously on the for loop method. Thus it is better to use the vector operation' 

#problem 2

user_input <- function(arg1){
    if(!is.numeric(arg1)){
        stop('This function only works for numeric inputs!\n',
                       'You have provided objects of the following classes:\n',
                      'arg1: ', class(arg1), '\n'
                     )
      }
    rturn(sample(arg1)) }

#problem 3
#1. Count the number of nursing home facilities by state and order them in descending order
covid_df <- read.csv("~/Desktop/IE5374HW/HW2/COVID_19_Nursing_Home_Data_2021_09_12.csv")
covid_df %>%
  group_by(provider_state) %>%
  summarise(number_of_nh=n()) %>%
  arrange(desc(number_of_nh)) %>%
  drop_na()

#2.Display the top five counties by number of nursing home facilities 
covid_df %>%
  group_by(provider_state) %>%
  summarise(number_of_nh=n()) %>%
  arrange(desc(number_of_nh)) %>%
  top_n(5)

#3.Display four tables containing the states which experienced more than 20 weeks\n'
'of shortage of nursing staff (table 1), clinical staff (table 2), aides (table 3),\n'
'and other staff (table 4)'

table_temp<- covid_df %>%
  filter(shortage_of_nursing_staff == "Y") %>%
  group_by(provider_state,federal_provider_number) %>%
  summarize(number_of_shortage_of_nursing_staff=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_nursing_staff >20)

sum <- table_temp %>%
  group_by(provider_state) %>%
  summarise(number_of_facilities_in_each_state=n())

total_f <- covid_df %>%
  group_by(provider_state) %>%
  summarise(number_of_facilities_in_each_state=n_distinct(federal_provider_number))

table_1 <- full_join(sum,total_f,by ="provider_state")
percentage <- joint_table$number_of_facilities_in_each_state.x/joint_table$number_of_facilities_in_each_state.y
table_1$percentage_of_shortage <- percentage
  

table_2<- covid_df %>%
  filter(shortage_of_clinical_staff == "Y") %>%
  group_by(provider_state,federal_provider_number) %>%
  summarize(number_of_shortage_of_clinical_staff=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_clinical_staff >20)

sum2 <- table_2 %>%
  group_by(provider_state) %>%
  summarise(number_of_facilities_in_each_state=n())


table_3<- covid_df %>%
  filter(shortage_of_aides == "Y") %>%
  group_by(provider_state,federal_provider_number) %>%
  summarize(number_of_shortage_of_aides=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_aidesf>20)

sum3 <- table_3 %>%
  group_by(provider_state) %>%
  summarise(number_of_facilities_in_each_state=n())

table_4<- covid_df %>%
  filter(shortage_of_other_staff == "Y") %>%
  group_by(provider_state,federal_provider_number) %>%
  summarize(number_of_shortage_of_other_staff=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_other_staff>20)

sum4 <- table_4 %>%
  group_by(provider_state) %>%
  summarise(number_of_facilities_in_each_state=n())
  

#4 Display counties that faced more than 10 weeks  shortage of  N95 masks /n'
'(table 1), surgicalmasks (table 2), eye protection (table 3), supply of gowns /n'
'(table 4), supply of gloves (table 5),and supply of hand sanitizer (table 6)'

table_1<- covid_df %>%
  filter(one_week_supply_of_n95_masks == "N") %>%
  group_by(county) %>%
  summarize(number_of_shortage_of_n95_masks=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_n95_masks>10)

table_2<- covid_df %>%
  filter(one_week_supply_of_surgical_masks == "N") %>%
  group_by(county) %>%
  summarize(number_of_shortage_of_surgical_mask=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_surgical_mask>10)

table_3<- covid_df %>%
  filter(one_week_supply_of_eye_protection == "N") %>%
  group_by(county) %>%
  summarize(number_of_shortage_of_eye_protection=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_eye_protection>10)

table_4<- covid_df %>%
  filter(one_week_supply_of_gowns == "N") %>%
  group_by(county) %>%
  summarize(number_of_shortage_of_gowns=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_gowns>10)

table_5<- covid_df %>%
  filter(one_week_supply_of_gloves == "N") %>%
  group_by(county) %>%
  summarize(number_of_shortage_of_gloves=n_distinct(week_ending))%>%
  filter(number_of_shortage_of_gloves>10)

table_6<- covid_df %>%
  filter(one_week_supply_of_hand_sanitizer == "N") %>%
  group_by(county) %>%
  summarize(number_of_shortage_of_hand_sanitizer = n_distinct(week_ending))%>%
  filter(number_of_shortage_of_hand_sanitizer>10)

#5 Display all the nursing home facilities that experienced a shortage of /n'
'ventilator supplies formore than 10 weeks'
table_1 <- covid_df %>%
  filter(one_week_supply_of_ventilator_supplies == "N") %>%
  group_by(federal_provider_number) %>%
  summarise(number_of_shortage_of_ventilator_supplies = n_distinct((week_ending))%>%
  filter(number_of_shortage_of_ventilator_supplies>10)

  

  
  
 




