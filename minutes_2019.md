# DevOps Meeting(s) Minutes

## Rules

1. Everyone is welcome.
2. Stick to the [code of conduct](http://berlincodeofconduct.org).
3. The meeting is limited to maximum 60 minutes.
4. If there is no volunteer, the group has to define someone to write the minutes (and upload them to gitlab afterwards).
5. At the end of the meeting, the next one has to be defined in time and space.
6. Twitter important results after the meeting via @fusionUniJena.
7. 42
8. The cake is a lie!

---

## Upcoming

### 2019-07-12

**Time**: 13:30
**Venue**: Telco
**Attendees**: David, Eleonora, Martin, Sven

**Topic(s)**: Instance Presentations

* BEXIS
  * migration by end of 2019 (soon before christmas)
    * bexis2 version: latest
    * postgresql : 9.6 (probably 10)
    * server: windows server 2012
  * core modifications mostly done by Franzi
    * further information - session needed
  * documentations and help for every module (eihter existing or available soon)
  * RBM (resource booking management)
    * features
      * overview of resources
      * calendar view
      * exchangable content (resources could be defined differently - e.g. CDs, cars,...)
    * migration of feature permissions still open
  * EMM (event management module)
    * planning of events, meetings, retreats, etc.
    * available for anonymous users (secured with password)
    * XML based event form (using metadata entity)
    * small issues (e.g. "create dataset" and not "create event/register")
  * FMT (file management tool)
    * management of different types of data (internal documents)
      * several security issues for different file types
      * controller with specific scope on "normal" users and "administrators"
  * LUI (landuse information)
    * calculation based on dataset(s)
    * parameter selection based on form (based on config file)
  * PGM (photo gallery module)
    * gallery with cart
    * order by email - using the template from the cart
  * PMM (plot management module)
    * plot chart from BEXIS
    * generic with options to create polygones (areas)
  * TCD (TubeDB Climate Data)
    * module for climate data
  * BMM (BEXIX migration module)
    * not that flexible - probably useful for other BEXIS instances e.g. Jena Experiment
    * project specific modifications are necessary
  * DOV (dataset overview)
    * small windows application
    * runs once per night to calculate something
      * e.g. plots of measurements
* ALM (alumni management)
* 

---

## Past

### 2019-07-04

**Time**: 13:15 - 14:10
**Venue**: Telco
**Attendees**: Eleonora, Hamdi, Martin, Sven

**Topic(s)**: Instance Presentations

* open issues from last meeting?

* AquaDiva
  * in general problems with materialized views for large datasets
    * visualization of ONLY indexed datasets (different from core implementation)
  * modification of search interface (especially for facets)
    * redure redundancies (e.g. owner names - only "Kai Totsche", and not "Kai", "Totsche" and "Kai Totsche")
    * needs modifications in the search config files for "how to index and compose nodes"
    * still some minor issues with handling of values in different metadata schemas
    * potential improvement(s): offer the possibility to create rules for "merging"
  * dataset annotations
    * embedded into the easy upload
    * suggestions (e.g. similar to unit)
  * statistics
    * how many datasets, data-points, and so on...
  * resource booking management
    * rights management should applied beforehand
    * workflow: request -> decision -> confirmation
    * additional step in the "wizard"
    * additional settings file (similar to credentials.config)
    * this modified feature is not used (even though this was a high prioritized function)
  * dataset summary
    * python/R scripts 
    * big data seems to be an issue - long loading time
  * more visual relationship graphs with "a priori" algorithms
    * still some issues with those identifications

---

### 2019-06-27

**Time**: 13:10 - 14:05
**Venue**: Kaffeeküche
**Attendees**: David, Eleonora, Hamdi, Martin, Sven

**Topic(s)**: Instance Presentations

* iDiv
  * bexis2 version: 2.12.0 (2x)
  * postgresql : 9.3
  * server: windows server 2012r2
  * modifications:
    * home -> redirect to different page
      * better would be a load of external module page, so that it is not removed after update
    * menu -> chnages in the manifest files
    * dataset upload:
      * normal workflow only for unstructured
      * easy upload for tabular data only
    * extension of dim with new workflow to publish datasets
      * so it could be cumbersome at update time
      * publish to GBIF
        * mapping to DcA necessary - more system specific, because the upload restricts the user to take only DcA attributes
        * all of this stuff is inside DIM
      * get DOI via second workflow
        * maybe consider it as a separate module? or should it be part of the core in the long run?
    * requests available in different spots
    * modifications inside help section
  * modules:
    * iDiv module for different content within the website
      * good approach, so no changes after update
    * multi media modul
      * extension for visualization of documents within bexis2 core
      * map view doesn't work anymore, because of structural changes
      * polygones with images and further information as zip-file
      * extensible?

* provenance of changes?
  * how and what to change on update?
  * documentation needed
    * up to now, not enough!

---

### 2019-06-20

**Time**: 13:05 - 13:50\
**Venue**: Telco Room (JenTower 17N01)\
**Attendees**: David, Eleonora, Franzi, Hamdi, Martin, Sven

**Topic(s)**: Just get together the first time!

* What should be the outcome of those kinds of meetings?
  * regular reports of BEXIS2 core and side project(s) - e.g. iDiv, AquaDiva, Biodiversity Exploratories
  * general issues
    * What will change within the next release?
    * What are the plans?
    * What are the problems?
    * Do I need help?
  * BEXIS2 topics
    * Hooks
    * Extensions & API
  * git topics
    * Workflow introduction(s) - e.g. fork, clone, merge, branch
  * pipeline(s)
    * How to publish functional changes?
  * code reviews?
  * sharing of resource(s)
    * Documents
    * Code
    * bugs & fixes
