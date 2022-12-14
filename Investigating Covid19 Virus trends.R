
library(readr)
covid_df <- read_csv("covid19.csv")
dim(covid_df)
vector_cols <- colnames(covid_df)
print(vector_cols)
class(vector_cols)
head(covid_df)
library(tibble)
glimpse(covid_df)
library(dplyr)
covid_df_all_states <- covid_df %>%
  filter(province_state = "All states")%>%
  select(-province_state)
covid_df_all_states_daily <- covid_df_all_states%>%
  select(Date, Country_region, actove, hospitalizedCurr, daily_tested, daily_positive)
head(covid_df_all_states_daily)
covid_df_all_states_daily_sum <- covid_df_all_states_daily%>%
  groupby(Country_region)%>%
  summarise(teseted = sum(daily_tested), positive = sum(daily_positive), active = sum(active), hospitalized = sum(hospitalizedCurr))%>%
  arrange(desc(tested))
covid_df_all_states_daily_sum
covid_top_10 <- head(covid_df_all_states_daily_sum, 10)
covid_top_10
countries <- covid_top_10$Country_region
tested_cases <- covid_top_10$tested
positive-cases <- covid_top_10$positive
active_cases <- covid_top_10$active
hospitalized_cases <- covid_top_10$hospitalized
names(tested_cases) <- countries
names(positive_cases) <- countries
names(active_cases) <- countries
names(hospitalized_cases) <- countries
positive_cases
sum(positive_cases)
mean(positive_cases)
positive_cases/sum(positive_cases)
positive_cases/tested_cases
positive_tested_top_3 <- c("United Kingdom" = 0.11, "United States" = 0.10, "turkey" = 0.08)
united_kingdom <- c(0.11, 1473672, 166909, 0, 0)
united_states <- c(0.10, 17282363, 1877179, 0, 0)
turkey <- c(0.08, 2031192, 163941, 2980960, 0, 0)
covid_mat <- rbind(united_kingdom, united_states, turkey)
colnames(covid_mat) <- c("Ratio", "tested", "positive", "active", "hospitalized")
covid_mat
question <- "which countries have had the highest number of positive cases against the number of tests?"
answer <- c("positive tested cases" = positive_tested_top_3)
datasets <- list(original = covid_df, allstates = covid_df_all_states, daily = covid_df_all_states_daily, top_10_ = covid_top_10)
matrices <- list(covid_mat)
vectors <- list(vector_cols, countries)
data_structure_list <- list("dataframe" = datasets, matrix = "matrices", vector = "vectors")
covid_analysis_list <- list(question, answer, data_structure_list)
covid_analysis_list[[2]]
