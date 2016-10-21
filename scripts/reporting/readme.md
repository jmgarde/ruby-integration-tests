# Liveball Downloader

### Purpose

To provide automatic fetching of CSV data from Liveball (initial run is just the Global Respondent Export) - this is intended to be used in tandem with a "black hole" CSV parser. This portion of the project has yet to be written.


### Configuration

The script makes use of Environment variables for tuning on a CI Server and forward compatibility with security concerns. This requires each variable to be exported on the command line prior to excecution, see: Example Usage for further details.

- login :  Username used to login to liveball
- password: Password used to login to liveball
- start_date: First day the export should contain
- end_date: Last day the export should contain
- *optional* sleep - Defaults to 30 seconds, but provides an override configuration flag.


### Example Usage

```
export login="robot"; export password="johnson"; export start_date="12/01/2013"; export end_date="12/12/2013"; rspec features/liveball.rb

```

