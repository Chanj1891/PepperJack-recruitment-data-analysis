# PepperJack-recruitment-data-analysis

### Description

PepperJack, Inc., a medium-sized recruitment firm, uses the Position.xlsx spreadsheet to keep track of all the open positions it needs to fill. Additional information, such as the industry code and location (state/province) of each employer in Position.xlsx, can be found in Employer.xlsx. Full descriptions of each industry code and location are available in NAICS.xlsx and Location.xlsx, respectively.

### Data Pipeline

1. To create the database and load the four excel files into SQL server environment, run the sql script Prototype.sql

2. Once the above script is run, the data will be picked up from the files and the final stage tables will be loaded with fresh data by the embeded stored procedures

3. Import the ProtoVisual.twb file into Tableau software to view the Dashboards related to data

### Tools

    SQL Server 2012
    Tableau 10
