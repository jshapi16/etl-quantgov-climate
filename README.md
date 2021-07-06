# etl-quantgov-climate
ETL Project extracting data from QuantGov and FEMA to analyze climate regulations and natural disasters.


**Extraction**

For the extraction, our primary data sources were the US Natural Disaster Declarations CSV from Kaggle (<https://www.kaggle.com/headsortails/us-natural-disaster-declarations>) and the RegCensus Python API (<https://github.com/QuantGov/regcensus-api-python>). The data was loaded into a Jupyter Notebook where it was cleaned.

QuantGov tracks every United States Federal and State regulatory agency. At the federal level (jurisdiction=38), it tracks nine agencies (below with their agency code) which regulate climate and the environment:

-   Marine Mammal Commission: 87

-   Environmental Protection Agency: 219

-   Morris K. Udall Scholarship and Excellence In National Environmental Policy Foundation: 201

-   Utah Reclamation Mitigation and Conservation Commission: 222

-   Water Resources Council: 232

-   Susquehanna River Basin Commission: 72

-   Low-Emission Vehicle Certification Board: 247

-   Gulf Coast Ecosystem Restoration Council: 132

-   Delaware River Basin Commission: 91

This project extracted the total count of regulations from each of the nine agencies (above) from years 2000-2020.


**Transform**

The datasets tracked additional variables not central to the project's question:
![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/fema_uncleaned.png?raw=true)
FIGURE 1: Uncleaned FEMA Dataframe

![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/fed_uncleaned.png?raw=true)
FIGURE 2: Uncleaned Regulations Dataframe

We first focused on performing transformations to the FEMA dataframe. Firstly, we created a new filtered DataFrame of just the columns we needed:  'state', 'fy_declared', 'incident_type',  'declaration_title'. Next, we removed all disaster entries that were declared before fiscal year 2000 and not in 2021. Lastly, we dropped any duplicate data entries renamed ‘fy_declared’ to ‘year’ and ‘declaration_title’ to ‘incident_title’.

![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/fema_clean_df.png?raw=true)
FIGURE 3: Final FEMA Dataframe

We next performed transformations on the government regulations dataframe. Firstly, we created a new filtered DataFrame of just the columns we needed: 'seriesValue', 'agencyID', 'agencyName', 'periodCode'. Next, renamed ‘seriesValue’ to ‘totalRegs’ and ‘periodCode’ to ‘year’. We then sorted the data by ascending years and finally reset the index of the sorted dataframe.

![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/fed_cleaned_df.png?raw=true)
FIGURE 4: Final Regulations Dataframe

**Load**

We utilized QuickDatabaseDiagrams ([https://app.quickdatabasediagrams.com](https://app.quickdatabasediagrams.com/)) to plan out an ERD that would define the relationships between columns of our two datasets. The figure below shows the constructed diagrams:

![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/Fema_fed_ERD.png?raw=true)
FIGURE 5: ERD Diagram

After cleaning the datasets and selecting the most relevant columns for our database, we created an engine to connect the tables stored on Pandas Python to load the results using SQLAlchemy. The database is now ready for queries to obtain specific outcomes, an example of such a query is shown in the figure below.

![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/Fema_data_postgres.png?raw=true)
FIGURE 6: Example query from FEMA table

![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/Fed_data_postgres.png?raw=true)
FIGURE 7: Example query from regulations table

**Graph**
The final graph indicates that regulations and natural disasters show a similar positive trend. 
![image](https://github.com/jshapi16/etl-quantgov-climate/blob/main/images/reg_disaster_graph.png?raw=true)
FIGURE 8: Graph of cleaned datasets

**Summary**
Governments hold the ultimate power to affect positive transformations around public goods, like climate. With the number of natural disasters increasing over time, the purpose of this project was to determine how nine of the United States federal government regulatory agencies responded to the changing disaster landscape from 2000-2020.

The relationship between the two tables is year and by graphing each dataset will demonstrate whether the United States regulatory bodies responded to natural disasters by creating additional regulation for the climate. 

**Citations**
Heads or Tails (2021). US Natural Disaster Declarations, Version 44. Retrieved from <https://www.kaggle.com/headsortails/us-natural-disaster-declarations>.

Patrick McLaughlin, Jonathan Nelson, Thurston Powers, Walter Stover, and Stephen Strosko, RegData US 4.0 Annual (dataset), QuantGov, Mercatus Center at George Mason University, Arlington, VA, 2021.

