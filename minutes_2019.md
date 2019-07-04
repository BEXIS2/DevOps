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

### 2019-07-05

**Time**: 
**Venue**: 
**Attendees**: 

**Topic**: Instance Presentations

* open issues from last meeting?

* BEXIS
* AquaDiva

---

## Past

### 2019-06-27

**Time**: 13:10 - 14:05
**Venue**: Kaffeeküche
**Attendees**: David, Eleonora, Hamdi, Martin, Sven

**Topic**: Instance Presentations

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

**Topic**: Just get together the first time!

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
