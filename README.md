BACKGROUND
  1) The need was discussed in terms of getting data automatically via API data feeds. Most were supplied by HenryC and others were found online so that the user could have the process automated and the data cleaned
  2) users will have to have a database structure installed
  3) users will have to have the CRAN 4.4.3 version installed
  4) Will also have to have an editor such as RSutdio installed

Items requested
1) 7 Day forecast (data pull. item completed pending migration and testing)
2) Historical data for averages (dating back as long as we can get). Item completed as it will be manual yearly download due to restriction of download capacity (1000 processing utilization)
3) Alert warnings for Winter Storm Warnings, Blizzard Warnings, Severe Thunderstorm Warnings, and Tornado Warnings. All U.S (api.weather.gov) (copmleted but likely want to cut this down)
4) Item #3 will be brought into a staging table and then have production table to keep active ones (api.weather.gov)
5) Important data from the RSS feeds on this site https://www.spc.noaa.gov/aboutrss.html
