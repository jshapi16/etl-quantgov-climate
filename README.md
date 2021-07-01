# etl-quantgov-climate
ETL Project extracting data from QuantGov and FEMA to analyze climate regulations and natural disasters.


**ETL Project**
​
By Kreeti Gulati, Jordan Shapiro, Anna Chiasson, Nico Santoso, Norman Chan
​
![](RackMultipart20210701-4-19dmzn2_html_237499165a11f2b9.gif)
​
**Extraction**
​
For the extraction, our primary data sources were the US Natural Disaster Declarations CSV from Kaggle ([https://www.kaggle.com/headsortails/us-natural-disaster-declarations](https://www.kaggle.com/headsortails/us-natural-disaster-declarations)) and the RegCensus Python API ([https://github.com/QuantGov/regcensus-api-python](https://github.com/QuantGov/regcensus-api-python)). The data was loaded into a Jupyter Notebook where it was cleaned.
​
QuantGov tracks every United States Federal and State regulatory agency. At the federal level (jurisdiction=38), it tracks nine agencies (below with their agency code) which regulate climate and the environment:
​
- Marine Mammal Commission: 87
- Environmental Protection Agency: 219
- Morris K. Udall Scholarship and Excellence In National Environmental Policy Foundation: 201
- Utah Reclamation Mitigation and Conservation Commission: 222
- Water Resources Council: 232
- Susquehanna River Basin Commission: 72
- Low-Emission Vehicle Certification Board: 247
- Gulf Coast Ecosystem Restoration Council: 132
- Delaware River Basin Commission: 91
​
This project extracted the total count of regulations from each of the nine agencies (above) from years 2000-2020.
​
**Transform**
​
The datasets tracked additional variables not central to the project&#39;s question:
​
![](RackMultipart20210701-4-19dmzn2_html_24bac0c9f86b0da2.png)
​
FIGURE 1: Uncleaned FEMA Dataframe
​
![](RackMultipart20210701-4-19dmzn2_html_aecea2e46dc8311b.png)
​
FIGURE 2: Uncleaned Regulations Dataframe
​
We first focused on performing transformations to the FEMA dataframe. Firstly, we created a new filtered DataFrame of just the columns we needed: &#39;state&#39;, &#39;fy\_declared&#39;, &#39;incident\_type&#39;, &#39;declaration\_title&#39;. Next, we removed all disaster entries that were declared before fiscal year 2000 and not in 2021. Lastly, we dropped any duplicate data entries renamed &#39;fy\_declared&#39; to &#39;year&#39; and &#39;declaration\_title&#39; to &#39;incident\_title&#39;.
​
![](RackMultipart20210701-4-19dmzn2_html_1f5f44c70abcc4b5.png)
​
FIGURE 3: Final FEMA Dataframe
​
We next performed transformations on the government regulations dataframe. Firstly, we created a new filtered DataFrame of just the columns we needed: &#39;seriesValue&#39;, &#39;agencyID&#39;, &#39;agencyName&#39;, &#39;periodCode&#39;. Next, renamed &#39;seriesValue&#39; to &#39;totalRegs&#39; and &#39;periodCode&#39; to &#39;year&#39;. We then sorted the data by ascending years and finally reset the index of the sorted dataframe.
​
![](RackMultipart20210701-4-19dmzn2_html_40a817c8ec5bb4de.png)
​
FIGURE 4: Final Regulations Dataframe
​
**Load**
​
We utilized QuickDatabaseDiagrams ([https://app.quickdatabasediagrams.com](https://app.quickdatabasediagrams.com/)) to plan out an ERD that would define the relationships between columns of our two datasets. The figure below shows the constructed diagrams:
​
![](RackMultipart20210701-4-19dmzn2_html_2c5448cc082987ed.png)
​
FIGURE 5: ERD Diagram
​
After cleaning the datasets and selecting the most relevant columns for our database, we created an engine to connect the tables stored on Pandas Python to load the results using SQLAlchemy. The database is now ready for queries to obtain specific outcomes, an example of such a query is shown in the figure below.
​
![](RackMultipart20210701-4-19dmzn2_html_eedd4d385e32f48e.png)
​
FIGURE 6: Example query from FEMA table
​
![](RackMultipart20210701-4-19dmzn2_html_f40b0ef0859bea59.png)
​
FIGURE 7: Example query from regulations table
​
**Summary:**
​
Governments hold the ultimate power to affect positive transformations around public goods, like climate. With the number of natural disasters increasing over time, the purpose of this project was to determine how nine of the United States federal government regulatory agencies responded to the changing disaster landscape from 2000-2020.
​
The relationship between the two tables is year and by graphing each dataset will demonstrate whether the United States regulatory bodies responded to natural disasters by creating additional regulation for the climate.
​
**Citations:**
​
Heads or Tails (2021). US Natural Disaster Declarations, Version 44. Retrieved from [https://www.kaggle.com/headsortails/us-natural-disaster-declarations](https://www.kaggle.com/headsortails/us-natural-disaster-declarations).
​
Patrick McLaughlin, Jonathan Nelson, Thurston Powers, Walter Stover, and Stephen Strosko, RegData US 4.0 Annual (dataset), QuantGov, Mercatus Center at George Mason University, Arlington, VA, 2021.
