﻿/*
Created: 3/10/2007
Modified: 10/17/2015
Project: Breadboard BI MDW
Model: Breadboard BI Physical Enterprise Dimensional Model
Database: MySQL 5.0
*/




-- Create tables section -------------------------------------------------

-- Table BRIDGE_ACCOUNT

CREATE TABLE `BRIDGE_ACCOUNT`
(
  `PARENT_ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The parent account surrogate key.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.',
  `PARENT_ACCOUNT_ID` Varchar(36)
 COMMENT 'The parent account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `LEVEL_NUMBER` Smallint
 COMMENT 'The level of the hierarchical relationship.  For the root (top of the hierarchy), this will be 0.  For the direct subsidiary, this will be 1, etc.',
  `BOTTOM_IND` Char(1)
 COMMENT 'This denotes the bottom of a particular hierarchy.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account bridge table.'
;

CREATE UNIQUE INDEX `BRIDGE_ACCOUNT_AK` ON `BRIDGE_ACCOUNT` (`PARENT_ACCOUNT_ID`,`ACCOUNT_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `BRIDGE_ACCOUNT` ADD  PRIMARY KEY (`PARENT_ACCOUNT_SK`,`ACCOUNT_SK`)
;

-- Table BRIDGE_BUSINESS_UNIT

CREATE TABLE `BRIDGE_BUSINESS_UNIT`
(
  `PARENT_BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The parent business unit surrogate key.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.',
  `PARENT_BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The parent business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `SOURCE_SYSTEM_SK` Double DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `LEVEL_NUMBER` Smallint
 COMMENT 'The level of the hierarchical relationship.  For the root (top of the hierarchy), this will be 0.  For the direct subsidiary, this will be 1, etc.',
  `BOTTOM_IND` Char(1)
 COMMENT 'This denotes the bottom of a particular hierarchy.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This bridge table captures the business unit hierarchy.  It maintains a row for every parent to child pathway, including a row from parent (root) to itself.'
;

CREATE UNIQUE INDEX `BRIDGE_BUSINESS_UNIT_AK` ON `BRIDGE_BUSINESS_UNIT` (`PARENT_BUSINESS_UNIT_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `BRIDGE_BUSINESS_UNIT` ADD  PRIMARY KEY (`PARENT_BUSINESS_UNIT_SK`,`BUSINESS_UNIT_SK`)
;

-- Table BRIDGE_PERSON

CREATE TABLE `BRIDGE_PERSON`
(
  `PARENT_PERSON_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The parent person surrogate key.',
  `PERSON_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The person surrogate key.',
  `PARENT_PERSON_ID` Varchar(36)
 COMMENT 'The parent person identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an person in the source.',
  `PERSON_ID` Varchar(36)
 COMMENT 'The person identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an person in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `LEVEL_NUMBER` Smallint
 COMMENT 'The level of the hierarchical relationship.  For the root (top of the hierarchy), this will be 0.  For the direct subsidiary, this will be 1, etc.',
  `BOTTOM_IND` Char(1)
 COMMENT 'This denotes the bottom of a particular hierarchy.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The person bridge table.'
;

ALTER TABLE `BRIDGE_PERSON` ADD  PRIMARY KEY (`PARENT_PERSON_SK`,`PERSON_SK`)
;

-- Table DIMENSION_ACCOUNT

CREATE TABLE `DIMENSION_ACCOUNT`
(
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.',
  `ACCOUNT_ID` Varchar(36) NOT NULL
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system account SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `ACCOUNT_NAME` Varchar(60)
 COMMENT 'The account name.',
  `ACCOUNT_DESC` Varchar(255)
 COMMENT 'The account description.',
  `ACCOUNT_TYPE_ID` Varchar(36)
 COMMENT 'The account type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account type in the source.',
  `ACCOUNT_TYPE_DESC` Varchar(255)
 COMMENT 'The account type description.',
  `OBJECT_ACCOUNT_ID` Varchar(36)
 COMMENT 'The object account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an object account in the source.',
  `OBJECT_ACCOUNT_DESC` Varchar(255)
 COMMENT 'The object account description.',
  `SUBSIDIARY_ACCOUNT_ID` Varchar(36)
 COMMENT 'The subsidiary account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subsidiary account in the source.',
  `SUBSIDIARY_ACCOUNT_DESC` Varchar(255)
 COMMENT 'The subsidiary account description.',
  `ACCOUNT_LEVEL_OF_DETAIL_IND` Char(1)
 COMMENT 'The account level of detail indicator.',
  `ACCOUNT_CATEGORY_1_CODE` Varchar(32)
 COMMENT 'The account category 1 account code.',
  `ACCOUNT_CATEGORY_1_DESC` Varchar(255)
 COMMENT 'The account category 1 account description.',
  `ACCOUNT_CATEGORY_2_CODE` Varchar(32)
 COMMENT 'The account category 2 account code.',
  `ACCOUNT_CATEGORY_2_DESC` Varchar(255)
 COMMENT 'The account category 2 account description.',
  `ACCOUNT_CLASSIFICATION_NAME` Varchar(60)
 COMMENT 'The account classification name.  For example, current liability, current asset, fixed asset, operating expense, etc.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account finance dimension.'
;

CREATE INDEX `DIMENSION_ACCOUNT_AK` ON `DIMENSION_ACCOUNT` (`ACCOUNT_ID`,`ACCOUNT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_ACCOUNT_PK` ON `DIMENSION_ACCOUNT` (`ACCOUNT_SK`)
;

ALTER TABLE `DIMENSION_ACCOUNT` ADD  PRIMARY KEY (`ACCOUNT_SK`)
;

ALTER TABLE `DIMENSION_ACCOUNT` ADD UNIQUE `PK_DIMENSION_ACCOUNT` (`ACCOUNT_SK`)
;

-- Table DIMENSION_ADVERTISEMENT

CREATE TABLE `DIMENSION_ADVERTISEMENT`
(
  `AD_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The advertisement surrogate key.',
  `AD_ID` Varchar(36)
 COMMENT 'The advertisement identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement in the source.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `AD_NAME` Varchar(60)
 COMMENT 'The advertisement name.',
  `AD_DESC` Varchar(255)
 COMMENT 'The advertisement description.',
  `AD_1_DESC` Varchar(255)
 COMMENT 'The advertisement line 1 description.',
  `AD_2_DESC` Varchar(255)
 COMMENT 'The advertisement line 2 description.',
  `AD_TYPE_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The advertisement type surrogate key.  This relates to the advertisement type dimension.',
  `AD_TYPE_ID` Varchar(36) DEFAULT '-'
 COMMENT 'The advertisement type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement type in the source.',
  `AD_TYPE_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The advertisement type name.',
  `AD_TYPE_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The advertisement type description.',
  `AD_STATUS_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The advertisement status surrogate key.  This relates to the advertisement status dimension.',
  `AD_STATUS_ID` Varchar(36) DEFAULT '-'
 COMMENT 'The advertisement status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement status in the source.',
  `AD_STATUS_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The advertisement status name.',
  `AD_STATUS_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The advertisement status description.',
  `AD_STATUS_DATE` Datetime
 COMMENT 'The advertisement status date.',
  `AD_BUSINESS_NAME` Varchar(60)
 COMMENT 'The advertisement business name.',
  `AD_BUSINESS_LOCATION_DESC` Varchar(255)
 COMMENT 'The advertisement business location.',
  `AD_DISPLAY_URL_DESC` Varchar(1024)
 COMMENT 'The display URL description.',
  `AD_DESTINATION_URL_DESC` Varchar(1024)
 COMMENT 'The destination URL description.',
  `AD_GROUP_NAME` Varchar(60)
 COMMENT 'The ad group name.',
  `AD_BUSINESS_PHONE_NUMBER` Varchar(32)
 COMMENT 'The telephone number associated with the advertisement.',
  `AD_DISTRIBUTION_DESC` Varchar(255)
 COMMENT 'The advertisement distribution description.  For example, Search Only, Content Only, etc.',
  `AD_GROUP_STATUS_DESC` Varchar(255)
 COMMENT 'The advertisement group status description.',
  `CUSTOMER_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `IMAGE_URL_DESC` Varchar(255)
 COMMENT 'A description of the advertisement image.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The advertisement dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_ADVERTISEMENT_AK` ON `DIMENSION_ADVERTISEMENT` (`AD_ID`,`DW_START_DATE`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_ADVERTISEMENT_PK` ON `DIMENSION_ADVERTISEMENT` (`AD_SK`)
;

ALTER TABLE `DIMENSION_ADVERTISEMENT` ADD  PRIMARY KEY (`AD_SK`)
;

ALTER TABLE `DIMENSION_ADVERTISEMENT` ADD UNIQUE `PK_DIMENSION_ADVERTISEMENT` (`AD_SK`)
;

-- Table DIMENSION_ADVERTISEMENT_TYPE

CREATE TABLE `DIMENSION_ADVERTISEMENT_TYPE`
(
  `AD_TYPE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The advertisement type surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `AD_TYPE_ID` Varchar(36)
 COMMENT 'The advertisement type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement type in the source.',
  `AD_TYPE_NAME` Varchar(60)
 COMMENT 'The advertisement type name.',
  `AD_TYPE_DESC` Varchar(255)
 COMMENT 'The advertisement type description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The advertisement type dimension.'
;

CREATE UNIQUE INDEX `DIM_ADVERTISEMENT_TYPE_AK` ON `DIMENSION_ADVERTISEMENT_TYPE` (`AD_TYPE_ID`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_ADVERTISEMENT_TYPE` ADD  PRIMARY KEY (`AD_TYPE_SK`)
;

-- Table DIMENSION_ADVERTISEMENT_STATUS

CREATE TABLE `DIMENSION_ADVERTISEMENT_STATUS`
(
  `AD_STATUS_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The advertisement status surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `AD_STATUS_ID` Varchar(36)
 COMMENT 'The advertisement status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement status in the source.',
  `AD_STATUS_NAME` Varchar(60)
 COMMENT 'The advertisement status name.',
  `AD_STATUS_DESC` Varchar(255)
 COMMENT 'The advertisement status description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The advertisement status dimension.'
;

CREATE UNIQUE INDEX `DIM_ADVERTISEMENT_STATUS_AK` ON `DIMENSION_ADVERTISEMENT_STATUS` (`AD_STATUS_ID`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_ADVERTISEMENT_STATUS` ADD  PRIMARY KEY (`AD_STATUS_SK`)
;

-- Table DIMENSION_AGREEMENT

CREATE TABLE `DIMENSION_AGREEMENT`
(
  `AGREEMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The agreement surrogate key.',
  `AGREEMENT_ID` Varchar(36)
 COMMENT 'The agreement identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an agreement in the source.',
  `AGREEMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system agreement SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `AGREEMENT_RENEWAL_NUMBER` Smallint
 COMMENT 'The agreement renewal number.',
  `AGREEMENT_LINE_NUMBER` Varchar(36)
 COMMENT 'The agreement reneweal line number',
  `AGREEMENT_LINE_DESC` Varchar(255)
 COMMENT 'The agreement line description.',
  `AGREEMENT_DESC` Varchar(255)
 COMMENT 'The agreement description.',
  `AGREEMENT_CATEGORY` Varchar(36)
 COMMENT 'The agreement category.',
  `AGREEMENT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The agreemenet category name.',
  `AGREEMENT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The agreement category description.',
  `AGREEMENT_START_DATE` Datetime
 COMMENT 'The agreement start date.',
  `AGREEMENT_END_DATE` Datetime
 COMMENT 'The agreement end date.',
  `AGREEMENT_RENEWAL_DATE` Datetime
 COMMENT 'The agreement renewal date.',
  `AGREEMENT_ACTIVATED_DATE` Datetime
 COMMENT 'The agreement activated date.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The agreement dimension.'
;

CREATE INDEX `DIMENSION_AGREEMENT_AK` ON `DIMENSION_AGREEMENT` (`AGREEMENT_ID`,`AGREEMENT_LINE_NUMBER`,`AGREEMENT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_AGREEMENT_PK` ON `DIMENSION_AGREEMENT` (`AGREEMENT_SK`)
;

ALTER TABLE `DIMENSION_AGREEMENT` ADD  PRIMARY KEY (`AGREEMENT_SK`)
;

-- Table DIMENSION_APPLICATION_STATUS

CREATE TABLE `DIMENSION_APPLICATION_STATUS`
(
  `APPLICATION_STATUS_SK` Int NOT NULL
 COMMENT 'The application status surrogate key.',
  `APPLICATION_STATUS_ID` Varchar(36)
 COMMENT 'The application status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a application status in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `APPLICATION_STATUS_NAME` Varchar(60)
 COMMENT 'The application status name.',
  `APPLICATION_STATUS_DESC` Varchar(60)
 COMMENT 'The application status description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The application status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_APPL_STATUS_AK` ON `DIMENSION_APPLICATION_STATUS` (`APPLICATION_STATUS_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_APPL_STATUS_PK` ON `DIMENSION_APPLICATION_STATUS` (`APPLICATION_STATUS_SK`)
;

ALTER TABLE `DIMENSION_APPLICATION_STATUS` ADD  PRIMARY KEY (`APPLICATION_STATUS_SK`)
;

ALTER TABLE `DIMENSION_APPLICATION_STATUS` ADD UNIQUE `PK_DIMENSION_APPLICATION_STATUS` (`APPLICATION_STATUS_SK`)
;

-- Table DIMENSION_BANK_ACCOUNT

CREATE TABLE `DIMENSION_BANK_ACCOUNT`
(
  `BANK_ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The bank account surrogate key.',
  `BANK_ACCOUNT_ID` Varchar(36) NOT NULL
 COMMENT 'The bank account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bank account in the source.',
  `BANK_ACCOUNT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system bank account SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BANK_ACCOUNT_NAME` Varchar(60)
 COMMENT 'The bank account name.',
  `BANK_ACCOUNT_TYPE_ID` Varchar(36)
 COMMENT 'The bank account type idenfier in the source system.',
  `BANK_ACCOUNT_TYPE_CODE` Varchar(32)
 COMMENT 'The bank account type code.',
  `BANK_ACCOUNT_TYPE_NAME` Varchar(60)
 COMMENT 'The bank account type name.',
  `BANK_ACCOUNT_TYPE_DESC` Varchar(255)
 COMMENT 'The bank account type description.',
  `BANK_CODE` Varchar(32)
 COMMENT 'The bank code.',
  `BANK_NAME` Varchar(60)
 COMMENT 'The bank name.',
  `BANK_DESC` Varchar(255)
 COMMENT 'The bank description.',
  `BANK_ACCOUNT_STATUS_CODE` Varchar(32)
 COMMENT 'The bank account status code.',
  `BANK_ACCOUNT_STATUS_NAME` Varchar(60)
 COMMENT 'The bank account status name.',
  `BANK_ACCOUNT_STATUS_DESC` Varchar(255)
 COMMENT 'The bank account status description.',
  `CREDIT_RATING_TYPE_CODE` Varchar(32)
 COMMENT 'The credit rating type code.',
  `CREDIT_RATING_TYPE_NAME` Varchar(60)
 COMMENT 'The credit rating type name.',
  `CREDIT_RATING_TYPE_DESC` Varchar(255)
 COMMENT 'The credit rating type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The bank account dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_BANK_ACCOUNT_AK` ON `DIMENSION_BANK_ACCOUNT` (`BANK_ACCOUNT_ID`,`BANK_ACCOUNT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BANK_ACCOUNT_PK` ON `DIMENSION_BANK_ACCOUNT` (`BANK_ACCOUNT_SK`)
;

ALTER TABLE `DIMENSION_BANK_ACCOUNT` ADD  PRIMARY KEY (`BANK_ACCOUNT_SK`)
;

ALTER TABLE `DIMENSION_BANK_ACCOUNT` ADD UNIQUE `PK_DIMENSION_BANK_ACCOUNT` (`BANK_ACCOUNT_SK`)
;

-- Table DIMENSION_BILL_STATUS

CREATE TABLE `DIMENSION_BILL_STATUS`
(
  `BILL_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The bill status surrogate key.',
  `BILL_STATUS_ID` Varchar(36)
 COMMENT 'The bill status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill status in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `BILL_STATUS_NAME` Varchar(60)
 COMMENT 'The bill status name.',
  `BILL_STATUS_DESC` Varchar(255)
 COMMENT 'The bill status description.',
  `BILL_STATUS_GROUP_ID` Varchar(36)
 COMMENT 'The bill status group source system identifier.',
  `BILL_STATUS_GROUP_NAME` Varchar(60)
 COMMENT 'The bill status group name.',
  `BILL_STATUS_GROUP_DESC` Varchar(255)
 COMMENT 'The bill status group description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The bill status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_BILL_STATUS_AK` ON `DIMENSION_BILL_STATUS` (`BILL_STATUS_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BILL_STATUS_PK` ON `DIMENSION_BILL_STATUS` (`BILL_STATUS_SK`)
;

ALTER TABLE `DIMENSION_BILL_STATUS` ADD  PRIMARY KEY (`BILL_STATUS_SK`)
;

ALTER TABLE `DIMENSION_BILL_STATUS` ADD UNIQUE `PK_DIMENSION_BILL_STATUS` (`BILL_STATUS_SK`)
;

-- Table DIMENSION_BILL_TYPE

CREATE TABLE `DIMENSION_BILL_TYPE`
(
  `BILL_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The bill type surrogate key.',
  `BILL_TYPE_ID` Varchar(36)
 COMMENT 'The bill type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill type in the source.',
  `BILL_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system bill type SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `BILL_TYPE_NAME` Varchar(60)
 COMMENT 'The bill type name.',
  `BILL_TYPE_DESC` Varchar(255)
 COMMENT 'The bill type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The bill type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_BILL_TYPE_AK` ON `DIMENSION_BILL_TYPE` (`BILL_TYPE_ID`,`BILL_TYPE_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BILL_TYPE_PK` ON `DIMENSION_BILL_TYPE` (`BILL_TYPE_SK`)
;

ALTER TABLE `DIMENSION_BILL_TYPE` ADD  PRIMARY KEY (`BILL_TYPE_SK`)
;

ALTER TABLE `DIMENSION_BILL_TYPE` ADD UNIQUE `PK_DIMENSION_BILL_TYPE` (`BILL_TYPE_SK`)
;

-- Table DIMENSION_BUDGET_FORECAST

CREATE TABLE `DIMENSION_BUDGET_FORECAST`
(
  `BUDGET_FRCST_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The budget forecast surrogate key.',
  `BUDGET_FRCST_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system budget forecast SETID.  This column is often used as part of the unique identifer.',
  `BUDGET_FRCST_ID` Varchar(36)
 COMMENT 'The budget forecast reference identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a budget forecast in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The budget reference effective date.',
  `BUDGET_FRCST_NAME` Varchar(60)
 COMMENT 'The budget forecast name.',
  `BUDGET_FRCST_DESC` Varchar(255)
 COMMENT 'The budget forecast description.',
  `BUDGET_FRCST_FISCAL_YEAR` Decimal(4,0)
 COMMENT 'The budget forecast fiscal year.',
  `BUDGET_FRCST_IND` Char(1)
 COMMENT 'The budget forecast indicator, B = budget, F = forecast.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The budget forecast dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_BUDGET_FRCST_AK` ON `DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_ID`,`BUDGET_FRCST_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BUDGET_FRCST_PK` ON `DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BUDGET_AK` USING BTREE ON `DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_ID`,`BUDGET_FRCST_SETID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_BUDGET_FORECAST` ADD  PRIMARY KEY (`BUDGET_FRCST_SK`)
;

ALTER TABLE `DIMENSION_BUDGET_FORECAST` ADD UNIQUE `PK_DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_SK`)
;

-- Table DIMENSION_BUDGET_FORECAST_ITEM

CREATE TABLE `DIMENSION_BUDGET_FORECAST_ITEM`
(
  `BUDGET_FRCST_ITEM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The budget forecast item surrogate key.',
  `BUDGET_FRCST_SK` Int NOT NULL DEFAULT 0,
  `BUDGET_FRCST_ITEM_ID` Varchar(36)
 COMMENT 'The budget forecast item identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a budget item in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BUDGET_FRCST_ITEM_NAME` Varchar(60)
 COMMENT 'The budget forecast item name.',
  `BUDGET_FRCST_ITEM_CAT_ID` Varchar(36) DEFAULT 0
 COMMENT 'The budget forecast item category identifier in the source system.',
  `BUDGET_FRCST_ITEM_CAT_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The budget forecast item category name.',
  `BUDGET_FRCST_ITEM_CAT_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The budget forecast item category description.',
  `BUDGET_FRCST_ITEM_SUBCAT_ID` Varchar(36) DEFAULT 0
 COMMENT 'The budget forecast item subcategory identifier in the source system.',
  `BUDGET_FRCST_ITEM_SUBCAT_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The budget forecast item subcategory name.',
  `BUDGET_FRCST_ITEM_SUBCAT_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The budget forecast item subcategory description.',
  `BUDGET_FRCST_ID` Varchar(36)
 COMMENT 'The budget forecast reference identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a budget forecast in the source.',
  `BUDGET_FRCST_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system budget forecast SETID.  This column is often used as part of the unique identifer.',
  `BUDGET_FRCST_NAME` Varchar(60)
 COMMENT 'The budget forecast name.',
  `BUDGET_FRCST_DESC` Varchar(255)
 COMMENT 'The budget forecast description.',
  `BUDGET_FRCST_IND` Char(1)
 COMMENT 'The budget forecast indicator, B = budget, F = forecast.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The budget forecast item dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_BUDGET_FRCST_ITEM_AK` ON `DIMENSION_BUDGET_FORECAST_ITEM` (`BUDGET_FRCST_ITEM_ID`,`BUDGET_FRCST_ID`,`BUDGET_FRCST_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BUDGET_FRCST_ITEM_PK` ON `DIMENSION_BUDGET_FORECAST_ITEM` (`BUDGET_FRCST_ITEM_SK`)
;

ALTER TABLE `DIMENSION_BUDGET_FORECAST_ITEM` ADD  PRIMARY KEY (`BUDGET_FRCST_ITEM_SK`)
;

ALTER TABLE `DIMENSION_BUDGET_FORECAST_ITEM` ADD UNIQUE `PK_DIMENSION_BUDGET_FORECAST_ITEM` (`BUDGET_FRCST_ITEM_SK`)
;

-- Table DIMENSION_BUSINESS_UNIT

CREATE TABLE `DIMENSION_BUSINESS_UNIT`
(
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT NULL
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_NAME` Varchar(60)
 COMMENT 'The business unit name.',
  `BUSINESS_UNIT_DESC` Varchar(60)
 COMMENT 'The business unit description',
  `BUSINESS_UNIT_ALT_ID` Varchar(36)
 COMMENT 'The alternate business unit identifier in the source system.',
  `BUSINESS_UNIT_TYPE_CODE` Varchar(32) DEFAULT 'UNDEFINED'
 COMMENT 'The business unit type.',
  `BUSINESS_UNIT_TYPE_NAME` Varchar(60)
 COMMENT 'The business unit type name.',
  `BUSINESS_UNIT_TYPE_DESC` Varchar(255)
 COMMENT 'The business unit type description.',
  `BUSINESS_UNIT_CATEGORY` Varchar(32)
 COMMENT 'The business unit category.',
  `START_DATE` Timestamp NULL
 COMMENT 'The start date of the business unit.',
  `STOP_DATE` Timestamp NULL
 COMMENT 'The stop date of the business unit.',
  `REMODEL_DATE` Timestamp NULL
 COMMENT 'The remodel date.',
  `AREA_QTY` Double
 COMMENT 'The area quantity.',
  `AREA_UOM_ID` Varchar(32)
 COMMENT 'The area unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `REGION_NAME` Varchar(255)
 COMMENT 'The region name.',
  `DISTRICT_NAME` Varchar(255)
 COMMENT 'The district name.',
  `LATITUDE` Double
 COMMENT 'The latitude.',
  `LONGITUDE` Double
 COMMENT 'The longitude.',
  `PHONE_COUNTRY_CODE` Varchar(32)
 COMMENT 'The telephone country code.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The address line 1 description.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The address line 2 description.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The address line 3 description.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The address line 4 description.',
  `STATE_PROVINCE_CODE` Varchar(6)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(255)
 COMMENT 'The state or province name.',
  `CITY_NAME` Varchar(255)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(255)
 COMMENT 'The county name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(255)
 COMMENT 'The country name.',
  `PHONE_REGION_CODE` Double
 COMMENT 'The phone region code.',
  `BUSINESS_UNIT_STATUS_CODE` Varchar(32)
 COMMENT 'The business unit status code.',
  `BUSINESS_UNIT_STATUS_NAME` Varchar(60)
 COMMENT 'The business unit status name.',
  `BUSINESS_UNIT_STATUS_DESC` Varchar(255)
 COMMENT 'The business unit status description.',
  `PARENT_BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The parent business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `PARENT_BUSINESS_UNIT_NAME` Varchar(60)
 COMMENT 'The parent business unit name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The business unit dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_BUSINESS_UNIT_AK` ON `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_ID`,`BUSINESS_UNIT_TYPE_CODE`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BUSINESS_UNIT_PK` ON `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`)
;

ALTER TABLE `DIMENSION_BUSINESS_UNIT` ADD  PRIMARY KEY (`BUSINESS_UNIT_SK`)
;

ALTER TABLE `DIMENSION_BUSINESS_UNIT` ADD UNIQUE `PK_DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`)
;

-- Table DIMENSION_CALL_RESULT

CREATE TABLE `DIMENSION_CALL_RESULT`
(
  `CALL_RESULT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call result surrogate key.',
  `CALL_RESULT_ID` Varchar(36)
 COMMENT 'The call result identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a call result in the source.',
  `CALL_RESULT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system call result SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CALL_RESULT_NAME` Varchar(60)
 COMMENT 'The call result name.',
  `CALL_RESULT_DESC` Varchar(255)
 COMMENT 'The call result description.',
  `CALL_RESULT_CATEGORY` Varchar(32)
 COMMENT 'The call result category.',
  `CALL_RESULT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The call result category name.',
  `CALL_RESULT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The call result category description.',
  `HOSTED_CLIENT_SK` Linestring DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The call result dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CALL_RESULT_AK` ON `DIMENSION_CALL_RESULT` (`CALL_RESULT_ID`,`CALL_RESULT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CALL_RESULT_PK` ON `DIMENSION_CALL_RESULT` (`CALL_RESULT_SK`)
;

ALTER TABLE `DIMENSION_CALL_RESULT` ADD  PRIMARY KEY (`CALL_RESULT_SK`)
;

ALTER TABLE `DIMENSION_CALL_RESULT` ADD UNIQUE `PK_DIMENSION_CALL_RESULT` (`CALL_RESULT_SK`)
;

-- Table DIMENSION_CALL_TYPE

CREATE TABLE `DIMENSION_CALL_TYPE`
(
  `CALL_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call type surrogate key.',
  `CALL_TYPE_ID` Varchar(36)
 COMMENT 'The call type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a call type in the source.',
  `CALL_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system call type SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `CALL_TYPE_NAME` Varchar(60)
 COMMENT 'The call type name.',
  `CALL_TYPE_DESC` Varchar(255)
 COMMENT 'The call type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The call type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CALL_TYPE_AK` ON `DIMENSION_CALL_TYPE` (`CALL_TYPE_ID`,`CALL_TYPE_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CALL_TYPE_PK` ON `DIMENSION_CALL_TYPE` (`CALL_TYPE_SK`)
;

ALTER TABLE `DIMENSION_CALL_TYPE` ADD  PRIMARY KEY (`CALL_TYPE_SK`)
;

ALTER TABLE `DIMENSION_CALL_TYPE` ADD UNIQUE `PK_DIMENSION_CALL_TYPE` (`CALL_TYPE_SK`)
;

-- Table DIMENSION_CAMPAIGN_WAVE

CREATE TABLE `DIMENSION_CAMPAIGN_WAVE`
(
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.',
  `CAMPAIGN_ID` Varchar(36) NOT NULL DEFAULT '-'
 COMMENT 'The marketing campaign identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign in the source.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CAMPAIGN_WAVE_ID` Varchar(36)
 COMMENT 'The marketing campaign wave identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign wave in the source.',
  `CAMPAIGN_WAVE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system campaign wave SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `CAMPAIGN_WAVE_NAME` Varchar(60)
 COMMENT 'The campaign wave name.',
  `CAMPAIGN_SK` Int DEFAULT 0
 COMMENT 'The campaign surrogate key.  This relates to the campaign dimension.',
  `PROMOTION_CODE` Varchar(60)
 COMMENT 'The promotion code associated with the campaign.',
  `CAMPAIGN_NAME` Varchar(60)
 COMMENT 'The campaign name.',
  `CAMPAIGN_WAVE_START_DATE` Datetime
 COMMENT 'The campaign start date.',
  `CAMPAIGN_WAVE_STOP_DATE` Datetime
 COMMENT 'The campaign stop date.',
  `CAMPAIGN_OBJECTIVE_CODE` Varchar(36)
 COMMENT 'The campaign objective code.',
  `CAMPAIGN_OBJECTIVE_DESC` Varchar(255)
 COMMENT 'The campaign objective description.',
  `CAMPAIGN_OFFER_NAME` Varchar(60)
 COMMENT 'The campaign offer name.',
  `CAMPAIGN_CONTENT_NAME` Varchar(60)
 COMMENT 'The campaign content name.',
  `CAMPAIGN_CONTENT_DESC` Varchar(255)
 COMMENT 'The campaign content desc.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_TYPE_NAME` Varchar(60)
 COMMENT 'The campaign content name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_TYPE_DESC` Varchar(255)
 COMMENT 'The campaign content  type description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_SUBTYPE_NAME` Varchar(60)
 COMMENT 'The campaign content subtype name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content Hierarchy.',
  `CAMPAIGN_CONTENT_SUBTYPE_DESC` Varchar(255)
 COMMENT 'The campaign content subtype description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CUSTOMER_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `PROGRAM_OWNER_ID` Varchar(36)
 COMMENT 'The program owner source system identifier.',
  `PROGRAM_OWNER_NAME` Varchar(60)
 COMMENT 'The program owner name.',
  `CAMPAIGN_STATUS_CODE` Varchar(36)
 COMMENT 'The campaign status code.',
  `CAMPAIGN_STATUS_NAME` Varchar(60)
 COMMENT 'The campaign status name.',
  `CAMPAIGN_STATUS_DESC` Varchar(255)
 COMMENT 'The campaign status description.',
  `CAMPAIGN_WAVE_STATUS_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The campaign wave status surrogate key.  This relates to the campaign wave status dimension.',
  `CAMPAIGN_WAVE_STATUS_CODE` Varchar(36)
 COMMENT 'The campaign wave status code.',
  `CAMPAIGN_WAVE_STATUS_NAME` Varchar(60)
 COMMENT 'The campaign wave status name.',
  `CAMPAIGN_WAVE_STATUS_DESC` Varchar(255)
 COMMENT 'The campaign wave status description.',
  `CAMPAIGN_START_DATE` Datetime
 COMMENT 'The marketing campaign start date.',
  `CAMPAIGN_STOP_DATE` Datetime
 COMMENT 'The marketing campaign stop date.',
  `CAMPAIGN_WAVE_BUDGET_AMT` Decimal(26,2)
 COMMENT 'The campaign wave budget amount.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The campaign wave  (promotion) dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CAMPAIGN_WAVE_AK` ON `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_ID`,`CAMPAIGN_ID`,`CAMPAIGN_WAVE_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CAMPAIGN_WAVE_AK2` ON `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_NAME`,`CAMPAIGN_NAME`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_MARKETING_ACTIV_PK` ON `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_MKT_CAMPAIGN_AK` ON `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_ID`,`CAMPAIGN_WAVE_ID`,`CAMPAIGN_WAVE_SETID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN_WAVE` ADD  PRIMARY KEY (`CAMPAIGN_WAVE_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN_WAVE` ADD UNIQUE `PK_DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`)
;

-- Table DIMENSION_CAMPAIGN

CREATE TABLE `DIMENSION_CAMPAIGN`
(
  `CAMPAIGN_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The campaign surrogate key.',
  `CAMPAIGN_ID` Varchar(36) NOT NULL DEFAULT '-'
 COMMENT 'The marketing campaign identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign in the source.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `PROMOTION_CODE` Varchar(60)
 COMMENT 'The promotion code associated with the campaign.',
  `CAMPAIGN_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The campaign name.',
  `CAMPAIGN_OBJECTIVE_SK` Int DEFAULT 0
 COMMENT 'The campaign objective surrogate key.  This relates to the campaign objective dimension.',
  `CAMPAIGN_OBJECTIVE_CODE` Varchar(36)
 COMMENT 'The campaign objective code.',
  `CAMPAIGN_OBJECTIVE_DESC` Varchar(255)
 COMMENT 'The campaign objective description.',
  `CAMPAIGN_OFFER_NAME` Varchar(60)
 COMMENT 'The campaign offer name.',
  `CAMPAIGN_CONTENT_NAME` Varchar(60)
 COMMENT 'The campaign content name.',
  `CAMPAIGN_CONTENT_DESC` Varchar(255)
 COMMENT 'The campaign content desc.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_TYPE_SK` Int DEFAULT 0
 COMMENT 'The campaign type surrogate key.  This relates to the campaign type dimension.',
  `CAMPAIGN_CONTENT_TYPE_NAME` Varchar(60)
 COMMENT 'The campaign content name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_TYPE_DESC` Varchar(255)
 COMMENT 'The campaign content  type description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_SUBTYPE_SK` Int DEFAULT 0
 COMMENT 'The campaign subtype surrogate key.  This relates to the campaign subtype dimension.',
  `CAMPAIGN_CONTENT_SUBTYPE_NAME` Varchar(60)
 COMMENT 'The campaign content subtype name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content Hierarchy.',
  `CAMPAIGN_CONTENT_SUBTYPE_DESC` Varchar(255)
 COMMENT 'The campaign content subtype description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `PROGRAM_OWNER_ID` Varchar(36)
 COMMENT 'The program owner source system identifier.',
  `PROGRAM_OWNER_NAME` Varchar(60)
 COMMENT 'The program owner name.',
  `CAMPAIGN_STATUS_SK` Int DEFAULT 0
 COMMENT 'The campaign status surrogate key.  This relates to the campaign status dimension.',
  `CAMPAIGN_STATUS_CODE` Varchar(36)
 COMMENT 'The campaign status code.',
  `CAMPAIGN_STATUS_NAME` Varchar(60)
 COMMENT 'The campaign status name.',
  `CAMPAIGN_STATUS_DESC` Varchar(255)
 COMMENT 'The campaign status description.',
  `CAMPAIGN_START_DATE` Datetime
 COMMENT 'The marketing campaign start date.',
  `CAMPAIGN_STOP_DATE` Datetime
 COMMENT 'The marketing campaign stop date.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The campaign (promotion) dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CAMPAIGN_AK` ON `DIMENSION_CAMPAIGN` (`CAMPAIGN_ID`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN` ADD  PRIMARY KEY (`CAMPAIGN_SK`)
;

-- Table DIMENSION_CAMPAIGN_SUBTYPE

CREATE TABLE `DIMENSION_CAMPAIGN_SUBTYPE`
(
  `CAMPAIGN_SUBTYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The campaign subtype surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `CAMPAIGN_TYPE_SK` Int DEFAULT 0
 COMMENT 'The campaign type surrogate key.  This relates to the campaign type dimension.',
  `CAMPAIGN_CONTENT_TYPE_ID` Varchar(36)
 COMMENT 'The campaign content type identifier.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign type in the source.',
  `CAMPAIGN_CONTENT_TYPE_NAME` Varchar(60)
 COMMENT 'The campaign content name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_TYPE_DESC` Varchar(255)
 COMMENT 'The campaign content  type description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_SUBTYPE_ID` Varchar(36)
 COMMENT 'The campaign content subtype identifier.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign subtype in the source.',
  `CAMPAIGN_CONTENT_SUBTYPE_NAME` Varchar(60)
 COMMENT 'The campaign content subtype name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content Hierarchy.',
  `CAMPAIGN_CONTENT_SUBTYPE_DESC` Varchar(255)
 COMMENT 'The campaign content subtype description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The campaign (promotion) subtype dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CAMPAIGN_SUBTYPE_AK` ON `DIMENSION_CAMPAIGN_SUBTYPE` (`CAMPAIGN_CONTENT_TYPE_ID`,`CAMPAIGN_CONTENT_SUBTYPE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN_SUBTYPE` ADD  PRIMARY KEY (`CAMPAIGN_SUBTYPE_SK`)
;

-- Table DIMENSION_CAMPAIGN_TYPE

CREATE TABLE `DIMENSION_CAMPAIGN_TYPE`
(
  `CAMPAIGN_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The campaign type surrogate key.',
  `CAMPAIGN_CONTENT_TYPE_ID` Varchar(36)
 COMMENT 'The campaign content type identifier.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign subtype in the source.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `CAMPAIGN_CONTENT_TYPE_NAME` Varchar(60)
 COMMENT 'The campaign content type name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content Hierarchy.',
  `CAMPAIGN_CONTENT_TYPE_DESC` Varchar(255)
 COMMENT 'The campaign content type description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The campaign (promotion) type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CAMPAIGN_TYPE_AK` ON `DIMENSION_CAMPAIGN_TYPE` (`CAMPAIGN_CONTENT_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN_TYPE` ADD  PRIMARY KEY (`CAMPAIGN_TYPE_SK`)
;

-- Table DIMENSION_CAMPAIGN_STATUS

CREATE TABLE `DIMENSION_CAMPAIGN_STATUS`
(
  `CAMPAIGN_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The campaign status surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `CAMPAIGN_STATUS_CODE` Varchar(36)
 COMMENT 'The campaign status code.',
  `CAMPAIGN_STATUS_NAME` Varchar(60)
 COMMENT 'The campaign status name.',
  `CAMPAIGN_STATUS_DESC` Varchar(255)
 COMMENT 'The campaign status description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The campaign (promotion) status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CAMPAIGN_STATUS_AK` ON `DIMENSION_CAMPAIGN_STATUS` (`CAMPAIGN_STATUS_CODE`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN_STATUS` ADD  PRIMARY KEY (`CAMPAIGN_STATUS_SK`)
;

-- Table DIMENSION_CAMPAIGN_WAVE_STATUS

CREATE TABLE `DIMENSION_CAMPAIGN_WAVE_STATUS`
(
  `CAMPAIGN_WAVE_STATUS_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave status surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `CAMPAIGN_WAVE_STATUS_CODE` Varchar(36) DEFAULT '-'
 COMMENT 'The campaign wave status code.',
  `CAMPAIGN_WAVE_STATUS_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The campaign wave status name.',
  `CAMPAIGN_WAVE_STATUS_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The campaign wave status description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The campaign wave status dimension.'
;

CREATE UNIQUE INDEX `DIM_CAMPAIGN_WAVE_STATUS_AK` ON `DIMENSION_CAMPAIGN_WAVE_STATUS` (`SOURCE_SYSTEM_SK`,`CAMPAIGN_WAVE_STATUS_CODE`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN_WAVE_STATUS` ADD  PRIMARY KEY (`CAMPAIGN_WAVE_STATUS_SK`)
;

-- Table DIMENSION_CAMPAIGN_OBJECTIVE

CREATE TABLE `DIMENSION_CAMPAIGN_OBJECTIVE`
(
  `CAMPAIGN_OBJECTIVE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The campaign objective surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `CAMPAIGN_OBJECTIVE_CODE` Varchar(36)
 COMMENT 'The campaign objective code.',
  `CAMPAIGN_OBJECTIVE_DESC` Varchar(255)
 COMMENT 'The campaign objective description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The campaign (promotion) objective dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CAMPAIGN_OBJECTIVE_AK` ON `DIMENSION_CAMPAIGN_OBJECTIVE` (`CAMPAIGN_OBJECTIVE_CODE`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_CAMPAIGN_OBJECTIVE` ADD  PRIMARY KEY (`CAMPAIGN_OBJECTIVE_SK`)
;

-- Table DIMENSION_CARRIER

CREATE TABLE `DIMENSION_CARRIER`
(
  `CARRIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The carrier surrogate key.',
  `CARRIER_ID` Varchar(36)
 COMMENT 'The carrier identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a carrier in the source.',
  `CARRIER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system carrier SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CARRIER_NAME` Varchar(60)
 COMMENT 'The carrier name.',
  `CARRIER_DESC` Varchar(255)
 COMMENT 'The carrier description.',
  `STATUS_DATE` Timestamp NULL
 COMMENT 'The status date.',
  `STATUS_CODE` Varchar(32)
 COMMENT 'The status code.',
  `STATUS_NAME` Varchar(60)
 COMMENT 'The status name.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(32)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `COUNTRY_CODE` Varchar(32)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `FREIGHT_FORWARD_IND` Char(1)
 COMMENT 'The freight forwarder indicator.',
  `FREIGHT_VENDOR_IND` Char(1)
 COMMENT 'The freight vendor indicator.',
  `TRUCK_IND` Char(1)
 COMMENT 'This denotes if a shipper offers truck shipments.',
  `RAIL_IND` Char(1)
 COMMENT 'This denotes if a shipper offers rail (train) shipments.',
  `BARG_IND` Char(1)
 COMMENT 'This denotes if a shipper offers barg shipments.',
  `VESSEL_IND` Char(1)
 COMMENT 'This denotes if a shipper offers vessel (ship) shipments.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The carrier (shipper) dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CARRIER_AK` ON `DIMENSION_CARRIER` (`CARRIER_ID`,`CARRIER_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CARRIER_PK` ON `DIMENSION_CARRIER` (`CARRIER_SK`)
;

ALTER TABLE `DIMENSION_CARRIER` ADD  PRIMARY KEY (`CARRIER_SK`)
;

ALTER TABLE `DIMENSION_CARRIER` ADD UNIQUE `PK_DIMENSION_CARRIER` (`CARRIER_SK`)
;

-- Table DIMENSION_CASE

CREATE TABLE `DIMENSION_CASE`
(
  `CASE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case surrogate key.',
  `CASE_ID` Varchar(36)
 COMMENT 'The caes identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case in the source.',
  `CASE_SETID` Varchar(32) DEFAULT 'SHARE'
 COMMENT 'The source system case SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CASE_DESC` Varchar(255)
 COMMENT 'The case description.',
  `AGENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The agent surrogate key.  This relates to the person dimension.',
  `PRIOR_AGENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The prior agent surrogate key.  This relates to the person dimension.',
  `AGENT_NAME` Varchar(60)
 COMMENT 'The agent name.',
  `CASE_TYPE_CODE` Varchar(32)
 COMMENT 'The case type code.',
  `CASE_TYPE_NAME` Varchar(60)
 COMMENT 'The case type name.',
  `CASE_SOURCE_ID` Varchar(36)
 COMMENT 'The case source identifier in the source system.',
  `CASE_SOURCE_NAME` Varchar(60)
 COMMENT 'The case source name.',
  `CONTACT_CENTER_CATEGORY` Varchar(32)
 COMMENT 'The contact center category.',
  `CONTACT_CENTER_CATEGORY_NAME` Varchar(32)
 COMMENT 'The contact center category name.',
  `CASE_SPECIALTY_TYPE_CODE` Varchar(32)
 COMMENT 'The case specialty type.',
  `CASE_SPECIALTY_TYPE_DESC` Varchar(255)
 COMMENT 'The case specialty type description.',
  `CASE_DETAIL_NAME` Varchar(32)
 COMMENT 'The case detail name.',
  `CASE_DETAIL_DESC` Varchar(255)
 COMMENT 'The case detail description.',
  `PROBLEM_TYPE_CODE` Varchar(32)
 COMMENT 'The problem type code.',
  `PROBLEM_TYPE_DESC` Varchar(255)
 COMMENT 'The problem type description.',
  `IMPACT_TYPE_NAME` Varchar(32)
 COMMENT 'The impact type name.',
  `IMPACT_TYPE_DESC` Varchar(255)
 COMMENT 'The impact type description.',
  `REOPEN_REASON_CODE` Varchar(32)
 COMMENT 'The reopen reason code.',
  `REOPEN_REASON_DESC` Varchar(255)
 COMMENT 'The reopen reason description.',
  `CLOSED_REASON_CODE` Varchar(32)
 COMMENT 'The case closed reason description.',
  `CLOSED_REASON_DESC` Varchar(255)
 COMMENT 'The case closed reason description.',
  `RESPONSE_IND` Varchar(4)
 COMMENT 'The response indicator.',
  `RESPONSE_DESC` Varchar(255)
 COMMENT 'The response description.',
  `RESPONSE_DATE` Timestamp NULL
 COMMENT 'The response date.',
  `RESPONSE_MET_DATE` Timestamp NULL
 COMMENT 'The response met date.',
  `RESTORE_DATE` Timestamp NULL
 COMMENT 'The restore date.',
  `RESTORE_MET_DATE` Timestamp NULL
 COMMENT 'The restore met date.',
  `RESTORE_CODE` Varchar(4)
 COMMENT 'The restore code.',
  `RESTORE_DESC` Varchar(255)
 COMMENT 'The restore description.',
  `PAY_FOR_SERVICE_IND` Varchar(1)
 COMMENT 'The pay for service indicator.',
  `ANONYMOUS_IND` Varchar(1)
 COMMENT 'The anonymous indicator.',
  `SECURE_CASE_IND` Varchar(1)
 COMMENT 'The secure case indicator.',
  `SLA_IND` Varchar(1)
 COMMENT 'The service level agreement (SLA) indicator.',
  `CASE_OPEN_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The case open surrogate key.  This relates to the date dimension.',
  `CASE_OPEN_DATE` Timestamp NULL
 COMMENT 'The case open date.',
  `TARGET_CLOSE_DATE` Timestamp NULL
 COMMENT 'The target close date.',
  `CASE_CLOSED_DATE` Timestamp NULL
 COMMENT 'The case closed date.',
  `CASE_PRIORITY_CATEGORY` Varchar(1)
 COMMENT 'The case priority category.',
  `CASE_PRIORITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case priority SETID.  This column is often used as part of the unique identifer.',
  `CASE_PRIORITY_CATEGORY_NAME` Varchar(60)
 COMMENT 'The case priority category name.',
  `CASE_PRIORITY_CATEGORY_DESC` Varchar(255)
 COMMENT 'The case priority category description.',
  `CASE_PRIORITY_ID` Varchar(36)
 COMMENT 'The case priority souce system identifier.',
  `CASE_PRIORITY_NAME` Varchar(60)
 COMMENT 'The case priority name.',
  `CASE_PRIORITY_DESC` Varchar(255)
 COMMENT 'The case priority desciption.',
  `CASE_SEVERITY_ID` Varchar(36)
 COMMENT 'The case severity identifier in the source system.',
  `CASE_SEVERITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case severity SETID.  This column is often used as part of the unique identifer.',
  `CASE_SEVERITY_NAME` Varchar(60)
 COMMENT 'The case severity name.',
  `CASE_SEVERITY_DESC` Varchar(255)
 COMMENT 'The case severity description.',
  `CASE_STATUS_ID` Varchar(36)
 COMMENT 'The case status identifier in the source system.',
  `CASE_STATUS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case status SETID.  This column is often used as part of the unique identifer.',
  `CASE_STATUS_NAME` Varchar(60)
 COMMENT 'The case status name.',
  `CASE_STATUS_CATEGORY` Varchar(1)
 COMMENT 'The case status category.',
  `CASE_STATUS_CATEGORY_NAME` Varchar(60)
 COMMENT 'The case status category name.',
  `CASE_STATUS_CATEGORY_DESC` Varchar(255)
 COMMENT 'The case status category description.',
  `CASE_STATUS_DESC` Varchar(255)
 COMMENT 'The case status description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CASE_AK` ON `DIMENSION_CASE` (`CASE_ID`,`CASE_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CASE_PK` ON `DIMENSION_CASE` (`CASE_SK`)
;

CREATE INDEX `DIMENSION_CASE_OPEN_DATE_BI` ON `DIMENSION_CASE` (`CASE_OPEN_DATE_SK`)
;

ALTER TABLE `DIMENSION_CASE` ADD  PRIMARY KEY (`CASE_SK`)
;

ALTER TABLE `DIMENSION_CASE` ADD UNIQUE `PK_DIMENSION_CASE` (`CASE_SK`)
;

-- Table DIMENSION_CASE_PRIORITY

CREATE TABLE `DIMENSION_CASE_PRIORITY`
(
  `CASE_PRIORITY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case priority surrogate key.',
  `CASE_PRIORITY_ID` Varchar(36)
 COMMENT 'The case priority identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case priority in the source.',
  `CASE_PRIORITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case priority SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CASE_PRIORITY_CATEGORY` Varchar(1)
 COMMENT 'The case priority category.',
  `CASE_PRIORITY_CATEGORY_NAME` Varchar(60)
 COMMENT 'The case priority category name.',
  `CASE_PRIORITY_CATEGORY_DESC` Varchar(255)
 COMMENT 'The case priority category description.',
  `CASE_PRIORITY_NAME` Varchar(60)
 COMMENT 'The case priority name.',
  `CASE_PRIORITY_DESC` Varchar(255)
 COMMENT 'The case priority description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case priority dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CASE_PRIORITY_AK` ON `DIMENSION_CASE_PRIORITY` (`CASE_PRIORITY_ID`,`CASE_PRIORITY_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CASE_PRIORITY_PK` ON `DIMENSION_CASE_PRIORITY` (`CASE_PRIORITY_SK`)
;

ALTER TABLE `DIMENSION_CASE_PRIORITY` ADD  PRIMARY KEY (`CASE_PRIORITY_SK`)
;

ALTER TABLE `DIMENSION_CASE_PRIORITY` ADD UNIQUE `PK_DIMENSION_CASE_PRIORITY` (`CASE_PRIORITY_SK`)
;

-- Table DIMENSION_CASE_SEVERITY

CREATE TABLE `DIMENSION_CASE_SEVERITY`
(
  `CASE_SEVERITY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case severity surrogate key.',
  `CASE_SEVERITY_ID` Varchar(36)
 COMMENT 'The case severity identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case severity in the source.',
  `CASE_SEVERITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case severity SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CASE_SEVERITY_NAME` Varchar(60)
 COMMENT 'The case severity name.',
  `CASE_SEVERITY_DESC` Varchar(255)
 COMMENT 'The case severity description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case severity dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CASE_SEVERITY_AK` ON `DIMENSION_CASE_SEVERITY` (`CASE_SEVERITY_ID`,`CASE_SEVERITY_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CASE_SEVERITY_PK` ON `DIMENSION_CASE_SEVERITY` (`CASE_SEVERITY_SK`)
;

ALTER TABLE `DIMENSION_CASE_SEVERITY` ADD  PRIMARY KEY (`CASE_SEVERITY_SK`)
;

-- Table DIMENSION_CASE_STATUS

CREATE TABLE `DIMENSION_CASE_STATUS`
(
  `CASE_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case status surrogate key.',
  `CASE_STATUS_ID` Varchar(36)
 COMMENT 'The case status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case status in the source.',
  `CASE_STATUS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case status SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CASE_STATUS_CATEGORY` Varchar(1)
 COMMENT 'The case status category.',
  `CASE_STATUS_CATEGORY_NAME` Varchar(60)
 COMMENT 'The cases status category name.',
  `CASE_STATUS_CATEGORY_DESC` Varchar(255)
 COMMENT 'The cases status category description.',
  `CASE_STATUS_NAME` Varchar(60)
 COMMENT 'The case status name.',
  `CASE_STATUS_DESC` Varchar(255)
 COMMENT 'The case status description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CASE_STATUS_AK` ON `DIMENSION_CASE_STATUS` (`CASE_STATUS_ID`,`CASE_STATUS_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CASE_STATUS_PK` ON `DIMENSION_CASE_STATUS` (`CASE_STATUS_SK`)
;

ALTER TABLE `DIMENSION_CASE_STATUS` ADD  PRIMARY KEY (`CASE_STATUS_SK`)
;

-- Table DIMENSION_CHARTFIELD

CREATE TABLE `DIMENSION_CHARTFIELD`
(
  `CHARTFIELD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The chartfield surrogate key.',
  `CHARTFIELD_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system chartfield SETID.  This column is often used as part of the unique identifer.',
  `CHARTFIELD_ID` Varchar(36)
 COMMENT 'The chartfield identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a chartfield in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CHARTFIELD_TYPE_NAME` Varchar(60)
 COMMENT 'The chartfield type name.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The chartfield effective date.',
  `CHARTFIELD_NAME` Varchar(60)
 COMMENT 'The chartfield name.',
  `CHARTFIELD_DESC` Varchar(255)
 COMMENT 'The chartfield description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The expansion chartfield dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CHARTFIELD_AK` ON `DIMENSION_CHARTFIELD` (`CHARTFIELD_ID`,`CHARTFIELD_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CHARTFIELD_PK` ON `DIMENSION_CHARTFIELD` (`CHARTFIELD_SK`)
;

ALTER TABLE `DIMENSION_CHARTFIELD` ADD  PRIMARY KEY (`CHARTFIELD_SK`)
;

-- Table DIMENSION_CLASSIFICATION

CREATE TABLE `DIMENSION_CLASSIFICATION`
(
  `CLASSIFICATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The classification surrogate key.',
  `CLASSIFICATION_ID` Varchar(36) NOT NULL
 COMMENT 'The classification identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a classification in the source.',
  `CLASSIFICATION_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system classification SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The class effective date.',
  `CLASSIFICATION_NAME` Varchar(60)
 COMMENT 'The classification name.',
  `CLASSIFICATION_DESC` Varchar(255)
 COMMENT 'The classification description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The classification dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CLASSIFICATION_AK` ON `DIMENSION_CLASSIFICATION` (`CLASSIFICATION_ID`,`CLASSIFICATION_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CLASS_PK` ON `DIMENSION_CLASSIFICATION` (`CLASSIFICATION_SK`)
;

ALTER TABLE `DIMENSION_CLASSIFICATION` ADD  PRIMARY KEY (`CLASSIFICATION_SK`)
;

ALTER TABLE `DIMENSION_CLASSIFICATION` ADD UNIQUE `PK_DIMENSION_CLASSIFICATION` (`CLASSIFICATION_SK`)
;

-- Table DIMENSION_COMPANY

CREATE TABLE `DIMENSION_COMPANY`
(
  `COMPANY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The company surrogate key.',
  `COMPANY_ID` Varchar(36) NOT NULL
 COMMENT 'The company identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `COMPANY_NAME` Varchar(60)
 COMMENT 'The company name.',
  `COMPANY_DESC` Varchar(255)
 COMMENT 'The company description.',
  `COMPANY_ALT_DESC` Varchar(255)
 COMMENT 'The company alternate description.',
  `COMPANY_STATUS_CODE` Varchar(32)
 COMMENT 'The company status code.',
  `COMPANY_STATUS_DESC` Varchar(40)
 COMMENT 'The company status description.',
  `COMPANY_STATUS_DATE` Timestamp NULL
 COMMENT 'The effective date for the company status.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(32)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(32)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `INDUSTRY_CODE` Varchar(32)
 COMMENT 'The industry code.',
  `INDUSTRY_NAME` Varchar(60)
 COMMENT 'The industry name.',
  `INDUSTRY_DESC` Varchar(255)
 COMMENT 'The industry description.',
  `INDUSTRY_SECTOR_CODE` Varchar(32)
 COMMENT 'The industry sector code.',
  `INDUSTRY_SECTOR_NAME` Varchar(60)
 COMMENT 'The industry sector name.',
  `INDUSTRY_SECTOR_DESC` Varchar(255)
 COMMENT 'The industry sector description.',
  `LEGAL_TYPE_CODE` Varchar(32)
 COMMENT 'The legal entity type code.',
  `LEGAL_TYPE_NAME` Varchar(60)
 COMMENT 'The legal entity type name.',
  `LEGAL_TYPE_DESC` Varchar(255)
 COMMENT 'The legal entity type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The company dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_COMPANY_AK` ON `DIMENSION_COMPANY` (`COMPANY_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_COMPANY_PK` ON `DIMENSION_COMPANY` (`COMPANY_SK`)
;

ALTER TABLE `DIMENSION_COMPANY` ADD  PRIMARY KEY (`COMPANY_SK`)
;

-- Table DIMENSION_COMPANY_PAYGROUP

CREATE TABLE `DIMENSION_COMPANY_PAYGROUP`
(
  `PAYGROUP_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The company paygroup surrogate key.',
  `COMPANY_ID` Varchar(36) NOT NULL
 COMMENT 'The company paygroup identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company paygroup in the source.',
  `PAYGROUP_ID` Varchar(36) NOT NULL
 COMMENT 'The paygroup identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a paygroup in the source',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PAYGROUP_STATUS_DATE` Timestamp NULL
 COMMENT 'The paygroup status effective date.',
  `PAYGROUP_STATUS_CODE` Varchar(32)
 COMMENT 'The paygroup status code.',
  `PAYGROUP_NAME` Varchar(60)
 COMMENT 'The paygroup name.',
  `PAYGROUP_DESC` Varchar(255)
 COMMENT 'The paygroup description.',
  `PAY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The pay frequency code.',
  `PAY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The pay frequency name.',
  `PAY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The pay frequency description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The company pay group dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_COMPANY_PAYGROU_AK` ON `DIMENSION_COMPANY_PAYGROUP` (`COMPANY_ID`,`PAYGROUP_ID`,`PAYGROUP_STATUS_DATE`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_COMPANY_PAYGROU_PK` ON `DIMENSION_COMPANY_PAYGROUP` (`PAYGROUP_SK`)
;

ALTER TABLE `DIMENSION_COMPANY_PAYGROUP` ADD  PRIMARY KEY (`PAYGROUP_SK`)
;

-- Table DIMENSION_CONTRACT

CREATE TABLE `DIMENSION_CONTRACT`
(
  `CONTRACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The contract surrogate key.',
  `CONTRACT_ID` Varchar(36) NOT NULL
 COMMENT 'The contract identifier (number) in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a contract in the source.',
  `CONTRACT_SETID` Varchar(32) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system contract SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CONTRACT_NAME` Varchar(60)
 COMMENT 'The contract name.',
  `CONTRACT_DESC` Varchar(255)
 COMMENT 'The contract description.',
  `CONTRACT_TYPE_ID` Varchar(36)
 COMMENT 'The source system contract identifier.',
  `CONTRACT_TYPE_NAME` Varchar(60)
 COMMENT 'The contract type name.',
  `CONTRACT_TYPE_DESC` Varchar(255)
 COMMENT 'The contract type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1)
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The contract dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CONTRACT_AK` ON `DIMENSION_CONTRACT` (`CONTRACT_ID`,`CONTRACT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CONTRACT_PK` ON `DIMENSION_CONTRACT` (`CONTRACT_SK`)
;

ALTER TABLE `DIMENSION_CONTRACT` ADD  PRIMARY KEY (`CONTRACT_SK`)
;

ALTER TABLE `DIMENSION_CONTRACT` ADD UNIQUE `PK_DIMENSION_CONTRACT` (`CONTRACT_SK`)
;

-- Table DIMENSION_COST_CENTER

CREATE TABLE `DIMENSION_COST_CENTER`
(
  `COST_CENTER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The cost center surrogate key.',
  `COST_CENTER_ID` Varchar(36)
 COMMENT 'The cost center identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a cost center in the source.',
  `COST_CENTER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system cost center SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `COST_CENTER_NAME` Varchar(60)
 COMMENT 'The cost center name.',
  `COST_CENTER_DESC` Varchar(255)
 COMMENT 'The cost center description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The cost center dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_COST_CENTER_PK` ON `DIMENSION_COST_CENTER` (`COST_CENTER_SK`)
;

ALTER TABLE `DIMENSION_COST_CENTER` ADD  PRIMARY KEY (`COST_CENTER_SK`)
;

ALTER TABLE `DIMENSION_COST_CENTER` ADD UNIQUE `PK_DIMENSION_COST_CENTER` (`COST_CENTER_SK`)
;

-- Table DIMENSION_CURRENCY

CREATE TABLE `DIMENSION_CURRENCY`
(
  `CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The currency surrogate key.',
  `CURRENCY_ID` Varchar(36) NOT NULL
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CURRENCY_NAME` Varchar(60)
 COMMENT 'The currency name.',
  `CURRENCY_DESC` Varchar(255)
 COMMENT 'The currency description.',
  `DECIMAL_PLACE_QTY` Decimal(5,0)
 COMMENT 'The quantity of decimal places to the right of the separator punctuation (comma or period).  For example, USD would be 2 ($257.33).',
  `EFFECTIVE_STATUS_DATE` Datetime
 COMMENT 'The effective status date.',
  `EFFECTIVE_STATUS_CODE` Char(1)
 COMMENT 'The effective status code.',
  `EFFECTIVE_STATUS_NAME` Varchar(60)
 COMMENT 'The effective status name.',
  `CURRENCY_SYMBOL_CODE` Varchar(36) CHARACTER SET utf8
 COMMENT 'The currency symbol code.',
  `CURRENCY_SYMBOL_SIDE_IND` Char(1)
 COMMENT 'This denotes if the currency symbol is displayed on either the left L or right R side of the currency value.  For example, the USD symbol would be to the left $257.33, while the PLN symbol would be to the right 257.33zl.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The currency dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CURRENCY_AK` ON `DIMENSION_CURRENCY` (`CURRENCY_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CURRENCY_PK` ON `DIMENSION_CURRENCY` (`CURRENCY_SK`)
;

ALTER TABLE `DIMENSION_CURRENCY` ADD  PRIMARY KEY (`CURRENCY_SK`)
;

ALTER TABLE `DIMENSION_CURRENCY` ADD UNIQUE `PK_DIMENSION_CURRENCY` (`CURRENCY_SK`)
;

-- Table DIMENSION_CUSTOMER

CREATE TABLE `DIMENSION_CUSTOMER`
(
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.',
  `CUSTOMER_ID` Varchar(36) NOT NULL
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CUSTOMER_MASTER_SK` Int DEFAULT 0
 COMMENT 'The customer master surrogate key consolidates the same customer that may occur in several source systems.  It is utilized by customers that have this rationalization requirement.  It is independent of SCD2 surrogate keys and it is not used in intrasystem hierarchies.',
  `CUSTOMER_NAME` Varchar(60)
 COMMENT 'The customer name.  If the customer is a person, the name may be formatted FAMILY NAME, GIVEN NAME.',
  `SINCE_DATE` Datetime
 COMMENT 'The date the entity became a customer.',
  `ADD_DATE` Datetime
 COMMENT 'The date the customer was added to the source system.',
  `BIRTH_DATE` Date
 COMMENT 'The customer birth date.',
  `DEATH_DATE` Date
 COMMENT 'The customer death date.',
  `DO_NOT_CONTACT_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted.',
  `DO_NOT_EMAIL_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted via email.',
  `DO_NOT_MAIL_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted via mail.',
  `DO_NOT_CALL_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted via telephone.',
  `CUSTOMER_STATUS_CODE` Varchar(36)
 COMMENT 'The customer status code.',
  `CUSTOMER_STATUS_NAME` Varchar(60)
 COMMENT 'The customer status name.',
  `CUSTOMER_STATUS_DESC` Varchar(255)
 COMMENT 'The customer status description.',
  `CUSTOMER_STATUS_DATE` Datetime
 COMMENT 'The customer status date.',
  `GEO_CODE` Varchar(32)
 COMMENT 'The geographical code.',
  `IN_CITY_LIMIT_IND` Varchar(1)
 COMMENT 'This denotes if a customers is physically located within the city.',
  `TIMEZONE_NAME` Varchar(32)
 COMMENT 'The timezone name.',
  `LATITUDE` Decimal(7,4)
 COMMENT 'The latitude of the customer.',
  `LONGITUDE` Decimal(7,4)
 COMMENT 'The longitude of the customer.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `STATE_PROVINCE_CODE` Varchar(3)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `EMAIL_DOMAIN_DESC` Varchar(255)
 COMMENT 'The email domain.',
  `EMAIL_ADDRESS_DESC` Varchar(255)
 COMMENT 'The email address.',
  `PHONE_COUNTRY_CODE` Varchar(3)
 COMMENT 'The telephone country code.',
  `PHONE_REGION_CODE` Varchar(3)
 COMMENT 'The phone region, area, or city code.',
  `PHONE_NUMBER` Varchar(32)
 COMMENT 'The telephone number.',
  `PHONE_EXTENSION_NUMBER` Varchar(6)
 COMMENT 'The telephone extension number.',
  `SOLD_TO_IND` Varchar(1)
 COMMENT 'This denotes if a customer plays the role of sold to.',
  `SHIP_TO_IND` Varchar(1)
 COMMENT 'This denotes if a customer plays the role of ship to.',
  `BILL_TO_IND` Varchar(1)
 COMMENT 'This denotes if a customer plays the role of bill to.',
  `ALT_CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer alternate identifier.',
  `DUNS_NUMBER` Varchar(32)
 COMMENT 'The Dun & Bradstreet number.',
  `PARENT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The parent Dun & Bradstreet number.',
  `ULT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The ultimate (parent) Dun & Bradstreet number.',
  `LAST_NAME` Varchar(60)
 COMMENT 'The customer last name (when the customer is a person).',
  `FIRST_NAME` Varchar(60)
 COMMENT 'The customer first name (when the customer is a person).',
  `GENDER_CAT` Varchar(32)
 COMMENT 'The marital status category.',
  `CREDIT_RATING_CODE` Varchar(32)
 COMMENT 'The credit rating code.',
  `CREDIT_RATING_CAT` Varchar(32)
 COMMENT 'The credit rating category.',
  `CREDIT_RATING_NAME` Varchar(60)
 COMMENT 'The credit rating name.',
  `CREDIT_SCORE_QTY` Double
 COMMENT 'The credit score.',
  `CUSTOMER_TYPE_ID` Varchar(32)
 COMMENT 'The customer type identifier.',
  `CUSTOMER_TYPE_CODE` Varchar(32)
 COMMENT 'The customer type code.',
  `CUSTOMER_TYPE_NAME` Varchar(60)
 COMMENT 'The customer type name.',
  `CUSTOMER_TYPE_DESC` Varchar(255)
 COMMENT 'The customer type description.',
  `MARITAL_STATUS_CAT` Varchar(32)
 COMMENT 'The marital status category.',
  `MARITAL_STATUS_DATE` Datetime
 COMMENT 'The marital status date.',
  `CUSTOMER_GROUP_CODE` Varchar(32)
 COMMENT 'The customer group code.',
  `CUSTOMER_GROUP_NAME` Varchar(60)
 COMMENT 'The customer group name.',
  `CUSTOMER_GROUP_DESC` Varchar(255)
 COMMENT 'The customer group description.',
  `CUSTOMER_CLASS_CODE` Varchar(32)
 COMMENT 'The customer classification code.',
  `CUSTOMER_CLASS_NAME` Varchar(60)
 COMMENT 'The customer classification name.',
  `CUSTOMER_CLASS_DESC` Varchar(255)
 COMMENT 'The customer classification description.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `CUSTOMER_AMT` Decimal(26,2)
 COMMENT 'The customer amount.  This generic amount column can be used for amounts that act as a dimension attribute, rather than a fact table metric.',
  `INCOME_QTY` Decimal(26,2)
 COMMENT 'The customer annual income (currency defined by the currency identifier).',
  `CREDIT_STATUS_DATE` Datetime
 COMMENT 'The customer credit status date.',
  `CREDIT_STATUS_CODE` Varchar(36)
 COMMENT 'The customer credit status code.',
  `CREDIT_STATUS_NAME` Varchar(60)
 COMMENT 'The customer credit status name.',
  `CREDIT_STATUS_DESC` Varchar(255)
 COMMENT 'The customer credit status description.',
  `GUARANTEED_CPC_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The guaranteed cost per click (CPC) amount.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The customer dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CUSTOMER_AK` ON `DIMENSION_CUSTOMER` (`CUSTOMER_ID`,`CUSTOMER_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CUSTOMER_PK` ON `DIMENSION_CUSTOMER` (`CUSTOMER_SK`)
;

ALTER TABLE `DIMENSION_CUSTOMER` ADD  PRIMARY KEY (`CUSTOMER_SK`)
;

ALTER TABLE `DIMENSION_CUSTOMER` ADD UNIQUE `PK_DIMENSION_CUSTOMER` (`CUSTOMER_SK`)
;

-- Table DIMENSION_CUSTOMER_CONTACT

CREATE TABLE `DIMENSION_CUSTOMER_CONTACT`
(
  `CUSTOMER_CONTACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The customer contact surrogate key.',
  `CUSTOMER_CONTACT_ID` Varchar(36) NOT NULL
 COMMENT 'The customer contact identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer contact in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CUSTOMER_CONTACT_NAME` Varchar(60)
 COMMENT 'The customer contact name (GIVEN + FAMILY).',
  `CUSTOMER_SK` Int DEFAULT 0
 COMMENT 'The customer surrogate key.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_ID` Varchar(36) NOT NULL
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The customer contact dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_CUSTOMER_CONTAC_AK` ON `DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_ID`,`CUSTOMER_ID`,`CUSTOMER_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_CUSTOMER_CONTAC_PK` ON `DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_SK`)
;

ALTER TABLE `DIMENSION_CUSTOMER_CONTACT` ADD  PRIMARY KEY (`CUSTOMER_CONTACT_SK`)
;

ALTER TABLE `DIMENSION_CUSTOMER_CONTACT` ADD UNIQUE `PK_DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_SK`)
;

-- Table DIMENSION_DAY

CREATE TABLE `DIMENSION_DAY`
(
  `DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The day surrogate key.  This smart key is loaded with the date value in the format YYYYMMDD.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It may be used in combination with other identifiers to uniquely identify a dimension in the source system.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DAY_DATE` Date NOT NULL
 COMMENT 'The date (date datatype).',
  `DAY_NAME` Varchar(60)
 COMMENT 'The name of the day, e.g., Monday.',
  `DAY_DESC` Varchar(32)
 COMMENT 'The date string in the format DD-MM-YYYY.',
  `MONTH_SK` Int DEFAULT 0
 COMMENT 'The month surrogate key.  Relates to the month dimension (if needed for aggregate fact tables).',
  `MONTH_NUMBER` Int
 COMMENT 'The month number (1-12).',
  `MONTH_NAME` Varchar(60)
 COMMENT 'The month name, e.g. January.',
  `QUARTER_SK` Int
 COMMENT 'The quarter surrogate key.  Relates to the quarter dimension (if needed for aggregate fact tables).',
  `QUARTER_NUMBER` Int
 COMMENT 'The quarter number (1-4).',
  `QUARTER_NAME` Varchar(60)
 COMMENT 'The quarter name, e.g., Q1.',
  `DAY_OF_WEEK_NUMBER` Int
 COMMENT 'The day of the week number (1-7).',
  `DAY_OF_MONTH_NUMBER` Int
 COMMENT 'The day of month number (1-31).',
  `DAYS_IN_MONTH_QTY` Int
 COMMENT 'The number of days in a given month.',
  `DAY_OF_YEAR_NUMBER` Int
 COMMENT 'The day of year number (1-366).',
  `WEEK_OF_MONTH_NUMBER` Int
 COMMENT 'The week of month number (1-5).',
  `WEEK_OF_QUARTER_NUMBER` Int
 COMMENT 'The week of quarter number.',
  `WEEK_OF_YEAR_NUMBER` Int
 COMMENT 'The week of year number (1-52).',
  `WEEKEND_IND` Char(1)
 COMMENT 'This denotes if a day is a weekend (generally Saturday and Sunday).',
  `WEEK_OF_MONTH_NAME` Varchar(60)
 COMMENT 'The week of month name, e.g., W1.',
  `YEAR_QUARTER_NAME` Varchar(60)
 COMMENT 'The year quarter name, e.g., 2006Q1.',
  `WEEK_SK` Int DEFAULT 0
 COMMENT 'The calendar week surrogate key.  This relates to the week dimension (if needed for aggregate fact tables).',
  `WEEK_NAME` Varchar(60)
 COMMENT 'The week name.  For example, 1998W45.  Note:  this assumes week starts on Sunday.',
  `WEEK_DESC` Varchar(255)
 COMMENT 'The week description.  For example, Week of September 3, 2006.  Note:  this assumes week starts on Sunday.',
  `YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'This column is defined as a varchar datatype to allow for proper Mondrian drill-through formatting.',
  `DAY_OF_WEEK_SORT_NAME` Varchar(60) NOT NULL
 COMMENT 'The day of week sort name used to overcome ordinal column issues in Mondrian.  Example format, Day 1 - Day 7.',
  `YEAR_SK` Int
 COMMENT 'The year surrogate key.  Relates to the year dimension (if needed for aggregate fact tables).',
  `YEAR_NUMBER` Int
 COMMENT 'The year number.',
  `FISCAL_PERIOD_ID` Varchar(36)
 COMMENT 'The fiscal period identifier in the source system.',
  `FISCAL_PERIOD_NUMBER` Int
 COMMENT 'The fiscal year period number.',
  `FISCAL_PERIOD_NAME` Varchar(60)
 COMMENT 'The fiscal period name.',
  `FISCAL_QUARTER_SK` Int
 COMMENT 'The fiscal quarter surrogate key.',
  `FISCAL_QUARTER_NUMBER` Int
 COMMENT 'The fiscal quarter number.',
  `FISCAL_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal quarter name.',
  `DAY_OF_FISCAL_PERIOD_NUMBER` Int
 COMMENT 'The fiscal period day number.',
  `DAY_OF_FISCAL_PERIOD_QTY` Int
 COMMENT 'The fiscal period day quantity.',
  `DAY_OF_FISCAL_YEAR_NUMBER` Int
 COMMENT 'The number of days in the fiscal year.',
  `WEEK_OF_FISCAL_PERIOD_NUMBER` Int
 COMMENT 'The fiscal period week number.',
  `WEEK_OF_FISCAL_QUARTER_NUMBER` Int
 COMMENT 'The fiscal week quarter number.',
  `WEEK_OF_FISCAL_YEAR_NUMBER` Int
 COMMENT 'The week of fiscal year number.',
  `WEEK_OF_FISCAL_PERIOD_NAME` Varchar(60)
 COMMENT 'The week of fiscal period name.',
  `FISCAL_YEAR_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal year quarter name.',
  `FISCAL_YEAR_SK` Int DEFAULT 0
 COMMENT 'The fiscal year surrogate key.',
  `FISCAL_YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'The fiscal year sort number.',
  `FISCAL_YEAR_NUMBER` Int
 COMMENT 'The fiscal year number.',
  `FISCAL_YEAR_NAME` Varchar(60)
 COMMENT 'The fiscal year name, e.g., FY2007.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The day (date) dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_DAY_AK` ON `DIMENSION_DAY` (`DAY_DATE`,`BUSINESS_UNIT_ID`)
;

CREATE UNIQUE INDEX `DIMENSION_DAY_PK` ON `DIMENSION_DAY` (`DATE_SK`)
;

CREATE INDEX `DIMENSION_DAY_SOURCE_FK` USING BTREE ON `DIMENSION_DAY` (`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_DAY` ADD  PRIMARY KEY (`DATE_SK`)
;

-- Table DIMENSION_WEEK

CREATE TABLE `DIMENSION_WEEK`
(
  `WEEK_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The calendar week surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WEEK_OF_YEAR_NUMBER` Int
 COMMENT 'The week of year number (1-52).',
  `WEEK_NAME` Varchar(60)
 COMMENT 'The week name.  For example, 1998W45.  Note:  this assumes week starts on Sunday.',
  `WEEK_DESC` Varchar(255)
 COMMENT 'The week description.  For example, Week of September 3, 2006.  Note:  this assumes week starts on Sunday.',
  `DAY_OF_WEEK_SORT_NAME` Varchar(60)
 COMMENT 'The day of week sort name used to overcome ordinal column issues in Mondrian.  Example format, Day 1 - Day 7.',
  `YEAR_SK` Int
 COMMENT 'The year surrogate key.  Relates to the year dimension (if needed for aggregate fact tables).',
  `YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'This column is defined as a varchar datatype to allow for proper Mondrian drill-through formatting.',
  `YEAR_NUMBER` Int
 COMMENT 'The year number.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The calender week dimension.'
;

ALTER TABLE `DIMENSION_WEEK` ADD  PRIMARY KEY (`WEEK_SK`)
;

-- Table DIMENSION_DEPARTMENT

CREATE TABLE `DIMENSION_DEPARTMENT`
(
  `DEPARTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The department surrogate key.',
  `DEPARTMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_STATUS_DATE` Timestamp NULL
 COMMENT 'The effective status date.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `EFFECTIVE_STATUS_NAME` Varchar(60)
 COMMENT 'The effective status name.',
  `EFFECTIVE_STATUS_DESC` Varchar(255)
 COMMENT 'The effective status description.',
  `DEPARTMENT_NAME` Varchar(60)
 COMMENT 'The department name.',
  `DEPARTMENT_DESC` Varchar(255)
 COMMENT 'The department description.',
  `MANAGER_ID` Varchar(36)
 COMMENT 'The department manager identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department manager in the source.',
  `MANAGER_NAME` Varchar(60)
 COMMENT 'The department manager name.',
  `BUDGET_LEVEL_CODE` Varchar(32)
 COMMENT 'The budget level code.',
  `BUDGET_LEVEL_NAME` Varchar(60)
 COMMENT 'The budget level name.',
  `BUDGET_LEVEL_DESC` Varchar(255)
 COMMENT 'The budget level description.',
  `PARENT_DEPARTMENT_ID` Varchar(36)
 COMMENT 'The parent department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a parent department in the source.',
  `PARENT_DEPARTMENT_NAME` Varchar(60)
 COMMENT 'The parent department name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The department dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_DEPARTMENT_AK` ON `DIMENSION_DEPARTMENT` (`DEPARTMENT_ID`,`DEPARTMENT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_DEPARTMENT_PK` ON `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`)
;

ALTER TABLE `DIMENSION_DEPARTMENT` ADD  PRIMARY KEY (`DEPARTMENT_SK`)
;

ALTER TABLE `DIMENSION_DEPARTMENT` ADD UNIQUE `PK_DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`)
;

-- Table DIMENSION_DOCUMENT_TYPE

CREATE TABLE `DIMENSION_DOCUMENT_TYPE`
(
  `DOCUMENT_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The document type surrogate key.',
  `DOCUMENT_TYPE_ID` Varchar(36)
 COMMENT 'The document type identifier in the source system.',
  `DOCUMENT_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system document type SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `DOCUMENT_TYPE_CATEGROY` Varchar(60)
 COMMENT 'The document type category.',
  `DOCUMENT_TYPE_NAME` Varchar(60)
 COMMENT 'The document type name.',
  `DOCUMENT_TYPE_DESC` Varchar(255)
 COMMENT 'The document type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The document type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_DOCUMENT_TYPE_AK` ON `DIMENSION_DOCUMENT_TYPE` (`DOCUMENT_TYPE_ID`,`DOCUMENT_TYPE_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_DOCUMENT_TYPE_PK` ON `DIMENSION_DOCUMENT_TYPE` (`DOCUMENT_TYPE_SK`)
;

ALTER TABLE `DIMENSION_DOCUMENT_TYPE` ADD  PRIMARY KEY (`DOCUMENT_TYPE_SK`)
;

ALTER TABLE `DIMENSION_DOCUMENT_TYPE` ADD UNIQUE `PK_DIMENSION_DOCUMENT_TYPE` (`DOCUMENT_TYPE_SK`)
;

-- Table DIMENSION_EMPLOYEE_JOB_ACTION

CREATE TABLE `DIMENSION_EMPLOYEE_JOB_ACTION`
(
  `EMPLOYEE_JOB_ACTION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The employee job action surrogate key.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee identifier in the source system.',
  `JOB_ACTION_ID` Varchar(36)
 COMMENT 'The job action identifier in the source system.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The job action effective date.',
  `EFFECTIVE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The job action effective date surrogate key.  This relates to the day dimension.',
  `JOB_ACTION_SEQUENCE_ID` Int DEFAULT 0
 COMMENT 'The job action sequence identifier (number) in the source system.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `JOB_ACTION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The job action surrogate key.  This relates to the job action dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `COMPANY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The company surrogate key.  This relates to the company dimension.',
  `DEPARTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The department surrogate key.  This relates to the department dimension.',
  `JOBCODE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The jobcode surrogate key.  This relates to the jobcode dimension.',
  `POSITION_SK` Int DEFAULT 0
 COMMENT 'The position surrogate key.  This relates to the position dimension.',
  `MANAGER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The manager surrogate key.  This relates to the person dimension.',
  `LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The location surrogate key.  This relates to the location dimension.',
  `EMPLOYEE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The employee surrogate key.  This relates to the person dimension.',
  `SALARY_PLAN_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The salary plan surrogate key.  This relates to the salary plan dimension.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.  This relates to the account dimension.',
  `FUND_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The fund surrogate key.  This relates to the fund dimension.',
  `CLASSIFICATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The class surrogate key.  This relates to the class dimension.',
  `PAYGROUP_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The company paygroup surrogate key.  This relates to the company paygroup dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `OPERATING_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The operating unit surrogate key.  This relates to the operating unit dimension.',
  `CONTRACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The contract surrogate key.  This relates to the contract dimension.',
  `CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The currency surrogate key.  This relates to the currency dimension.',
  `JOB_ACTION_DATE` Timestamp NULL
 COMMENT 'The job action date.',
  `JOB_ACTION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The job action date surrogate key.  This relates to the day dimension.',
  `EXPIRATION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The job action expiration date surrogate key.',
  `DEPARTMENT_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The department start date surrogate key.  This relates to the day dimension.',
  `GRADE_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The grade start date surrogate key.  This relates to the day dimension.',
  `JOB_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The job start date surrogate key.  This relates to the day dimension.',
  `JOB_STOP_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The job stop date surrogate key.  This relates to the day dimension.',
  `POSITION_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The position start date surrogate key.  This relates to the day dimension.',
  `STEP_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The step start date surrogate key.  This relates to the day dimension.',
  `HIRE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The hire date surrogate key.  This relates to the day dimension.',
  `ASSIGNMENT_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The assigment start date surrogate key.  This relates to the day dimension.',
  `ASSIGNMENT_STOP_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The assigment stop date surrogate key.  This relates to the day dimension.',
  `STANDARD_HOURS_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The standard hours frequency code.',
  `STANDARD_HOURS_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The standard hours frequency description.',
  `COMPENSATION_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The compensation frequency code.',
  `COMPENSATION_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The compensation frequency description.',
  `LABOR_AGREEMENT_CODE` Varchar(32)
 COMMENT 'The labor agreement code.',
  `LABOR_AGREEMENT_DESC` Varchar(255)
 COMMENT 'The labor agreement description.',
  `EMPLOYEE_CLASS_CODE` Varchar(32)
 COMMENT 'The employee class code.',
  `EMPLOYEE_CLASS_DESC` Varchar(255)
 COMMENT 'The employee class description.',
  `BENEFIT_STATUS_CODE` Varchar(32)
 COMMENT 'The benefit status code.',
  `BENEFIT_STATUS_DESC` Varchar(255)
 COMMENT 'The benefit status description.',
  `BENEFIT_SOURCE_CODE` Varchar(32)
 COMMENT 'The benefit source code.',
  `BENEFIT_SOURCE_DESC` Varchar(255)
 COMMENT 'The benefit source description.',
  `EARNINGS_DISTRIBUTION_CODE` Varchar(32)
 COMMENT 'The earnings distribution code.',
  `EARNINGS_DISTRIBUTION_DESC` Varchar(255)
 COMMENT 'The earnings distribution description.',
  `EMPLOYEE_STATUS_CODE` Varchar(32)
 COMMENT 'The employee status code.',
  `EMPLOYEE_STATUS_DESC` Varchar(255)
 COMMENT 'The employee status description.',
  `EMPLOYEE_TYPE_CODE` Varchar(32)
 COMMENT 'The employee type code.',
  `EMPLOYEE_TYPE_DESC` Varchar(255)
 COMMENT 'The employee type description.',
  `FULL_PART_TIME_CODE` Varchar(32)
 COMMENT 'The full/part time code.',
  `FULL_PART_TIME_DESC` Varchar(255)
 COMMENT 'The full/part time description.',
  `HR_STATUS_CODE` Varchar(32)
 COMMENT 'The human resource status code.',
  `HR_STATUS_DESC` Varchar(255)
 COMMENT 'The human resource status description.',
  `JOB_INDICATOR_CODE` Varchar(32)
 COMMENT 'The job indicator code.',
  `JOB_INDICATOR_DESC` Varchar(255)
 COMMENT 'The job indicator description.',
  `REGULAR_TEMPORARY_CODE` Varchar(32)
 COMMENT 'The regular temporary indicator.',
  `REGULAR_TEMPORARY_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `JOB_SHIFT_CODE` Varchar(32)
 COMMENT 'The job shift code.',
  `JOB_SHIFT_DESC` Varchar(255)
 COMMENT 'The job shift description.',
  `PAY_TYPE_CODE` Varchar(32)
 COMMENT 'The pay type code.',
  `PAY_TYPE_DESC` Varchar(255)
 COMMENT 'The pay type description.',
  `FTE_EQUIVALENT_QTY` Decimal(9,6) DEFAULT 0
 COMMENT 'The full time equivalent (FTE) quantity.',
  `ANNUAL_RATE` Decimal(21,6) DEFAULT 0
 COMMENT 'The annual rate.',
  `ANNUAL_BENEFIT_BASE_RATE` Decimal(21,6) DEFAULT 0
 COMMENT 'The annual benefit base rate.',
  `CHANGE_AMT` Decimal(18,6)
 COMMENT 'The change amount.',
  `CHANGE_PCT` Decimal(6,3) DEFAULT 0
 COMMENT 'The change percent.',
  `COMPENSATION_RATE` Decimal(18,6) DEFAULT 0
 COMMENT 'The compensation rate.',
  `HOURLY_RATE` Decimal(18,6) DEFAULT 0
 COMMENT 'The hourly rate.',
  `DAILY_RATE` Decimal(18,3) DEFAULT 0
 COMMENT 'The daily rate.',
  `MONTHLY_RATE` Decimal(21,6) DEFAULT 0
 COMMENT 'The monthly rate.',
  `SHIFT_RATE` Decimal(18,6) DEFAULT 0
 COMMENT 'The shift rate.',
  `SHIFT_FACTOR_QTY` Decimal(4,3) DEFAULT 0
 COMMENT 'The shift factor quantity.',
  `WORK_DAY_HOURS_QTY` Decimal(6,2) DEFAULT 0
 COMMENT 'The quantity of hours in a work day.',
  `WORK_WEEK_HOURS_QTY` Decimal(6,2) DEFAULT 0
 COMMENT 'The quantity of hours in a work week.',
  `JOB_DURATION_DAY_QTY` Double DEFAULT 0
 COMMENT 'The quantity of days in a job.',
  `JOB_ACTION_REASON_ID` Varchar(36)
 COMMENT 'The job action reason identifier in the source system.',
  `LATEST_ACTION_IND` Char(1)
 COMMENT 'This indicator denotes if the the job action is the latest job action for an employee.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The employee job action dimension.  A detailed employee profile + the latest job action transaction.  Although labled a dimension (due to high numbers of text columns), this plays the role of a base grain fact table.  Accordingly, a series of aggregate fact tables associated with counts may be needed.'
;

CREATE UNIQUE INDEX `DIMENSION_EMPLOYEE_JOB_AC_AK` ON `DIMENSION_EMPLOYEE_JOB_ACTION` (`EMPLOYEE_ID`,`JOB_ACTION_ID`,`EFFECTIVE_DATE`,`BUSINESS_UNIT_SK`,`JOB_ACTION_SEQUENCE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_EMPLOYEE_JOB_AC_PK` ON `DIMENSION_EMPLOYEE_JOB_ACTION` (`EMPLOYEE_JOB_ACTION_SK`)
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD  PRIMARY KEY (`EMPLOYEE_JOB_ACTION_SK`)
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD UNIQUE `PK_DIMENSION_EMPLOYEE_JOB_ACTION` (`EMPLOYEE_JOB_ACTION_SK`)
;

-- Table DIMENSION_FISCAL_PERIOD

CREATE TABLE `DIMENSION_FISCAL_PERIOD`
(
  `FISCAL_PERIOD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The fiscal period surrogate key.',
  `FISCAL_PERIOD_ID` Varchar(36)
 COMMENT 'This fiscal period in the source system.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It may be used in combination with other identifiers to uniquely identify a dimension in the source system.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `FISCAL_PERIOD_NUMBER` Int
 COMMENT 'The fiscal year period number.',
  `FISCAL_PERIOD_NAME` Varchar(60)
 COMMENT 'The fiscal period name.',
  `FISCAL_QUARTER_SK` Int DEFAULT 0
 COMMENT 'The fiscal quarter surrogate key.',
  `FISCAL_QUARTER_NUMBER` Int
 COMMENT 'The fiscal quarter number.',
  `FISCAL_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal quarter name.',
  `FISCAL_YEAR_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal year quarter name.',
  `FISCAL_YEAR_SK` Int DEFAULT 0
 COMMENT 'The fiscal year surrogate key.',
  `FISCAL_YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'The fiscal year sort number.',
  `FISCAL_YEAR_NUMBER` Int
 COMMENT 'The fiscal year number.',
  `FISCAL_YEAR_NAME` Varchar(60)
 COMMENT 'The fiscal year name, e.g., FY2007.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The fiscal period dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_FISCAL_PERIOD_PK` ON `DIMENSION_FISCAL_PERIOD` (`FISCAL_PERIOD_SK`)
;

ALTER TABLE `DIMENSION_FISCAL_PERIOD` ADD  PRIMARY KEY (`FISCAL_PERIOD_SK`)
;

ALTER TABLE `DIMENSION_FISCAL_PERIOD` ADD UNIQUE `PK_DIMENSION_FISCAL_PERIOD` (`FISCAL_PERIOD_SK`)
;

-- Table DIMENSION_FUND

CREATE TABLE `DIMENSION_FUND`
(
  `FUND_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The fund surrogate key.',
  `FUND_ID` Varchar(36) NOT NULL
 COMMENT 'The fund identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a fund in the source.',
  `FUND_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system fund SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The fund effective date.',
  `FUND_NAME` Varchar(60)
 COMMENT 'The fund name.',
  `FUND_DESC` Varchar(255)
 COMMENT 'The fund description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The fund dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_FUND_AK` ON `DIMENSION_FUND` (`FUND_ID`,`FUND_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_FUND_AK` ON `DIMENSION_FUND` (`FUND_ID`,`FUND_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_FUND_PK` ON `DIMENSION_FUND` (`FUND_SK`)
;

ALTER TABLE `DIMENSION_FUND` ADD  PRIMARY KEY (`FUND_SK`)
;

ALTER TABLE `DIMENSION_FUND` ADD UNIQUE `PK_DIMENSION_FUND` (`FUND_SK`)
;

-- Table DIMENSION_GEOGRAPHIC_LOCATION

CREATE TABLE `DIMENSION_GEOGRAPHIC_LOCATION`
(
  `GEO_LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The geographic location surrogate key.',
  `GEO_LOCATION_ID` Int NOT NULL DEFAULT 0
 COMMENT 'The geographic location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a geographic location in the source.  Note:  this identiifier is reused by MaxMind.  This means that identifier ID 1 may point to a location in China in one file, but in a subsequent file it may point to Brazil.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `ISO_3166_COUNTRY_CODE` Varchar(32) DEFAULT '-'
 COMMENT 'The ISO 3166 country code.',
  `ISO_3166_COUNTRY_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The ISO 3166 country name.',
  `ISO_3166_2_REGION_CODE` Varchar(32) DEFAULT '-'
 COMMENT 'The ISO 3166-2 region code.',
  `ISO_3166_2_REGION_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The ISO 3166-2 region name.',
  `FIPS_10_4_REGION_CODE` Varchar(32) DEFAULT '-'
 COMMENT 'The FIPS 10-4 region code.',
  `FIPS_10_4_REGION_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The FIPS 10-4 region name.',
  `CITY_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The city name.',
  `POSTAL_CODE` Varchar(32) DEFAULT 'Missing'
 COMMENT 'This postal code.',
  `REGION_CODE` Varchar(32)
 COMMENT 'The region name.  If the geographic location is the United States or Canada, this is the ISO 3166-2 region code, otherwise it is the FIPS 10-4 region code.',
  `REGION_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The region name.  If the geographic location is the United States or Canada, this is the ISO 3166-2 region name, otherwise it is the FIPS 10-4 region name.',
  `DMA_CODE` Smallint DEFAULT 0
 COMMENT 'The designated marketing area (DMA) code.',
  `DMA_NAME` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The designated marketing area (DMA) name.',
  `PHONE_REGION_CODE` Smallint DEFAULT 0
 COMMENT 'The telephone region code.',
  `LATITUDE_NUMBER` Decimal(7,4)
 COMMENT 'The latitude number for the city.',
  `LONGITUDE_NUMBER` Decimal(7,4)
 COMMENT 'The longitude number for the city.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The geographic location dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_GEO_LOCATION_PK` ON `DIMENSION_GEOGRAPHIC_LOCATION` (`GEO_LOCATION_SK`)
;

CREATE INDEX `DIMENSION_GEO_LOC_I` ON `DIMENSION_GEOGRAPHIC_LOCATION` (`REGION_NAME`,`ISO_3166_COUNTRY_CODE`)
;

CREATE INDEX `DIMENSION_GEOGRAPHIC_LOC_AK` ON `DIMENSION_GEOGRAPHIC_LOCATION` (`LONGITUDE_NUMBER`,`LATITUDE_NUMBER`)
;

ALTER TABLE `DIMENSION_GEOGRAPHIC_LOCATION` ADD  PRIMARY KEY (`GEO_LOCATION_SK`)
;

ALTER TABLE `DIMENSION_GEOGRAPHIC_LOCATION` ADD UNIQUE `PK_DIMENSION_GEOGRAPHIC_LOCATION` (`GEO_LOCATION_SK`)
;

-- Table DIMENSION_GL_ADJUSTMENT

CREATE TABLE `DIMENSION_GL_ADJUSTMENT`
(
  `GL_ADJUSTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The general ledger adjustment surrogate key.',
  `GL_ADJUSTMENT_ID` Varchar(36)
 COMMENT 'The general ledger adjustment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies a general ledger adjustment in the source.',
  `GL_ADJUSTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system general ledger adjustment SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The general ledger adjustment effective date.',
  `GL_ADJUSTMENT_NAME` Varchar(60)
 COMMENT 'The general ledger adjustment name.',
  `GL_ADJUSTMENT_DESC` Varchar(255)
 COMMENT 'The general ledger adjustment description',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The general ledger adjustment dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_GL_ADJUSTMENT_AK` ON `DIMENSION_GL_ADJUSTMENT` (`GL_ADJUSTMENT_ID`,`GL_ADJUSTMENT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_GL_ADJUSTMENT_PK` ON `DIMENSION_GL_ADJUSTMENT` (`GL_ADJUSTMENT_SK`)
;

ALTER TABLE `DIMENSION_GL_ADJUSTMENT` ADD  PRIMARY KEY (`GL_ADJUSTMENT_SK`)
;

ALTER TABLE `DIMENSION_GL_ADJUSTMENT` ADD UNIQUE `PK_DIMENSION_GL_ADJUSTMENT` (`GL_ADJUSTMENT_SK`)
;

-- Table DIMENSION_GL_BOOK

CREATE TABLE `DIMENSION_GL_BOOK`
(
  `GL_BOOK_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The general ledger book surrogate key.',
  `GL_BOOK_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system general ledger book  SETID.  This column is often used as part of the unique identifer.',
  `GL_BOOK_ID` Varchar(36)
 COMMENT 'The general ledger book identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies a general ledger book in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The general ledger book effective date.',
  `GL_BOOK_NAME` Varchar(60)
 COMMENT 'The general ledger book name.',
  `GL_BOOK_DESC` Varchar(255)
 COMMENT 'The general ledger book description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The general ledger book dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_BOOK_CODE_AK` ON `DIMENSION_GL_BOOK` (`GL_BOOK_ID`,`GL_BOOK_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_BOOK_CODE_PK` ON `DIMENSION_GL_BOOK` (`GL_BOOK_SK`)
;

ALTER TABLE `DIMENSION_GL_BOOK` ADD  PRIMARY KEY (`GL_BOOK_SK`)
;

ALTER TABLE `DIMENSION_GL_BOOK` ADD UNIQUE `PK_DIMENSION_GL_BOOK` (`GL_BOOK_SK`)
;

-- Table DIMENSION_PRODUCT_LOT

CREATE TABLE `DIMENSION_PRODUCT_LOT`
(
  `PRODUCT_LOT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The product lot surrogate key.',
  `PRODUCT_LOT_ID` Varchar(36) NOT NULL
 COMMENT 'The product lot identifier in the source system.',
  `PRODUCT_ID` Varchar(36) NOT NULL
 COMMENT 'The product identifier in the source system.',
  `PRODUCT_LOT_SETID` Varchar(32) DEFAULT 'SHARE'
 COMMENT 'The source system product lot SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PRODUCT_LOT_NAME` Varchar(60)
 COMMENT 'The product lot name.',
  `PRODUCT_LOT_DESC` Varchar(255)
 COMMENT 'The product lot description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The product (material) lot dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PRODUCT_LOT_AK` ON `DIMENSION_PRODUCT_LOT` (`PRODUCT_LOT_ID`,`PRODUCT_LOT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PRODUCT_LOT_PK` ON `DIMENSION_PRODUCT_LOT` (`PRODUCT_LOT_SK`)
;

ALTER TABLE `DIMENSION_PRODUCT_LOT` ADD  PRIMARY KEY (`PRODUCT_LOT_SK`)
;

ALTER TABLE `DIMENSION_PRODUCT_LOT` ADD UNIQUE `PK_DIMENSION_PRODUCT_LOT` (`PRODUCT_LOT_SK`)
;

-- Table DIMENSION_JOBCODE

CREATE TABLE `DIMENSION_JOBCODE`
(
  `JOBCODE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The jobcode surrogate key.',
  `JOBCODE_ID` Varchar(36) NOT NULL
 COMMENT 'The jobcode identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a jobcode in the source.',
  `JOBCODE_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system jobcode SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `JOBCODE_NAME` Varchar(60)
 COMMENT 'The jobcode name.',
  `JOBCODE_DESC` Varchar(255)
 COMMENT 'The jobcode description.',
  `SALARY_PLAN_SK` Int DEFAULT 0
 COMMENT 'The salary plan surrogate key.  This relates to the salary plan dimension.',
  `COMPENSATION_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The compensation frequency code.',
  `COMPENSATION_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The compensation frequency name.',
  `COMPENSATION_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The compensation frequency description.',
  `JOB_ACCOUNTABILITY_PCT` Decimal(7,3)
 COMMENT 'The job accountability percent.',
  `JOB_ACCOUNTABILITY_POINTS_QTY` Double
 COMMENT 'The job accountability points quantity.',
  `JOB_FAMILY_CODE` Varchar(32)
 COMMENT 'The job family code.',
  `JOB_FAMILY_NAME` Varchar(60)
 COMMENT 'The job family name.',
  `JOB_FAMILY_DESC` Varchar(255)
 COMMENT 'The job family description.',
  `JOB_FUNCTION_CODE` Varchar(32)
 COMMENT 'The job function code.',
  `JOB_FUNCTION_NAME` Varchar(60)
 COMMENT 'The job function name.',
  `JOB_FUNCTION_DESC` Varchar(255)
 COMMENT 'The job function description.',
  `MANAGER_LEVEL_CODE` Varchar(32)
 COMMENT 'The manager level code.',
  `MANAGER_LEVEL_NAME` Varchar(60)
 COMMENT 'The manager level name.',
  `MANAGER_LEVEL_DESC` Varchar(255)
 COMMENT 'The manager level description.',
  `REGULAR_TEMP_CODE` Varchar(32)
 COMMENT 'The regular temporary code.',
  `REGULAR_TEMP_NAME` Varchar(60)
 COMMENT 'The regular temporary name.',
  `REGULAR_TEMP_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `STANDARD_HOURS_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The standard hours frequency code.',
  `LABOR_UNION_CODE` Varchar(32)
 COMMENT 'The labor union code.',
  `LABOR_UNION_NAME` Varchar(60)
 COMMENT 'The labor union name.',
  `LABOR_UNION_DESC` Varchar(255)
 COMMENT 'The labor union description.',
  `WORKERS_COMPENSATION_CODE` Varchar(32)
 COMMENT 'The workers compensation code.',
  `SALARY_SURVERY_CODE` Varchar(32)
 COMMENT 'The salary survey code.',
  `SALARY_SURVEY_NAME` Varchar(60)
 COMMENT 'The salary survey name.',
  `SALARY_SURVEY_DESC` Varchar(255)
 COMMENT 'The salary survey description.',
  `SALARY_SURVEY_CURRENCY_SK` Int DEFAULT 0
 COMMENT 'The salary survey currency surrogate key.  This relates to the currency dimension.',
  `SALARY_SURVEY_CURRENCY_ID` Varchar(36)
 COMMENT 'The salary survey currency source system identifier.',
  `SALARY_SURVEY_AMT` Double
 COMMENT 'The salary survey amount.',
  `WORKERS_COMPENSATION_NAME` Varchar(60)
 COMMENT 'The workers compensation name.',
  `WORKERS_COMPENSATION_DESC` Varchar(255)
 COMMENT 'The workers compensation description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The job code dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_JOBCODE_AK` ON `DIMENSION_JOBCODE` (`JOBCODE_ID`,`JOBCODE_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_JOBCODE_PK` ON `DIMENSION_JOBCODE` (`JOBCODE_SK`)
;

ALTER TABLE `DIMENSION_JOBCODE` ADD  PRIMARY KEY (`JOBCODE_SK`)
;

ALTER TABLE `DIMENSION_JOBCODE` ADD UNIQUE `PK_DIMENSION_JOBCODE` (`JOBCODE_SK`)
;

-- Table DIMENSION_JOB_ACTION

CREATE TABLE `DIMENSION_JOB_ACTION`
(
  `JOB_ACTION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The job action surrogate key.',
  `JOB_ACTION_ID` Varchar(36) NOT NULL
 COMMENT 'The job action identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a job action in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `JOB_ACTION_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The job action effective date.',
  `JOB_ACTION_NAME` Varchar(60)
 COMMENT 'The job action name.',
  `JOB_ACTION_DESC` Varchar(255)
 COMMENT 'The job action description.',
  `JOB_ACTION_REASON_ID` Varchar(36)
 COMMENT 'The job action reason identifier in the source system.',
  `JOB_ACTION_REASON_NAME` Varchar(60)
 COMMENT 'The job action reason name.',
  `JOB_ACTION_REASON_DESC` Varchar(255)
 COMMENT 'The job action reason description.',
  `JOB_ACTION_REASON_EFF_DATE` Timestamp NULL
 COMMENT 'The job action reason effective date.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The job action dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_JOB_ACTION_AK` ON `DIMENSION_JOB_ACTION` (`JOB_ACTION_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_JOB_ACTION_PK` ON `DIMENSION_JOB_ACTION` (`JOB_ACTION_SK`)
;

ALTER TABLE `DIMENSION_JOB_ACTION` ADD  PRIMARY KEY (`JOB_ACTION_SK`)
;

ALTER TABLE `DIMENSION_JOB_ACTION` ADD UNIQUE `PK_DIMENSION_JOB_ACTION` (`JOB_ACTION_SK`)
;

-- Table DIMENSION_KEYWORD_PHRASE

CREATE TABLE `DIMENSION_KEYWORD_PHRASE`
(
  `KEYWORD_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The keyword phrase surrogate key.',
  `KEYWORD_ID` Varchar(60)
 COMMENT 'The keyword phrase identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a keyword phrase in the source.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `KEYWORD_DESC` Varchar(255)
 COMMENT 'The keyword phrase description.',
  `KEYWORD_STATUS_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The keyword status surrogate key.  This relates to the keyword status dimension.',
  `KEYWORD_STATUS_ID` Varchar(36) DEFAULT '-'
 COMMENT 'The keyword phrase status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a keyword phrase status in the source.',
  `KEYWORD_STATUS_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The keyword phrase status name.',
  `KEYWORD_STATUS_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The keyword phrase status description.',
  `KEYWORD_STATUS_DATE` Datetime
 COMMENT 'The keyword phrase status date.',
  `KEYWORD_MATCHING_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The keyword matching surrogate key.  This relates to the keyword matching dimension.',
  `MATCHING_OPTION_ID` Varchar(36) DEFAULT '-'
 COMMENT 'The keyword phrase matching option identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a keyword phrase matching option in the source.',
  `MATCHING_OPTION_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The keyword phrase matching option name.',
  `MATCHING_OPTION_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The keyword phrase matching option description.',
  `QUALITY_SCORE_QTY` Double
 COMMENT 'The quality score quantity.',
  `DESTINATION_URL_DESC` Varchar(1024) DEFAULT 'http://www.breadboardbi.com'
 COMMENT 'The destination URL description.',
  `DEFAULT_COST_PER_CLICK_AMT` Decimal(26,2)
 COMMENT 'The default cost per click amount.',
  `TOKEN_QTY` Int UNSIGNED
 COMMENT 'The number of tokens in the keyword phrase.',
  `KEYWORD_LENGTH_QTY` Int UNSIGNED
 COMMENT 'The number of characters in the keyword phrase.',
  `KEYWORD_LENGTH_BUCKET_NAME` Varchar(60)
 COMMENT 'The keyword length bucket names.  Current values include 1 - 10, 11 - 20, 21 - 30, 31 - 40, 41 - 50, 51-60, 61+.',
  `MAX_CPC_BUCKET_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The maximum cost per click bucket name.  Current values include .01 -.10, .11- .20, .21 - .30, .31- .40, .41- 50, .51- .60, .61 - .70, .71 - .80, .81 - .90, .91 - 1.00, 1.01 - 1.25, 1.26 - 1.50, 1.51 -1.75, 1.76 - 2.00, 2.01 - 2.50, 2.51 - 3.00, 3.01+',
  `ADWORD_CAMPAIGN_IND` Varchar(1) DEFAULT 'N'
 COMMENT 'This indicator denotes if a keyword is/was associated to a paid campaign.',
  `CURRENCY_SK` Int DEFAULT 0
 COMMENT 'The currency surrogate key.  This relates to the currency dimension.',
  `MIN_CPC_AMT` Decimal(26,2)
 COMMENT 'The minimum cost per click amount.',
  `CONTENT_BID_AMT` Decimal(26,2)
 COMMENT 'The content (syndication) bid amount.',
  `MAX_CPC_AMT` Decimal(26,2)
 COMMENT 'The maximum cost per click amount.',
  `PREFERED_HIGH_RANK_QTY` Int UNSIGNED
 COMMENT 'The preferred high rank quantity.',
  `PREFERED_LOW_RANK_QTY` Int UNSIGNED
 COMMENT 'The preferred low rank quantity.',
  `ORGANIC_IND` Varchar(1)
 COMMENT 'This indicator denotes if a keyword is/was associated to an organic search.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The keyword phrase dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_KEYWORD_PHRASE_AK` ON `DIMENSION_KEYWORD_PHRASE` (`KEYWORD_ID`,`DW_START_DATE`,`HOSTED_CLIENT_SK`,`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `DIM_KEYWORD_PHRASE_CRNCY_FK` USING BTREE ON `DIMENSION_KEYWORD_PHRASE` (`CURRENCY_SK`)
;

ALTER TABLE `DIMENSION_KEYWORD_PHRASE` ADD  PRIMARY KEY (`KEYWORD_SK`)
;

-- Table DIMENSION_KEYWORD_STATUS

CREATE TABLE `DIMENSION_KEYWORD_STATUS`
(
  `KEYWORD_STATUS_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The keyword status surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `KEYWORD_STATUS_ID` Varchar(36) DEFAULT '-'
 COMMENT 'The keyword phrase status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a keyword phrase status in the source.',
  `KEYWORD_STATUS_NAME` Varchar(60) DEFAULT 'Mising'
 COMMENT 'The keyword phrase status name.',
  `KEYWORD_STATUS_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The keyword phrase status description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The keyword status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_KEYWORD_STATUS_AK` ON `DIMENSION_KEYWORD_STATUS` (`HOSTED_CLIENT_SK`,`SOURCE_SYSTEM_SK`,`KEYWORD_STATUS_ID`)
;

ALTER TABLE `DIMENSION_KEYWORD_STATUS` ADD  PRIMARY KEY (`KEYWORD_STATUS_SK`)
;

-- Table DIMENSION_KEYWORD_MATCHING

CREATE TABLE `DIMENSION_KEYWORD_MATCHING`
(
  `KEYWORD_MATCHING_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The keyword matching surrogate key.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `MATCHING_OPTION_ID` Varchar(36) DEFAULT '-'
 COMMENT 'The keyword phrase matching option identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a keyword phrase matching option in the source.',
  `MATCHING_OPTION_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The keyword phrase matching option name.',
  `MATCHING_OPTION_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The keyword phrase matching option description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The keyword matching dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_KEYWORD_MATCHING_AK` ON `DIMENSION_KEYWORD_MATCHING` (`MATCHING_OPTION_ID`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_KEYWORD_MATCHING` ADD  PRIMARY KEY (`KEYWORD_MATCHING_SK`)
;

-- Table DIMENSION_LEDGER

CREATE TABLE `DIMENSION_LEDGER`
(
  `LEDGER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The ledger surrogate key.',
  `LEDGER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system ledger SETID.  This column is often used as part of the unique identifer.',
  `LEDGER_ID` Varchar(36)
 COMMENT 'The ledger identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a ledger in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `LEDGER_NAME` Varchar(60)
 COMMENT 'The ledger name.',
  `LEDGER_GROUP_ID` Varchar(36)
 COMMENT 'The ledger group identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a ledger group in the source.',
  `LEDGER_GROUP_NAME` Varchar(60)
 COMMENT 'The ledger group name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The ledger finance dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_LEDGER_AK` ON `DIMENSION_LEDGER` (`LEDGER_ID`,`LEDGER_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_LEDGER_PK` ON `DIMENSION_LEDGER` (`LEDGER_SK`)
;

ALTER TABLE `DIMENSION_LEDGER` ADD  PRIMARY KEY (`LEDGER_SK`)
;

ALTER TABLE `DIMENSION_LEDGER` ADD UNIQUE `PK_DIMENSION_LEDGER` (`LEDGER_SK`)
;

-- Table DIMENSION_LOCATION

CREATE TABLE `DIMENSION_LOCATION`
(
  `LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The location surrogate key.',
  `LOCATION_ID` Varchar(36) NOT NULL
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a location in the source.',
  `LOCATION_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `REGULATORY_REGION_SK` Int DEFAULT 0
 COMMENT 'The regulatory region surrogate key.',
  `REGULATORY_REGION_ID` Varchar(36)
 COMMENT 'The regulatory region identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a regulatory region in the source.',
  `LOCATION_NAME` Varchar(60)
 COMMENT 'The location name.',
  `LOCATION_DESC` Varchar(255)
 COMMENT 'The location description',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The address line 1.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The address line 2.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The address line 3.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The address line 4.',
  `BUILDING_NAME` Varchar(60)
 COMMENT 'The building name.',
  `FLOOR_NUMBER` Varchar(32)
 COMMENT 'The floor number.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(32)
 COMMENT 'The state province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(32)
 COMMENT 'The country code.',
  `GEOGRAPHY_CODE` Varchar(32)
 COMMENT 'The geography code.',
  `ALT_GEOGRAPHY_CODE` Varchar(32)
 COMMENT 'The alternate geography code.',
  `JURSIDICTION_CODE` Varchar(32)
 COMMENT 'The jurisdiction code.',
  `SECTOR_NUMBER` Varchar(32)
 COMMENT 'The sector number.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The location dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_LOCATION_AK` ON `DIMENSION_LOCATION` (`LOCATION_ID`,`LOCATION_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_LOCATION_PK` ON `DIMENSION_LOCATION` (`LOCATION_SK`)
;

ALTER TABLE `DIMENSION_LOCATION` ADD  PRIMARY KEY (`LOCATION_SK`)
;

ALTER TABLE `DIMENSION_LOCATION` ADD UNIQUE `PK_DIMENSION_LOCATION` (`LOCATION_SK`)
;

-- Table DIMENSION_MARKETING_CHANNEL

CREATE TABLE `DIMENSION_MARKETING_CHANNEL`
(
  `MARKETING_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The marketing activity surrogate key.',
  `CHANNEL_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `CHANNEL_ID` Varchar(36) NOT NULL
 COMMENT 'The marekting channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a region in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `CHANNEL_NAME` Varchar(60)
 COMMENT 'The channel name.',
  `CHANNEL_DESC` Varchar(255)
 COMMENT 'The channel description.',
  `CHANNEL_TYPE_CODE` Varchar(32)
 COMMENT 'The marketing channel type.',
  `CHANNEL_TYPE_NAME` Varchar(60)
 COMMENT 'The marketing channel type name.',
  `CHANNEL_TYPE_DESC` Varchar(255)
 COMMENT 'The channel type description.',
  `CHANNEL_ACTIVITY_CODE` Varchar(32)
 COMMENT 'The channel activity code.',
  `CHANNEL_ACTIVITY_NAME` Varchar(60)
 COMMENT 'The channel activity name.',
  `CHANNEL_ACTIVITY_DESC` Varchar(255)
 COMMENT 'The channel activity description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The marketing channel dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_MARKETING_CHANN_AK` ON `DIMENSION_MARKETING_CHANNEL` (`CHANNEL_ID`,`CHANNEL_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_MARKETING_CHANN_PK` ON `DIMENSION_MARKETING_CHANNEL` (`MARKETING_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_MARKETING_CHANNEL` ADD  PRIMARY KEY (`MARKETING_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_MARKETING_CHANNEL` ADD UNIQUE `PK_DIMENSION_MARKETING_CHANNEL` (`MARKETING_CHANNEL_SK`)
;

-- Table DIMENSION_MARKETING_SEGMENT

CREATE TABLE `DIMENSION_MARKETING_SEGMENT`
(
  `MARKETING_SEGMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The marketing segment surrogate key.',
  `SEGMENT_ID` Varchar(36)
 COMMENT 'The marketing segment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign in the source.',
  `SEGMENT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SEGMENT_NAME` Varchar(60)
 COMMENT 'The marketing segment name.',
  `SEGMENT_GROUP_ID` Varchar(36)
 COMMENT 'The marketing segment group source system identifier.',
  `SEGMENT_GROUP_NAME` Varchar(60)
 COMMENT 'The marketing segment group name.',
  `SEGMENT_GROUP_DESC` Varchar(255)
 COMMENT 'The segment group description.',
  `INTERNAL_EXTERNAL_IND` Varchar(1)
 COMMENT 'This denotes an internal or external source.',
  `INTERNAL_EXTERNAL_DESC` Varchar(255)
 COMMENT 'The internal external source name.',
  `SEGMENT_LIST_SOURCE_NAME` Varchar(60)
 COMMENT 'The segment list source name.',
  `SEGMENT_LIST_DESC` Varchar(255)
 COMMENT 'The segment list description.',
  `SEGMENT_LIST_GENERATED_DATE` Timestamp NULL
 COMMENT 'The segment list generated date.',
  `SEGMENT_LIST_UPDATE_DATE` Timestamp NULL
 COMMENT 'The segment list updated date.',
  `FIXED_DYNAMIC_IND` Varchar(1)
 COMMENT 'This denotes a fixed or dymanic segment.',
  `SEGMENT_CURRENT_LIST_IND` Varchar(1)
 COMMENT 'This denotes if the segment list is current.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The marekting segment dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_MARKETING_SEGME_AK` ON `DIMENSION_MARKETING_SEGMENT` (`SEGMENT_ID`,`SEGMENT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_MARKETING_SEGME_PK` ON `DIMENSION_MARKETING_SEGMENT` (`MARKETING_SEGMENT_SK`)
;

ALTER TABLE `DIMENSION_MARKETING_SEGMENT` ADD  PRIMARY KEY (`MARKETING_SEGMENT_SK`)
;

ALTER TABLE `DIMENSION_MARKETING_SEGMENT` ADD UNIQUE `PK_DIMENSION_MARKETING_SEGMENT` (`MARKETING_SEGMENT_SK`)
;

-- Table DIMENSION_MARKETING_STATUS

CREATE TABLE `DIMENSION_MARKETING_STATUS`
(
  `MARKETING_STATUS_SK` Int NOT NULL
 COMMENT 'The marketing status surrogate key.',
  `MARKETING_STATUS_ID` Varchar(36)
 COMMENT 'The marketing status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing status in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `MARKETING_STATUS_NAME` Varchar(60)
 COMMENT 'The marekting status name.',
  `MARKETING_STATUS_DESC` Varchar(60)
 COMMENT 'The marketing status description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The marketing status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_MARKETING_STATU_AK` ON `DIMENSION_MARKETING_STATUS` (`MARKETING_STATUS_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_MARKETING_STATU_PK` ON `DIMENSION_MARKETING_STATUS` (`MARKETING_STATUS_SK`)
;

ALTER TABLE `DIMENSION_MARKETING_STATUS` ADD  PRIMARY KEY (`MARKETING_STATUS_SK`)
;

-- Table DIMENSION_MONTH

CREATE TABLE `DIMENSION_MONTH`
(
  `MONTH_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The month surrogate key.',
  `MONTH_NUMBER` Int
 COMMENT 'The month number (1-12).',
  `MONTH_NAME` Varchar(60)
 COMMENT 'The month name, e.g. January.',
  `QUARTER_SK` Int
 COMMENT 'The quarter surrogate key.  Relates to the quarter dimension.',
  `QUARTER_NUMBER` Int
 COMMENT 'The quarter number (1-4).',
  `QUARTER_NAME` Varchar(60)
 COMMENT 'The quarter name, e.g., Q1.',
  `DAYS_IN_MONTH_QTY` Int
 COMMENT 'The number of days in a given month.',
  `YEAR_QUARTER_NAME` Varchar(60)
 COMMENT 'The year quarter name, e.g., 2006Q1.',
  `YEAR_SK` Int
 COMMENT 'The year surrogate key.  Relates to the year dimension (if needed for aggregate fact tables).',
  `YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'This column is defined as a varchar datatype to allow for proper Mondrian drill-through formatting.',
  `YEAR_NUMBER` Int
 COMMENT 'The year number.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1)
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The month dimension.'
;

ALTER TABLE `DIMENSION_MONTH` ADD  PRIMARY KEY (`MONTH_SK`)
;

-- Table DIMENSION_QUARTER

CREATE TABLE `DIMENSION_QUARTER`
(
  `QUARTER_SK` Int NOT NULL
 COMMENT 'The quarter surrogate key.  Relates to the quarter dimension (if needed for aggregate fact tables).',
  `QUARTER_NUMBER` Int
 COMMENT 'The quarter number (1-4).',
  `QUARTER_NAME` Varchar(60)
 COMMENT 'The quarter name, e.g., Q1.',
  `YEAR_QUARTER_NAME` Varchar(60)
 COMMENT 'The year quarter name, e.g., 2006Q1.',
  `YEAR_SK` Int
 COMMENT 'The year surrogate key.  Relates to the year dimension (if needed for aggregate fact tables).',
  `YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'This column is defined as a varchar datatype to allow for proper Mondrian drill-through formatting.',
  `YEAR_NUMBER` Int
 COMMENT 'The year number.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1)
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The calendar quarter dimension.'
;

ALTER TABLE `DIMENSION_QUARTER` ADD  PRIMARY KEY (`QUARTER_SK`)
;

-- Table DIMENSION_YEAR

CREATE TABLE `DIMENSION_YEAR`
(
  `YEAR_SK` Int NOT NULL
 COMMENT 'The year surrogate key.',
  `YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'This column is defined as a varchar datatype to allow for proper Mondrian drill-through formatting.',
  `YEAR_NUMBER` Int
 COMMENT 'The year number.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1)
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The calendar year dimension.'
;

ALTER TABLE `DIMENSION_YEAR` ADD  PRIMARY KEY (`YEAR_SK`)
;

-- Table DIMENSION_OPERATING_UNIT

CREATE TABLE `DIMENSION_OPERATING_UNIT`
(
  `OPERATING_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The operating unit surrogate key.',
  `OPERATING_UNIT_ID` Varchar(36) NOT NULL
 COMMENT 'The operating unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an operating unit in the source.',
  `OPERATING_UNIT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system operating unit SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `OPERATING_UNIT_NAME` Varchar(60)
 COMMENT 'The operating unit name.',
  `OPERATING_UNIT_DESC` Varchar(255)
 COMMENT 'The operating unit description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The operating unit dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_OPERATING_UNIT_AK` ON `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_ID`,`OPERATING_UNIT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_OPERATING_UNIT_PK` ON `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`)
;

ALTER TABLE `DIMENSION_OPERATING_UNIT` ADD  PRIMARY KEY (`OPERATING_UNIT_SK`)
;

ALTER TABLE `DIMENSION_OPERATING_UNIT` ADD UNIQUE `PK_DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`)
;

-- Table DIMENSION_ORDER_CAPTURE

CREATE TABLE `DIMENSION_ORDER_CAPTURE`
(
  `ORDER_CAPTURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The order capture surrogate key.',
  `ORDER_CAPTURE_ID` Varchar(36)
 COMMENT 'The order (capture) source system identifier.  It is a degenerate dimenension in the order capture fact table.',
  `ORDER_CAPTURE_SETID` Varchar(32) DEFAULT 'SHARE'
 COMMENT 'The source system order SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `ORDER_CAPTURE_DESC` Varchar(255)
 COMMENT 'The order capture description.',
  `BILL_TO_TYPE_CODE` Varchar(32)
 COMMENT 'The bill to type code.',
  `SOURCE_TYPE_CODE` Varchar(32)
 COMMENT 'The source type code.',
  `SOURCE_TYPE_NAME` Varchar(32)
 COMMENT 'The order source type.',
  `SOURCE_TYPE_DESC` Varchar(255)
 COMMENT 'The source type description.',
  `CAPTURE_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.  Not intended for display.',
  `CAPTURE_TYPE_NAME` Varchar(60)
 COMMENT 'The capture type name.',
  `CAPTURE_TYPE_DESC` Varchar(255)
 COMMENT 'The capture type description.',
  `BILL_TO_TYPE_NAME` Varchar(60)
 COMMENT 'The bill to type name.',
  `BILL_TO_TYPE_DESC` Varchar(255)
 COMMENT 'The bill to type description.',
  `SHIP_PARTIAL_IND` Char(1)
 COMMENT 'This denotes if partial shipments are allowed for the order.',
  `RESELL_IND` Varchar(1)
 COMMENT 'This denotes a resell.',
  `PO_CONFIRMATION_IND` Char(1)
 COMMENT 'This denotes if a purchase order has been received.',
  `BILL_RECIPIENT_IND` Char(1)
 COMMENT 'This denotes if the recipient of the order is to be billed.',
  `BULK_ORDER_IND` Char(1)
 COMMENT 'This denotes a bulk order.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The order capture (order) dimension.  This maintains description order attributes.'
;

CREATE UNIQUE INDEX `DIMENSION_ORDER_CAPTURE_AK` ON `DIMENSION_ORDER_CAPTURE` (`ORDER_CAPTURE_ID`,`ORDER_CAPTURE_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_ORDER_CAPTURE_PK` ON `DIMENSION_ORDER_CAPTURE` (`ORDER_CAPTURE_SK`)
;

ALTER TABLE `DIMENSION_ORDER_CAPTURE` ADD  PRIMARY KEY (`ORDER_CAPTURE_SK`)
;

ALTER TABLE `DIMENSION_ORDER_CAPTURE` ADD UNIQUE `PK_DIMENSION_ORDER_CAPTURE` (`ORDER_CAPTURE_SK`)
;

-- Table DIMENSION_ORDER_STATUS

CREATE TABLE `DIMENSION_ORDER_STATUS`
(
  `ORDER_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The order status surrogate key.',
  `ORDER_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The order status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an order status in the source.',
  `ORDER_STATUS_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `ORDER_STATUS_NAME` Varchar(60)
 COMMENT 'The order status name.',
  `ORDER_STATUS_DESC` Varchar(255)
 COMMENT 'The order status description.',
  `HOSTED_CLIENT_SK` Smallint DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The order status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_ORDER_STATUS_AK` ON `DIMENSION_ORDER_STATUS` (`ORDER_STATUS_ID`,`ORDER_STATUS_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_ORDER_STATUS_PK` ON `DIMENSION_ORDER_STATUS` (`ORDER_STATUS_SK`)
;

ALTER TABLE `DIMENSION_ORDER_STATUS` ADD  PRIMARY KEY (`ORDER_STATUS_SK`)
;

ALTER TABLE `DIMENSION_ORDER_STATUS` ADD UNIQUE `PK_DIMENSION_ORDER_STATUS` (`ORDER_STATUS_SK`)
;

-- Table DIMENSION_ORDER_TYPE

CREATE TABLE `DIMENSION_ORDER_TYPE`
(
  `ORDER_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The order type surrogate key.',
  `ORDER_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The order type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an order type in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `ORDER_TYPE_NAME` Varchar(60)
 COMMENT 'The order type name.',
  `ORDER_TYPE_DESC` Varchar(255)
 COMMENT 'The order type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The order type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_ORDER_TYPE_AK` ON `DIMENSION_ORDER_TYPE` (`ORDER_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_ORDER_TYPE_PK` ON `DIMENSION_ORDER_TYPE` (`ORDER_TYPE_SK`)
;

ALTER TABLE `DIMENSION_ORDER_TYPE` ADD  PRIMARY KEY (`ORDER_TYPE_SK`)
;

ALTER TABLE `DIMENSION_ORDER_TYPE` ADD UNIQUE `PK_DIMENSION_ORDER_TYPE` (`ORDER_TYPE_SK`)
;

-- Table DIMENSION_PARTNER

CREATE TABLE `DIMENSION_PARTNER`
(
  `PARTNER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The partner surrogate key.',
  `PARTNER_ID` Varchar(36)
 COMMENT 'The partner identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a partner in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PARTNER_NAME` Varchar(60)
 COMMENT 'The partner name.',
  `PARTNER_STATUS_CODE` Varchar(32)
 COMMENT 'The partner status code.',
  `PARTNER_STATUS_DESC` Varchar(255)
 COMMENT 'The partner status description.',
  `CUSTOMER_IND` Varchar(1)
 COMMENT 'The customer indicator.',
  `TAX_EXEMPT_IND` Varchar(1)
 COMMENT 'The tax exempt indicator.',
  `PARTNER_SINCE_DATE` Timestamp NULL
 COMMENT 'The partner since date.',
  `EMPLOYEE_QTY` Decimal(9,0)
 COMMENT 'The quantity of employees.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The partner dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PARTNER_AK` ON `DIMENSION_PARTNER` (`PARTNER_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PARTNER_PK` ON `DIMENSION_PARTNER` (`PARTNER_SK`)
;

ALTER TABLE `DIMENSION_PARTNER` ADD  PRIMARY KEY (`PARTNER_SK`)
;

ALTER TABLE `DIMENSION_PARTNER` ADD UNIQUE `PK_DIMENSION_PARTNER` (`PARTNER_SK`)
;

-- Table DIMENSION_PARTNER_CONTACT

CREATE TABLE `DIMENSION_PARTNER_CONTACT`
(
  `PARTNER_CONTACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The partner contact surrogate key.',
  `PARTNER_CONTACT_ID` Varchar(36)
 COMMENT 'The partner contact identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a partner contact in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PARTNER_CONTACT_NAME` Varchar(60)
 COMMENT 'The partner contact name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The partner contact dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PARTNER_CONTACT_AK` ON `DIMENSION_PARTNER_CONTACT` (`PARTNER_CONTACT_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PARTNER_CONTACT_PK` ON `DIMENSION_PARTNER_CONTACT` (`PARTNER_CONTACT_SK`)
;

ALTER TABLE `DIMENSION_PARTNER_CONTACT` ADD  PRIMARY KEY (`PARTNER_CONTACT_SK`)
;

-- Table DIMENSION_PAYMENT_METHOD

CREATE TABLE `DIMENSION_PAYMENT_METHOD`
(
  `PAYMENT_METHOD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The payment method surrogate key.',
  `PAYMENT_METHOD_ID` Varchar(36) NOT NULL
 COMMENT 'The payment method identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment method in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PAYMENT_METHOD_NAME` Varchar(60)
 COMMENT 'The payment method name.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The payment method dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PAYMENT_METHOD_AK` ON `DIMENSION_PAYMENT_METHOD` (`PAYMENT_METHOD_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PAYMENT_METHOD_PK` ON `DIMENSION_PAYMENT_METHOD` (`PAYMENT_METHOD_SK`)
;

ALTER TABLE `DIMENSION_PAYMENT_METHOD` ADD  PRIMARY KEY (`PAYMENT_METHOD_SK`)
;

-- Table DIMENSION_PAYMENT_TERMS

CREATE TABLE `DIMENSION_PAYMENT_TERMS`
(
  `PAYMENT_TERMS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The payment terms surrogate key.',
  `PAYMENT_TERMS_ID` Varchar(36) NOT NULL
 COMMENT 'The payment terms identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment term in the source.',
  `PAYMENT_TERMS_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system payment terms SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PAYMENT_TERMS_NAME` Varchar(60)
 COMMENT 'The payment terms name.',
  `PAYMENT_TERMS_DATE` Timestamp NULL
 COMMENT 'The payment terms date.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `PAYMENT_TERMS_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The payment terms amount.',
  `CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The payment terms currency surrogate key.  This relates to the currency dimension.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The payment terms dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PAYMENT_TERMS_AK` ON `DIMENSION_PAYMENT_TERMS` (`PAYMENT_TERMS_ID`,`PAYMENT_TERMS_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PAYMENT_TERMS_PK` ON `DIMENSION_PAYMENT_TERMS` (`PAYMENT_TERMS_SK`)
;

ALTER TABLE `DIMENSION_PAYMENT_TERMS` ADD  PRIMARY KEY (`PAYMENT_TERMS_SK`)
;

ALTER TABLE `DIMENSION_PAYMENT_TERMS` ADD UNIQUE `PK_DIMENSION_PAYMENT_TERMS` (`PAYMENT_TERMS_SK`)
;

-- Table DIMENSION_PERSON

CREATE TABLE `DIMENSION_PERSON`
(
  `PERSON_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The person surrogate key.',
  `PERSON_ID` Varchar(36) NOT NULL
 COMMENT 'The person identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an person in the source.',
  `PERSON_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PERSON_MASTER_SK` Int DEFAULT 0
 COMMENT 'The person master surrogate key consolidates the same person that may occur in several source systems.  It is utilized by customers that have this rationalization requirement.  It is independent of SCD2 surrogate keys and it is not used in intrasystem hierarchies.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an employee  in the source.',
  `AGENT_ID` Varchar(36)
 COMMENT 'The agent identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an agent in the source.',
  `ALTERNATE_EMPLOYEE_ID` Varchar(36)
 COMMENT 'The alternate employee identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an employyee in the source.',
  `APPLICANT_ID` Varchar(36)
 COMMENT 'The applicant identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an applicant in the source.',
  `NATIONAL_ID` Varchar(36)
 COMMENT 'The national identifier, for example a U.S. Social Security Number.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `BIRTH_DATE` Date
 COMMENT 'The birth date.',
  `APPLICATION_DATE` Timestamp NULL
 COMMENT 'The employment application date.',
  `DEATH_DATE` Date
 COMMENT 'The death date.',
  `FULL_NAME` Varchar(60)
 COMMENT 'The full name of the person.',
  `LAST_NAME` Varchar(60)
 COMMENT 'The last (family) name.',
  `MIDDLE_NAME` Varchar(60)
 COMMENT 'The middle name.',
  `FIRST_NAME` Varchar(60)
 COMMENT 'The first (given) name.',
  `MARITAL_STATUS_CODE` Varchar(32)
 COMMENT 'The marital status code.',
  `MARITAL_STATUS_NAME` Varchar(60)
 COMMENT 'The marital status name.',
  `MARITAL_STATUS_DESC` Varchar(255)
 COMMENT 'The marital status description.',
  `MARITAL_STATUS_DATE` Timestamp NULL
 COMMENT 'The marital status date.',
  `GENDER_CODE` Varchar(1)
 COMMENT 'The gender code.',
  `GENDER_DESC` Varchar(255)
 COMMENT 'The gender description.',
  `FULL_TIME_STUDENT_IND` Char(1)
 COMMENT 'The denotes if a person is a full time student.',
  `US_WORK_ELIGIBILITY_IND` Char(1)
 COMMENT 'The denotes if a person is eligible to work in the United States.',
  `EU_WORK_ELIGIBILTY_IND` Char(1)
 COMMENT 'The denotes if a person is eligible to work in the European Union.',
  `US_CITIZEN_PROOF_DOC1_NAME` Varchar(60)
 COMMENT 'The name of document 1 used to prove US citizenship.',
  `US_CITIZEN_PROOF_DOC2_NAME` Varchar(60)
 COMMENT 'The name of document 2 used to prove US citizenship.',
  `MILITARY_STATUS_CODE` Char(1)
 COMMENT 'The military status code.',
  `HIGHEST_EDUCATION_LEVEL_CODE` Varchar(32)
 COMMENT 'The highest education level code.',
  `HIGHEST_EDUCATION_LEVEL_NAME` Varchar(60)
 COMMENT 'The highest education level name.',
  `HIGHEST_EDUCATION_LEVEL_DESC` Varchar(255)
 COMMENT 'The highest education level description.',
  `ETHNIC_GROUP_CODE` Varchar(32)
 COMMENT 'The ethnic group code.',
  `ETHNIC_GROUP_NAME` Varchar(60)
 COMMENT 'The ethnic group name.',
  `ETHNIC_GROUP_DESC` Varchar(255)
 COMMENT 'The ethnic group description.',
  `HIGH_COMPENSATION_IND` Char(1)
 COMMENT 'This denotes a high compensation person.',
  `HIGH_COMPENSATION_PLAN_IND` Char(1)
 COMMENT 'This denotes a high compensation plan membership.',
  `EXPERIENCE_YEAR_QTY` Smallint
 COMMENT 'The quantity of experience years for the person.',
  `HOME_CITY_NAME` Varchar(60)
 COMMENT 'The home address city name.',
  `HOME_STATE_PROVINCE_CODE` Varchar(32)
 COMMENT 'The home address state code.',
  `HOME_POSTAL_CODE` Varchar(32)
 COMMENT 'The home address postal code.',
  `HOME_GEOGRAPHY_CODE` Varchar(32)
 COMMENT 'The home address geography code.',
  `HOME_COUNTRY_NAME` Varchar(60)
 COMMENT 'The home address country name.',
  `REGULATORY_REGION_CODE` Varchar(32)
 COMMENT 'The regulatory region code.',
  `HOME_PHONE_NUMBER` Varchar(32)
 COMMENT 'The home telephone number.',
  `CELL_PHONE_NUMBER` Varchar(32)
 COMMENT 'The cell phone number.',
  `BUSINESS_PHONE_NUMBER` Varchar(32)
 COMMENT 'The business phone number.',
  `DISABLED_IND` Char(1)
 COMMENT 'This denotes a disabled person.',
  `DISABLED_VETRAN_IND` Char(1)
 COMMENT 'This denotes a disabled military veteran.',
  `SALES_REP_IND` Char(1)
 COMMENT 'This denotes if a person is a sales representative.',
  `SERVICE_REP_IND` Char(1)
 COMMENT 'This denotes if a person is a customer service representative.',
  `HOME_ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `HOME_ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `HOME_ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `HOME_ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `HOME_STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The home address state name.',
  `HOME_PHONE_COUNTRY_CODE` Varchar(32)
 COMMENT 'The telephone country code.',
  `HOME_PHONE_REGION_CODE` Varchar(32)
 COMMENT 'The phone region, area, or city code.',
  `SALES_USER_TYPE_CODE` Varchar(32)
 COMMENT 'The sales user type code.',
  `SALES_USER_TYPE_DESC` Varchar(255)
 COMMENT 'The sales user type description.',
  `MANAGER_QUOTA_TYPE_CODE` Varchar(32)
 COMMENT 'The manager quota type code.',
  `MANAGER_QUOTA_TYPE_DESC` Varchar(255)
 COMMENT 'The manager quota type description.',
  `QUOTA_TYPE_CODE` Varchar(32)
 COMMENT 'The quota type code.',
  `QUOTA_TYPE_DESC` Varchar(255)
 COMMENT 'The quota type description.',
  `UNIT_QUOTA_TYPE_CODE` Varchar(32)
 COMMENT 'The unit quota type code.',
  `UNIT_QUOTA_TYPE_DESC` Varchar(255)
 COMMENT 'The unit quota type description.',
  `JOBCODE_ID` Varchar(36)
 COMMENT 'The jobcode identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `JOBCODE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system jobcode SETID.  This column is often used as part of the unique identifer.',
  `LOCATION_ID` Varchar(36)
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `LOCATON_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system location SETID.  This column is often used as part of the unique identifer.',
  `EMPLOYEE_CLASS_CODE` Varchar(32)
 COMMENT 'The employee class code.',
  `FULL_PART_TIME_IND` Varchar(1)
 COMMENT 'This denotes if an employee is full or part-time.',
  `FULL_PART_TIME_DESC` Varchar(255)
 COMMENT 'The full or part time description.',
  `REG_TEMP_IND` Varchar(1)
 COMMENT 'This denotes if an employee is regular or temporary.',
  `REG_TEMP_DESC` Varchar(255)
 COMMENT 'The regular or temporary description.',
  `DEPT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `DEPT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `DEPT_NAME` Varchar(60)
 COMMENT 'The department name.',
  `DEPT_DESC` Varchar(255)
 COMMENT 'The department description.',
  `SALES_REGION_CODE` Varchar(32)
 COMMENT 'The sales region code.',
  `SALES_REGION_DESC` Varchar(255)
 COMMENT 'The sales region description.',
  `EMPLOYEE_CLASS_ID` Varchar(36)
 COMMENT 'The employee class identifier in the source system.',
  `EMPLOYEE_CLASS_NAME` Varchar(60)
 COMMENT 'The employee class name.',
  `EMPLOYEE_CLASS_DESC` Varchar(255)
 COMMENT 'The employee class description.',
  `REGULAR_TEMPORARY_IND` Varchar(1)
 COMMENT 'The regular temporary indicator.',
  `REGULAR_TEMPORARY_NAME` Varchar(60)
 COMMENT 'The regular temporary name.',
  `REGULAR_TEMPORARY_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `PERSON_STATUS_CODE` Varchar(36)
 COMMENT 'The person status code.',
  `PERSON_STATUS_NAME` Varchar(60)
 COMMENT 'The person status name.',
  `PERSON_STATUS_DESC` Varchar(255)
 COMMENT 'The person status description.',
  `PERSON_STATUS_DATE` Datetime
 COMMENT 'The person status date.',
  `PERSON_TYPE_ID` Varchar(36)
 COMMENT 'The person type identifier.',
  `PERSON_TYPE_NAME` Varchar(60)
 COMMENT 'The person type name.',
  `PERSON_TYPE_DESC` Varchar(255)
 COMMENT 'The person type description.',
  `PERSON_GROUP_CODE` Varchar(36)
 COMMENT 'The person group code.',
  `PERSON_GROUP_NAME` Varchar(60)
 COMMENT 'The person group name.',
  `PERSON_GROUP_DESC` Varchar(255)
 COMMENT 'The person group description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The person dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PERSON_AK` ON `DIMENSION_PERSON` (`EMPLOYEE_ID`,`PERSON_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PERSON_PK` ON `DIMENSION_PERSON` (`PERSON_SK`)
;

ALTER TABLE `DIMENSION_PERSON` ADD  PRIMARY KEY (`PERSON_SK`)
;

ALTER TABLE `DIMENSION_PERSON` ADD UNIQUE `PK_DIMENSION_PERSON` (`PERSON_SK`)
;

-- Table DIMENSION_POSITION

CREATE TABLE `DIMENSION_POSITION`
(
  `POSITION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The position surrogate key.',
  `POSITION_ID` Varchar(36) NOT NULL
 COMMENT 'The position identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a position in the source.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The effective date surrogate key.  This relates to the day dimension.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `POSITION_NAME` Varchar(60)
 COMMENT 'The position name.',
  `POSITION_DESC` Varchar(255)
 COMMENT 'The position description.',
  `BUSINESS_UNIT_SK` Int DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `DEPARTMENT_SK` Int DEFAULT 0
 COMMENT 'The department surrogate key.  This relates to the department dimension.',
  `JOBCODE_SK` Int DEFAULT 0
 COMMENT 'The jobcode surrogate key.  This relates to the jobcode dimension.',
  `MANAGER_SK` Int DEFAULT 0
 COMMENT 'The manager surrogate key.  This relates to the person dimension.',
  `LOCATION_SK` Int DEFAULT 0
 COMMENT 'The location surrogate key.  This relates to the location dimension.',
  `COMPANY_SK` Int DEFAULT 0
 COMMENT 'The company surrogate key.  This relates to the company dimension.',
  `SALARY_PLAN_SK` Int DEFAULT 0
 COMMENT 'The salary plan surrogate key.  This relates to the salary plan dimension.',
  `POSITION_STATUS_CODE` Varchar(32)
 COMMENT 'The position status code.',
  `POSITION_STATUS_NAME` Varchar(60)
 COMMENT 'The position status name.',
  `POSITION_STATUS_DESC` Varchar(255)
 COMMENT 'The position status description.',
  `POSITION_STATUS_DATE_SK` Int DEFAULT 0
 COMMENT 'The position status date surrogate key.  This relates to the day dimension.',
  `POSITION_ESTABLISHED_DATE_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The position established date surrogate key.  This relates to the day dimension.',
  `BUDGETED_POSITION_QTY` Decimal(1,0) DEFAULT 0
 COMMENT 'The position budgeted quantity (set at 1 if true).',
  `MAXIMUM_HEAD_COUNT_QTY` Decimal(4,0) DEFAULT 0
 COMMENT 'The maximum headcount quantity.',
  `LABOR_UNION_CODE` Varchar(32)
 COMMENT 'The labor union code.',
  `LABOR_UNION_NAME` Varchar(60)
 COMMENT 'The labor union name.',
  `LABOR_UNION_DESC` Varchar(255)
 COMMENT 'The labor union description.',
  `JOB_SHIFT_CODE` Varchar(32)
 COMMENT 'The job shift code.',
  `JOB_SHIFT_NAME` Varchar(60)
 COMMENT 'The job shift name.',
  `JOB_SHIFT_DESC` Varchar(255)
 COMMENT 'The job shift description.',
  `REGULAR_TEMPORARY_CODE` Varchar(32)
 COMMENT 'The regular temporary code.',
  `REGULAR_TEMPORARY_NAME` Varchar(60)
 COMMENT 'The regular temporary name.',
  `REGULAR_TEMPORARY_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `FULL_PART_TIME_CODE` Varchar(32)
 COMMENT 'The full part time code.',
  `FULL_PART_TIME_NAME` Varchar(60)
 COMMENT 'The full part time name.',
  `FULL_PART_TIME_DESC` Varchar(255)
 COMMENT 'The full part time description.',
  `DRUG_TEST_REQUIRED_QTY` Decimal(1,0) DEFAULT 0
 COMMENT 'The drug test required quantity (set to 1 if true).',
  `SECURITY_CLEARANCE_CODE` Varchar(32)
 COMMENT 'The security clearance code.',
  `SECURITY_CLEARANCE_NAME` Varchar(60)
 COMMENT 'The security clearance name.',
  `SECURITY_CLEARANCE_DESC` Varchar(255)
 COMMENT 'The security clearance description.',
  `FULL_TIME_EQUIVALENT_QTY` Decimal(9,6) DEFAULT 0
 COMMENT 'The full time equivalent quantity.',
  `ACADEMIC_RANK_CODE` Varchar(32)
 COMMENT 'The academic rank code.',
  `ACADEMIC_RANK_NAME` Varchar(60)
 COMMENT 'The academic rank name.',
  `ACADEMIC_RANK_DESC` Varchar(255)
 COMMENT 'The academic rank description.',
  `SERVICE_GROUP_CODE` Varchar(32)
 COMMENT 'The service group code.',
  `SERVICE_GROUP_NAME` Varchar(60)
 COMMENT 'The service group name.',
  `SERVICE_GROUP_DESC` Varchar(255)
 COMMENT 'The service group description.',
  `JOB_PROFILE_CODE` Varchar(32)
 COMMENT 'The job profile code.',
  `JOB_PROFILE_NAME` Varchar(60)
 COMMENT 'The job profile name.',
  `JOB_PROFILE_DESC` Varchar(255)
 COMMENT 'The job profile description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Text DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The position dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_POSITION_AK` ON `DIMENSION_POSITION` (`POSITION_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_POSITION_PK` ON `DIMENSION_POSITION` (`POSITION_SK`)
;

ALTER TABLE `DIMENSION_POSITION` ADD  PRIMARY KEY (`POSITION_SK`)
;

ALTER TABLE `DIMENSION_POSITION` ADD UNIQUE `PK_DIMENSION_POSITION` (`POSITION_SK`)
;

-- Table DIMENSION_PRODUCT

CREATE TABLE `DIMENSION_PRODUCT`
(
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.',
  `PRODUCT_ID` Varchar(36) NOT NULL
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PRODUCT_CODE` Varchar(36)
 COMMENT 'The product code.',
  `PRODUCT_MASTER_SK` Int DEFAULT 0
 COMMENT 'The product master surrogate key consolidates the same product that may occur in several source systems.  It is utilized by customers that have this rationalization requirement.  It is independent of SCD2 surrogate keys and it is not used in intrasystem hierarchies.',
  `PRODUCT_NAME` Varchar(60)
 COMMENT 'The product name.',
  `PRODUCT_DESC` Varchar(255)
 COMMENT 'The product description.',
  `MANUFACTURER_PRODUCT_ID` Varchar(36)
 COMMENT 'The manufacturers product identifier.',
  `PRODUCT_KIT_IND` Varchar(1)
 COMMENT 'This denotes if a product is a part of a kit.',
  `PRODUCT_UPPER_MARGIN_PCT` Decimal(5,2)
 COMMENT 'The product upper margin percent.',
  `PRODUCT_LOWER_MARGIN_PCT` Decimal(5,2)
 COMMENT 'The product lower margin percent.',
  `PRODUCT_DEFAULT_UOM_ID` Varchar(3)
 COMMENT 'The default unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `PRODUCT_CATEGORY_CODE` Varchar(36)
 COMMENT 'The product category code.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The product cateogry name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The product category description.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_BRAND_CODE` Varchar(32)
 COMMENT 'The product brand code.',
  `PRODUCT_BRAND_NAME` Varchar(60)
 COMMENT 'The product brand name.',
  `PRODUCT_BRAND_DESC` Varchar(255)
 COMMENT 'The product brand description.',
  `PRODUCT_DEPARTMENT_NAME` Varchar(60)
 COMMENT 'The product department name.',
  `WEIGHT_QTY` Double
 COMMENT 'The weight quantity (as defined by the weight unit of measure).',
  `WEIGHT_UOM_ID` Varchar(36)
 COMMENT 'The weight unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `LENGTH_QTY` Double
 COMMENT 'The length quantity (as defined by the dimension unit of measure).',
  `WIDTH_QTY` Double
 COMMENT 'The width quantity (as defined by the dimension unit of measure).',
  `HEIGHT_QTY` Double
 COMMENT 'The height quantity (as defined by the dimension unit of measure).',
  `DIMENSION_UOM_ID` Varchar(36)
 COMMENT 'The dimension unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `VOLUME_UOM_ID` Varchar(36)
 COMMENT 'The volume unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `SELL_UNIT_QTY` Double
 COMMENT 'The standard quantity of units sold as this product (as defined by the unit unit of measure).',
  `CASE_UNIT_QTY` Double
 COMMENT 'The number of these products that define a case.',
  `PALLET_UNIT_QTY` Double
 COMMENT 'The number of these products that define a shipping pallet.',
  `VOLUME_QTY` Double
 COMMENT 'The volume quantity (as defined by the volume unit of measure).',
  `UNIT_UOM_ID` Varchar(36)
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `PARENT_PRODUCT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The product category name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PARENT_PRODUCT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The product category description.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_SUBCATEGORY_CODE` Varchar(32)
 COMMENT 'The product subcateogry code.',
  `PRODUCT_SUBCATEGORY_NAME` Varchar(60)
 COMMENT 'The product subcategory name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_SUBCATEGORY_DESC` Varchar(255)
 COMMENT 'The product subcategory description.',
  `PRODUCT_STATUS_CODE` Varchar(1)
 COMMENT 'The product status code.',
  `PRODUCT_STATUS_NAME` Varchar(60)
 COMMENT 'The product status name.',
  `PRODUCT_STATUS_DESC` Varchar(255)
 COMMENT 'The product status description.',
  `PRODUCT_STATUS_DATE` Datetime
 COMMENT 'The product status date.',
  `PRODUCT_FAMILY_CODE` Varchar(36)
 COMMENT 'The product family code.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_FAMILY_NAME` Varchar(60)
 COMMENT 'The product family name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_FAMILY_DESC` Varchar(255)
 COMMENT 'The product family description.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `EAN_UPC_NUMBER` Varchar(32)
 COMMENT 'The international article number (EAN/UPC).',
  `ALT_EAN_UPC_NUMBER` Varchar(32)
 COMMENT 'The alternate international article number (EAN/UPC).',
  `EAN_UPC_TYPE_NAME` Varchar(60)
 COMMENT 'The EAN/UPC type name.  For example, Manufacturer EAN; Manufacturer Short EAN; ITF Code; 16 Character, ITF Code; Instore EAN; Instore Short EAN; UPC; Velocity Code; etc.',
  `ALT_EAN_UPC_TYPE_NAME` Varchar(60)
 COMMENT 'The alternate EAN/UPC type name.  For example, Manufacturer EAN; Manufacturer Short EAN; ITF Code; 16 Character, ITF Code; Instore EAN; Instore Short EAN; UPC; Velocity Code; etc.',
  `PRICE_EACH_AMT` Decimal(26,2)
 COMMENT 'The standard each price of the product offered to customers.  This is generic across customers and often does not reflect the price actually offered to customers.',
  `COST_EACH_AMT` Decimal(26,2)
 COMMENT 'The each cost of the product.  This is a sum of all costs that can be attributed to a product (e.g., raw material, transportation, indirect costs, etc.).',
  `CURRENCY_SK` Int DEFAULT 0,
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The product (finished material) dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PRODUCT_PK` ON `DIMENSION_PRODUCT` (`PRODUCT_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PRODUCT_AK` ON `DIMENSION_PRODUCT` (`PRODUCT_ID`,`PRODUCT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PRODUDCT_AK` USING BTREE ON `DIMENSION_PRODUCT` (`PRODUCT_ID`,`PRODUCT_SETID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_PRODUCT` ADD  PRIMARY KEY (`PRODUCT_SK`)
;

ALTER TABLE `DIMENSION_PRODUCT` ADD UNIQUE `PK_DIMENSION_PRODUCT` (`PRODUCT_SK`)
;

-- Table DIMENSION_PROGRAM

CREATE TABLE `DIMENSION_PROGRAM`
(
  `PROGRAM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The program surrogate key.',
  `PROGRAM_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The program source system SETID.  This column is often used as part of the unique identifer.',
  `PROGRAM_ID` Varchar(36)
 COMMENT 'The program identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a program in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The program effective date.',
  `PROGRAM_NAME` Varchar(60)
 COMMENT 'The program name.',
  `PROGRAM_DESC` Varchar(255)
 COMMENT 'The program description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The program dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PROGRAM_AK` ON `DIMENSION_PROGRAM` (`PROGRAM_ID`,`PROGRAM_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PROGRAM_PK` ON `DIMENSION_PROGRAM` (`PROGRAM_SK`)
;

ALTER TABLE `DIMENSION_PROGRAM` ADD  PRIMARY KEY (`PROGRAM_SK`)
;

ALTER TABLE `DIMENSION_PROGRAM` ADD UNIQUE `PK_DIMENSION_PROGRAM` (`PROGRAM_SK`)
;

-- Table DIMENSION_PROJECT

CREATE TABLE `DIMENSION_PROJECT`
(
  `PROJECT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The project surrogate key.',
  `PROJECT_ID` Varchar(36)
 COMMENT 'The project identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a project in the source.',
  `PROJECT_SETID` Varchar(32) DEFAULT 'SHARE'
 COMMENT 'The source system project SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PROJECT_NAME` Varchar(60)
 COMMENT 'The project name.',
  `PROJECT_DESC` Varchar(255)
 COMMENT 'The project description.',
  `PROJECT_TYPE_CODE` Varchar(32)
 COMMENT 'The project type code.',
  `PROJECT_TYPE_NAME` Varchar(60)
 COMMENT 'The project type name.',
  `PROJECT_TYPE_DESC` Varchar(255)
 COMMENT 'The project type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The project dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PROJECT_AK` ON `DIMENSION_PROJECT` (`PROJECT_ID`,`PROJECT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PROJECT_PK` ON `DIMENSION_PROJECT` (`PROJECT_SK`)
;

ALTER TABLE `DIMENSION_PROJECT` ADD  PRIMARY KEY (`PROJECT_SK`)
;

ALTER TABLE `DIMENSION_PROJECT` ADD UNIQUE `PK_DIMENSION_PROJECT` (`PROJECT_SK`)
;

-- Table DIMENSION_PROVIDER_GROUP

CREATE TABLE `DIMENSION_PROVIDER_GROUP`
(
  `PROVIDER_GROUP_SK` Int NOT NULL
 COMMENT 'The provider group surrogate key.',
  `PROVIDER_GROUP_ID` Varchar(36)
 COMMENT 'The provider group identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a provider group in the source.',
  `PROVIDER_GROUP_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system provider group SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PROVIDER_GROUP_DESC` Varchar(255)
 COMMENT 'The provider group description.',
  `PROVIDER_GROUP_TYPE_CODE` Varchar(32)
 COMMENT 'The provider group type code.',
  `PROVIDER_GROUP_TYPE_DESC` Varchar(255)
 COMMENT 'The provider group type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The provider group dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_PROVIDER_GROUP_AK` ON `DIMENSION_PROVIDER_GROUP` (`PROVIDER_GROUP_ID`,`PROVIDER_GROUP_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_PROVIDER_GROUP_PK` ON `DIMENSION_PROVIDER_GROUP` (`PROVIDER_GROUP_SK`)
;

ALTER TABLE `DIMENSION_PROVIDER_GROUP` ADD  PRIMARY KEY (`PROVIDER_GROUP_SK`)
;

ALTER TABLE `DIMENSION_PROVIDER_GROUP` ADD UNIQUE `PK_DIMENSION_PROVIDER_GROUP` (`PROVIDER_GROUP_SK`)
;

-- Table DIMENSION_RECRUITMENT_CHANNEL

CREATE TABLE `DIMENSION_RECRUITMENT_CHANNEL`
(
  `RECRUITMENT_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The recruitment surrogate key.',
  `RECRUITMENT_CHANNEL_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The recruitment channel source system SETID.  This column is often used as part of the unique identifer.',
  `RECRUITMENT_CHANNEL_ID` Varchar(36) NOT NULL
 COMMENT 'The recruitment channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a recruitment channel in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `RECRUITMENT_CHANNEL_NAME` Varchar(60)
 COMMENT 'The channel name.',
  `RECRUITMENT_CHANNEL_DESC` Varchar(255)
 COMMENT 'The channel description.',
  `RECRUITMENT_CHANNEL_TYPE_CODE` Varchar(32)
 COMMENT 'The recruitment channel type.',
  `RECRUITMENT_CHANNEL_TYPE_NAME` Varchar(60)
 COMMENT 'The recruitment channel type name.',
  `RECRUITMENT_CHANNEL_TYPE_DESC` Varchar(255)
 COMMENT 'The channel type description.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '31-DEC-2199'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The recruitment channel dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_RECRUIT_CHANNEL_PK` ON `DIMENSION_RECRUITMENT_CHANNEL` (`RECRUITMENT_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_RECRUITMENT_CHANNEL` ADD  PRIMARY KEY (`RECRUITMENT_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_RECRUITMENT_CHANNEL` ADD UNIQUE `PK_DIMENSION_RECRUITMENT_CHANNEL` (`RECRUITMENT_CHANNEL_SK`)
;

-- Table DIMENSION_RECRUITMENT_EVENT

CREATE TABLE `DIMENSION_RECRUITMENT_EVENT`
(
  `RECRUITMENT_EVENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The recruitment event surrogate key.',
  `RECRUITMENT_EVENT_ID` Varchar(36) NOT NULL
 COMMENT 'The recruitment event identifier in the source system.  Alone, or in combination with other columns, (e.g., recruitment event, setid, source system), this value uniquely identifiers a recruitment event in the source.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `RECRUITMENT_EVENT_NAME` Varchar(60)
 COMMENT 'The recruitment event name.',
  `RECRUITMENT_EVENT_DESC` Varchar(60)
 COMMENT 'The recruitment event description',
  `RECRUITMENT_EVENT_TYPE_CODE` Varchar(32)
 COMMENT 'The recruitment event type.',
  `RECRUITMENT_EVENT_TYPE_NAME` Varchar(60)
 COMMENT 'The recruitment event type name.',
  `RECRUITMENT_EVENT_TYPE_DESC` Varchar(255)
 COMMENT 'The recruitment event type description.',
  `START_DATE` Timestamp NULL
 COMMENT 'The start date of the recruitment event.',
  `STOP_DATE` Timestamp NULL
 COMMENT 'The stop date of the recruitment event.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The address line 1 description.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The address line 2 description.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The address line 3 description.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The address line 4 description.',
  `CITY_NAME` Varchar(255)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(255)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(6)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(255)
 COMMENT 'The state or province name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(255)
 COMMENT 'The country name.',
  `SUPER_NATIONAL_NAME` Varchar(60)
 COMMENT 'The super national name, e.g., European Union.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `LATITUDE` Decimal(7,4)
 COMMENT 'The latitude.',
  `LONGITUDE` Decimal(7,4)
 COMMENT 'The longitude.',
  `PHONE_COUNTRY_CODE` Smallint
 COMMENT 'The telephone country code.',
  `PHONE_REGION_CODE` Smallint
 COMMENT 'The phone region code.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The recruitment event dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_RECRUITMENT_EVENT_PK` ON `DIMENSION_RECRUITMENT_EVENT` (`RECRUITMENT_EVENT_SK`)
;

ALTER TABLE `DIMENSION_RECRUITMENT_EVENT` ADD  PRIMARY KEY (`RECRUITMENT_EVENT_SK`)
;

ALTER TABLE `DIMENSION_RECRUITMENT_EVENT` ADD UNIQUE `PK_DIMENSION_RECRUITMENT_EVENT` (`RECRUITMENT_EVENT_SK`)
;

-- Table DIMENSION_REGION

CREATE TABLE `DIMENSION_REGION`
(
  `REGION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The region surrogate key.',
  `REGION_ID` Varchar(36)
 COMMENT 'The region identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a region in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `REGION_NAME` Varchar(60)
 COMMENT 'The region name.  For exampe, North America, Europe, etc.',
  `PARENT_REGION_ID` Varchar(36) DEFAULT 0
 COMMENT 'The parent region identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a region in the source.',
  `PARENT_REGION_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The parent region name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The region dimension.'
;

CREATE INDEX `DIMENSION_REGION_AK` ON `DIMENSION_REGION` (`REGION_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_REGION_PK` ON `DIMENSION_REGION` (`REGION_SK`)
;

ALTER TABLE `DIMENSION_REGION` ADD  PRIMARY KEY (`REGION_SK`)
;

ALTER TABLE `DIMENSION_REGION` ADD UNIQUE `PK_DIMENSION_REGION` (`REGION_SK`)
;

-- Table DIMENSION_REGULATORY_REGION

CREATE TABLE `DIMENSION_REGULATORY_REGION`
(
  `REGULATORY_REGION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The regulatory region surrogate key.',
  `REGULATORY_REGION_ID` Varchar(36)
 COMMENT 'The regulatory region source system identifier.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `REGULATORY_REGION_NAME` Varchar(60)
 COMMENT 'The regulatory region name.',
  `REGULATORY_REGION_DESC` Varchar(255)
 COMMENT 'The regulatory region description.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The regulatory region dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_REGULATORY_REGI_AK` ON `DIMENSION_REGULATORY_REGION` (`REGULATORY_REGION_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_REGULATORY_REGI_PK` ON `DIMENSION_REGULATORY_REGION` (`REGULATORY_REGION_SK`)
;

ALTER TABLE `DIMENSION_REGULATORY_REGION` ADD  PRIMARY KEY (`REGULATORY_REGION_SK`)
;

-- Table DIMENSION_RETURN_REASON

CREATE TABLE `DIMENSION_RETURN_REASON`
(
  `RETURN_REASON_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The return reason surrogate key.',
  `RETURN_REASON_ID` Varchar(36) NOT NULL
 COMMENT 'The return reason identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an return reason in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `RETURN_REASON_NAME` Varchar(60)
 COMMENT 'The return reason name.',
  `RETURN_REASON_DESC` Varchar(255)
 COMMENT 'The return reason description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The return reason dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_RETURN_REASON_AK` ON `DIMENSION_RETURN_REASON` (`RETURN_REASON_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_RETURN_REASON_PK` ON `DIMENSION_RETURN_REASON` (`RETURN_REASON_SK`)
;

ALTER TABLE `DIMENSION_RETURN_REASON` ADD  PRIMARY KEY (`RETURN_REASON_SK`)
;

-- Table DIMENSION_RETURN_TYPE

CREATE TABLE `DIMENSION_RETURN_TYPE`
(
  `RETURN_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The return type surrogate key.',
  `RETURN_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The return type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an return type in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `RETURN_TYPE_NAME` Varchar(60)
 COMMENT 'The return type name.',
  `RETURN_TYPE_DESC` Varchar(255)
 COMMENT 'The return type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The return type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_RETURN_TYPE_AK` ON `DIMENSION_RETURN_TYPE` (`RETURN_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_RETURN_TYPE_PK` ON `DIMENSION_RETURN_TYPE` (`RETURN_TYPE_SK`)
;

ALTER TABLE `DIMENSION_RETURN_TYPE` ADD  PRIMARY KEY (`RETURN_TYPE_SK`)
;

ALTER TABLE `DIMENSION_RETURN_TYPE` ADD UNIQUE `PK_DIMENSION_RETURN_TYPE` (`RETURN_TYPE_SK`)
;

-- Table DIMENSION_SALARY_PLAN

CREATE TABLE `DIMENSION_SALARY_PLAN`
(
  `SALARY_PLAN_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The salary admin plan surrogate key.',
  `SALARY_PLAN_ID` Varchar(36) NOT NULL
 COMMENT 'The salary admin plan identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a salary admin plan in the source.',
  `SALARY_PLAN_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system salary admin plan SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SALARY_GRADE_ID` Varchar(36)
 COMMENT 'The salary grade source system identifier.',
  `SALARY_STEP_ID` Varchar(36)
 COMMENT 'The salary step identifier.',
  `SALARY_PLAN_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The salary plan effective date.',
  `SALARY_GRADE_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The salary grade effective date.',
  `SALARY_STEP_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The salary step effective date.',
  `SALARY_PLAN_NAME` Varchar(60)
 COMMENT 'The salary plan name.',
  `SALARY_PLAN_DESC` Varchar(255)
 COMMENT 'The salary plan description.',
  `SALARY_GRADE_NAME` Varchar(60)
 COMMENT 'The salary grade name.',
  `SALARY_GRADE_DESC` Varchar(255)
 COMMENT 'The salary grade description.',
  `SALARY_STEP_NAME` Varchar(60)
 COMMENT 'The salary step name.',
  `SALARY_STEP_DESC` Varchar(255)
 COMMENT 'The salary step description.',
  `CURRENCY_SK` Int
 COMMENT 'The currency surrogate key.  This relates to the currency dimension.',
  `COMPANY_SK` Int
 COMMENT 'The company surrogate key.  This relates to the company dimension.',
  `SALARY_PLAN_EFF_STATUS_CODE` Varchar(32)
 COMMENT 'The salary plan effective status code.',
  `SALARY_PLAN_SCOPE_CODE` Varchar(32)
 COMMENT 'The salary plan scope code.',
  `SALARY_PLAN_SCOPE_NAME` Varchar(60)
 COMMENT 'The salary plan scope name.',
  `SALARY_PLAN_SCOPE_DESC` Varchar(255)
 COMMENT 'The salary plan scope description.',
  `SALARY_BASIS_CODE` Varchar(32)
 COMMENT 'The salary basis code.',
  `SALARY_BASIS_NAME` Varchar(60)
 COMMENT 'The salary basis name.',
  `SALARY_BASIS_DESC` Varchar(255)
 COMMENT 'The salary basis description.',
  `DAILY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The daily frequency code.',
  `DAILY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The daily frequency name.',
  `DAILY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The daily frequency description.',
  `HOURLY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The hourly frequency code.',
  `HOURLY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The hourly frequency name.',
  `HOURLY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The hourly frequency description.',
  `MONTHLY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The monthly frequency code.',
  `MONTHLY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The monthly frequency name.',
  `MONTHLY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The monthly frequency description.',
  `MAX_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The maximum annual rate.',
  `MID_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The midpoint annual rate.',
  `MIN_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The minimum annual rate.',
  `MAX_MONTHLY_RATE` Decimal(18,3)
 COMMENT 'The maximum monthly rate.',
  `MID_MONTHLY_RATE` Decimal(18,3)
 COMMENT 'The midpoint montly rate.',
  `MIN_MONTHLY_RATE` Decimal(18,3)
 COMMENT 'The minimum montly rate.',
  `MAX_DAILY_RATE` Decimal(18,3)
 COMMENT 'The maximum daily rate.',
  `MID_DAILY_RATE` Decimal(18,3)
 COMMENT 'The midpoint daily rate.',
  `MIN_DAILY_RATE` Decimal(18,3)
 COMMENT 'The minimum daily rate.',
  `MAX_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The maximum hourly rate.',
  `MID_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The midpoint hourly rate.',
  `MIN_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The minimum hourly rate.',
  `INCREMENT_DAY_QTY` Decimal(4,0)
 COMMENT 'The quantity of increment days.',
  `INCREMENT_WEEK_QTY` Decimal(4,0)
 COMMENT 'The quantity of increment weeks.',
  `STEP_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The step annual rate.',
  `STEP_DAILY_RATE` Decimal(18,3)
 COMMENT 'The step daily rate.',
  `STEP_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The step hourly rate.',
  `STEP_BIWEEKLY_RATE` Decimal(18,3)
 COMMENT 'The step biweekly rate.',
  `STEP_MONTHLY_RATE` Decimal(21,3)
 COMMENT 'The step monthly rate.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The salary plan dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SALARY_PLAN_AK` ON `DIMENSION_SALARY_PLAN` (`SALARY_PLAN_ID`,`SALARY_PLAN_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SALARY_ADMIN_PL_PK` ON `DIMENSION_SALARY_PLAN` (`SALARY_PLAN_SK`)
;

ALTER TABLE `DIMENSION_SALARY_PLAN` ADD  PRIMARY KEY (`SALARY_PLAN_SK`)
;

ALTER TABLE `DIMENSION_SALARY_PLAN` ADD UNIQUE `PK_DIMENSION_SALARY_PLAN` (`SALARY_PLAN_SK`)
;

-- Table DIMENSION_SALES_CHANNEL

CREATE TABLE `DIMENSION_SALES_CHANNEL`
(
  `SALES_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales channel surrogate key.',
  `SALES_CHANNEL_ID` Varchar(36)
 COMMENT 'The sales channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales channel in the source.',
  `SALES_CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The sales channel source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `SALES_CHANNEL_NAME` Varchar(60)
 COMMENT 'The sales channel name.',
  `SALES_CHANNEL_DESC` Varchar(255)
 COMMENT 'The sales channel description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales channel dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SALES_CHANNEL_AK` ON `DIMENSION_SALES_CHANNEL` (`SALES_CHANNEL_ID`,`SALES_CHANNEL_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SALES_CHANNEL_PK` ON `DIMENSION_SALES_CHANNEL` (`SALES_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_SALES_CHANNEL` ADD  PRIMARY KEY (`SALES_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_SALES_CHANNEL` ADD UNIQUE `PK_DIMENSION_SALES_CHANNEL` (`SALES_CHANNEL_SK`)
;

-- Table DIMENSION_SALES_LEAD

CREATE TABLE `DIMENSION_SALES_LEAD`
(
  `SALES_LEAD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales lead surrogate key.',
  `SALES_LEAD_ID` Varchar(36)
 COMMENT 'The sales lead identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead in the source.',
  `SALES_LEAD_SETID` Varchar(32) DEFAULT 'SHARE'
 COMMENT 'The source system sales lead SETID.  This column is often used as part of the unique identifer.',
  `SALES_LEAD_DESC` Varchar(255)
 COMMENT 'The sales lead description.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SALES_LEAD_OWNER_ID` Varchar(36)
 COMMENT 'The sales lead owner identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead owner in the source.',
  `SALES_LEAD_OWNER_NAME` Varchar(60)
 COMMENT 'The sales lead owner name.',
  `SALES_LEAD_TYPE_ID` Varchar(36)
 COMMENT 'The sales lead type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead type in the source.',
  `SALES_LEAD_TYPE_NAME` Varchar(60)
 COMMENT 'The sales lead type name.',
  `SALES_LEAD_TYPE_DESC` Varchar(255)
 COMMENT 'The sales lead type description.',
  `SALES_LEAD_CHANNEL_ID` Varchar(36)
 COMMENT 'The lead channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a lead channel in the source.',
  `SALES_LEAD_CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The lead channel source system SETID.  This column is often used as part of the unique identifer.',
  `SALES_LEAD_CHANNEL_NAME` Varchar(60)
 COMMENT 'The lead channel name.',
  `SALES_LEAD_CHANNEL_DESC` Varchar(255)
 COMMENT 'The lead channel description.',
  `SALES_LEAD_STATUS_ID` Varchar(36)
 COMMENT 'The lead status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a status in the source system.',
  `SALES_LEAD_STATUS_NAME` Varchar(60)
 COMMENT 'The sales lead status name.',
  `SALES_LEAD_STATUS_DESC` Varchar(255)
 COMMENT 'The sales lead status description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales lead dimension.'
;

CREATE INDEX `DIMENSION_SALES_LEAD_AK` ON `DIMENSION_SALES_LEAD` (`SALES_LEAD_ID`,`SALES_LEAD_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SALES_LEAD_PK` ON `DIMENSION_SALES_LEAD` (`SALES_LEAD_SK`)
;

CREATE INDEX `DIM_SALES_LEAD_CHANNEL_I` ON `DIMENSION_SALES_LEAD` (`SALES_LEAD_CHANNEL_NAME`)
;

CREATE UNIQUE INDEX `DIM_SALES_LEAD_TYPE_I` ON `DIMENSION_SALES_LEAD` (`SALES_LEAD_SK`,`SALES_LEAD_TYPE_NAME`)
;

ALTER TABLE `DIMENSION_SALES_LEAD` ADD  PRIMARY KEY (`SALES_LEAD_SK`)
;

ALTER TABLE `DIMENSION_SALES_LEAD` ADD UNIQUE `PK_DIMENSION_SALES_LEAD` (`SALES_LEAD_SK`)
;

-- Table DIMENSION_SALES_LEAD_CHANNEL

CREATE TABLE `DIMENSION_SALES_LEAD_CHANNEL`
(
  `SALES_LEAD_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The lead channel surrogate key.',
  `SALES_LEAD_CHANNEL_ID` Varchar(36)
 COMMENT 'The lead channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a lead channel in the source.',
  `SALES_LEAD_CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The lead channel source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SALES_LEAD_CHANNEL_NAME` Varchar(60)
 COMMENT 'The lead channel name.',
  `SALES_LEAD_CHANNEL_DESC` Varchar(255)
 COMMENT 'The lead channel description.',
  `SALES_LEAD_CHANNEL_CAT` Varchar(32)
 COMMENT 'The sales lead channel category.',
  `SALES_LEAD_CHANNEL_CAT_DESC` Varchar(255)
 COMMENT 'The sales lead channel category description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales lead channel dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SALES_LEAD_CHAN_AK` ON `DIMENSION_SALES_LEAD_CHANNEL` (`SALES_LEAD_CHANNEL_ID`,`SALES_LEAD_CHANNEL_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_LEAD_CHANNEL_PK` ON `DIMENSION_SALES_LEAD_CHANNEL` (`SALES_LEAD_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_SALES_LEAD_CHANNEL` ADD  PRIMARY KEY (`SALES_LEAD_CHANNEL_SK`)
;

ALTER TABLE `DIMENSION_SALES_LEAD_CHANNEL` ADD UNIQUE `PK_DIMENSION_SALES_LEAD_CHANNEL` (`SALES_LEAD_CHANNEL_SK`)
;

-- Table DIMENSION_SALES_LEAD_TYPE

CREATE TABLE `DIMENSION_SALES_LEAD_TYPE`
(
  `SALES_LEAD_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales lead type surrogate key.',
  `SALES_LEAD_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The sales lead type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an sales lead type in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SALES_LEAD_TYPE_NAME` Varchar(60)
 COMMENT 'The sales lead type name.',
  `SALES_LEAD_TYPE_DESC` Varchar(255)
 COMMENT 'The sales lead type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales lead type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SALES_LEAD_TYPE_AK` ON `DIMENSION_SALES_LEAD_TYPE` (`SALES_LEAD_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SALES_LEAD_TYPE_PK` ON `DIMENSION_SALES_LEAD_TYPE` (`SALES_LEAD_TYPE_SK`)
;

ALTER TABLE `DIMENSION_SALES_LEAD_TYPE` ADD  PRIMARY KEY (`SALES_LEAD_TYPE_SK`)
;

ALTER TABLE `DIMENSION_SALES_LEAD_TYPE` ADD UNIQUE `PK_DIMENSION_SALES_LEAD_TYPE` (`SALES_LEAD_TYPE_SK`)
;

-- Table DIMENSION_SALES_OPPORTUNITY

CREATE TABLE `DIMENSION_SALES_OPPORTUNITY`
(
  `SALES_OPPORTUNITY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales opportunity surrogate key.',
  `SALES_OPPORTUNITY_ID` Varchar(36)
 COMMENT 'The sales opportunity identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales opportunity in the source.',
  `SALES_OPPORTUNITY_SETID` Varchar(32) DEFAULT 'SHARE'
 COMMENT 'The source system sales lead SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SALES_OPPORTUNITY_NAME` Varchar(60)
 COMMENT 'The sales opportunity name.',
  `SALES_OPPORTUNITY_DESC` Varchar(255)
 COMMENT 'The sales opportunity description.',
  `SALES_OPPORTUNITY_TYPE_ID` Varchar(36)
 COMMENT 'The sales opportunity type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead type in the source.',
  `SALES_OPPORTUNITY_TYPE_NAME` Varchar(60)
 COMMENT 'The sales opportunity type name.',
  `SALES_OPPORTUNITY_TYPE_DESC` Varchar(255)
 COMMENT 'The sales opportunity type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales opportunity dimension.'
;

CREATE INDEX `DIMENSION_SALES_OPPORTUNITY_AK` ON `DIMENSION_SALES_OPPORTUNITY` (`SALES_OPPORTUNITY_ID`,`SALES_OPPORTUNITY_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SALES_OPPORTUNITY_PK` ON `DIMENSION_SALES_OPPORTUNITY` (`SALES_OPPORTUNITY_SK`)
;

ALTER TABLE `DIMENSION_SALES_OPPORTUNITY` ADD  PRIMARY KEY (`SALES_OPPORTUNITY_SK`)
;

ALTER TABLE `DIMENSION_SALES_OPPORTUNITY` ADD UNIQUE `PK_DIMENSION_SALES_OPPORTUNITY` (`SALES_OPPORTUNITY_SK`)
;

-- Table DIMENSION_SHIPMENT_PRIORITY

CREATE TABLE `DIMENSION_SHIPMENT_PRIORITY`
(
  `SHIP_PRIORITY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment priority surrogate key.',
  `SHIP_PRIORITY_ID` Varchar(36) NOT NULL
 COMMENT 'The shipment priority identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment priority in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SHIP_PRIORITY_NAME` Varchar(60)
 COMMENT 'The shipment priority name.',
  `SHIP_PRIORITY_DESC` Varchar(255)
 COMMENT 'The shipment priority description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipment priority dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SHIPMENT_PRIORI_AK` ON `DIMENSION_SHIPMENT_PRIORITY` (`SHIP_PRIORITY_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SHIPMENT_PRIORITY_PK` ON `DIMENSION_SHIPMENT_PRIORITY` (`SHIP_PRIORITY_SK`)
;

ALTER TABLE `DIMENSION_SHIPMENT_PRIORITY` ADD  PRIMARY KEY (`SHIP_PRIORITY_SK`)
;

ALTER TABLE `DIMENSION_SHIPMENT_PRIORITY` ADD UNIQUE `PK_DIMENSION_SHIPMENT_PRIORITY` (`SHIP_PRIORITY_SK`)
;

-- Table DIMENSION_SHIPMENT_ROUTE

CREATE TABLE `DIMENSION_SHIPMENT_ROUTE`
(
  `SHIP_ROUTE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment route surrogate key.',
  `SHIP_ROUTE_ID` Varchar(36) NOT NULL
 COMMENT 'The shipment route identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment route in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SHIP_ROUTE_NAME` Varchar(60)
 COMMENT 'The shipment route name.',
  `SHIP_ROUTE_DESC` Varchar(255)
 COMMENT 'The shipment route description.',
  `SHIP_ROUTE_DISTANCE_QTY` Double DEFAULT 0
 COMMENT 'The route travel distance.',
  `DISTANCE_UOM_ID` Varchar(36)
 COMMENT 'The route travel distance unit of measure',
  `TRAVEL_MINUTE_QTY` Double DEFAULT 0
 COMMENT 'The route travel time in minutes',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipment route dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SHIPMENT_ROUTE_AK` ON `DIMENSION_SHIPMENT_ROUTE` (`SHIP_ROUTE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SHIPMENT_ROUTE_PK` ON `DIMENSION_SHIPMENT_ROUTE` (`SHIP_ROUTE_SK`)
;

ALTER TABLE `DIMENSION_SHIPMENT_ROUTE` ADD  PRIMARY KEY (`SHIP_ROUTE_SK`)
;

ALTER TABLE `DIMENSION_SHIPMENT_ROUTE` ADD UNIQUE `PK_DIMENSION_SHIPMENT_ROUTE` (`SHIP_ROUTE_SK`)
;

-- Table DIMENSION_SHIPMENT_TYPE

CREATE TABLE `DIMENSION_SHIPMENT_TYPE`
(
  `SHIP_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment type surrogate key.',
  `SHIP_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The shipment type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment type in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SHIP_TYPE_NAME` Varchar(60)
 COMMENT 'The shipment type name.',
  `SHIP_TYPE_DESC` Varchar(255)
 COMMENT 'The shipment type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipment type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SHIPMENT_TYPE_AK` ON `DIMENSION_SHIPMENT_TYPE` (`SHIP_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SHIPMENT_TYPE_PK` ON `DIMENSION_SHIPMENT_TYPE` (`SHIP_TYPE_SK`)
;

ALTER TABLE `DIMENSION_SHIPMENT_TYPE` ADD  PRIMARY KEY (`SHIP_TYPE_SK`)
;

ALTER TABLE `DIMENSION_SHIPMENT_TYPE` ADD UNIQUE `PK_DIMENSION_SHIPMENT_TYPE` (`SHIP_TYPE_SK`)
;

-- Table DIMENSION_SOURCE_SYSTEM

CREATE TABLE `DIMENSION_SOURCE_SYSTEM`
(
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source  system surrogate key.  The SOURCE_SYSTEM_SK and SOURCE_SYSTEM_ID should  be valued exactly the same, i.e., for a given source system with a  SOURCE_SYSTEM_ID = 1, the SOURCE_SYSTEM_SK will also be = 1.  Both the  SOURCE_SYSTEM_ID and the SOURCE_SYSTEM_SK are owned by your clients analytics team they will have no meaning outside of this context.',
  `SOURCE_SYSTEM_ID` Varchar(36)
 COMMENT 'The source system  identifier.  The SOURCE_SYSTEM_SK and SOURCE_SYSTEM_ID should be valued exactly  the same, i.e., for a given source system with a SOURCE_SYSTEM_ID = 1,  the SOURCE_SYSTEM_SK will also be = 1.  Both the SOURCE_SYSTEM_ID and  the SOURCE_SYSTEM_SK are  owned  by your clients analytics team   they  will have no meaning outside of this context.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `SOURCE_SYSTEM_NAME` Varchar(60)
 COMMENT 'The source system name.',
  `SOURCE_SYSTEM_DESC` Varchar(255)
 COMMENT 'The source system  description.',
  `CONTACT_NAME` Varchar(60)
 COMMENT 'The source system contact  person name.',
  `CONTACT_EMAIL_DESC` Varchar(255)
 COMMENT 'The source system contact  person email address.',
  `SOURCE_SYSTEM_GROUP_CAT` Varchar(32)
 COMMENT 'The group source system category.  For example, WEB.',
  `PARENT_SOURCE_SYSTEM_NAME` Varchar(32)
 COMMENT 'The source system category.  For example, WEB SERVER LOG, APPLICATION SERVER LOG, PAGE TAGGER, etc.',
  `PARENT_SOURCE_SYSTEM_SK` Double
 COMMENT 'The parent source system surrogate key.',
  `DEFAULT_WEB_SOURCE_IND` Varchar(1)
 COMMENT 'This indicator denotes the default source of web data.  It is used to initially populate presentation objects.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The source system table maintains information about the systems source by the MDW.  Data is entered manually (or using some other method) by the analytics team.'
;

CREATE UNIQUE INDEX `DIMENSION_SOURCE_SYSTEM_AK` ON `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_ID`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_SOURCE_SYSTEM` ADD  PRIMARY KEY (`SOURCE_SYSTEM_SK`)
;

-- Table DIMENSION_STATISTICS

CREATE TABLE `DIMENSION_STATISTICS`
(
  `STATISTICS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The statistics surrogate key.',
  `STATISTICS_ID` Varchar(36)
 COMMENT 'The statistics identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies statistics in the source.',
  `STATISTICS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The statistics source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The statistics effective date.',
  `STATISTICS_NAME` Varchar(60)
 COMMENT 'The statistics name.',
  `STATISTICS_DESC` Varchar(255)
 COMMENT 'The statistics description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The statistics dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_STATISTICS_AK` ON `DIMENSION_STATISTICS` (`STATISTICS_ID`,`STATISTICS_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_STATISTICS_PK` ON `DIMENSION_STATISTICS` (`STATISTICS_SK`)
;

ALTER TABLE `DIMENSION_STATISTICS` ADD  PRIMARY KEY (`STATISTICS_SK`)
;

ALTER TABLE `DIMENSION_STATISTICS` ADD UNIQUE `PK_DIMENSION_STATISTICS` (`STATISTICS_SK`)
;

-- Table DIMENSION_SUBLEDGER

CREATE TABLE `DIMENSION_SUBLEDGER`
(
  `SUBLEDGER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The subledger surrogate key.',
  `SUBLEDGER_ID` Varchar(36)
 COMMENT 'The subledger identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subledger in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SUBLEDGER_NAME` Varchar(60)
 COMMENT 'The subledger name.',
  `SUBLEDGER_DESC` Varchar(255)
 COMMENT 'The subledger description.',
  `SUBLEDGER_TYPE_ID` Varchar(32)
 COMMENT 'The subledger type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subledger type in the source.',
  `SUBLEDGER_TYPE_NAME` Varchar(60)
 COMMENT 'The subledger type name.',
  `SUBLEDGER_TYPE_DESC` Varchar(255)
 COMMENT 'The subledger type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The subledger finance dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SUBLEDGER_AK` ON `DIMENSION_SUBLEDGER` (`SUBLEDGER_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SUBLEDGER_PK` ON `DIMENSION_SUBLEDGER` (`SUBLEDGER_SK`)
;

ALTER TABLE `DIMENSION_SUBLEDGER` ADD  PRIMARY KEY (`SUBLEDGER_SK`)
;

ALTER TABLE `DIMENSION_SUBLEDGER` ADD UNIQUE `PK_DIMENSION_SUBLEDGER` (`SUBLEDGER_SK`)
;

-- Table DIMENSION_SUPPLIER

CREATE TABLE `DIMENSION_SUPPLIER`
(
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.',
  `SUPPLIER_ID` Varchar(36) NOT NULL
 COMMENT 'The supplier identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a supplier in the source.',
  `SUPPLIER_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SUPPLIER_NAME` Varchar(60)
 COMMENT 'The supplier name.  If the supplier is a person, the name may be formatted FAMILY NAME, GIVEN NAME.',
  `SUPPLIER_MASTER_SK` Int DEFAULT 0
 COMMENT 'The supplier master surrogate key consolidates the same supplier that may occur in several source systems.  It is utilized by suppliers that have this rationalization requirement.  It is independent of SCD2 surrogate keys and it is not used in intrasystem hierarchies.',
  `DUNS_NUMBER` Varchar(32)
 COMMENT 'The Dun & Bradstreet number.',
  `PARENT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The parent Dun & Bradstreet number.',
  `ULT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The ultimate (parent) Dun & Bradstreet number.',
  `ALT_SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier alternate identifier.',
  `SINCE_DATE` Timestamp NULL
 COMMENT 'The date the entity became a supplier.',
  `ADD_DATE` Timestamp NULL
 COMMENT 'The date the supplier was added to the source system.',
  `SUPPLIER_STATUS_CODE` Varchar(1)
 COMMENT 'The supplier status code.',
  `SUPPLIER_STATUS_NAME` Varchar(60)
 COMMENT 'The supplier status name.',
  `SUPPLIER_STATUS_DESC` Varchar(255)
 COMMENT 'The supplier status description.',
  `SUPPLIER_STATUS_DATE` Timestamp NULL
 COMMENT 'The supplier status date.',
  `GEO_CODE` Varchar(32)
 COMMENT 'The geographical code.',
  `IN_CITY_LIMIT_IND` Varchar(1)
 COMMENT 'This denotes if a suppliers is physically located within the city.',
  `TIMEZONE_NAME` Varchar(32)
 COMMENT 'The timezone name.',
  `LATITUDE` Decimal(7,4)
 COMMENT 'The latitude of the supplier.',
  `LONGITUDE` Decimal(7,4)
 COMMENT 'The longitude of the supplier.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `STATE_PROVINCE_CODE` Varchar(3)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `SUPER_NATIONAL_NAME` Varchar(60)
 COMMENT 'The super national name.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `EMAIL_DOMAIN_DESC` Varchar(255)
 COMMENT 'The email domain.',
  `EMAIL_ADDRESS_DESC` Varchar(255)
 COMMENT 'The email address.',
  `PHONE_COUNTRY_CODE` Varchar(3)
 COMMENT 'The telephone country code.',
  `PHONE_REGION_CODE` Varchar(3)
 COMMENT 'The phone region, area, or city code.',
  `PHONE_NUMBER` Varchar(32)
 COMMENT 'The telephone number.',
  `PHONE_EXTENSION_NUMBER` Varchar(6)
 COMMENT 'The telephone extension number.',
  `SUPPLIER_TYPE_ID` Varchar(36)
 COMMENT 'The supplier type identifier.',
  `SUPPLIER_TYPE_CODE` Varchar(32)
 COMMENT 'The supplier type code.',
  `SUPPLIER_TYPE_NAME` Varchar(60)
 COMMENT 'The supplier type name.',
  `SUPPLIER_TYPE_DESC` Varchar(255)
 COMMENT 'The supplier type description.',
  `SUPPLIER_GROUP_CODE` Varchar(32)
 COMMENT 'The supplier group code.',
  `SUPPLIER_GROUP_NAME` Varchar(60)
 COMMENT 'The supplier group name.',
  `SUPPLIER_GROUP_DESC` Varchar(255)
 COMMENT 'The supplier group description.',
  `SUPPLIER_CLASS_CODE` Varchar(32)
 COMMENT 'The supplier classification code.',
  `SUPPLIER_CLASS_NAME` Varchar(60)
 COMMENT 'The supplier classification name.',
  `SUPPLIER_CLASS_DESC` Varchar(255)
 COMMENT 'The supplier classification description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The supplier dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_SUPPLIER_AK` ON `DIMENSION_SUPPLIER` (`SUPPLIER_ID`,`SUPPLIER_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_SUPPLIER_PK` ON `DIMENSION_SUPPLIER` (`SUPPLIER_SK`)
;

ALTER TABLE `DIMENSION_SUPPLIER` ADD  PRIMARY KEY (`SUPPLIER_SK`)
;

ALTER TABLE `DIMENSION_SUPPLIER` ADD UNIQUE `PK_DIMENSION_SUPPLIER` (`SUPPLIER_SK`)
;

-- Table DIMENSION_TIME

CREATE TABLE `DIMENSION_TIME`
(
  `TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The time of day surrogate key.',
  `TIME_24_CODE` Varchar(32)
 COMMENT 'The 24 hour time (e.g., 17:34).',
  `TIME_12_CODE` Varchar(32)
 COMMENT 'The 12 hour time (e.g., 5:34).',
  `HOUR_24_CODE` Varchar(32)
 COMMENT 'The hour (00 - 24) code for the time of day.',
  `HOUR_12_CODE` Varchar(32)
 COMMENT 'The hour (01 - 12) code for the time of day.',
  `AM_PM_IND` Varchar(2)
 COMMENT 'The AM/PM indicator.',
  `MINUTE_QTY` Decimal(2,0)
 COMMENT 'The number of minutes for the time of day (0-59).',
  `HOUR_24_QTY` Decimal(2,0)
 COMMENT 'The number of hours for the time of day (0-24).',
  `HOUR_12_QTY` Decimal(2,0)
 COMMENT 'The number of hours for the time of day (1-12).',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The time of day dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_TIME_PK` ON `DIMENSION_TIME` (`TIME_SK`)
;

ALTER TABLE `DIMENSION_TIME` ADD  PRIMARY KEY (`TIME_SK`)
;

ALTER TABLE `DIMENSION_TIME` ADD UNIQUE `PK_DIMENSION_TIME` (`TIME_SK`)
;

-- Table DIMENSION_TIME_REPORT_CODE

CREATE TABLE `DIMENSION_TIME_REPORT_CODE`
(
  `TIME_REPORT_CODE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The time report code surrogate key.',
  `TIME_REPORT_CODE_ID` Varchar(36)
 COMMENT 'The time report code identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a time report code in the source.',
  `TIME_REPORT_CODE` Varchar(32)
 COMMENT 'The time report code.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_STATUS_DATE` Timestamp NULL
 COMMENT 'The effective status date.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `TIME_REPORT_CODE_NAME` Varchar(60)
 COMMENT 'The time report code name.',
  `TIME_REPORT_CODE_DESC` Varchar(255)
 COMMENT 'The time report code description.',
  `TIME_REPORT_CODE_TYPE_CODE` Varchar(32)
 COMMENT 'The time report code type code.',
  `TIME_REPORT_CODE_TYPE_NAME` Varchar(60)
 COMMENT 'The time report code type name.',
  `TIME_REPORT_CODE_TYPE_DESC` Varchar(255)
 COMMENT 'The time report code type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The time report code dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_TIME_REPORT_COD_AK` ON `DIMENSION_TIME_REPORT_CODE` (`TIME_REPORT_CODE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_TIME_REPORT_COD_PK` ON `DIMENSION_TIME_REPORT_CODE` (`TIME_REPORT_CODE_SK`)
;

ALTER TABLE `DIMENSION_TIME_REPORT_CODE` ADD  PRIMARY KEY (`TIME_REPORT_CODE_SK`)
;

ALTER TABLE `DIMENSION_TIME_REPORT_CODE` ADD UNIQUE `PK_DIMENSION_TIME_REPORT_CODE` (`TIME_REPORT_CODE_SK`)
;

-- Table DIMENSION_TRANSACTION_STATUS

CREATE TABLE `DIMENSION_TRANSACTION_STATUS`
(
  `TRXN_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction status surrogate key.',
  `TRXN_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The transaction status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction status in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `TRXN_STATUS_NAME` Varchar(60)
 COMMENT 'The transaction status name.',
  `TRXN_STATUS_DESC` Varchar(255)
 COMMENT 'The transaction status description.',
  `TRXN_STATUS_CATEGORY` Varchar(60)
 COMMENT 'The transaction status category.',
  `TRXN_STATUS_CATEGORY_NAME` Varchar(60)
 COMMENT 'The transaction status category name.',
  `TRXN_STATUS_CATEGORY_DESC` Varchar(255)
 COMMENT 'The transaction status category description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The transaction status dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_TRANSACTION_STA_AK` ON `DIMENSION_TRANSACTION_STATUS` (`TRXN_STATUS_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_TRXN_STATUS_PK` ON `DIMENSION_TRANSACTION_STATUS` (`TRXN_STATUS_SK`)
;

ALTER TABLE `DIMENSION_TRANSACTION_STATUS` ADD  PRIMARY KEY (`TRXN_STATUS_SK`)
;

ALTER TABLE `DIMENSION_TRANSACTION_STATUS` ADD UNIQUE `PK_DIMENSION_TRANSACTION_STATUS` (`TRXN_STATUS_SK`)
;

-- Table DIMENSION_TRANSACTION_TYPE

CREATE TABLE `DIMENSION_TRANSACTION_TYPE`
(
  `TRXN_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction type surrogate key.',
  `TRXN_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The transaction type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction type in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `TRXN_TYPE_NAME` Varchar(60)
 COMMENT 'The transaction type name.',
  `TRXN_TYPE_CATEGORY` Varchar(60)
 COMMENT 'The transaction type category.',
  `TRXN_TYPE_TYPE_DESC` Varchar(255)
 COMMENT 'The transaction type description.',
  `TRXN_TYPE_CATEGORY_NAME` Varchar(60)
 COMMENT 'The transaction type category name.',
  `TRXN_TYPE_CATEGORY_DESC` Varchar(255)
 COMMENT 'The transaction type category description.',
  `TRXN_TYPE_OBJECT_NAME` Varchar(60)
 COMMENT 'The transaction type object name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `TRXN_TYPE_DESC` Varchar(255)
 COMMENT 'The transaction type description.'
)
 COMMENT = 'The transaction type dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_TRANSACTION_TYP_AK` ON `DIMENSION_TRANSACTION_TYPE` (`TRXN_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_TRANSACTION_TYPE_PK` ON `DIMENSION_TRANSACTION_TYPE` (`TRXN_TYPE_SK`)
;

ALTER TABLE `DIMENSION_TRANSACTION_TYPE` ADD  PRIMARY KEY (`TRXN_TYPE_SK`)
;

ALTER TABLE `DIMENSION_TRANSACTION_TYPE` ADD UNIQUE `PK_DIMENSION_TRANSACTION_TYPE` (`TRXN_TYPE_SK`)
;

-- Table DIMENSION_UNIT_OF_MEASURE

CREATE TABLE `DIMENSION_UNIT_OF_MEASURE`
(
  `UNIT_OF_MEASURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The unit of measure surrogate key.',
  `UNIT_OF_MEASURE_ID` Varchar(36) NOT NULL
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `UNIT_OF_MEASURE_NAME` Varchar(60)
 COMMENT 'The unit of measure name.',
  `UNIT_OF_MEASURE_DESC` Varchar(255)
 COMMENT 'The unit of measure description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The unit of measure dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_UNIT_OF_MEASURE_AK` ON `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_UNIT_OF_MEASURE_PK` ON `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`)
;

ALTER TABLE `DIMENSION_UNIT_OF_MEASURE` ADD  PRIMARY KEY (`UNIT_OF_MEASURE_SK`)
;

ALTER TABLE `DIMENSION_UNIT_OF_MEASURE` ADD UNIQUE `PK_DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`)
;

-- Table DIMENSION_WAREHOUSE

CREATE TABLE `DIMENSION_WAREHOUSE`
(
  `WAREHOUSE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The warehouse surrogate key.',
  `WAREHOUSE_ID` Varchar(36) NOT NULL
 COMMENT 'The warehouse identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a warehouse in the source.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `WAREHOUSE_NAME` Varchar(60)
 COMMENT 'The warehouse name.',
  `WAREHOUSE_DESC` Varchar(255)
 COMMENT 'The warehouse description.',
  `WAREHOUSE_STATUS_CODE` Varchar(1)
 COMMENT 'The warehouse status code.',
  `WAREHOUSE_STATUS_NAME` Varchar(60)
 COMMENT 'The warehouse status name.',
  `WAREHOUSE_STATUS_DESC` Varchar(255)
 COMMENT 'The warehouse status description.',
  `WAREHOUSE_STATUS_DATE` Timestamp NULL
 COMMENT 'The warehouse status date.',
  `GEO_CODE` Varchar(32)
 COMMENT 'The geographical code.',
  `TIMEZONE_NAME` Varchar(32)
 COMMENT 'The timezone name.',
  `LATITUDE` Decimal(7,4)
 COMMENT 'The latitude of the warehouse.',
  `LONGITUDE` Decimal(7,4)
 COMMENT 'The longitude of the warehouse.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `IN_CITY_LIMIT_IND` Varchar(1)
 COMMENT 'This denotes if a warehouses is physically located within the city.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `STATE_PROVINCE_CODE` Varchar(3)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `SUPER_NATIONAL_NAME` Varchar(60)
 COMMENT 'The super national name, i.e., European Union.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `WAREHOUSE_OWNERSHIP_IND` Varchar(32)
 COMMENT 'The warehouse ownership code.',
  `WAREHOUSE_OWNERSHIP_NAME` Varchar(60)
 COMMENT 'The warehouse ownership name.',
  `WAREHOUSE_OWNERSHIP_DESC` Varchar(255)
 COMMENT 'The warehouse ownership description.',
  `WAREHOUSE_TYPE_CODE` Varchar(32)
 COMMENT 'The warehouse type code.',
  `WAREHOUSE_TYPE_NAME` Varchar(60)
 COMMENT 'The warehouse type name.',
  `WAREHOUSE_TYPE_DESC` Varchar(255)
 COMMENT 'The warehouse type description.',
  `CLIMATE_CONTROL_IND` Varchar(1)
 COMMENT 'This denotes if a warehouse has climate control capabilities.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The warehouse dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_WAREHOUSE_AK` ON `DIMENSION_WAREHOUSE` (`WAREHOUSE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WAREHOUSE_PK` ON `DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`)
;

ALTER TABLE `DIMENSION_WAREHOUSE` ADD  PRIMARY KEY (`WAREHOUSE_SK`)
;

ALTER TABLE `DIMENSION_WAREHOUSE` ADD UNIQUE `PK_DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`)
;

-- Table DIMENSION_WEB_BROWSER_OS

CREATE TABLE `DIMENSION_WEB_BROWSER_OS`
(
  `WEB_BROWSER_OS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web browser operating system surrogate key.',
  `WEB_BROWSER_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The web browser name (e.g., Firefox 1.x).',
  `WEB_BROWSER_OS_DESC` Varchar(2000) DEFAULT 'Missing'
 COMMENT 'The web browser/OS description (e.g., Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4).',
  `PARENT_WEB_BROWSER_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The web browser parent name (e.g., Firefox).',
  `PARENT_OPERATING_SYSTEM_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The operating system name (e.g., Windows).',
  `OPERATING_SYSTEM_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The operating system name (e.g., Windows 98).',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table. ',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The web browser operating system dimension.  Every unique web browser os description from the web server log will have a row in this table.'
;

CREATE UNIQUE INDEX `DIMENSION_WEB_BROWSER_OS_AK` ON `DIMENSION_WEB_BROWSER_OS` (`WEB_BROWSER_OS_DESC`,`HOSTED_CLIENT_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WEB_BROWSER_OS_PK` ON `DIMENSION_WEB_BROWSER_OS` (`WEB_BROWSER_OS_SK`)
;

ALTER TABLE `DIMENSION_WEB_BROWSER_OS` ADD  PRIMARY KEY (`WEB_BROWSER_OS_SK`)
;

ALTER TABLE `DIMENSION_WEB_BROWSER_OS` ADD UNIQUE `DIMENSION_WEB_BROWSER_OS_AK` (`WEB_BROWSER_OS_DESC`)
;

ALTER TABLE `DIMENSION_WEB_BROWSER_OS` ADD UNIQUE `PK_DIMENSION_WEB_BROWSER_OS` (`WEB_BROWSER_OS_SK`)
;

-- Table DIMENSION_WEB_FILE

CREATE TABLE `DIMENSION_WEB_FILE`
(
  `WEB_FILE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web file surrogate key.',
  `WEB_FILE_NAME` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The web file name (e.g., /etl_maps.html).',
  `WEB_FILE_URL_DESC` Varchar(2000) DEFAULT 'Missing'
 COMMENT 'The web file URL description (e.g., http://www.breadboardbi.com/cubes.html).',
  `WEB_FILE_BYTE_QTY` Double
 COMMENT 'The web file byte quantity.',
  `WEB_FILE_CAT` Varchar(32) DEFAULT 'Missing'
 COMMENT 'The web file category (e.g., html).',
  `WEB_FILE_CAT_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The web file category name.  This could be used to further detail the shorter category.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The web file dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_WEB_FILE_AK` ON `DIMENSION_WEB_FILE` (`WEB_FILE_NAME`,`HOSTED_CLIENT_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WEBSITE_FILE_PK` ON `DIMENSION_WEB_FILE` (`WEB_FILE_SK`)
;

ALTER TABLE `DIMENSION_WEB_FILE` ADD  PRIMARY KEY (`WEB_FILE_SK`)
;

ALTER TABLE `DIMENSION_WEB_FILE` ADD UNIQUE `DIMENSION_WEB_FILE_AK` (`WEB_FILE_NAME`)
;

ALTER TABLE `DIMENSION_WEB_FILE` ADD UNIQUE `PK_DIMENSION_WEB_FILE` (`WEB_FILE_SK`)
;

-- Table DIMENSION_WEB_NAVIGATION_PATH

CREATE TABLE `DIMENSION_WEB_NAVIGATION_PATH`
(
  `WEB_NAVIGATION_PATH_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web navigation path surrogate key.',
  `WEB_NAVIGATION_PATH_DESC` Varchar(4000) DEFAULT 'Missing'
 COMMENT 'The web navigation path description.  This will be the names of the web pages visited during the session concatenated.',
  `PAGE_QTY` Int DEFAULT 1
 COMMENT 'The number of pages in a particular web navigation path.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `WEB_NAVIGATION_PATH_ID` Varchar(1000)
 COMMENT 'The web navigation path identifier.'
)
 COMMENT = 'The web navigation path dimension maintains the web navigation paths created by visitors during the course of a single visit.'
;

CREATE UNIQUE INDEX `DIMENSION_WEB_NAV_PATH_AK` ON `DIMENSION_WEB_NAVIGATION_PATH` (`WEB_NAVIGATION_PATH_DESC`)
;

CREATE UNIQUE INDEX `DIMENSION_WEB_NAVIGATION_PK` ON `DIMENSION_WEB_NAVIGATION_PATH` (`WEB_NAVIGATION_PATH_SK`)
;

CREATE INDEX `DIM_WEB_NAVIGATION_PATH_AK` USING BTREE ON `DIMENSION_WEB_NAVIGATION_PATH` (`WEB_NAVIGATION_PATH_ID`)
;

ALTER TABLE `DIMENSION_WEB_NAVIGATION_PATH` ADD  PRIMARY KEY (`WEB_NAVIGATION_PATH_SK`)
;

ALTER TABLE `DIMENSION_WEB_NAVIGATION_PATH` ADD UNIQUE `DIMENSION_WEB_NAV_PATH_AK` (`WEB_NAVIGATION_PATH_DESC`)
;

ALTER TABLE `DIMENSION_WEB_NAVIGATION_PATH` ADD UNIQUE `PK_DIMENSION_WEB_NAVIGATION_PATH` (`WEB_NAVIGATION_PATH_SK`)
;

-- Table DIMENSION_WEB_ORGANIZATION

CREATE TABLE `DIMENSION_WEB_ORGANIZATION`
(
  `WEB_ORGANIZATION_SK` Double NOT NULL
 COMMENT 'The web organization surrogate key.',
  `WEB_ORGANIZATION_DESC` Varchar(255)
 COMMENT 'The web organization description.',
  `LONG_IP_START_NUMBER` Int
 COMMENT 'The start number for the web organization long IP range.',
  `LONG_IP_END_NUMBER` Int
 COMMENT 'The end number for the web organization long IP range.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The web organization dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_WEB_ORG_AK` ON `DIMENSION_WEB_ORGANIZATION` (`WEB_ORGANIZATION_DESC`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_WEB_ORGANIZATION` ADD  PRIMARY KEY (`WEB_ORGANIZATION_SK`)
;

-- Table DIMENSION_WEB_SITE_REFERER

CREATE TABLE `DIMENSION_WEB_SITE_REFERER`
(
  `REFERER_URL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web site referer surrogate key.',
  `REFERER_URL_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The referer URL description.',
  `REFERER_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The referer description.',
  `PARENT_REFERER_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The parent referer description.',
  `REFERER_DOMAIN_DESC` Varchar(2000) DEFAULT 'Missing'
 COMMENT 'The referer domain from the URL.',
  `EXTERNAL_IND` Varchar(1)
 COMMENT 'This indicates if a referer page is external to the web site.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The web site referer dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_WEB_SITE_REFER_AK` ON `DIMENSION_WEB_SITE_REFERER` (`REFERER_URL_DESC`,`HOSTED_CLIENT_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WEBSITE_REFERRE_PK` ON `DIMENSION_WEB_SITE_REFERER` (`REFERER_URL_SK`)
;

CREATE INDEX `DIM_WEB_SITE_REFERER_AK` USING BTREE ON `DIMENSION_WEB_SITE_REFERER` (`REFERER_URL_DESC`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `DIMENSION_WEB_SITE_REFERER` ADD  PRIMARY KEY (`REFERER_URL_SK`)
;

ALTER TABLE `DIMENSION_WEB_SITE_REFERER` ADD UNIQUE `DIMENSION_WEB_SITE_REFER_AK` (`REFERER_URL_DESC`)
;

ALTER TABLE `DIMENSION_WEB_SITE_REFERER` ADD UNIQUE `PK_DIMENSION_WEB_SITE_REFERER` (`REFERER_URL_SK`)
;

-- Table DIMENSION_WEB_VISITOR

CREATE TABLE `DIMENSION_WEB_VISITOR`
(
  `WEB_VISITOR_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web site visitor surrogate key.',
  `WEB_VISITOR_LOGIN_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The web visitor login name (rarely used).',
  `WEB_VISITOR_FULL_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The web visitor full name (rarely used).',
  `WEB_BROWSER_OS_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The web browser operating system description.',
  `IP_ADDRESS_DESC` Varchar(2000) DEFAULT 'MIssing'
 COMMENT 'The IP address description, e.g., 192.168.0.100.',
  `LONG_IP_NUMBER` Int
 COMMENT 'The long IP address.',
  `WEB_ORGANIZATION_DESC` Varchar(255) DEFAULT 'Missing'
 COMMENT 'The web organization description.',
  `WEB_BROWSER_OS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web browser operating system description.',
  `GEO_LOCATION_SK` Int DEFAULT 0
 COMMENT 'The geographic location surrogate key.  This relates to the geographic location dimension.  It is included in this dimesion to allow dimensional analysis without joining to a large fact table.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `REGION_CODE` Varchar(32)
 COMMENT 'The region code (state, province, department, etc.).',
  `REGION_NAME` Varchar(60)
 COMMENT 'The region name (state, province, department, etc.).',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(32)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `LATITUDE_NUMBER` Decimal(7,4)
 COMMENT 'The latitude number.',
  `LONGITUDE_NUMBER` Decimal(7,4)
 COMMENT 'The longitude number.',
  `DMA_CODE` Int
 COMMENT 'The designated marketing area (DMA) code.',
  `DMA_NAME` Varchar(60)
 COMMENT 'The designated marketing area (DMA) name.',
  `PHONE_REGION_CODE` Int
 COMMENT 'The telephone region (area) code.',
  `TIMEZONE_DESC` Varchar(255)
 COMMENT 'The timezone description.',
  `ROBOT_QTY` Decimal(1,0) DEFAULT 0
 COMMENT 'The quantity of robot visitors.  This is set to 1 if a visitor is a robot, otherwise it defaults to 0.',
  `ROBOT_IND` Char(1)
 COMMENT 'This denotes if a visitor is a Robot.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The web visitor dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_WEB_VISITOR_AK` ON `DIMENSION_WEB_VISITOR` (`LONG_IP_NUMBER`,`HOSTED_CLIENT_SK`,`WEB_VISITOR_FULL_NAME`,`IP_ADDRESS_DESC`)
;

CREATE UNIQUE INDEX `DIMENSION_WEB_VISITOR_PK` ON `DIMENSION_WEB_VISITOR` (`WEB_VISITOR_SK`)
;

CREATE INDEX `DIM_WEB_VISITOR_GEO_LOC_FK` USING BTREE ON `DIMENSION_WEB_VISITOR` (`GEO_LOCATION_SK`)
;

CREATE INDEX `DIM_WEB_VISITOR_BROW_OS_FK` USING BTREE ON `DIMENSION_WEB_VISITOR` (`WEB_BROWSER_OS_SK`)
;

ALTER TABLE `DIMENSION_WEB_VISITOR` ADD  PRIMARY KEY (`WEB_VISITOR_SK`)
;

ALTER TABLE `DIMENSION_WEB_VISITOR` ADD UNIQUE `PK_DIMENSION_WEB_VISITOR` (`WEB_VISITOR_SK`)
;

-- Table DIMENSION_WORK_ORDER_CATEGORY

CREATE TABLE `DIMENSION_WORK_ORDER_CATEGORY`
(
  `WORK_ORDER_CATEGORY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order category surrogate key.',
  `WORK_ORDER_CATEGORY_ID` Varchar(36) NOT NULL
 COMMENT 'The work order category identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order category in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WORK_ORDER_CATEGORY_DESC` Varchar(255)
 COMMENT 'The work order category description.',
  `WORK_ORDER_CATEGORY_NAME` Varchar(60)
 COMMENT 'The work order category name.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order category dimension table.'
;

CREATE UNIQUE INDEX `DIMENSION_WO_CATEGORY_PK` ON `DIMENSION_WORK_ORDER_CATEGORY` (`WORK_ORDER_CATEGORY_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_CATEGORY` ADD  PRIMARY KEY (`WORK_ORDER_CATEGORY_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_CATEGORY` ADD UNIQUE `PK_DIMENSION_WORK_ORDER_CATEGORY` (`WORK_ORDER_CATEGORY_SK`)
;

-- Table DIMENSION_WORK_ORDER_PHASE

CREATE TABLE `DIMENSION_WORK_ORDER_PHASE`
(
  `WORK_ORDER_PHASE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order phase surrogate key.',
  `WORK_ORDER_PHASE_ID` Varchar(36) NOT NULL
 COMMENT 'The work order phase identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order phase in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WORK_ORDER_PHASE_DESC` Varchar(255)
 COMMENT 'The work order phase description.',
  `WORK_ORDER_PHASE_NAME` Varchar(60)
 COMMENT 'The work order phase name.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT SYSDATE
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order phase dimension table.'
;

CREATE UNIQUE INDEX `DIMENSION_WO_PHASE_AK` ON `DIMENSION_WORK_ORDER_PHASE` (`WORK_ORDER_PHASE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WO_PHASE_PK` ON `DIMENSION_WORK_ORDER_PHASE` (`WORK_ORDER_PHASE_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_PHASE` ADD  PRIMARY KEY (`WORK_ORDER_PHASE_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_PHASE` ADD UNIQUE `PK_DIMENSION_WORK_ORDER_PHASE` (`WORK_ORDER_PHASE_SK`)
;

-- Table DIMENSION_WORK_ORDER_STATUS

CREATE TABLE `DIMENSION_WORK_ORDER_STATUS`
(
  `WORK_ORDER_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order status surrogate key.',
  `WORK_ORDER_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The work order status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order status in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `WORK_ORDER_STATUS_DESC` Varchar(255)
 COMMENT 'The work order status description.',
  `WORK_ORDER_STATUS_NAME` Varchar(60)
 COMMENT 'The work order status name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order status dimension table.'
;

CREATE UNIQUE INDEX `DIMENSION_WO_STATUS_AK` ON `DIMENSION_WORK_ORDER_STATUS` (`WORK_ORDER_STATUS_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WO_STATUS_PK` ON `DIMENSION_WORK_ORDER_STATUS` (`WORK_ORDER_STATUS_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WO_STATUS_AK` ON `DIMENSION_WORK_ORDER_STATUS` (`WORK_ORDER_STATUS_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_STATUS` ADD  PRIMARY KEY (`WORK_ORDER_STATUS_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_STATUS` ADD UNIQUE `PK_DIMENSION_WORK_ORDER_STATUS` (`WORK_ORDER_STATUS_SK`)
;

-- Table DIMENSION_WORK_ORDER_TYPE

CREATE TABLE `DIMENSION_WORK_ORDER_TYPE`
(
  `WORK_ORDER_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order type surrogate key.',
  `WORK_ORDER_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The work order type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order type in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `WORK_ORDER_TYPE_DESC` Varchar(255)
 COMMENT 'The work order type description.',
  `WORK_ORDER_TYPE_NAME` Varchar(60)
 COMMENT 'The work order type name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order type dimension table.'
;

CREATE UNIQUE INDEX `DIMENSION_WO_TYPE_AK` ON `DIMENSION_WORK_ORDER_TYPE` (`WORK_ORDER_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WO_TYPE_PK` ON `DIMENSION_WORK_ORDER_TYPE` (`WORK_ORDER_TYPE_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WO_TYPE_AK` ON `DIMENSION_WORK_ORDER_TYPE` (`WORK_ORDER_TYPE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_TYPE` ADD  PRIMARY KEY (`WORK_ORDER_TYPE_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_TYPE` ADD UNIQUE `PK_DIMENSION_WORK_ORDER_TYPE` (`WORK_ORDER_TYPE_SK`)
;

-- Table DIMENSION_WORK_ORDER_VARIANCE

CREATE TABLE `DIMENSION_WORK_ORDER_VARIANCE`
(
  `WORK_ORDER_VARIANCE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order variance surrogate key.',
  `WORK_ORDER_VARIANCE_ID` Varchar(36) NOT NULL
 COMMENT 'The work order variance identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order variance in the source.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WORK_ORDER_VARIANCE_DESC` Varchar(255)
 COMMENT 'The work order variance description.',
  `WORK_ORDER_VARIANCE_NAME` Varchar(60)
 COMMENT 'The work order variance name.',
  `DW_VERSION_NUMBER` Set(18) DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order variance dimension table.'
;

CREATE UNIQUE INDEX `DIMENSION_WO_VARIANCE_AK` ON `DIMENSION_WORK_ORDER_VARIANCE` (`WORK_ORDER_VARIANCE_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WO_VARIANCE_PK` ON `DIMENSION_WORK_ORDER_VARIANCE` (`WORK_ORDER_VARIANCE_SK`)
;

CREATE UNIQUE INDEX `DIMENSION_WO_VARIANCE_AK` ON `DIMENSION_WORK_ORDER_VARIANCE` (`WORK_ORDER_VARIANCE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_VARIANCE` ADD  PRIMARY KEY (`WORK_ORDER_VARIANCE_SK`)
;

ALTER TABLE `DIMENSION_WORK_ORDER_VARIANCE` ADD UNIQUE `PK_DIMENSION_WORK_ORDER_VARIANCE` (`WORK_ORDER_VARIANCE_SK`)
;

-- Table FACT_ACCOUNT_PAYABLE

CREATE TABLE `FACT_ACCOUNT_PAYABLE`
(
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The accounts payable business unit surrogate key.  This relates to the business unit dimension.',
  `PAYMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The payment identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PAYMENT_LINE_ID` Varchar(36) NOT NULL DEFAULT 1
 COMMENT 'The payment line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `AP_PERSON_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The accounts payable person surrogate key.  This relates to the person dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `DOCUMENT_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The document type surrogate key.  This relates to the document type dimension.',
  `TRXN_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The payment transaction type surrogate key.  This relates to the transaction type dimension.',
  `PAYMENT_TRXN_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The payment transaction status surrogate key.  This relates to the transaction status dimension.',
  `PAYMENT_TRXN_TYPE_SK` Int DEFAULT "0"
 COMMENT 'The payment transaction type surrogate key.  This relates to the transaction type dimension.',
  `TRXN_POST_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The posted transaction status surrogate key.  This relates to the transaction status dimension.',
  `BANK_ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The bank account status surrogate key.  This relates to the bank account dimension.',
  `PAYMENT_METHOD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The payment method surrogate key.  This relates to the payment method dimension.',
  `PAYMENT_TERMS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The payment terms surrogate key.  This relates to the payment terms dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `CONTRACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The contract surrogate key.  This relates to the contract dimension.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.  This relates to the account dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `TRXN_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The transaction date surrogate key.  This relates to the day dimension.',
  `TRXN_DUE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The transaction due date surrogate key.  This relates to the day dimension.',
  `DISCOUNT_DUE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The discount due date surrogate key.  This relates to the day dimension.',
  `MAX_SCHEDULED_PAYMENT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The maximum scheduled payment date surrogate key.  This relates to the day dimension.',
  `REQUSITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `WAREHOUSE_RECEIPT_ID` Varchar(36)
 COMMENT 'The warehouse receipt identifier in the source system.  It is a degenerate dimension in the fact table.',
  `TRXN_DATE` Datetime
 COMMENT 'The transaction date.',
  `TRXN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction amount.',
  `TRXN_DISCOUNT_ELIGIBLE_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The discount eligible transaction amount.',
  `TRXN_ADJUSTMENT_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction adjustment amount.',
  `TRXN_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction paid amount.',
  `TRXN_OPEN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction open amount.',
  `TRXN_GROSS_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction gross paid amount.',
  `TRXN_DISCOUNT_ON_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction discount on paid amount.',
  `TRXN_DISCOUNT_LOST_ON_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction discount lost on paid amount.',
  `TRXN_LATE_CHARGE_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction late charge amount.',
  `TRXN_LATE_CHARGE_DENIED_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction late charge denied amount.',
  `TRXN_LATE_CHARGE_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction late charge paid amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 0
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account payable (transaction) fact table.'
;

CREATE UNIQUE INDEX `FACT_ACCOUNT_PAYABLE_PK` ON `FACT_ACCOUNT_PAYABLE` (`BUSINESS_UNIT_SK`,`PAYMENT_ID`,`PAYMENT_LINE_ID`)
;

CREATE INDEX `FACT_AP_BU_BI` ON `FACT_ACCOUNT_PAYABLE` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_AP_PERSON_BI` ON `FACT_ACCOUNT_PAYABLE` (`AP_PERSON_SK`)
;

CREATE INDEX `FACT_AP_SUPPLIER_BI` ON `FACT_ACCOUNT_PAYABLE` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_AP_DOC_TYPE_BI` ON `FACT_ACCOUNT_PAYABLE` (`DOCUMENT_TYPE_SK`)
;

CREATE INDEX `FACT_AP_TRXN_TYPE_BI` ON `FACT_ACCOUNT_PAYABLE` (`PAYMENT_TRXN_TYPE_SK`,`TRXN_TYPE_SK`)
;

CREATE INDEX `FACT_AP_TRXN_STATUS_BI` ON `FACT_ACCOUNT_PAYABLE` (`PAYMENT_TRXN_STATUS_SK`)
;

CREATE INDEX `FACT_AP_TRXN_POST_STATUS_BI` ON `FACT_ACCOUNT_PAYABLE` (`TRXN_POST_STATUS_SK`)
;

CREATE INDEX `FACT_AP_BANK_ACCOUNT_BI` ON `FACT_ACCOUNT_PAYABLE` (`BANK_ACCOUNT_SK`)
;

CREATE INDEX `FACT_AP_PAYMENT_METHOD_BI` ON `FACT_ACCOUNT_PAYABLE` (`PAYMENT_METHOD_SK`)
;

CREATE INDEX `FACT_AP_PAYMENT_TERMS_BI` ON `FACT_ACCOUNT_PAYABLE` (`PAYMENT_TERMS_SK`)
;

CREATE INDEX `FACT_AP_B_CRNCY_BI` ON `FACT_ACCOUNT_PAYABLE` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_AP_T_CRNCY_BI` ON `FACT_ACCOUNT_PAYABLE` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_AP_CONTRACT_BI` ON `FACT_ACCOUNT_PAYABLE` (`CONTRACT_SK`)
;

CREATE INDEX `FACT_AP_ACCOUNT_BI` ON `FACT_ACCOUNT_PAYABLE` (`ACCOUNT_SK`)
;

CREATE INDEX `FACT_AP_SOURCE_BI` ON `FACT_ACCOUNT_PAYABLE` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_AP_TRXN_DATE_BI` ON `FACT_ACCOUNT_PAYABLE` (`TRXN_DATE_SK`)
;

CREATE INDEX `FACT_AP_TRXN_DUE_DATE_BI` ON `FACT_ACCOUNT_PAYABLE` (`TRXN_DUE_DATE_SK`)
;

CREATE INDEX `FACT_AP_DISCOUNT_DUE_DATE_BI` ON `FACT_ACCOUNT_PAYABLE` (`DISCOUNT_DUE_DATE_SK`)
;

CREATE INDEX `FACT_AP_MAX_SCHDLD_PAY_DATE_BI` ON `FACT_ACCOUNT_PAYABLE` (`MAX_SCHEDULED_PAYMENT_DATE_SK`)
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD  PRIMARY KEY (`BUSINESS_UNIT_SK`,`PAYMENT_ID`,`PAYMENT_LINE_ID`)
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD UNIQUE `PK_FACT_ACCOUNT_PAYABLE` (`BUSINESS_UNIT_SK`,`PAYMENT_ID`,`PAYMENT_LINE_ID`)
;

-- Table FACT_ACCOUNT_RECEIVABLE

CREATE TABLE `FACT_ACCOUNT_RECEIVABLE`
(
  `RECEIVABLE_ID` Varchar(36) NOT NULL DEFAULT 1
 COMMENT 'The receivable identifier in the source system.  It is a degenerate dimension in the fact table.',
  `RECEIVABLE_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The receivable line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `JOURNAL_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The journal date surrogate key.  This relates to the day dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The accounts receivable business unit surrogate key.  This relates to the business unit dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `OPERATING_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The operating unit surrogate key.  This relates to the operating unit dimension.',
  `LEDGER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The ledger surrogate key.  This relates to the ledger dimension.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.  This relates to the account dimension.',
  `CLASSIFICATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The class surrogate key.  This relates to the class dimension.',
  `FUND_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The fund surrogate key.  This relates to the fund dimension.',
  `DEPARTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The department surrogate key.  This relates to the department dimension.',
  `PROGRAM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The program surrogate key.  This relates to the program dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BUDGET_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The budget forecast surrogate key.  This relates to the budget forecast dimension.',
  `DOCUMENT_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The document type surrogate key.  This relates to the document type dimension.',
  `INVOICE_ID` Varchar(36)
 COMMENT 'The invoice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `INVOICE_LINE_ID` Varchar(36)
 COMMENT 'The invoice line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PAYMENT_ID` Varchar(36)
 COMMENT 'The payment identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PAYMENT_LINE_ID` Varchar(36)
 COMMENT 'The payment line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `JOURNAL_DATE` Datetime
 COMMENT 'The journal entry date.',
  `TRXN_RECEIVABLE_AMT` Decimal(26,2)
 COMMENT 'The transaction receivable amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Double
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account receivable (transaction) fact table.'
;

CREATE INDEX `FACT_AR_JOURNAL_DATE_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`JOURNAL_DATE_SK`)
;

CREATE INDEX `FACT_AR_BU_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_AR_PRODUCT_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_AR_OPERATING_UNIT_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`OPERATING_UNIT_SK`)
;

CREATE INDEX `FACT_AR_LEDGER_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`LEDGER_SK`)
;

CREATE INDEX `FACT_AR_ACCOUNT_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`ACCOUNT_SK`)
;

CREATE INDEX `FACT_AR_CLASS_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`CLASSIFICATION_SK`)
;

CREATE INDEX `FACT_AR_FUND_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`FUND_SK`)
;

CREATE INDEX `FACT_AR_DEPARTMENT_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`DEPARTMENT_SK`)
;

CREATE INDEX `FACT_AR_PROGRAM_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`PROGRAM_SK`)
;

CREATE INDEX `FACT_AR_CUSTOMER_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_AR_B_CRNCY_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_AR_T_CRNCY_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_AR_BUDGET_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`BUDGET_SK`)
;

CREATE INDEX `FACT_AR_DOCUMENT_TYPE_BI` ON `FACT_ACCOUNT_RECEIVABLE` (`DOCUMENT_TYPE_SK`)
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD  PRIMARY KEY (`RECEIVABLE_ID`,`RECEIVABLE_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD UNIQUE `PK_FACT_ACCOUNT_RECEIVABLE` (`RECEIVABLE_ID`,`RECEIVABLE_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_ADVERTISEMENT_IMPRESSION

CREATE TABLE `FACT_ADVERTISEMENT_IMPRESSION`
(
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) UNSIGNED DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `IMPRESSION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The ad impression date surrogate key.  This column may be used to partition the fact table by time.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The marketing activity surrogate key.  This relates to the marketing campaign dimension.',
  `AD_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The advertisement surrogate key.  This relates to the advertisement dimension.',
  `KEYWORD_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The keyword phrase surrogate key.  This relates to the keyword phrase dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `AD_IMPRESSION_QTY` Int UNSIGNED DEFAULT 0
 COMMENT 'The advertisement impression quantity.',
  `AD_CLICK_QTY` Int UNSIGNED DEFAULT 0
 COMMENT 'The advertisement click quantity.',
  `AD_COST_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The advertisement cost quantity.',
  `AVERAGE_POSITION_QTY` Int UNSIGNED DEFAULT 0
 COMMENT 'The average advertisement position quantity.',
  `IMPRESSION_DATE` Datetime
 COMMENT 'The impression date.',
  `CPC_AVERAGE_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The average cost per click (CPC) amount (ad cost amount / ad click quantity).',
  `AD_CLICK_RATE` Decimal(9,5) DEFAULT 0
 COMMENT 'The advertisement click rate.',
  `CONTENT_BID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The content bid amount.',
  `PREFERED_HIGH_RANK_QTY` Int UNSIGNED DEFAULT 0
 COMMENT 'The preferred high rank quantity.',
  `PREFERED_LOW_RANK_QTY` Int UNSIGNED DEFAULT 0
 COMMENT 'The preferred low rank quantity.',
  `HOSTED_CLIENT_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'The advertisement impression fact table.'
;

CREATE INDEX `FACT_AD_IMPRESSION_AD_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`AD_SK`)
;

CREATE INDEX `FACT_AD_IMPRESSION_CAMPAIGN_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`CAMPAIGN_WAVE_SK`)
;

CREATE INDEX `FACT_AD_IMPRESSION_CRNCY_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_AD_IMPRESSION_CUST_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_AD_IMPRESSION_KEYWORD_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`KEYWORD_SK`)
;

CREATE INDEX `FACT_AD_IMPRESSION_PRODUCT_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_AD_IMPRESSION_SOURCE_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_AD_IMPRESS_BASE_CRNCY_FK` USING BTREE ON `FACT_ADVERTISEMENT_IMPRESSION` (`BASE_CURRENCY_SK`)
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD  PRIMARY KEY (`IMPRESSION_DATE_SK`,`CUSTOMER_SK`,`CAMPAIGN_WAVE_SK`,`AD_SK`,`KEYWORD_SK`)
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD UNIQUE `PK_FACT_ADVERTISEMENT_IMPRESSION` (`IMPRESSION_DATE_SK`,`CUSTOMER_SK`,`CAMPAIGN_WAVE_SK`,`AD_SK`)
;

-- Table FACT_BILLING

CREATE TABLE `FACT_BILLING`
(
  `INVOICE_ID` Varchar(36) NOT NULL
 COMMENT 'The invoice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `INVOICE_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The invoice line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BILL_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The bill status surrogate key.  This relates to the bill status dimension.',
  `BILL_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The bill type surrogate key.  This relates to the bill type dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CUSTOMER_BILL_TO_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The bill to customer surrogate key.  This relates to the customer dimension.',
  `CUSTOMER_SHIP_TO_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The ship to customer surrogate key.  This relates to the customer dimension.',
  `ORDER_CAPTURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The order capture surrogate key.  This relates to the order capture dimension.',
  `ORDER_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The order type surrogate key.  This relates to the order type dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SALES_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales channel surrogate key.  This relates to the sales channel dimension.',
  `SALES_REPRESENTATIVE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales person surrogate key.  This relates to the day dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `UNIT_OF_MEASURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `ORDER_CAPTURE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The order (capture) date surrogate key.  This relates to the day dimension.',
  `INVOICE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The invoice date surrogate key.  This column may be used to partition the fact table by time.',
  `ACCOUNTING_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The accounting date surrogate key.  This relates to the day dimension.',
  `ORDER_CAPTURE_DATE` Datetime
 COMMENT 'The order date.',
  `INVOICE_DATE` Datetime
 COMMENT 'The invoice date.',
  `ACCOUNTING_DATE` Datetime
 COMMENT 'The accounting date.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `ORDER_CAPTURE_ID` Varchar(36)
 COMMENT 'The order (capture) source system identifier.  It is a degenerate dimension in the order capture fact table.',
  `ORDER_CAPTURE_LINE_ID` Varchar(36)
 COMMENT 'The order line number.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimenension in the order capture fact table.  Note:  this may or not be a numeric value.',
  `PURCHASE_ORDER_LINE_ID` Varchar(36)
 COMMENT 'The customer purchase order (PO) line identifier in the source system.  It is a degenerate dimenension in the order capture fact table.',
  `TRXN_INVOICE_AMT` Decimal(26,2)
 COMMENT 'The transaction invoice amount.',
  `TRXN_DISCOUNT_AMT` Decimal(26,2)
 COMMENT 'The transaction discount amount.',
  `TRXN_SURCHARGE_AMT` Decimal(26,2)
 COMMENT 'The transaction surcharge amount.',
  `TRXN_TAX_AMT` Decimal(26,2)
 COMMENT 'The transaction tax amount.',
  `TRXN_GROSS_EXTENDED_AMT` Decimal(26,2)
 COMMENT 'The transaction gross extended amount.',
  `TRXN_NET_EXTENDED_AMT` Decimal(26,2)
 COMMENT 'The transaction net extended amount.',
  `TRXN_COST_AMT` Decimal(26,2)
 COMMENT 'The transaction cost amount.',
  `TRXN_FREIGHT_AMT` Decimal(26,2)
 COMMENT 'The transaction freight amount.',
  `TRXN_CREDIT_AMT` Decimal(26,2)
 COMMENT 'The transaction credit amount.',
  `TRXN_LIST_AMT` Decimal(26,2)
 COMMENT 'The transaction list amount.',
  `TRXN_REBATE_AMT` Decimal(26,2)
 COMMENT 'The transaction rebate amount.',
  `TRXN_SERVICE_FEE_AMT` Decimal(26,2)
 COMMENT 'The transaction service fee amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `BILLED_QTY` Decimal(26,0)
 COMMENT 'The billed unit quantity.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The billing (invoice line) fact table.'
;

CREATE INDEX `FACT_BILLING_BILL_STATUS_BI` ON `FACT_BILLING` (`BILL_STATUS_SK`)
;

CREATE INDEX `FACT_BILLING_BILL_TYPE_BI` ON `FACT_BILLING` (`BILL_TYPE_SK`)
;

CREATE INDEX `FACT_BILLING_BU_BI` ON `FACT_BILLING` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_BILLING_CUST_BILL_BI` ON `FACT_BILLING` (`CUSTOMER_BILL_TO_SK`)
;

CREATE INDEX `FACT_BILLING_CUST_SHIP_BI` ON `FACT_BILLING` (`CUSTOMER_SHIP_TO_SK`)
;

CREATE INDEX `FACT_BILLING_ORDER_BI` ON `FACT_BILLING` (`ORDER_CAPTURE_SK`)
;

CREATE INDEX `FACT_BILLING_ORDER_TYPE_BI` ON `FACT_BILLING` (`ORDER_TYPE_SK`)
;

CREATE INDEX `FACT_BILLING_PRODUCT_BI` ON `FACT_BILLING` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_BILLING_SALES_REP_BI` ON `FACT_BILLING` (`SALES_REPRESENTATIVE_SK`)
;

CREATE INDEX `FACT_BILLING_SALES_CHANNEL_BI` ON `FACT_BILLING` (`SALES_CHANNEL_SK`)
;

CREATE INDEX `FACT_BILLING_B_CRNCY_BI` ON `FACT_BILLING` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_BILLING_T_CRNCY_BI` ON `FACT_BILLING` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_BILLING_UOM_BI` ON `FACT_BILLING` (`UNIT_OF_MEASURE_SK`)
;

CREATE INDEX `FACT_BILLING_ORDER_DATE_BI` ON `FACT_BILLING` (`ORDER_CAPTURE_DATE_SK`)
;

CREATE INDEX `FACT_BILLING_INVOICE_DATE_BI` ON `FACT_BILLING` (`INVOICE_DATE_SK`)
;

CREATE INDEX `FACT_BILLING_ACCNTNG_DATE_BI` ON `FACT_BILLING` (`ACCOUNTING_DATE_SK`)
;

ALTER TABLE `FACT_BILLING` ADD  PRIMARY KEY (`INVOICE_ID`,`INVOICE_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_BUDGET_FORECAST

CREATE TABLE `FACT_BUDGET_FORECAST`
(
  `FISCAL_PERIOD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The fiscal period surrogate key.  This relates to the fiscal period dimension.',
  `BUDGET_FRCST_ITEM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The budget forecast item surrogate key.  This relates to the budget forecast item dimension.',
  `BUDGET_ITEM_SK` Int NOT NULL DEFAULT "0"
 COMMENT 'The budget item surrogate key.  This relates to the budget forecast item dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `COST_CENTER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The cost center surrogate key.  This relates to the cost center dimension.',
  `DEPARTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The department surrogate key.  This relates to the department dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `OPERATING_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The operating unit surrogate key.  This relates to the operating unit dimension.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.  This relates to the account dimension.',
  `UNIT_OF_MEASURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `ORDER_BUDGET_AMT` Double DEFAULT 0
 COMMENT 'The order budget amount.',
  `ORDER_FRCST_AMT` Double
 COMMENT 'The order forecast amount.',
  `ORDER_BUDGET_QTY` Double DEFAULT 0
 COMMENT 'The order budget quantity.',
  `ORDER_FRCST_QTY` Double
 COMMENT 'The order budget forecast quantity.',
  `ORDER_ACTUALS_AMT` Double DEFAULT 0
 COMMENT 'The order actuals amount.',
  `ORDER_ACTUALS_QTY` Double DEFAULT 0
 COMMENT 'The order actuals quantity.',
  `MANUFACTURING_BUDGET_AMT` Double DEFAULT 0
 COMMENT 'The manufacturing budget amount.',
  `MANUFACTURING_FRCST_AMT` Double
 COMMENT 'The manufacturing forecast amount.',
  `MANUFACTURING_BUDGET_QTY` Double DEFAULT 0
 COMMENT 'The manufacturing budget quantity.',
  `MANUFACTURING_FRCST_QTY` Double
 COMMENT 'The manufacturing forecast quantity.',
  `MANUFACTURING_ACTUALS_QTY` Double DEFAULT 0
 COMMENT 'The manufacturing actuals quantity.',
  `MANUFACTURING_ACTUALS_AMT` Double DEFAULT 0
 COMMENT 'The manufacturing actuals amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `FRCST_ITEM_SK` Int NOT NULL DEFAULT "0"
 COMMENT 'The forecast item surrogate key.  This relates to the budget forecast item dimension.'
)
 COMMENT = 'The budget forecast item fact table.'
;

CREATE INDEX `FACT_BDGT_FRCST_PERIOD_BI` ON `FACT_BUDGET_FORECAST` (`FISCAL_PERIOD_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_ITEM_BI` ON `FACT_BUDGET_FORECAST` (`BUDGET_ITEM_SK`,`BUDGET_FRCST_ITEM_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_BU_BI` ON `FACT_BUDGET_FORECAST` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_COST_CENTER_BI` ON `FACT_BUDGET_FORECAST` (`COST_CENTER_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_DEPT_BI` ON `FACT_BUDGET_FORECAST` (`DEPARTMENT_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_CUST_BI` ON `FACT_BUDGET_FORECAST` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_PRODUCT_BI` ON `FACT_BUDGET_FORECAST` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_OPER_UNIT_BI` ON `FACT_BUDGET_FORECAST` (`OPERATING_UNIT_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_ACCOUNT_BI` ON `FACT_BUDGET_FORECAST` (`ACCOUNT_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_UOM_BI` ON `FACT_BUDGET_FORECAST` (`UNIT_OF_MEASURE_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_T_CRNCY_BI` ON `FACT_BUDGET_FORECAST` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_BDGT_FRCST_B_CRNCY_BI` ON `FACT_BUDGET_FORECAST` (`BASE_CURRENCY_SK`)
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD  PRIMARY KEY (`FISCAL_PERIOD_SK`,`BUDGET_FRCST_ITEM_SK`,`BUSINESS_UNIT_SK`,`COST_CENTER_SK`,`DEPARTMENT_SK`,`CUSTOMER_SK`,`PRODUCT_SK`,`OPERATING_UNIT_SK`,`ACCOUNT_SK`)
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD UNIQUE `PK_FACT_BUDGET_FORECAST` (`FISCAL_PERIOD_SK`,`BUDGET_ITEM_SK`,`BUSINESS_UNIT_SK`,`COST_CENTER_SK`,`DEPARTMENT_SK`,`CUSTOMER_SK`,`PRODUCT_SK`,`OPERATING_UNIT_SK`,`ACCOUNT_SK`)
;

-- Table FACT_CASE

CREATE TABLE `FACT_CASE`
(
  `CASE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case surrogate key.  This relates to the case dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `AGREEMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The service agreement surrogate key.  This relates to the agreement dimension.',
  `AGENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The agent surrogate key.  This relates to the person dimension.',
  `PRIOR_AGENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The prior agent surrogate key.  This relates to the person dimension.',
  `CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The currency surrogate key.  This relates to the currency dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `CUSTOMER_CONTACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The customer contact surrogate key.  This relates to the customer contact dimension.',
  `PARTNER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The partner surrogate key.  This relates to the partner dimension.',
  `PARTNER_CONTACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The partner contact surrogate key.  This relates to the partner contact dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `PROVIDER_GROUP_SK` Int NOT NULL
 COMMENT 'The provider group surrogate key.  This relates to the provider group dimension.',
  `REGION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The region surrogate key.  This relates to the region dimension.',
  `CASE_OPEN_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The case open date surrogate key.  This column may be used to partition the fact table by time.',
  `CASE_OPEN_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case open time surrogate key.  This relates to the time dimension.',
  `CASE_CLOSED_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case closed time surrogate key.  This relates to the time dimension.',
  `CASE_CLOSED_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The case closed date surrogate key.  This column may be used to partition the fact table by time.',
  `RESPONSE_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The response time surrogate key.  This relates to the time dimension.',
  `CASE_ID` Varchar(36)
 COMMENT 'The case identifier in the source system.  It is a degenerate dimension in the fact table.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It is a degenerate dimension in the fact table.',
  `CASE_OPEN_DATE` Datetime
 COMMENT 'The case open date.',
  `RESPONSE_DATE` Datetime
 COMMENT 'The response date.',
  `TARGET_CLOSE_DATE` Datetime
 COMMENT 'The target close date.',
  `CASE_CLOSED_DATE` Datetime
 COMMENT 'The case closed date.',
  `CASE_SLA_QTY` Double
 COMMENT 'The quantity of cases governed by a service level agreement (SLA).',
  `CASE_RESOLVED_QTY` Double
 COMMENT 'The quantity of resolved cases.',
  `CASE_OPEN_MINUTE_QTY` Double
 COMMENT 'The quantity of minutes the case was open.',
  `RESTORED_FIRST_CONTACT_QTY` Double
 COMMENT 'The quantity of cases resolved during the first contact.',
  `SLA_RESPONSE_COMPLIANCE_QTY` Double
 COMMENT 'The quantity of cases responded to in compliance with a service level agreement (SLA).',
  `SLA_RESTORED_COMPLIANCE_QTY` Double
 COMMENT 'The quantity of cases resolved in compliance with a service level agreement (SLA).',
  `SOLUTION_QTY` Double
 COMMENT 'The quantity of cases responded to with a specified solution.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case fact table.'
;

CREATE UNIQUE INDEX `FACT_CASE_AK` ON `FACT_CASE` (`CASE_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_CASE_CASE_BI` ON `FACT_CASE` (`CASE_SK`)
;

CREATE INDEX `FACT_CASE_BU_BI` ON `FACT_CASE` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_CASE_SOURCE_BI` ON `FACT_CASE` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_CASE_AGREEMENT_BI` ON `FACT_CASE` (`AGREEMENT_SK`)
;

CREATE INDEX `FACT_CASE_AGENT_BI` ON `FACT_CASE` (`AGENT_SK`)
;

CREATE INDEX `FACT_CASE_PRIOR_AGENT_BI` ON `FACT_CASE` (`PRIOR_AGENT_SK`)
;

CREATE INDEX `FACT_CASE_CRNCY_BI` ON `FACT_CASE` (`CURRENCY_SK`)
;

CREATE INDEX `FACT_CASE_CUST_BI` ON `FACT_CASE` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_CASE_CUST_CONTACT_BI` ON `FACT_CASE` (`CUSTOMER_CONTACT_SK`)
;

CREATE INDEX `FACT_CASE_PARTNER_BI` ON `FACT_CASE` (`PARTNER_SK`)
;

CREATE INDEX `FACT_CASE_PARTNER_CONTACT_BI` ON `FACT_CASE` (`PARTNER_CONTACT_SK`)
;

CREATE INDEX `FACT_CASE_PRODUCT_BI` ON `FACT_CASE` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_CASE_PROVIDER_GROUP_BI` ON `FACT_CASE` (`PROVIDER_GROUP_SK`)
;

CREATE INDEX `FACT_CASE_REGION_BI` ON `FACT_CASE` (`REGION_SK`)
;

CREATE INDEX `FACT_CASE_OPEN_DATE_BI` ON `FACT_CASE` (`CASE_OPEN_DATE_SK`)
;

CREATE INDEX `FACT_CASE_OPEN_TIME_BI` ON `FACT_CASE` (`CASE_OPEN_TIME_SK`)
;

CREATE INDEX `FACT_CASE_CLOSED_TIME_BI` ON `FACT_CASE` (`CASE_CLOSED_TIME_SK`)
;

CREATE INDEX `FACT_CASE_CLOSED_DATE_BI` ON `FACT_CASE` (`CASE_CLOSED_DATE_SK`)
;

ALTER TABLE `FACT_CASE` ADD  PRIMARY KEY (`CASE_SK`,`BUSINESS_UNIT_SK`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_CONTACT_CENTER_CALL

CREATE TABLE `FACT_CONTACT_CENTER_CALL`
(
  `CALL_ID` Varchar(36) NOT NULL
 COMMENT 'The call identifier in the source system.  It is a degenerate dimension in the fact table.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `AGENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The agent surrogate key.  This relates to the person dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CALL_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call type surrogate key.  This relates to the call type dimension.',
  `CALL_RESULT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call result surrogate key.  This relates to the call result dimension.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.  This relates to the campaign wave surrogate key.',
  `CASE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case surrogate key.  This relates to the case dimension.',
  `CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The currency surrogate key.  This relates to the currency dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `CALL_START_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call start time surrogate key.  This relates to the time dimension.',
  `CALL_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The call start date surrogate key.',
  `CALL_END_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call end time surrogate key.  This relates to the time dimension.',
  `CALL_END_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The call end date surrogate key.',
  `CALL_REQUEST_ID` Varchar(36)
 COMMENT 'The call request identifier (out bound calls) in the source system.  It is a degenerate dimension in the fact table.',
  `CALL_START_DATE` Datetime
 COMMENT 'The call start date.',
  `CALL_END_DATE` Datetime
 COMMENT 'The call end date.',
  `CALL_QTY` Double
 COMMENT 'The quantity of calls.',
  `CALL_SECOND_QTY` Double
 COMMENT 'The call second quantity.',
  `AGENT_QTY` Double
 COMMENT 'The quantity of agents assigned to the call.',
  `SEGMENT_QTY` Double
 COMMENT 'The quantity of call segments.',
  `CALLER_ABANDONED_QTY` Double
 COMMENT 'The quantity of caller abandoned calls.',
  `CONFERENCE_QTY` Double
 COMMENT 'The quantity of conference calls.',
  `HOLD_QTY` Double
 COMMENT 'The quantity of calls placed on hold.',
  `INBOUND_QTY` Double
 COMMENT 'The quantity of inbound calls.',
  `OUTBOUND_QTY` Double
 COMMENT 'The quantity of outbound calls.',
  `QUEUE_QTY` Double
 COMMENT 'The quantity of calls placed in the queue.',
  `TRANSFER_QTY` Double
 COMMENT 'The quantity of transfer calls.',
  `TRANSFER_WRONG_QTY` Double
 COMMENT 'The quantity of transfer wrong number calls.',
  `TRANSFER_ABANDONED_QTY` Double
 COMMENT 'The quantity of transfer abandoned number calls.',
  `TRANSFER_FAILED_QTY` Double
 COMMENT 'The quantity of transfer failed calls.',
  `MACHINE_LEFT_MESSAGE_QTY` Double
 COMMENT 'The quantity of messages left on a machine.',
  `LISTENED_QTY` Double
 COMMENT 'The quantity of calls listened to by the recipient.',
  `RECIPIENT_HANG_UP_QTY` Double
 COMMENT 'The quantity of calls when the customer was not available.',
  `MACHINE_HANG_UP_QTY` Double
 COMMENT 'The quantity of answering machine hang ups.',
  `NO_ANSWER_QTY` Double
 COMMENT 'The quantity of unanswered calls.',
  `LINE_BUSY_QTY` Double
 COMMENT 'The quantity of line busy calls.',
  `FAX_ANSWER_QTY` Double
 COMMENT 'The quantity of call answered by a fax machine.',
  `ATTEMPTED_INVALID_QTY` Double
 COMMENT 'The quantity of invalid (non working) telephone number calls.',
  `NOT_ATTEMPTED_QTY` Double
 COMMENT 'The quantity of calls not attempted.',
  `NOT_ATTEMPTED_INVALID_QTY` Double
 COMMENT 'The quantity of calls determined to be invalid and not attempted.',
  `AGENT_ABANDONED_QTY` Double
 COMMENT 'The quantity of agent abandoned quantity.',
  `DIAL_SECOND_QTY` Double
 COMMENT 'The dial second quantity.',
  `RING_SECOND_QTY` Double
 COMMENT 'The ring second quantity.',
  `QUEUE_SECOND_QTY` Double
 COMMENT 'The queue second quantity.',
  `TRANSFER_SECOND_QTY` Double
 COMMENT 'The transfer second quantity.',
  `HOLD_SECOND_QTY` Double
 COMMENT 'The hold second quantity.',
  `AGENT_SECOND_QTY` Double
 COMMENT 'The agent second quantity.',
  `CONFERENCE_SECOND_QTY` Double
 COMMENT 'The conference second quantity.',
  `CALL_BILL_AMT` Decimal(26,2)
 COMMENT 'The call bill amount.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The contact call center fact table.'
;

CREATE UNIQUE INDEX `FACT_CONTACT_CENTER_CALL_AK` ON `FACT_CONTACT_CENTER_CALL` (`CALL_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_CC_CALL_AGENT_BI` ON `FACT_CONTACT_CENTER_CALL` (`AGENT_SK`)
;

CREATE INDEX `FACT_CC_CALL_TYPE_AGENT_BI` ON `FACT_CONTACT_CENTER_CALL` (`CALL_TYPE_SK`)
;

CREATE INDEX `FACT_CC_CALL_RESULT_BI` ON `FACT_CONTACT_CENTER_CALL` (`CALL_RESULT_SK`)
;

CREATE INDEX `FACT_CC_CALL_CAMPAIGN_WAVE_BI` ON `FACT_CONTACT_CENTER_CALL` (`CAMPAIGN_WAVE_SK`)
;

CREATE INDEX `FACT_CC_CALL_CASE_BI` ON `FACT_CONTACT_CENTER_CALL` (`CASE_SK`)
;

CREATE INDEX `FACT_CC_CALL_CRNCY_BI` ON `FACT_CONTACT_CENTER_CALL` (`CURRENCY_SK`)
;

CREATE INDEX `FACT_CC_CALL_CUST_BI` ON `FACT_CONTACT_CENTER_CALL` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_CC_CALL_PRODUCT_BI` ON `FACT_CONTACT_CENTER_CALL` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_CC_CALL_START_TIME_BI` ON `FACT_CONTACT_CENTER_CALL` (`CALL_START_TIME_SK`)
;

CREATE INDEX `FACT_CC_CALL_START_DATE_BI` ON `FACT_CONTACT_CENTER_CALL` (`CALL_START_DATE_SK`)
;

CREATE INDEX `FACT_CC_CALL_END_TIME_BI` ON `FACT_CONTACT_CENTER_CALL` (`CALL_END_TIME_SK`)
;

CREATE INDEX `FACT_CC_CALL_END_DATE_BI` ON `FACT_CONTACT_CENTER_CALL` (`CALL_END_DATE_SK`)
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD  PRIMARY KEY (`CALL_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_CONTACT_CENTER_OUT_CALL

CREATE TABLE `FACT_CONTACT_CENTER_OUT_CALL`
(
  `CALL_ID` Varchar(36) NOT NULL
 COMMENT 'The call identifier in the source system.  It is a degenerate dimension in the fact table.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `AGENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The agent surrogate key.  This relates to the person dimension.',
  `CALL_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call type surrogate key.  This relates to the call type dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `CASE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The case surrogate key.  This relates to the case dimension.',
  `CALL_RESULT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call result surrogate key.  This relates to the call result dimension.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.  This relates to the campaign wave surrogate key.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `CALL_START_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call start time surrogate key.  This relates to the time dimension.',
  `CALL_END_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The call end time surrogate key.  This relates to the time dimension.',
  `CALL_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The call start date surrogate key.',
  `CALL_END_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The call end date surrogate key.',
  `CALL_START_DATE` Datetime
 COMMENT 'The call start date.',
  `CALL_END_DATE` Datetime
 COMMENT 'The call end date.',
  `CALL_QTY` Double DEFAULT 0
 COMMENT 'The quantity of calls.',
  `RECIPIENT_ABANDONED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of recipient abandoned calls.',
  `AGENT_QTY` Double DEFAULT 0
 COMMENT 'The quantity of agents assigned to the call.',
  `CONFERENCE_QTY` Double DEFAULT 0
 COMMENT 'The quantity of conference calls.',
  `HOLD_QTY` Double DEFAULT 0
 COMMENT 'The quantity of calls placed on hold.',
  `QUEUE_QTY` Double DEFAULT 0
 COMMENT 'The quantity of calls placed in the queue.',
  `SEGMENT_QTY` Double DEFAULT 0
 COMMENT 'The quantity of call segments.',
  `TRANSFER_QTY` Double DEFAULT 0
 COMMENT 'The quantity of transfer calls.',
  `CALL_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The call second quantity.',
  `CONFERENCE_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The conference second quantity.',
  `DIAL_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The dial second quantity.',
  `RING_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The ring second quantity.',
  `QUEUE_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The queue second quantity.',
  `TRANSFER_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The transfer second quantity.',
  `HOLD_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The hold second quantity.',
  `CALL_BILL_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The call bill amount.',
  `AGENT_SECOND_QTY` Double DEFAULT 0
 COMMENT 'The agent second quantity.',
  `TRANSFER_WRONG_QTY` Double DEFAULT 0
 COMMENT 'The quantity of transfer wrong number calls.',
  `TRANSFER_ABANDONED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of transfer abandoned number calls.',
  `TRANSFER_FAILED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of transfer failed calls.',
  `MACHINE_LEFT_MESSAGE_QTY` Double DEFAULT 0
 COMMENT 'The quantity of messages left on a machine.',
  `RECIPIENT_LISTENED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of calls listened to by the recipient.',
  `RECIPIENT_HANG_UP_QTY` Double DEFAULT 0
 COMMENT 'The quantity of calls when the customer was not available.',
  `MACHINE_HANG_UP_QTY` Double DEFAULT 0
 COMMENT 'The quantity of answering machine hang ups.',
  `NO_ANSWER_QTY` Double DEFAULT 0
 COMMENT 'The quantity of unanswered calls.',
  `LINE_BUSY_QTY` Double DEFAULT 0
 COMMENT 'The quantity of line busy calls.',
  `FAX_ANSWER_QTY` Double DEFAULT 0
 COMMENT 'The quantity of call answered by a fax machine.',
  `ATTEMPTED_INVALID_QTY` Double DEFAULT 0
 COMMENT 'The quantity of invalid (non working) telephone number calls.',
  `NOT_ATTEMPTED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of calls not attempted.',
  `NOT_ATTEMPTED_INVALID_QTY` Double DEFAULT 0
 COMMENT 'The quantity of calls determined to be invalid and not attempted.',
  `CALL_REQUEST_ID` Varchar(36)
 COMMENT 'The call request identifier (out bound calls) in the source system.  It is a degenerate dimension in the fact table.',
  `AGENT_ABANDONED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of agent abandoned calls.',
  `CONNECTED_CALL_QTY` Double DEFAULT 0
 COMMENT 'The quantity of connected calls.  Connected calls include operator transfers, recipient abandoned transfers, agent abandoned transfers, machine left messages, recipient listened, and recipient hang up calls.',
  `UNCONNECTED_CALL_QTY` Double DEFAULT 0
 COMMENT 'The quantity of unconnected calls.  Unconnected calls include invalid number, fax, no answer, and busy calls.',
  `CONNECTION_SECOND_QTY` Double
 COMMENT 'The connection second quantity.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

CREATE UNIQUE INDEX `FACT_CC_OUT_CALL_AK` ON `FACT_CONTACT_CENTER_OUT_CALL` (`CALL_ID`,`BUSINESS_UNIT_ID`)
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD  PRIMARY KEY (`CALL_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_MARKET_BASKET

CREATE TABLE `FACT_MARKET_BASKET`
(
  `SALE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sale (order) date surrogate key.  This column may be used to partition the fact table by time.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `PRODUCT1_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product 1 surrogate key.  This relates to the product dimension.',
  `PRODUCT2_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product 2 surrogate key.  This relates to the product dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `PRODUCT_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The product unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `SALE_DATE` Timestamp NULL
 COMMENT 'The sale date.',
  `BASKET_QTY` Decimal(10,0)
 COMMENT 'The number of baskets with the particular product combination.',
  `PRODUCT1_SALES_QTY` Double
 COMMENT 'The quantity of product1 sold with product2.',
  `PRODUCT1_PRICE_AMT` Decimal(26,2)
 COMMENT 'The price amount of product1 sold with product2.',
  `PRODUCT1_RECURRING_PRICE_AMT` Decimal(26,2)
 COMMENT 'The recurring price of product1 sold with product2.',
  `PRODUCT2_SALES_QTY` Double
 COMMENT 'The quantity of product2 sold with product1.',
  `PRODUCT2_PRICE_AMT` Decimal(26,2)
 COMMENT 'The price amount of product2 sold with product1.',
  `PRODUCT2_RECURRING_PRICE_AMT` Decimal(26,2)
 COMMENT 'The recurring price amount of product2 sold with product1.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The market basket fact table.'
;

CREATE INDEX `FACT_MARKET_BASKET_BI` ON `FACT_MARKET_BASKET` (`SALE_DATE_SK`)
;

CREATE INDEX `FACT_MARKET_BASKET_BU_BI` ON `FACT_MARKET_BASKET` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_MARKET_BASKET_CUST_BI` ON `FACT_MARKET_BASKET` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_MARKET_BASKET_PRODUCT1_BI` ON `FACT_MARKET_BASKET` (`PRODUCT1_SK`)
;

CREATE INDEX `FACT_MARKET_BASKET_PRODUCT2_BI` ON `FACT_MARKET_BASKET` (`PRODUCT2_SK`)
;

CREATE INDEX `FACT_MKT_BASKET_UOM_FK` USING BTREE ON `FACT_MARKET_BASKET` ()
;

CREATE INDEX `FACT_MKT_BASKET_BASE_CRNCY_BI` USING BTREE ON `FACT_MARKET_BASKET` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_MKT_BASKET_TRXN_CRNCY_BI` USING BTREE ON `FACT_MARKET_BASKET` (`TRXN_CURRENCY_SK`)
;

ALTER TABLE `FACT_MARKET_BASKET` ADD  PRIMARY KEY (`SALE_DATE_SK`,`CUSTOMER_SK`,`BUSINESS_UNIT_SK`,`PRODUCT1_SK`,`PRODUCT2_SK`)
;

-- Table FACT_PAYABLE_TIME

CREATE TABLE `FACT_PAYABLE_TIME`
(
  `REPORT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The report date surrogate key.  This column may be used to partition the fact table by time.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `TIME_REPORT_CODE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The time report code surrogate key.  This relates to the time report code dimension.',
  `COMPANY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The company surrogate key.  This relates to the company dimension.',
  `LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The location surrogate key.  This relates to the location dimension.',
  `DEPARTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The department surrogate key.  This relates to the department dimension.',
  `JOBCODE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The jobcode surrogate key.  This relates to the jobcode dimension.',
  `POSITION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The position surrogate key.  This relates to the position dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `EMPLOYEE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The employee person surrogate key.  This relates to the person dimension.',
  `PROJECT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The project surrogate key.  This relates to the project dimension.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.  This relates to the account dimension.',
  `FUND_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The fund surrogate key.  This relates to the fund dimension.',
  `CLASSIFICATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The class surrogate key.  This relates to the class dimension.',
  `OPERATING_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The operating unit surrogate key.  This relates to the operating unit dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `TIME_REPORT_ID` Varchar(36) NOT NULL
 COMMENT 'The time report identifier in the source system.  It is a degenerate dimension in the fact table.',
  `TIME_REPORT_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The time report line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `REPORT_DATE` Datetime
 COMMENT 'The time report date.',
  `HOUR_QTY` Decimal(18,6) DEFAULT 0
 COMMENT 'The quantity of hours.',
  `HOUR_RATE` Double DEFAULT 0
 COMMENT 'The rate per hour for the employee.',
  `PAYABLE_AMT` Double DEFAULT 0
 COMMENT 'The payable time amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The payable time fact table.'
;

CREATE INDEX `FACT_PAY_TIME_REPORT_DATE_BI` ON `FACT_PAYABLE_TIME` (`REPORT_DATE_SK`)
;

CREATE INDEX `FACT_PAY_TIME_BU_BI` ON `FACT_PAYABLE_TIME` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_PAY_TIME_TRC_BI` ON `FACT_PAYABLE_TIME` (`TIME_REPORT_CODE_SK`)
;

CREATE INDEX `FACT_PAY_TIME_COMPANY_BI` ON `FACT_PAYABLE_TIME` (`COMPANY_SK`)
;

CREATE INDEX `FACT_PAY_TIME_LOCATION_BI` ON `FACT_PAYABLE_TIME` (`LOCATION_SK`)
;

CREATE INDEX `FACT_PAY_TIME_DEPT_BI` ON `FACT_PAYABLE_TIME` (`DEPARTMENT_SK`)
;

CREATE INDEX `FACT_PAY_TIME_JOBCODE_BI` ON `FACT_PAYABLE_TIME` (`JOBCODE_SK`)
;

CREATE INDEX `FACT_PAY_TIME_POSITION_BI` ON `FACT_PAYABLE_TIME` (`POSITION_SK`)
;

CREATE INDEX `FACT_PAY_TIME_PRODUCT_BI` ON `FACT_PAYABLE_TIME` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_PAY_TIME_CUST_BI` ON `FACT_PAYABLE_TIME` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_PAY_TIME_EMPLOYEE_BI` ON `FACT_PAYABLE_TIME` (`EMPLOYEE_SK`)
;

CREATE INDEX `FACT_PAY_TIME_PROJECT_BI` ON `FACT_PAYABLE_TIME` (`PROJECT_SK`)
;

CREATE INDEX `FACT_PAY_TIME_ACCOUNT_BI` ON `FACT_PAYABLE_TIME` (`ACCOUNT_SK`)
;

CREATE INDEX `FACT_PAY_TIME_FUND_BI` ON `FACT_PAYABLE_TIME` (`FUND_SK`)
;

CREATE INDEX `FACT_PAY_TIME_CLASS_BI` ON `FACT_PAYABLE_TIME` (`CLASSIFICATION_SK`)
;

CREATE INDEX `FACT_PAY_TIME_OPER_UNIT_BI` ON `FACT_PAYABLE_TIME` (`OPERATING_UNIT_SK`)
;

CREATE INDEX `FACT_PAY_TIME_T_CRNCY_BI` ON `FACT_PAYABLE_TIME` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_PAY_TIME_B_CRNCY_BI` ON `FACT_PAYABLE_TIME` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_PAY_TIME_SOURCE_BI` ON `FACT_PAYABLE_TIME` (`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD  PRIMARY KEY (`TIME_REPORT_ID`,`TIME_REPORT_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_PERSON_APPLICATION

CREATE TABLE `FACT_PERSON_APPLICATION`
(
  `APPLICATION_ID` Varchar(36) NOT NULL
 COMMENT 'The application identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `APPLICANT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The applicant person surrogate key.  This relates to the person dimension.',
  `POSITION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The position surrogate key.  This relates to the position dimension.',
  `RECRUITER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The recruiter person surrogate key.  This relates to the person dimension.',
  `RECRUITMENT_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The recruitment channel surrogate key.  This relates to the recruitment channel dimension.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.  The relates to the campaign wave dimension.',
  `RECRUITMENT_EVENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The recruitment event surrogate key.  This relates to the recruitment event dimension.',
  `APPLICATION_STATUS_SK` Int NOT NULL
 COMMENT 'The (current) application status surrogate key.  This relates to the application status dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `APPLICATION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The application date surrogate key.  This column may be used to partition the fact table by time.',
  `REVIEW_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The application review date surrogate key.  This relates to the day dimension.',
  `TEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The applicant test date surrogate key.  This relates to the day dimension.',
  `REJECT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The application rejection date surrogate key.  This relates to the day dimension.',
  `INTERVIEW_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The applicant interview date surrogate key.  This relates to the day dimension.',
  `OFFER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The offer extended date surrogate key.  This relates to the day dimension.',
  `ACCEPT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The offer acceptance date surrogate key.  This relates to the day dimension.',
  `DECLINE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The offer declined date surrogate key.  This relates to the day dimension.',
  `START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The applicant work start date surrogate key.  This relates to the day dimension.',
  `REQUISITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  This is a degenerated dimension in the fact table.',
  `APPLICATION_DATE` Datetime
 COMMENT 'The application date.',
  `REVIEW_DATE` Datetime
 COMMENT 'The application review date.',
  `TEST_DATE` Datetime
 COMMENT 'The applicant test date.',
  `REJECT_DATE` Datetime
 COMMENT 'The applicant rejection date.',
  `INTERVIEW_DATE` Datetime
 COMMENT 'The applicant interview date.',
  `OFFER_DATE` Datetime
 COMMENT 'The offer extended date.',
  `ACCEPT_DATE` Datetime
 COMMENT 'The offer acceptance date.',
  `DECLINE_DATE` Datetime
 COMMENT 'The offer declined date.',
  `START_DATE` Datetime
 COMMENT 'The applicant work start date.',
  `SCORE_QTY` Double DEFAULT 0
 COMMENT 'The applicant score quantity.',
  `INTERNAL_QTY` Double DEFAULT 0
 COMMENT 'The quantity of internal applicants.',
  `EXTERNAL_QTY` Double DEFAULT 0
 COMMENT 'The quantity of external applicants.',
  `DAY_TO_FILL_QTY` Double DEFAULT 0
 COMMENT 'The time to fill quantity in days.',
  `APPLICATION_QTY` Double DEFAULT 0
 COMMENT 'The application quantity.',
  `REVIEW_QTY` Double DEFAULT 0
 COMMENT 'The  quantity of applications in the review status.',
  `TEST_QTY` Double DEFAULT 0
 COMMENT 'The quantity of applications in the test status.',
  `REJECT_QTY` Double DEFAULT 0
 COMMENT 'The  quantity of applications in the rejected status.',
  `INTERVIEW_QTY` Double DEFAULT 0
 COMMENT 'The  quantity of applications in the interview status.',
  `OFFER_QTY` Double DEFAULT 0
 COMMENT 'The  quantity of applications in the extended offer status.',
  `ACCEPT_QTY` Double DEFAULT 0
 COMMENT 'The  quantity of applications in the accepted status.',
  `DECLINE_QTY` Double DEFAULT 0
 COMMENT 'The  quantity of applications in the declined status.',
  `HIGH_PERFORMER_QTY` Double DEFAULT 0
 COMMENT 'The quantity of candiates that become high performers.',
  `RECEIVED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of applications in the received status.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The person application fact table.'
;

CREATE INDEX `FACT_PERSON_APPL_SOURCE_BI` ON `FACT_PERSON_APPLICATION` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_APPLICANT_BI` ON `FACT_PERSON_APPLICATION` (`APPLICANT_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_POSITION_BI` ON `FACT_PERSON_APPLICATION` (`POSITION_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_RECRUITER_BI` ON `FACT_PERSON_APPLICATION` (`RECRUITER_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_RCRT_CHNL_BI` ON `FACT_PERSON_APPLICATION` (`RECRUITMENT_CHANNEL_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_CMPGN_WAVE_BI` ON `FACT_PERSON_APPLICATION` (`CAMPAIGN_WAVE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_RCRT_EVENT_BI` ON `FACT_PERSON_APPLICATION` (`RECRUITMENT_EVENT_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_APPL_STAT_BI` ON `FACT_PERSON_APPLICATION` (`APPLICATION_STATUS_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_BU_BI` ON `FACT_PERSON_APPLICATION` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_APPL_DATE_BI` ON `FACT_PERSON_APPLICATION` (`APPLICATION_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_REV_DATE_BI` ON `FACT_PERSON_APPLICATION` (`REVIEW_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_TEST_DATE_BI` ON `FACT_PERSON_APPLICATION` (`TEST_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_RJCT_DATE_BI` ON `FACT_PERSON_APPLICATION` (`REJECT_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_INT_DATE_BI` ON `FACT_PERSON_APPLICATION` (`INTERVIEW_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_OFFER_DATE_BI` ON `FACT_PERSON_APPLICATION` (`OFFER_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_ACPT_DATE_BI` ON `FACT_PERSON_APPLICATION` (`ACCEPT_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_DEC_DATE_BI` ON `FACT_PERSON_APPLICATION` (`DECLINE_DATE_SK`)
;

CREATE INDEX `FACT_PERSON_APPL_START_DATE_BI` ON `FACT_PERSON_APPLICATION` (`START_DATE_SK`)
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD  PRIMARY KEY (`APPLICATION_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_PHYSICAL_INVENTORY

CREATE TABLE `FACT_PHYSICAL_INVENTORY`
(
  `SNAPSHOT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The inventory snapshot date surrogate key.  This column may be used to partition the fact table by time.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `PRODUCT_LOT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The inventory item lot surrogate key.  This relates to the inventory item lot dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `WAREHOUSE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The warehouse surrogate key.  This relates to the warehouse dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `INV_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The inventory unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `TRXN_CURRENCY_SK` Int DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `SNAPSHOT_DATE` Datetime
 COMMENT 'The physical inventory snapshot date.',
  `LATEST_SNAPSHOT_IND` Char(1)
 COMMENT 'The latest snapshot indicator.',
  `INV_OPEN_QTY` Double DEFAULT 0
 COMMENT 'The quantity of items in the open status.',
  `INV_RESTRICTED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of items in the restricted status.',
  `INV_HOLD_QTY` Double DEFAULT 0
 COMMENT 'The quantity of items in the hold status.',
  `INV_REJECTED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of items in the rejected status.',
  `INV_UNIT_COST_AMT` Decimal(26,2)
 COMMENT 'The unit cost of the product.  This is a sum of all costs that can be attributed to a product unit (e.g., raw material, transportation, indirect costs, etc.).',
  `INV_UNIT_PRICE_AMT` Decimal(26,2)
 COMMENT 'The standard unit price of the product offered to customers.  This is generic across customers and often does not reflect the price actually offered to customers.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT "1.000000000"
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The physical inventory fact table represents the inventory at a particular point in time.'
;

CREATE INDEX `FACT_PHYSICAL_INV_SNAP_DATE_BI` ON `FACT_PHYSICAL_INVENTORY` (`SNAPSHOT_DATE_SK`)
;

CREATE INDEX `FACT_PHYSICAL_INV_PRODUCT_BI` ON `FACT_PHYSICAL_INVENTORY` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_PHYSICAL_INV_LOT_BI` ON `FACT_PHYSICAL_INVENTORY` (`PRODUCT_LOT_SK`)
;

CREATE INDEX `FACT_PHYSICAL_INV_BU_BI` ON `FACT_PHYSICAL_INVENTORY` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_PHYSICAL_INV_WAREHOUSE_BI` ON `FACT_PHYSICAL_INVENTORY` (`WAREHOUSE_SK`)
;

CREATE INDEX `FACT_PHYSICAL_INV_SUPPLIER_BI` ON `FACT_PHYSICAL_INVENTORY` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_PHYSICAL_INV_UOM_BI` ON `FACT_PHYSICAL_INVENTORY` (`INV_UOM_SK`)
;

CREATE INDEX `FACT_PHYSICAL_INV_SOURCE_BI` ON `FACT_PHYSICAL_INVENTORY` (`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD  PRIMARY KEY (`SNAPSHOT_DATE_SK`,`PRODUCT_SK`,`PRODUCT_LOT_SK`,`BUSINESS_UNIT_SK`,`WAREHOUSE_SK`,`SUPPLIER_SK`,`INV_UOM_SK`)
;

-- Table FACT_PROCUREMENT

CREATE TABLE `FACT_PROCUREMENT`
(
  `REQUISITION_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `REQUISITION_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CONTRACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The contract surrogate key.  This relates to the contract dimension.',
  `WAREHOUSE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The warehouse surrogate key.  This relates to the warehouse dimension.',
  `REQUISITION_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requisition unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `PO_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The purchase order unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `SHIPPED_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipped unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `RECEIVED_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The received unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `REQUISITION_TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requisition transaction currency surrogate key.  This relates to the currency dimension.',
  `REQUISITION_BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requisition base currency surrogate key.  This relates to the currency dimension.',
  `PO_TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The purchase order transaction currency surrogate key.  This relates to the currency dimensi',
  `PO_BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The purchase order base currency surrogate key.  This relates to the currency dimension.',
  `REQUEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The request date surrogate key.  This relates to the day dimension.',
  `REQUISITION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The requisition date surrogate key.  This relates to the day dimension.',
  `PURCHASE_ORDER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The purchase order date surrogate key.  This relates to the day dimension.',
  `SHIPPING_NOTICE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The shipping notice date surrogate key.  This relates to the day dimension.',
  `SHIP_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The shipped date surrogate key.  This relates to the day dimension.',
  `WAREHOUSE_RECEIPT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The warehouse receipt date surrogate key.  This relates to the day dimension.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `REQUEST_DATE` Datetime
 COMMENT 'The request date.',
  `REQUISITION_DATE` Datetime
 COMMENT 'The requisition date.',
  `PURCHASE_ORDER_DATE` Datetime
 COMMENT 'The purchase order date.',
  `SHIPPING_NOTICE_DATE` Datetime
 COMMENT 'The shipping notice date.',
  `SHIP_DATE` Datetime
 COMMENT 'The shipped date.',
  `WAREHOUSE_RECEIPT_DATE` Datetime
 COMMENT 'The warehouse receipt date.',
  `REQUISITION_QTY` Double DEFAULT 0
 COMMENT 'The quantity of product requested for purchase.  This may or may not be the actual amount later purchased from a supplier using a purchase order.',
  `REQUISITION_TRXN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The requisition transaction amount.',
  `PURCHASE_ORDER_TRXN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The purchase order transaction amount.',
  `PURCHASE_ORDER_QTY` Double DEFAULT 0
 COMMENT 'The quantity of product purchased from a supplier using a purchase order.',
  `SHIPPED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of product shipped by the supplier.',
  `RECEIVED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of product received by the warehouse.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The procurement fact table brings together related requisition, purchase order, shipment notice, and warehouse receipt information.'
;

CREATE INDEX `FACT_PROCURE_SOURCE_BI` ON `FACT_PROCUREMENT` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_PROCURE_PRODUCT_BI` ON `FACT_PROCUREMENT` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_PROCURE_SUPPLIER_BI` ON `FACT_PROCUREMENT` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_PROCURE_BU_BI` ON `FACT_PROCUREMENT` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_PROCURE_CONTRACT_BI` ON `FACT_PROCUREMENT` (`CONTRACT_SK`)
;

CREATE INDEX `FACT_PROCURE_WAREHOUSE_BI` ON `FACT_PROCUREMENT` (`WAREHOUSE_SK`)
;

CREATE INDEX `FACT_PROCURE_RQSTN_UOM_BI` ON `FACT_PROCUREMENT` (`REQUISITION_UOM_SK`)
;

CREATE INDEX `FACT_PROCURE_PO_UOM_BI` ON `FACT_PROCUREMENT` (`PO_UOM_SK`)
;

CREATE INDEX `FACT_PROCURE_SHIPPED_UOM_BI` ON `FACT_PROCUREMENT` (`SHIPPED_UOM_SK`)
;

CREATE INDEX `FACT_PROCURE_RQCVD_UOM_BI` ON `FACT_PROCUREMENT` (`RECEIVED_UOM_SK`)
;

CREATE INDEX `FACT_PROCURE_RQSTN_T_CRNCY_BI` ON `FACT_PROCUREMENT` (`REQUISITION_TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_PROCURE_RQSTN_B_CRNCY_BI` ON `FACT_PROCUREMENT` (`REQUISITION_BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_PROCURE_PO_T_CRNCY_BI` ON `FACT_PROCUREMENT` (`PO_TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_PROCURE_PO_B_CRNCY_BI` ON `FACT_PROCUREMENT` (`PO_BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_PROCURE_REQUEST_DATE_BI` ON `FACT_PROCUREMENT` (`REQUEST_DATE_SK`)
;

CREATE INDEX `FACT_PROCURE_RQSTN_DATE_BI` ON `FACT_PROCUREMENT` (`REQUISITION_DATE_SK`)
;

CREATE INDEX `FACT_PROCURE_PO_DATE_BI` ON `FACT_PROCUREMENT` (`PURCHASE_ORDER_DATE_SK`)
;

CREATE INDEX `FACT_PROCURE_SN_DATE_BI` ON `FACT_PROCUREMENT` (`SHIPPING_NOTICE_DATE_SK`)
;

CREATE INDEX `FACT_PROCURE_SHIP_DATE_BI` ON `FACT_PROCUREMENT` (`SHIP_DATE_SK`)
;

CREATE INDEX `FACT_PROCURE_WR_DATE_BI` ON `FACT_PROCUREMENT` (`WAREHOUSE_RECEIPT_DATE_SK`)
;

ALTER TABLE `FACT_PROCUREMENT` ADD  PRIMARY KEY (`REQUISITION_ID`,`REQUISITION_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_PROCUREMENT` ADD UNIQUE `PK_FACT_PROCUREMENT` (`REQUISITION_ID`,`REQUISITION_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_PURCHASE_ORDER

CREATE TABLE `FACT_PURCHASE_ORDER`
(
  `PURCHASE_ORDER_ID` Varchar(36) NOT NULL
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_LINE_ID` Varchar(36) NOT NULL DEFAULT 1
 COMMENT 'The source system purchase order line identifer (number).',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `REQUESTER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `PURCHASER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The purchaser surrogate key.  This relates to the person dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `PURCHASE_ORDER_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The purchase order unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `REQUEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The request date surrogate key.  This relates to the day dimension.',
  `REQUISITION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The requisition date surrogate key.  This relates to the day dimension.',
  `PURCHASE_ORDER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The purchase order date surrogate key.  This relates to the day dimension.',
  `PURCHASE_ORDER_DATE` Datetime
 COMMENT 'The purchase order date.',
  `REQUISITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `REQUISITION_LINE_ID` Varchar(36)
 COMMENT 'The requisition line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_QTY` Double DEFAULT 0
 COMMENT 'The quantity of product purchased from a supplier using a purchase order.',
  `PURCHASE_ORDER_TRXN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The purchase order transaction amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9)
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The purchase order fact table maintains information about the products purchased from suppliers.'
;

CREATE INDEX `FACT_PO_SOURCE_BI` ON `FACT_PURCHASE_ORDER` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_PO_PRODUCT_BI` ON `FACT_PURCHASE_ORDER` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_PO_SUPPLIER_BI` ON `FACT_PURCHASE_ORDER` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_PO_REQUESTER_BI` ON `FACT_PURCHASE_ORDER` (`REQUESTER_SK`)
;

CREATE INDEX `FACT_PO_PURCHASER_BI` ON `FACT_PURCHASE_ORDER` (`PURCHASER_SK`)
;

CREATE INDEX `FACT_PO_BU_BI` ON `FACT_PURCHASE_ORDER` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_PO_T_TRXN_BI` ON `FACT_PURCHASE_ORDER` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_PO_B_TRXN_BI` ON `FACT_PURCHASE_ORDER` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_PO_UOM_BI` ON `FACT_PURCHASE_ORDER` (`PURCHASE_ORDER_UOM_SK`)
;

CREATE INDEX `FACT_PO_REQUEST_DATE_BI` ON `FACT_PURCHASE_ORDER` (`REQUEST_DATE_SK`)
;

CREATE INDEX `FACT_PO_RQSTN_DATE_BI` ON `FACT_PURCHASE_ORDER` (`REQUISITION_DATE_SK`)
;

CREATE INDEX `FACT_PO_PO_DATE_BI` ON `FACT_PURCHASE_ORDER` (`PURCHASE_ORDER_DATE_SK`)
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD  PRIMARY KEY (`PURCHASE_ORDER_ID`,`PURCHASE_ORDER_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD UNIQUE `PK_FACT_PURCHASE_ORDER` (`PURCHASE_ORDER_ID`,`PURCHASE_ORDER_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_REQUISITION

CREATE TABLE `FACT_REQUISITION`
(
  `REQUEST_DATE` Datetime
 COMMENT 'The requisition request date.',
  `REQUISITION_DATE` Datetime
 COMMENT 'The requisition date.',
  `REQUISITION_TRXN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The requisition transaction amount.',
  `REQUISITION_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `REQUISITION_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `REQUESTER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `REQUISITION_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requisition unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `REQUEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The request date surrogate key.  This relates to the day dimension.',
  `REQUISITION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The requisition date surrogate key.  This relates to the day dimension.',
  `REQUISITION_QTY` Double DEFAULT 0
 COMMENT 'The quantity of product requested for purchase.  This may or may not be the actual amount later purchased from a supplier using a purchase order.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The requisition fact table maintains information about internal product purchase requests.  Approved requisitions will drive the creation of purchase orders.'
;

CREATE INDEX `FACT_RQSTN_SOURCE_BI` ON `FACT_REQUISITION` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_RQSTN_PRODUCT_BI` ON `FACT_REQUISITION` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_RQSTN_SUPPLIER_BI` ON `FACT_REQUISITION` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_RQSTN_REQUESTER_BI` ON `FACT_REQUISITION` (`REQUESTER_SK`)
;

CREATE INDEX `FACT_RQSTN_T_CRNCY_BI` ON `FACT_REQUISITION` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_RQSTN_B_CRNCY_BI` ON `FACT_REQUISITION` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_RQSTN_BU_BI` ON `FACT_REQUISITION` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_RQSTN_UOM_BI` ON `FACT_REQUISITION` (`REQUISITION_UOM_SK`)
;

CREATE INDEX `FACT_RQSTN_REQUEST_DATE_BI` ON `FACT_REQUISITION` (`REQUEST_DATE_SK`)
;

CREATE INDEX `FACT_RQSTN_RQSTN_DATE_BI` ON `FACT_REQUISITION` (`REQUISITION_DATE_SK`)
;

ALTER TABLE `FACT_REQUISITION` ADD  PRIMARY KEY (`REQUISITION_ID`,`REQUISITION_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_REQUISITION` ADD UNIQUE `PK_FACT_REQUISITION` (`REQUISITION_ID`,`REQUISITION_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_RETURN

CREATE TABLE `FACT_RETURN`
(
  `RETURN_AUTHORIZATION_ID` Varchar(36) NOT NULL
 COMMENT 'The return authorization number.  It is a degenerate dimension in the fact table.',
  `RETURN_AUTHORIZATION_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The return authorization line identifier.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `AUTHORIZER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The authorizer surrogate key.  This relates to the person dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `RETURN_REASON_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The return reason surrogate key.  This relates to the return reason dimension.',
  `RETURN_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The return type surrogate key.  This relates to the return type dimension.',
  `RETURN_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The returned unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `REQUEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The return request date surrogate key.  This relates to the day dimension.',
  `RETURN_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The return date surrogate key.  This relates to the day dimension.',
  `RETURN_DATE` Datetime
 COMMENT 'The return date.',
  `RETURN_QTY` Double
 COMMENT 'The return quantity.',
  `REFUND_QTY` Double
 COMMENT 'The quantity of returns that resulted in refunds.',
  `EXCHANGE_QTY` Double
 COMMENT 'The quantity of returns that resulted in exchanges.',
  `RETURN_TRXN_AMT` Decimal(26,2)
 COMMENT 'The return transaction amount.',
  `RETURN_COST_TRXN_AMT` Decimal(26,2)
 COMMENT 'The return cost transaction amount.',
  `HANDLING_TRXN_AMT` Decimal(26,2)
 COMMENT 'The handling transaction amount (charged to customer).',
  `FREIGHT_TRXN_AMT` Decimal(26,2)
 COMMENT 'The freignt transaction amount (charged to customer).',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The customer return fact table maintains information about products returned by customers.'
;

CREATE INDEX `FACT_RETURN_BU_BI` ON `FACT_RETURN` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_RETURN_AUTHORIZER_BI` ON `FACT_RETURN` (`AUTHORIZER_SK`)
;

CREATE INDEX `FACT_RETURN_CUST_BI` ON `FACT_RETURN` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_RETURN_PRODUCT_BI` ON `FACT_RETURN` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_RETURN_SUPPLIER_BI` ON `FACT_RETURN` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_RETURN_REASON_BI` ON `FACT_RETURN` (`RETURN_REASON_SK`)
;

CREATE INDEX `FACT_RETURN_TYPE_BI` ON `FACT_RETURN` (`RETURN_TYPE_SK`)
;

CREATE INDEX `FACT_RETURN_UOM_BI` ON `FACT_RETURN` (`RETURN_UOM_SK`)
;

CREATE INDEX `FACT_RETURN_T_CRNCY_BI` ON `FACT_RETURN` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_RETURN_B_CRNCY_BI` ON `FACT_RETURN` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_RETURN_REQUEST_DATE_BI` ON `FACT_RETURN` (`REQUEST_DATE_SK`)
;

CREATE INDEX `FACT_RETURN_RETURN_DATE_BI` ON `FACT_RETURN` (`RETURN_DATE_SK`)
;

ALTER TABLE `FACT_RETURN` ADD  PRIMARY KEY (`RETURN_AUTHORIZATION_ID`,`RETURN_AUTHORIZATION_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_RETURN` ADD UNIQUE `PK_FACT_RETURN` (`RETURN_AUTHORIZATION_ID`,`RETURN_AUTHORIZATION_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_SALES_LEAD

CREATE TABLE `FACT_SALES_LEAD`
(
  `SALES_LEAD_ID` Varchar(36) NOT NULL
 COMMENT 'The sales lead identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SALES_LEAD_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The sales lead line identifier.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.  The relates to the campaign wave dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `CUSTOMER_CONTACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The customer contact surrogate key.  This relates to the customer contact dimension.',
  `MARKETING_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The marketing activity surrogate key.  This relates to the marketing channel dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SALES_LEAD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales lead surrogate key.  This relates to the sales lead dimension.',
  `SALES_LEAD_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales lead channel surrogate key.  This relates to the sales lead channel dimension.',
  `SALES_LEAD_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales lead type surrogate key.  This relates to the sales lead type dimension.',
  `SALES_REPRESENTATIVE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales person surrogate key.  This relates to the day dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `UNIT_OF_MEASURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `CREATED_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sales lead created date surrogate key.  This column may be used to partition the fact table by time.',
  `ASSIGNED_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sales lead assigned date surrogate key.',
  `IN_PROCESS_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sales lead in process date surrogate key.',
  `QUALIFIED_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sales lead qualified date surrogate key.',
  `DEAD_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sales lead dead date surrogate key.',
  `RECYCLED_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sales lead recycled date surrogate key.',
  `CREATED_DATE` Datetime
 COMMENT 'The sales lead created date.',
  `ASSIGNED_DATE` Datetime
 COMMENT 'The sales lead assigned date.',
  `IN_PROCESS_DATE` Datetime
 COMMENT 'The sales lead in process date.',
  `QUALIFIED_DATE` Datetime
 COMMENT 'The sales lead qualified date.',
  `DEAD_DATE` Datetime
 COMMENT 'The sales lead dead date.',
  `RECYCLED_DATE` Datetime
 COMMENT 'The sales lead recycled date.',
  `SALES_LEAD_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The sales lead amount.',
  `LEAD_QTY` Int DEFAULT 1
 COMMENT 'The sales lead quantity (independent of status).',
  `PRODUCT_QTY` Double DEFAULT 0
 COMMENT 'The sales lead quantity of a product at a particular unit of measure (e.g, five items, two case, one pallet).',
  `CREATED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of sales leads in the created status.',
  `ASSIGNED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of sales leads in the assigned status.',
  `IN_PROCESS_QTY` Double DEFAULT 0
 COMMENT 'The quantity of sales leads in the in process status.',
  `DEAD_QTY` Double DEFAULT 0
 COMMENT 'The quantity of sales leads in the dead status.',
  `RECYCLED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of sales leads in the recycled status.',
  `QUALIFIED_QTY` Double DEFAULT 0
 COMMENT 'The sales lead qualified quantity.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'This fact table maintains sales lead information at the sales lead grain.'
;

CREATE INDEX `FACT_SL_BU_BI` ON `FACT_SALES_LEAD` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_SL_CAMPAIGN_WAVE_BI` ON `FACT_SALES_LEAD` (`CAMPAIGN_WAVE_SK`)
;

CREATE INDEX `FACT_SL_CUST_BI` ON `FACT_SALES_LEAD` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_SL_CUST_CONTACT_BI` ON `FACT_SALES_LEAD` (`CUSTOMER_CONTACT_SK`)
;

CREATE INDEX `FACT_SL_MKT_CHANNEL_BI` ON `FACT_SALES_LEAD` (`MARKETING_CHANNEL_SK`)
;

CREATE INDEX `FACT_SL_PRODUCT_BI` ON `FACT_SALES_LEAD` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_SL_LEAD_BI` ON `FACT_SALES_LEAD` (`SALES_LEAD_SK`)
;

CREATE INDEX `FACT_SL_CHANNEL_BI` ON `FACT_SALES_LEAD` (`SALES_LEAD_CHANNEL_SK`)
;

CREATE INDEX `FACT_SL_LEAD_TYPE_BI` ON `FACT_SALES_LEAD` (`SALES_LEAD_TYPE_SK`)
;

CREATE INDEX `FACT_SL_SALES_REP_BI` ON `FACT_SALES_LEAD` (`SALES_REPRESENTATIVE_SK`)
;

CREATE INDEX `FACT_SL_T_CRNCY_BI` ON `FACT_SALES_LEAD` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_SL_B_CRNCY_BI` ON `FACT_SALES_LEAD` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_SL_UOM_BI` ON `FACT_SALES_LEAD` (`UNIT_OF_MEASURE_SK`)
;

CREATE INDEX `FACT_SL_CREATED_DATE_BI` ON `FACT_SALES_LEAD` (`CREATED_DATE_SK`)
;

CREATE INDEX `FACT_SL_ASSIGNED_DATE_BI` ON `FACT_SALES_LEAD` (`ASSIGNED_DATE_SK`)
;

CREATE INDEX `FACT_SL_IN_PROCESS_DATE_BI` ON `FACT_SALES_LEAD` (`IN_PROCESS_DATE_SK`)
;

CREATE INDEX `FACT_SL_QUALIFIED_DATE_BI` ON `FACT_SALES_LEAD` (`QUALIFIED_DATE_SK`)
;

CREATE INDEX `FACT_SL_DEAD_DATE_BI` ON `FACT_SALES_LEAD` (`DEAD_DATE_SK`)
;

CREATE INDEX `FACT_SL_RECYCLED_DATE_BI` ON `FACT_SALES_LEAD` (`RECYCLED_DATE_SK`)
;

ALTER TABLE `FACT_SALES_LEAD` ADD  PRIMARY KEY (`SALES_LEAD_ID`,`SALES_LEAD_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_SALES_LEAD` ADD UNIQUE `PK_FACT_SALES_LEAD` (`SALES_LEAD_ID`,`SALES_LEAD_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_SALES_OPPORTUNITY

CREATE TABLE `FACT_SALES_OPPORTUNITY`
(
  `SALES_OPPORTUNITY_ID` Varchar(36) NOT NULL
 COMMENT 'The sales opportunity identifier in the source system.  It is a degenerate dimension in the order capture fact table.',
  `SALES_OPPORTUNITY_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The sales opportunity line identifer.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.  The relates to the campaign wave dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `CUSTOMER_CONTACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The customer contact surrogate key.  This relates to the customer contact dimension.',
  `MARKETING_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The marketing activity surrogate key.  This relates to the marketing channel dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SALES_REPRESENTATIVE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales person surrogate key.  This relates to the day dimension.',
  `SALES_LEAD_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales lead surrogate key.  This relates to the sales lead dimension.',
  `SALES_OPPORTUNITY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales opportunity surrogate key.  This relates to the sales opportunity dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `UNIT_OF_MEASURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `QUALIFIED_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The sales opportunity qualified date surrogate key.',
  `PROSPECTING_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The prospecting date surrogate key.  This relates to the day dimension.',
  `DECISION_MAKER_ID_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The decision maker id date surrogate key.  This relates to the day dimension.',
  `NEEDS_ANALYSIS_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The needs analysis date surrogate key.  This relates to the day dimension.',
  `VALUE_PROPOSITION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The value proposition date surrogate key.  This relates to the day dimension.',
  `PERCEPTION_ANALYSIS_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The perception analysis date surrogate key.  This relates to the day dimension.',
  `PRICE_QUOTE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The price quote date surrogate key.  This relates to the day dimension.',
  `NEGOTIATION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The negotiation date surrogate key.  This relates to the day dimension.',
  `CLOSED_LOST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The closed lost date surrogate key.  This relates to the day dimension.',
  `CLOSED_WON_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The closed won date surrogate key.  This relates to the day dimension.',
  `QUALIFIED_DATE` Datetime
 COMMENT 'The qualified date.',
  `PROSPECTING_DATE` Datetime
 COMMENT 'The prospecting date.',
  `DECISION_MAKER_ID_DATE` Datetime
 COMMENT 'The decision maker id date.',
  `NEEDS_ANALYSIS_DATE` Datetime
 COMMENT 'The needs analysis date.',
  `VALUE_PROPOSITION_DATE` Datetime
 COMMENT 'The value proposition date.',
  `PERCEPTION_ANALYSIS_DATE` Datetime
 COMMENT 'The perception analysis date.',
  `PRICE_QUOTE_DATE` Datetime
 COMMENT 'The price quote date.',
  `NEGOTIATION_DATE` Datetime
 COMMENT 'The negotiation date.',
  `CLOSED_LOST_DATE` Datetime
 COMMENT 'The closed lost date.',
  `CLOSED_WON_DATE` Datetime
 COMMENT 'The closed won date.',
  `SALES_OPPORTUNITY_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The sales opportunity amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `CONFIDENCE_SCORE_QTY` Double DEFAULT 0
 COMMENT 'The win confidence score quantity.',
  `PRODUCT_QTY` Double DEFAULT 0
 COMMENT 'The product opportunity quantity.',
  `QUALIFIED_QTY` Double DEFAULT 0
 COMMENT 'The qualified quantity.  Set to one if the opportunity is in the qualified status.',
  `PROSPECTING_QTY` Double DEFAULT 0
 COMMENT 'The prospecting quantity.  Set to one if the opportunity is in the prospecting status.',
  `DECISION_MAKER_ID_QTY` Double DEFAULT 0
 COMMENT 'The decision maker id quantity.  Set to one if the opportunity is in the decision maker id status.',
  `NEEDS_ANALYSIS_QTY` Double DEFAULT 0
 COMMENT 'The needs analysis quantity.  Set to one if the opportunity is in the needs analysis status.',
  `VALUE_PROPOSITION_QTY` Double DEFAULT 0
 COMMENT 'The value proposition quantity.  Set to one if the opportunity is in the value proposition status.',
  `PERCEPTION_ANALYSIS_QTY` Double DEFAULT 0
 COMMENT 'The perception analysis quantity.  Set to one if the opportunity is in the perception analysis status.',
  `PRICE_QUOTE_QTY` Double DEFAULT 0
 COMMENT 'The price quote quantity.  Set to one if the opportunity is in the price quote status.',
  `NEGOTIATION_QTY` Double DEFAULT 0
 COMMENT 'The negotiation quantity.  Set to one if the opportunity is in the negotiation status.',
  `CLOSED_LOST_QTY` Double DEFAULT 0
 COMMENT 'The closed lost quantity.  Set to one if the opportunity is in the closed lost status.',
  `CLOSED_WON_QTY` Double DEFAULT 0
 COMMENT 'The closed won quantity.  Set to one if the opportunity is in the closed won status.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'This fact table maintains sales opportunity information at the sales opportunity grain.'
;

CREATE INDEX `FACT_SO_BU_BI` ON `FACT_SALES_OPPORTUNITY` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_SO_CAMPAIGN_WAVE_BI` ON `FACT_SALES_OPPORTUNITY` (`CAMPAIGN_WAVE_SK`)
;

CREATE INDEX `FACT_SO_CUST_BI` ON `FACT_SALES_OPPORTUNITY` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_SO_CUST_CONTACT_BI` ON `FACT_SALES_OPPORTUNITY` (`CUSTOMER_CONTACT_SK`)
;

CREATE INDEX `FACT_SO_MKT_CHANNEL_BI` ON `FACT_SALES_OPPORTUNITY` (`MARKETING_CHANNEL_SK`)
;

CREATE INDEX `FACT_SO_PRODUCT_BI` ON `FACT_SALES_OPPORTUNITY` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_SO_LEAD_BI` ON `FACT_SALES_OPPORTUNITY` (`SALES_LEAD_SK`)
;

CREATE INDEX `FACT_SO_OPPORTUNITY_BI` ON `FACT_SALES_OPPORTUNITY` (`SALES_OPPORTUNITY_SK`)
;

CREATE INDEX `FACT_SO_SALES_REP_BI` ON `FACT_SALES_OPPORTUNITY` (`SALES_REPRESENTATIVE_SK`)
;

CREATE INDEX `FACT_SO_T_CRNCY_BI` ON `FACT_SALES_OPPORTUNITY` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_SO_B_CRNCY_BI` ON `FACT_SALES_OPPORTUNITY` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_SO_UOM_BI` ON `FACT_SALES_OPPORTUNITY` (`UNIT_OF_MEASURE_SK`)
;

CREATE INDEX `FACT_SO_QUALIFIED_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`QUALIFIED_DATE_SK`)
;

CREATE INDEX `FACT_SO_PROSPECTING_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`PROSPECTING_DATE_SK`)
;

CREATE INDEX `FACT_SO_DECISION_MAKER_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`DECISION_MAKER_ID_DATE_SK`)
;

CREATE INDEX `FACT_SO_NEEDS_ANALYSIS_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`NEEDS_ANALYSIS_DATE_SK`)
;

CREATE INDEX `FACT_SO_VALUE_PROP_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`VALUE_PROPOSITION_DATE_SK`)
;

CREATE INDEX `FACT_SO_PRCPTN_ANLYS_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`PERCEPTION_ANALYSIS_DATE_SK`)
;

CREATE INDEX `FACT_SO_PRICE_QUOTE_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`PRICE_QUOTE_DATE_SK`)
;

CREATE INDEX `FACT_SO_NEGOTIATION_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`NEGOTIATION_DATE_SK`)
;

CREATE INDEX `FACT_SO_CLOSED_LOST_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`CLOSED_LOST_DATE_SK`)
;

CREATE INDEX `FACT_SO_CLOSED_WON_DATE_BI` ON `FACT_SALES_OPPORTUNITY` (`CLOSED_WON_DATE_SK`)
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD  PRIMARY KEY (`SALES_OPPORTUNITY_ID`,`SALES_OPPORTUNITY_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD UNIQUE `PK_FACT_SALES_OPPORTUNITY` (`SALES_OPPORTUNITY_ID`,`SALES_OPPORTUNITY_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_SHIPMENT

CREATE TABLE `FACT_SHIPMENT`
(
  `SHIPMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The source system shipment identifier.  A degenerate dimension in this context.',
  `SHIPMENT_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The source system shipment line identifier (number).',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CARRIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The carrier surrogate key.  This relates to the carrier dimension.',
  `BILL_CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The bill customer surrogate key.  This relates to the customer dimension.',
  `SHIP_CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The ship customer surrogate key.  This relates to the customer dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `DEPARTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The department surrogate key.  This relates to the department dimension.',
  `ORDER_CAPTURE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The order capture surrogate key.  The relates to the order capture table.',
  `WAREHOUSE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The warehouse surrogate key.  This relates to the warehouse dimension.',
  `SHIP_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The ship unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `VOLUME_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The volume unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `WEIGHT_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The weight unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `DISTANCE_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment distance unit of measure surrogate key.',
  `TRAVEL_TIME_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment travel time unit of measure surrogate key.',
  `SHIP_PRIORITY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment priority surrogate key.  This relates to the shipment priority dimension.',
  `SHIP_ROUTE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment route surrogate key.  This relates to the shipment route dimension.',
  `SHIP_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipment type surrogate key.  This relates to the shipment type dimension.',
  `ORDER_CAPTURE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The order date surrogate key.  This relates to the day dimension.',
  `DEMAND_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The demand date surrogate key.  This relates to the day dimension.',
  `ORIGINAL_SCHEDULE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The original schedule date surrogate key.  This relates to the day dimension.',
  `SCHEDULE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The actual schedule date surrogate key.  This relates to the day dimension.',
  `PICK_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The pick date surrogate key.  This relates to the day dimension.',
  `PACK_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The pick date surrogate key.  This relates to the day dimension.',
  `LOAD_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The load date surrogate key.  This relates to the day dimension.',
  `SHIP_EARLY_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The ship early date surrogate key.  This relates to the day dimension.',
  `SHIP_LATE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The ship late date surrogate key.  This relates to the day dimension.',
  `SHIP_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The shipped date surrogate key.  This relates to the day dimension.',
  `DELIVER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The deliver date surrogate key.  This relates to the day dimension.',
  `ORDER_CAPTURE_DATE` Datetime
 COMMENT 'The order capture date.',
  `DEMAND_DATE` Datetime
 COMMENT 'The demand date.',
  `ORIGINAL_SCHEDULE_DATE` Datetime
 COMMENT 'The original schedule date.',
  `SCHEDULE_DATE` Datetime
 COMMENT 'The actual schedule date.',
  `PICK_DATE` Datetime
 COMMENT 'The date the shipment items were picked from inventory.',
  `PACK_DATE` Datetime
 COMMENT 'The date that the items picked from inventory were packed for shipment.',
  `LOAD_DATE` Datetime
 COMMENT 'The date the items packed for shipment were loaded.',
  `SHIP_EARLY_DATE` Datetime
 COMMENT 'The ship early date.',
  `SHIP_LATE_DATE` Datetime
 COMMENT 'The ship late date.',
  `SHIP_DATE` Datetime
 COMMENT 'The ship date.',
  `DELIVER_DATE` Datetime
 COMMENT 'The date the item was delivered to the customer.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `VEHICLE_ID` Varchar(36)
 COMMENT 'The shipment vehicle number.  Depending on the method of transport, this may be the number for the aircraft, trailer, rail car, vessel, or barge.',
  `SCHEDULED_QTY` Double
 COMMENT 'The quantity of items scheduled for shipment.',
  `BACKORDER_QTY` Double
 COMMENT 'The quantity of items on back-order.',
  `BACKORDER_CANCEL_QTY` Double
 COMMENT 'The quantity of back-ordered items that have been cancelled.',
  `SHIPPED_QTY` Double
 COMMENT 'The quantity of items shipped.',
  `LIST_PRICE_AMT` Decimal(26,2)
 COMMENT 'The list price transaction amount.',
  `NET_UNIT_PRICE_AMT` Decimal(26,2)
 COMMENT 'The net unit price transaction amount.',
  `SHIP_AMT` Decimal(26,2)
 COMMENT 'The ship transaction amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `SHIP_WEIGHT_QTY` Double
 COMMENT 'The ship weight quantity.',
  `SHIP_VOLUME_QTY` Double
 COMMENT 'The ship volume quantity.',
  `TRAVEL_TIME_QTY` Double
 COMMENT 'The shipment travel time.',
  `DISTANCE_QTY` Double
 COMMENT 'The shipment distance.',
  `SHIP_TO_ORDER_DAY_QTY` Double
 COMMENT 'The quantity of days between the order date and the ship date.',
  `SHIP_TO_DEMAND_DAY_QTY` Double
 COMMENT 'The quantity of days between the demand date and the ship date.',
  `SHIP_LINE_CNT` Double DEFAULT 1
 COMMENT 'The number of shipment lines (used in aggregate queries).',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipment fact table maintains shipment line metrics.'
;

CREATE INDEX `FACT_SHIP_SOURCE_BI` ON `FACT_SHIPMENT` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_SHIP_BU_BI` ON `FACT_SHIPMENT` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_SHIP_CARRIER_BI` ON `FACT_SHIPMENT` (`CARRIER_SK`)
;

CREATE INDEX `FACT_SHIP_BILL_CUST_BI` ON `FACT_SHIPMENT` (`BILL_CUSTOMER_SK`)
;

CREATE INDEX `FACT_SHIP_SHIP_CUST_BI` ON `FACT_SHIPMENT` (`SHIP_CUSTOMER_SK`)
;

CREATE INDEX `FACT_SHIP_PRODUCT_BI` ON `FACT_SHIPMENT` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_SHIP_DEPARTMENT_BI` ON `FACT_SHIPMENT` (`DEPARTMENT_SK`)
;

CREATE INDEX `FACT_SHIP_ORDER_BI` ON `FACT_SHIPMENT` (`ORDER_CAPTURE_SK`)
;

CREATE INDEX `FACT_SHIP_WAREHOUSE_BI` ON `FACT_SHIPMENT` (`WAREHOUSE_SK`)
;

CREATE INDEX `FACT_SHIP_SHIP_UOM_BI` ON `FACT_SHIPMENT` (`SHIP_UOM_SK`)
;

CREATE INDEX `FACT_SHIP_VOLUME_UOM_BI` ON `FACT_SHIPMENT` (`VOLUME_UOM_SK`)
;

CREATE INDEX `FACT_SHIP_WEIGHT_UOM_BI` ON `FACT_SHIPMENT` (`WEIGHT_UOM_SK`)
;

CREATE INDEX `FACT_SHIP_T_CRNCY_BI` ON `FACT_SHIPMENT` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_SHIP_B_CRNCY_BI` ON `FACT_SHIPMENT` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_SHIP_DISTANCE_UOM_BI` ON `FACT_SHIPMENT` (`DISTANCE_UOM_SK`)
;

CREATE INDEX `FACT_SHIP_TRAVEL_TIME_UOM_BI` ON `FACT_SHIPMENT` (`TRAVEL_TIME_UOM_SK`)
;

CREATE INDEX `FACT_SHIP_PRIORITY_BI` ON `FACT_SHIPMENT` (`SHIP_PRIORITY_SK`)
;

CREATE INDEX `FACT_SHIP_ROUTE_BI` ON `FACT_SHIPMENT` (`SHIP_ROUTE_SK`)
;

CREATE INDEX `FACT_SHIP_TYPE_BI` ON `FACT_SHIPMENT` (`SHIP_TYPE_SK`)
;

CREATE INDEX `FACT_SHIP_ORDER_DATE_BI` ON `FACT_SHIPMENT` (`ORDER_CAPTURE_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_DEMAND_DATE_BI` ON `FACT_SHIPMENT` (`DEMAND_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_O_SCHEDULE_DATE_BI` ON `FACT_SHIPMENT` (`ORIGINAL_SCHEDULE_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_SCHEDULE_DATE_BI` ON `FACT_SHIPMENT` (`SCHEDULE_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_PICK_DATE_BI` ON `FACT_SHIPMENT` (`PICK_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_PACK_DATE_BI` ON `FACT_SHIPMENT` (`PACK_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_LOAD_DATE_BI` ON `FACT_SHIPMENT` (`LOAD_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_SHIP_EARLY_DATE_BI` ON `FACT_SHIPMENT` (`SHIP_EARLY_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_SHIP_LATE_DATE_BI` ON `FACT_SHIPMENT` (`SHIP_LATE_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_SHIP_DATE_BI` ON `FACT_SHIPMENT` (`SHIP_DATE_SK`)
;

CREATE INDEX `FACT_SHIP_DELIVER_DATE_BI` ON `FACT_SHIPMENT` (`DELIVER_DATE_SK`)
;

ALTER TABLE `FACT_SHIPMENT` ADD  PRIMARY KEY (`SHIPMENT_ID`,`SHIPMENT_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_SHIPMENT` ADD UNIQUE `PK_FACT_SHIPMENT` (`SHIPMENT_ID`,`SHIPMENT_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_SHIPPING_NOTICE

CREATE TABLE `FACT_SHIPPING_NOTICE`
(
  `SHIPPING_NOTICE_ID` Varchar(36) NOT NULL
 COMMENT 'The shipping notice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SHIPPING_NOTICE_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The source system shipping notice line identifier (number).',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CONTRACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The contract surrogate key.  This relates to the contract dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `PURCHASER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The purchaser surrogate key.  This relates to the person dimension.',
  `REQUESTER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `WAREHOUSE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The warehouse surrogate key.  This relates to the warehouse dimension.',
  `SHIPPED_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The shipped unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `REQUEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The request date surrogate key.  This relates to the day dimension.',
  `REQUISITION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The requisition date surrogate key.  This relates to the day dimension.',
  `PURCHASE_ORDER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The purchase order date surrogate key.  This relates to the day dimension.',
  `SHIPPING_NOTICE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The shipping notice date surrogate key.  This relates to the day dimension.',
  `SHIP_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The shipped date surrogate key.  This relates to the day dimension.',
  `SHIP_DATE` Datetime
 COMMENT 'The shipped date.',
  `SHIPPING_NOTICE_DATE` Datetime
 COMMENT 'The shipping notice date.',
  `REQUISITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SHIPPED_QTY` Double
 COMMENT 'The quantity of product shipped by the supplier.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipping notice fact table maintains information about the products shipped by suppliers (as reported by suppliers).'
;

CREATE INDEX `FACT_SN_SOURCE_BI` ON `FACT_SHIPPING_NOTICE` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_SN_BU_BI` ON `FACT_SHIPPING_NOTICE` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_SN_CONTRACT_BI` ON `FACT_SHIPPING_NOTICE` (`CONTRACT_SK`)
;

CREATE INDEX `FACT_SN_PRODUCT_BI` ON `FACT_SHIPPING_NOTICE` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_SN_PURCHASER_BI` ON `FACT_SHIPPING_NOTICE` (`PURCHASER_SK`)
;

CREATE INDEX `FACT_SN_REQUESTER_BI` ON `FACT_SHIPPING_NOTICE` (`REQUESTER_SK`)
;

CREATE INDEX `FACT_SN_SUPPLIER_BI` ON `FACT_SHIPPING_NOTICE` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_SN_WAREHOUSE_BI` ON `FACT_SHIPPING_NOTICE` (`WAREHOUSE_SK`)
;

CREATE INDEX `FACT_SN_SHIPPED_UOM_BI` ON `FACT_SHIPPING_NOTICE` (`SHIPPED_UOM_SK`)
;

CREATE INDEX `FACT_SN_REQUEST_DATE_BI` ON `FACT_SHIPPING_NOTICE` (`REQUEST_DATE_SK`)
;

CREATE INDEX `FACT_SN_RQSTN_DATE_BI` ON `FACT_SHIPPING_NOTICE` (`REQUISITION_DATE_SK`)
;

CREATE INDEX `FACT_SN_PO_DATE_BI` ON `FACT_SHIPPING_NOTICE` (`PURCHASE_ORDER_DATE_SK`)
;

CREATE INDEX `FACT_SN_SN_DATE_BI` ON `FACT_SHIPPING_NOTICE` (`SHIPPING_NOTICE_DATE_SK`)
;

CREATE INDEX `FACT_SN_SHIP_DATE_BI` ON `FACT_SHIPPING_NOTICE` (`SHIP_DATE_SK`)
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD  PRIMARY KEY (`SHIPPING_NOTICE_ID`,`SHIPPING_NOTICE_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD UNIQUE `PK_FACT_SHIPPING_NOTICE` (`SHIPPING_NOTICE_ID`,`SHIPPING_NOTICE_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_WAREHOUSE_RECEIPT

CREATE TABLE `FACT_WAREHOUSE_RECEIPT`
(
  `WAREHOUSE_RECEIPT_ID` Varchar(36) NOT NULL
 COMMENT 'The warehouse receipt identifier in the source system.  It is a degenerate dimension in the fact table.',
  `WAREHOUSE_RECEIPT_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The source system warehouse receipt line identifier (number).',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CONTRACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The contract surrogate key.  This relates to the contract dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `SUPPLIER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `REQUESTER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `PURCHASER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The purchaser surrogate key.  This relates to the person dimension.',
  `RECEIVER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The receiver surrogate key.  This relates to the person dimension.',
  `RECEIVED_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The received unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `WAREHOUSE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The warehouse surrogate key.  This relates to the warehouse dimension.',
  `REQUEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The request date surrogate key.  This relates to the day dimension.',
  `REQUISITION_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The requisition date surrogate key.  This relates to the day dimension.',
  `PURCHASE_ORDER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The purchase order date surrogate key.  This relates to the day dimension.',
  `SHIPPING_NOTICE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The shipping notice date surrogate key.  This relates to the day dimension.',
  `SHIP_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The shipped date surrogate key.  This relates to the day dimension.',
  `WAREHOUSE_RECEIPT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The warehouse receipt date surrogate key.  This relates to the day dimension.',
  `WAREHOUSE_RECEIPT_DATE` Datetime
 COMMENT 'The warehouse receipt date.',
  `REQUISITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SHIPPING_NOTICE_ID` Varchar(36)
 COMMENT 'The shipping notice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `RECEIVED_QTY` Double
 COMMENT 'The quantity of product received by the warehouse.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The warehouse receipt fact table maintains information about the products received by warehouses.'
;

CREATE INDEX `FACT_WR_SOURCE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_WR_BU_BI` ON `FACT_WAREHOUSE_RECEIPT` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_WR_CONTRACT_BI` ON `FACT_WAREHOUSE_RECEIPT` (`CONTRACT_SK`)
;

CREATE INDEX `FACT_WR_PRODUCT_BI` ON `FACT_WAREHOUSE_RECEIPT` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_WR_SUPPLIER_BI` ON `FACT_WAREHOUSE_RECEIPT` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_WR_REQUESTER_BI` ON `FACT_WAREHOUSE_RECEIPT` (`REQUESTER_SK`)
;

CREATE INDEX `FACT_WR_PURCHASER_BI` ON `FACT_WAREHOUSE_RECEIPT` (`PURCHASER_SK`)
;

CREATE INDEX `FACT_WR_RECEIVER_BI` ON `FACT_WAREHOUSE_RECEIPT` (`RECEIVER_SK`)
;

CREATE INDEX `FACT_WR_UOM_BI` ON `FACT_WAREHOUSE_RECEIPT` (`RECEIVED_UOM_SK`)
;

CREATE INDEX `FACT_WR_WAREHOUSE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`WAREHOUSE_SK`)
;

CREATE INDEX `FACT_WR_REQUEST_DATE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`REQUEST_DATE_SK`)
;

CREATE INDEX `FACT_WR_RQSTN_DATE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`REQUISITION_DATE_SK`)
;

CREATE INDEX `FACT_WR_PO_DATE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`PURCHASE_ORDER_DATE_SK`)
;

CREATE INDEX `FACT_WR_SN_DATE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`SHIPPING_NOTICE_DATE_SK`)
;

CREATE INDEX `FACT_WR_SHIP_DATE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`SHIP_DATE_SK`)
;

CREATE INDEX `FACT_WR_WR_DATE_BI` ON `FACT_WAREHOUSE_RECEIPT` (`WAREHOUSE_RECEIPT_DATE_SK`)
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD  PRIMARY KEY (`WAREHOUSE_RECEIPT_ID`,`WAREHOUSE_RECEIPT_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD UNIQUE `PK_FACT_WAREHOUSE_RECEIPT` (`WAREHOUSE_RECEIPT_ID`,`WAREHOUSE_RECEIPT_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table FACT_WEB_PAGE_VIEW

CREATE TABLE `FACT_WEB_PAGE_VIEW`
(
  `KEYWORD_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The keyword phrase surrogate key.  This relates to the keyword phrase dimension.',
  `HOSTED_CLIENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `REQUEST_DATE` Timestamp NOT NULL
 COMMENT 'The web page request date.',
  `WEB_VISITOR_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web visitor surrogate key.  This relates to the web visitor dimension.',
  `WEB_FILE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web file surrogate key.  This relates to the web file dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `REQUEST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The page request date surrogate key.',
  `REQUEST_TIME_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The time of day surrogate key.  This relates to the time dimension.',
  `GEO_LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The geographic location surrogate key.  This relates to the geographic location dimension.',
  `REFERER_URL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web site referer surrogate key.  This relates to the web site referer dimension.',
  `WEB_BROWSER_OS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web browser operating system surrogate key.  This relates to the web browser operating system dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.  The relates to the campaign wave dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `CLICK_ID` Varchar(36)
 COMMENT 'The paid keyword search source system click identifier.',
  `VIEW_ORDER_NUMBER` Smallint UNSIGNED
 COMMENT 'The order this page was viewed during the session.',
  `WEB_FILE_BYTE_QTY` Double DEFAULT 0
 COMMENT 'The web file byte quantity.',
  `WEB_PAGE_VIEW_QTY` Double DEFAULT 1
 COMMENT 'The web page view quantity.',
  `ROBOT_PAGE_VIEW_QTY` Double DEFAULT 0
 COMMENT 'The robot/crawler/spider view quantity.',
  `VIEW_SECONDS_QTY` Double DEFAULT 1
 COMMENT 'The number of seconds a visitor viewed a page.',
  `LANDING_PAGE_QTY` Double DEFAULT 0
 COMMENT 'The number of landing pages.  This is valued at 1 if a particular page view was the first in a viewing session.',
  `EXIT_PAGE_QTY` Double DEFAULT 0
 COMMENT 'The number of exit pages.  This is valued at 1 if a particular page view was the last in a viewing session.',
  `PAID_VIEW_QTY` Double DEFAULT 0
 COMMENT 'The number of paid views.  This implies the page view was referred by a paid source (e..g, Google Adwords, Yahoo Overture).',
  `ORGANIC_VIEW_QTY` Double DEFAULT 0
 COMMENT 'The number of organic search referral page views.  This column is valued at 1if the page view resulted from an organic keyword search.',
  `SYNDICATION_VIEW_QTY` Double DEFAULT 0
 COMMENT 'The number of syndication (contextual advertisement) search referral page views.  This column is valued at 1if the page view resulted from a paid syndication/contextual advertisement click.',
  `BOUNCE_QTY` Double DEFAULT 0
 COMMENT 'The bounce quantity.  A bounce is when a visitor visits a single page and then leaves the web site.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'This fact table maintains the .html and .pdf web page viewing activity for web site visitors.'
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_AK` ON `FACT_WEB_PAGE_VIEW` (`WEB_VISITOR_SK`,`REQUEST_DATE`,`WEB_FILE_SK`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_BROWSER_BI` ON `FACT_WEB_PAGE_VIEW` (`WEB_BROWSER_OS_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_CLIENT_BI` ON `FACT_WEB_PAGE_VIEW` (`HOSTED_CLIENT_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_DATE_BI` ON `FACT_WEB_PAGE_VIEW` (`REQUEST_DATE_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_FILE_BI` ON `FACT_WEB_PAGE_VIEW` (`WEB_FILE_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_KEYWORD_BI` ON `FACT_WEB_PAGE_VIEW` ()
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_LOC_BI` ON `FACT_WEB_PAGE_VIEW` (`GEO_LOCATION_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_REFER_BI` ON `FACT_WEB_PAGE_VIEW` (`REFERER_URL_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_SOURCE_BI` ON `FACT_WEB_PAGE_VIEW` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_VISITOR_BI` ON `FACT_WEB_PAGE_VIEW` (`WEB_VISITOR_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_CMPGN_FK` USING BTREE ON `FACT_WEB_PAGE_VIEW` (`CAMPAIGN_WAVE_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_CUST_FK` USING BTREE ON `FACT_WEB_PAGE_VIEW` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_PRODUCT_FK` USING BTREE ON `FACT_WEB_PAGE_VIEW` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_WEB_PAGE_VIEW_TIME_FK` USING BTREE ON `FACT_WEB_PAGE_VIEW` (`REQUEST_TIME_SK`)
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD  PRIMARY KEY (`HOSTED_CLIENT_SK`,`REQUEST_DATE`,`WEB_VISITOR_SK`,`WEB_FILE_SK`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD UNIQUE `PK_FACT_WEB_PAGE_VIEW` (`REQUEST_DATE`,`WEB_VISITOR_SK`,`WEB_FILE_SK`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

-- Table FACT_WEB_SITE_REFERER

CREATE TABLE `FACT_WEB_SITE_REFERER`
(
  `KEYWORD_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The keyword phrase surrogate key.  This relates to the keyword phrase dimension.',
  `WEB_VISITOR_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web visitor surrogate key.  This relates to the web visitor dimension.',
  `GEO_LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The geographic location surrogate key.  This relates to the geographic location dimension.',
  `REFERER_URL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web site referer surrogate key.  This relates to the web site referer dimension.',
  `REFERRAL_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The referral date surrogate key.  This column may be used to partition the fact table by time.',
  `WEB_FILE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web file surrogate key.  This relates to the web file dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key (in the case of web server logs, this will be the parent key).  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `REFERRAL_QTY` Int DEFAULT 1
 COMMENT 'The referral quantity.',
  `WEB_FILE_BYTE_QTY` Int DEFAULT 0
 COMMENT 'The web file byte quantity.',
  `WEB_PAGE_VIEW_QTY` Int DEFAULT 1
 COMMENT 'The web page view quantity.',
  `VIEW_SECONDS_QTY` Int DEFAULT 0
 COMMENT 'The number of seconds a visitor viewed a page.',
  `PAID_VIEW_QTY` Int DEFAULT 0
 COMMENT 'The number of paid keyword views.  This implies the view originated from paid keyword source (e..g, Google Adwords, Yahoo Overture).',
  `ORGANIC_VIEW_QTY` Int DEFAULT 0
 COMMENT 'The number of organic search views.  This implies the view originated from an organic keyword source.',
  `SYNDICATION_VIEW_QTY` Int DEFAULT 0
 COMMENT 'The number of syndication (contextual advertisement) search referrals.  This column is valued at 1if the referral resulted from a paid syndication/contextual advertisement click.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'Aggregates the web page viewing activity to a referer.'
;

CREATE UNIQUE INDEX `FACT_WEB_SITE_REFERER_AK` ON `FACT_WEB_SITE_REFERER` (`REFERRAL_DATE_SK`,`REFERER_URL_SK`,`WEB_FILE_SK`,`GEO_LOCATION_SK`,`WEB_VISITOR_SK`,`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_WEB_SITE_KEYWORD_BI` ON `FACT_WEB_SITE_REFERER` (`KEYWORD_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REF_CLIENT_BI` ON `FACT_WEB_SITE_REFERER` (`HOSTED_CLIENT_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REF_DAY_BI` ON `FACT_WEB_SITE_REFERER` (`REFERRAL_DATE_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REF_LOC_BI` ON `FACT_WEB_SITE_REFERER` (`GEO_LOCATION_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REF_REFERER_BI` ON `FACT_WEB_SITE_REFERER` (`REFERER_URL_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REF_VISITOR_BI` ON `FACT_WEB_SITE_REFERER` (`WEB_VISITOR_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REF_WEB_FILE_BI` ON `FACT_WEB_SITE_REFERER` (`WEB_FILE_SK`)
;

CREATE INDEX `FACT_WEB_SITE_SOURCE_BI` ON `FACT_WEB_SITE_REFERER` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REFERER_CUST_BI` ON `FACT_WEB_SITE_REFERER` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_WEB_SITE_REFER_PRODUCT_FK` USING BTREE ON `FACT_WEB_SITE_REFERER` (`PRODUCT_SK`)
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD  PRIMARY KEY (`WEB_VISITOR_SK`,`GEO_LOCATION_SK`,`REFERER_URL_SK`,`REFERRAL_DATE_SK`,`WEB_FILE_SK`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

-- Table FACT_WEB_SITE_VISIT

CREATE TABLE `FACT_WEB_SITE_VISIT`
(
  `KEYWORD_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The keyword phrase surrogate key.  This relates to the keyword phrase dimension.',
  `WEB_VISITOR_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web visitor surrogate key.  This relates to the web visitor dimension.',
  `GEO_LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The geographic location surrogate key.  This relates to the geographic location dimension.',
  `VISIT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The visit date surrogate key.  This column may be used to partition the fact table by time.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key (in the case of web server logs, this will be the parent key).  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CAMPAIGN_WAVE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The campaign wave surrogate key.  The relates to the campaign wave dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `EXIT_WEB_FILE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The exit web file surrogate key.  This relates to the web file dimension.',
  `LANDING_WEB_FILE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The landing web file surrogate key.  This relates to the web file dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `REFERER_URL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web site referer surrogate key.  This relates to the web site referer dimension.',
  `WEB_BROWSER_OS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web browser operating system surrogate key.  This relates to the web browser operating system dimension.',
  `WEB_NAVIGATION_PATH_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The web navigation path surrogate key.  This relates to the web navigation path dimension.',
  `VISIT_DATE` Timestamp NULL
 COMMENT 'The visit date.  This column may be used to partition the fact table by time.',
  `WEB_VISIT_QTY` Int DEFAULT 1
 COMMENT 'The web visit quantity.',
  `WEB_FILE_BYTE_QTY` Int DEFAULT 0
 COMMENT 'The web file byte quantity.',
  `WEB_PAGE_VIEW_QTY` Int DEFAULT 0
 COMMENT 'The web page view quantity.',
  `NEW_VISITOR_QTY` Int DEFAULT 0
 COMMENT 'The new visitor quantity.',
  `RETURNING_VISITOR_QTY` Int DEFAULT 0
 COMMENT 'The returning visitor quantity.',
  `ROBOT_PAGE_VIEW_QTY` Int DEFAULT 0
 COMMENT 'The robot/crawler/spider view quantity.',
  `VIEW_SECONDS_QTY` Int DEFAULT 0
 COMMENT 'The number of seconds a visitor viewed a page.',
  `PAID_VISIT_QTY` Int DEFAULT 0
 COMMENT 'The number of paid keyword visits.  This implies the visit originated from paid keyword source (e..g, Google Adwords, Yahoo Overture).',
  `ORGANIC_VISIT_QTY` Int DEFAULT 0
 COMMENT 'The number of organic visits  This implies the visit originated from an organic keyword source.',
  `SYNDICATION_VIEW_QTY` Int DEFAULT 0
 COMMENT 'The number of syndication (contextual advertisement) search visits.  This column is valued at 1if the visit resulted from a paid syndication/contextual advertisement click.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'This fact table aggregates the web page viewing activity of a visitor at a given location to the day level.'
;

CREATE INDEX `FACT_WEB_SITE_VISIT_BROWSER_BI` ON `FACT_WEB_SITE_VISIT` (`WEB_BROWSER_OS_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_CLIENT_BI` ON `FACT_WEB_SITE_VISIT` (`HOSTED_CLIENT_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_DAY_BI` ON `FACT_WEB_SITE_VISIT` (`VISIT_DATE_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_EXIT_BI` ON `FACT_WEB_SITE_VISIT` (`EXIT_WEB_FILE_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_KEYWORD_BI` ON `FACT_WEB_SITE_VISIT` (`KEYWORD_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_LANDING_BI` ON `FACT_WEB_SITE_VISIT` (`LANDING_WEB_FILE_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_PATH_BI` ON `FACT_WEB_SITE_VISIT` (`WEB_NAVIGATION_PATH_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_REFER_BI` ON `FACT_WEB_SITE_VISIT` (`REFERER_URL_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_SOURCE_BI` ON `FACT_WEB_SITE_VISIT` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_VISITOR_BI` ON `FACT_WEB_SITE_VISIT` (`WEB_VISITOR_SK`)
;

CREATE INDEX `FACT_WEB_VISIT_LOC_BI` ON `FACT_WEB_SITE_VISIT` (`GEO_LOCATION_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_CMPGN_FK` USING BTREE ON `FACT_WEB_SITE_VISIT` (`CAMPAIGN_WAVE_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_CUST_FK` USING BTREE ON `FACT_WEB_SITE_VISIT` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_WEB_SITE_VISIT_PRODUCT_FK` USING BTREE ON `FACT_WEB_SITE_VISIT` (`PRODUCT_SK`)
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD  PRIMARY KEY (`WEB_VISITOR_SK`,`GEO_LOCATION_SK`,`VISIT_DATE_SK`,`SOURCE_SYSTEM_SK`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD UNIQUE `PK_FACT_WEB_SITE_VISIT` (`VISIT_DATE_SK`,`SOURCE_SYSTEM_SK`,`GEO_LOCATION_SK`,`WEB_VISITOR_SK`,`HOSTED_CLIENT_SK`)
;

-- Table FACT_WORKFORCE_OVERVIEW

CREATE TABLE `FACT_WORKFORCE_OVERVIEW`
(
  `MONTH_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The month surrogate key.  This relates to the month dimension.',
  `EMPLOYEE_JOB_ACTION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The employee job action surrogate key.',
  `MANAGER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The manager surrogate key.  This relates to the person dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `COMPANY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The company surrogate key.  This relates to the company dimension.',
  `DEPARTMENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The department surrogate key.  This relates to the department dimension.',
  `JOBCODE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The jobcode surrogate key.  This relates to the jobcode dimension.',
  `POSITION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The position surrogate key.  This relates to the position dimension.',
  `LOCATION_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The location surrogate key.  This relates to the location dimension.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.  This relates to the account dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `OPERATING_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The operating unit surrogate key.  This relates to the operating unit dimension.',
  `SALARY_PLAN_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The salary plan surrogate key.  This relates to the salary plan dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `CONTRACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The contract surrogate key.  This relates to the contract dimension.',
  `EMPLOYEE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The employee surrogate key.  This relates to the person dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `FTE_EQUIVALENT_QTY` Double DEFAULT 0
 COMMENT 'The full time equivalent (FTE) quantity.',
  `TRANSFERRED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of transferred employees.  At the base grain, this is valued at 1 or 0 if an employee was transferred in the period.',
  `TERMINATED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of terminated employees.  At the base grain, this is valued at 1 or 0 if an employee was terminated in the period.',
  `HIRED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of hired employees.  At the base grain, this is valued at 1 or 0 if an employee was hired in the period.',
  `PROMOTED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of promoted employees.  At the base grain, this is valued at 1 or 0 if an employee was promoted in the period.',
  `RESIGNED_QTY` Double DEFAULT 0
 COMMENT 'The quantity of resigned employees.  At the base grain, this is valued at 1 or 0 if an employee resigned in the period.',
  `SALARY_HOUR_QTY` Double DEFAULT 0
 COMMENT 'The number of salary hours.',
  `OVERTIME_HOUR_QTY` Double DEFAULT 0
 COMMENT 'The quantity of overtime hours.',
  `SICK_HOUR_ACCRUED_QTY` Double DEFAULT 0
 COMMENT 'The number of sick hours accrued.',
  `SICK_HOUR_TAKEN_QTY` Double DEFAULT 0
 COMMENT 'The number of sick hours taken.',
  `SICK_HOUR_BALANCE_QTY` Double DEFAULT 0
 COMMENT 'The sick hour balance.',
  `VACATION_HOUR_ACCRUED_QTY` Double DEFAULT 0
 COMMENT 'The number of vacation hours accrued.',
  `VACATION_HOUR_TAKEN_QTY` Double DEFAULT 0
 COMMENT 'The number of vacation hours taken.',
  `VACATION_HOUR_BALANCE_QTY` Double DEFAULT 0
 COMMENT 'The vacation hour balance.',
  `SALARY_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The amount of salary.',
  `OVERTIME_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The amount of overtime pay.',
  `EMPLOYER_RETIREMENT_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The amount of retirement paid by the employer.',
  `EMPLOYEE_RETIREMENT_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The amount of retirement paid by the employee.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The workforce snapshot fact.  This monthly snapshot maintains numeric summaries for each employee.'
;

CREATE UNIQUE INDEX `FACT_WORKFORCE_SNAPSHOT_PK` ON `FACT_WORKFORCE_OVERVIEW` (`MONTH_SK`,`EMPLOYEE_JOB_ACTION_SK`)
;

CREATE INDEX `FACT_WFO_MONTH_BI` ON `FACT_WORKFORCE_OVERVIEW` (`MONTH_SK`)
;

CREATE INDEX `FACT_WFO_EMPL_JOB_ACTION_BI` ON `FACT_WORKFORCE_OVERVIEW` (`EMPLOYEE_JOB_ACTION_SK`)
;

CREATE INDEX `FACT_WFO_MANAGER_BI` ON `FACT_WORKFORCE_OVERVIEW` (`MANAGER_SK`)
;

CREATE INDEX `FACT_WFO_BU_BI` ON `FACT_WORKFORCE_OVERVIEW` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_WFO_COMPANY_BI` ON `FACT_WORKFORCE_OVERVIEW` (`COMPANY_SK`)
;

CREATE INDEX `FACT_WFO_DEPT_BI` ON `FACT_WORKFORCE_OVERVIEW` (`DEPARTMENT_SK`)
;

CREATE INDEX `FACT_WFO_JOBCODE_BI` ON `FACT_WORKFORCE_OVERVIEW` (`JOBCODE_SK`)
;

CREATE INDEX `FACT_WFO_POSITION_BI` ON `FACT_WORKFORCE_OVERVIEW` (`POSITION_SK`)
;

CREATE INDEX `FACT_WFO_LOCATION_BI` ON `FACT_WORKFORCE_OVERVIEW` (`LOCATION_SK`)
;

CREATE INDEX `FACT_WFO_ACCOUNT_BI` ON `FACT_WORKFORCE_OVERVIEW` (`ACCOUNT_SK`)
;

CREATE INDEX `FACT_WFO_PRODUCT_BI` ON `FACT_WORKFORCE_OVERVIEW` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_WFO_OPER_UNIT_BI` ON `FACT_WORKFORCE_OVERVIEW` (`OPERATING_UNIT_SK`)
;

CREATE INDEX `FACT_WFO_SALARY_PLAN_BI` ON `FACT_WORKFORCE_OVERVIEW` (`SALARY_PLAN_SK`)
;

CREATE INDEX `FACT_WFO_T_CRNCY_BI` ON `FACT_WORKFORCE_OVERVIEW` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_WFO_B_CRNCY_BI` ON `FACT_WORKFORCE_OVERVIEW` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_WFO_CONTRACT_BI` ON `FACT_WORKFORCE_OVERVIEW` (`CONTRACT_SK`)
;

CREATE INDEX `FACT_WFO_EMPLOYEE_BI` ON `FACT_WORKFORCE_OVERVIEW` (`EMPLOYEE_SK`)
;

CREATE INDEX `FACT_WFO_SOURCE_BI` ON `FACT_WORKFORCE_OVERVIEW` (`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD  PRIMARY KEY (`MONTH_SK`,`EMPLOYEE_JOB_ACTION_SK`)
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD UNIQUE `PK_FACT_WORKFORCE_OVERVIEW` (`MONTH_SK`,`EMPLOYEE_JOB_ACTION_SK`)
;

-- Table FACT_WORK_ORDER

CREATE TABLE `FACT_WORK_ORDER`
(
  `WORK_ORDER_ID` Varchar(36) NOT NULL
 COMMENT 'The work order identifier in the source system.',
  `WORK_ORDER_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The work order line identifier in the source system.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  All dimensions and base grain fact tables must include this column to enable multiple source system capability',
  `COMPANY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The company surrogate key.  This relates to the company dimension.',
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `PLANNER_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The planner surrogate key.  This relates to the person dimension.',
  `SUPERVISOR_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The supervisor surrogate key.  This relates to the person dimension.',
  `ORIGINATOR_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The originator surrogate key.  This relates to the person dimension.',
  `PRODUCT_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `ORDER_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The order type surrogate key.  This relates to the order type dimension.',
  `RELATED_ORDER_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The related order type surrogate key.  This relates to the related order type dimension.',
  `WORK_ORDER_CATEGORY1_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order category 1 surrogate key.  This relates to the work order category dimension.',
  `WORK_ORDER_CATEGORY2_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order category 2 surrogate key.  This relates to the work order category dimension.',
  `WORK_ORDER_PHASE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order phase surrogate key.  This relates to the work order phase dimension.',
  `WORK_ORDER_STATUS_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order status surrogate key.  This relates to the work order status dimension.',
  `WORK_ORDER_TYPE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order type surrogate key.  This relates to the work order type dimension.',
  `WORK_ORDER_UOM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `WORK_ORDER_VARIANCE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The work order variance surrogate key.  This relates to the work order variance dimension.',
  `WORK_ORDER_DATE` Datetime
 COMMENT 'The work order date.',
  `WORK_ORDER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The work order date surrogate key.  This relates to the day dimension.',
  `WORK_ORDER_ORDER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The work order ordered date surrogate key.  This relates to the day dimension.',
  `WORK_ORDER_ASSIGN_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The work order assigned date surrogate key.  This relates to the day dimension.',
  `WORK_ORDER_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The work order start date surrogate key.  This relates to the day dimension.',
  `WORK_ORDER_COMPLETE_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The work order complete date surrogate key.  This relates to the day dimension.',
  `WORK_ORDER_ORDER_DATE` Datetime
 COMMENT 'The work order ordered date.',
  `WORK_ORDER_ASSIGN_DATE` Datetime
 COMMENT 'The work order assigned date.',
  `WORK_ORDER_START_DATE` Datetime
 COMMENT 'The work order start date.',
  `WORK_ORDER_COMPLETE_DATE` Datetime
 COMMENT 'The work order completed date.',
  `SCRAPPED_PRIMARY_QTY` Double DEFAULT 0
 COMMENT 'The scrapped primary quantity.',
  `SHIPPED_PRIMARY_QTY` Double DEFAULT 0
 COMMENT 'The shipped primary quantity.',
  `ORDERED_PRIMARY_QTY` Double DEFAULT 0
 COMMENT 'The ordered primary quantity.',
  `ASSIGN_MINUTE_QTY` Double DEFAULT 0
 COMMENT 'The number of minutes to assign a work order.',
  `START_MINUTE_QTY` Double DEFAULT 0
 COMMENT 'The number of minutes to start a work order.',
  `COMPLETE_MINUTE_QTY` Double DEFAULT 0
 COMMENT 'The number of minutes to complete a work order.',
  `WORK_ORDER_QTY` Int DEFAULT 1
 COMMENT 'The work order quantity.  Set to 1, used for aggregations.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order fact table.'
;

CREATE INDEX `FACT_WO_ORDER_STATUS_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_STATUS_SK`)
;

CREATE INDEX `FACT_WO_TYPE_BI` ON `FACT_WORK_ORDER` (`ORDER_TYPE_SK`)
;

CREATE INDEX `FACT_WO_RELATED_TYPE_BI` ON `FACT_WORK_ORDER` (`RELATED_ORDER_TYPE_SK`)
;

CREATE INDEX `FACT_WO_VARIANCE_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_VARIANCE_SK`)
;

CREATE INDEX `FACT_WO_PHASE_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_PHASE_SK`)
;

CREATE INDEX `FACT_WO_CATEGORY1_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_CATEGORY1_SK`)
;

CREATE INDEX `FACT_WO_CATEGORY2_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_CATEGORY2_SK`)
;

CREATE INDEX `FACT_WO_UOM_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_UOM_SK`)
;

CREATE INDEX `FACT_WO_WO_DATE_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_DATE`)
;

CREATE INDEX `FACT_WO_COMPANY_BI` ON `FACT_WORK_ORDER` (`COMPANY_SK`)
;

CREATE INDEX `FACT_WO_CUSTOMER_BI` ON `FACT_WORK_ORDER` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_WO_BU_BI` ON `FACT_WORK_ORDER` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_WO_SUPERVISOR_BI` ON `FACT_WORK_ORDER` (`ORIGINATOR_SK`)
;

CREATE INDEX `FACT_WO_PLANNER_BI` ON `FACT_WORK_ORDER` (`PLANNER_SK`)
;

CREATE INDEX `FACT_WO_ORDER_DATE_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_DATE_SK`)
;

CREATE INDEX `FACT_WO_ASSIGN_DATE_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_ASSIGN_DATE_SK`)
;

CREATE INDEX `FACT_WO_START_DATE_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_START_DATE_SK`)
;

CREATE INDEX `FACT_WO_COMPLETE_DATE_BI` ON `FACT_WORK_ORDER` (`WORK_ORDER_COMPLETE_DATE_SK`)
;

CREATE INDEX `FACT_WO_ORDER_TYPE_BI` ON `FACT_WORK_ORDER` (`ORDER_TYPE_SK`)
;

ALTER TABLE `FACT_WORK_ORDER` ADD  PRIMARY KEY (`WORK_ORDER_ID`,`WORK_ORDER_LINE_ID`,`BUSINESS_UNIT_SK`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `FACT_WORK_ORDER` ADD UNIQUE `PK_FACT_WORK_ORDER` (`WORK_ORDER_ID`,`BUSINESS_UNIT_SK`,`WORK_ORDER_LINE_ID`,`SOURCE_SYSTEM_SK`)
;

-- Table STAGE_ACCOUNT

CREATE TABLE `STAGE_ACCOUNT`
(
  `ACCOUNT_ID` Varchar(36) NOT NULL
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system account SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `ACCOUNT_DESC` Varchar(255)
 COMMENT 'The account description.',
  `ACCOUNT_NAME` Varchar(60)
 COMMENT 'The account name.',
  `ACCOUNT_TYPE_ID` Varchar(32)
 COMMENT 'The account type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account type in the source.',
  `ACCOUNT_TYPE_DESC` Varchar(255)
 COMMENT 'The account type description.',
  `OBJECT_ACCOUNT_ID` Varchar(32)
 COMMENT 'The object account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an object account in the source.',
  `OBJECT_ACCOUNT_DESC` Varchar(255)
 COMMENT 'The object account description.',
  `SUBSIDIARY_ACCOUNT_ID` Varchar(32)
 COMMENT 'The subsidiary account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subsidiary account in the source.',
  `SUBSIDIARY_ACCOUNT_DESC` Varchar(255)
 COMMENT 'The subsidiary account description.',
  `LEVEL_NUMBER` Int
 COMMENT 'The level number of the account in the account hierarchy.',
  `ACCOUNT_LEVEL_OF_DETAIL_IND` Char(1)
 COMMENT 'The account level of detail indicator.',
  `ACCOUNT_CATEGORY_1_CODE` Varchar(32)
 COMMENT 'The account category 1 account code.',
  `ACCOUNT_CATEGORY_1_DESC` Varchar(255)
 COMMENT 'The account category 1 account description.',
  `ACCOUNT_CATEGORY_2_CODE` Varchar(32)
 COMMENT 'The account category 2 account code.',
  `ACCOUNT_CATEGORY_2_DESC` Varchar(255)
 COMMENT 'The account category 2 account description.',
  `ACCOUNT_CLASSIFICATION_NAME` Varchar(60)
 COMMENT 'The account classification name.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The financial account stage table.'
;

ALTER TABLE `STAGE_ACCOUNT` ADD  PRIMARY KEY (`ACCOUNT_ID`,`ACCOUNT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ACCOUNT` ADD UNIQUE `PK_STAGE_ACCOUNT` (`ACCOUNT_ID`,`ACCOUNT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_ACCOUNT_HIERARCHY

CREATE TABLE `STAGE_ACCOUNT_HIERARCHY`
(
  `PARENT_ACCOUNT_ID` Varchar(36)
 COMMENT 'The parent account identifier.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The (child) account identifier.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `ACCOUNT_NAME` Varchar(60)
 COMMENT 'The (child) account name.',
  `PARENT_ACCOUNT_NAME` Varchar(60)
 COMMENT 'The parent account name.',
  `LEVEL_NUMBER` Int
 COMMENT 'The level of the hierarchical relationship.  For the root (top of the hierarchy), this will be 0.  For the direct subsidiary, this will be 1, etc.',
  `BOTTOM_IND` Char(1)
 COMMENT 'This denotes the bottom of a particular hierarchy.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account hierarchy stage table.'
;

-- Table STAGE_ADVERTISEMENT

CREATE TABLE `STAGE_ADVERTISEMENT`
(
  `AD_ID` Varchar(36) NOT NULL
 COMMENT 'The advertisement identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capabililty.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `AD_NAME` Varchar(60)
 COMMENT 'The advertisement name.',
  `AD_DESC` Varchar(255)
 COMMENT 'The advertisement description.',
  `AD_1_DESC` Varchar(255)
 COMMENT 'The advertisement line 1 description.',
  `AD_2_DESC` Varchar(255)
 COMMENT 'The advertisement line 2 description.',
  `AD_TYPE_ID` Varchar(32)
 COMMENT 'The advertisement type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement type in the source.',
  `AD_TYPE_NAME` Varchar(60)
 COMMENT 'The advertisement type name.',
  `AD_TYPE_DESC` Varchar(255)
 COMMENT 'The advertisement type description.',
  `AD_STATUS_ID` Varchar(32)
 COMMENT 'The advertisement status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement status in the source.',
  `AD_STATUS_NAME` Varchar(60)
 COMMENT 'The advertisement status name.',
  `AD_STATUS_DESC` Varchar(255)
 COMMENT 'The advertisement status description.',
  `AD_STATUS_DATE` Datetime
 COMMENT 'The advertisement status date.',
  `AD_BUSINESS_NAME` Varchar(60)
 COMMENT 'The advertisement business name.',
  `AD_BUSINESS_LOCATION_DESC` Varchar(255)
 COMMENT 'The advertisement business location.',
  `AD_DISPLAY_URL_DESC` Varchar(1024)
 COMMENT 'The display URL description.',
  `AD_DESTINATION_URL_DESC` Varchar(1024)
 COMMENT 'The destination URL description.',
  `AD_GROUP_NAME` Varchar(60)
 COMMENT 'The ad group name.',
  `AD_BUSINESS_PHONE_NUMBER` Varchar(32)
 COMMENT 'The telephone number associated with the advertisement.',
  `AD_DISTRIBUTION_DESC` Varchar(255)
 COMMENT 'The advertisement distribution description.  For example, Search Only, Content Only, etc.',
  `AD_GROUP_STATUS_DESC` Varchar(255)
 COMMENT 'The advertisement group status description.',
  `IMAGE_URL_DESC` Varchar(255)
 COMMENT 'A description of the advertisement image.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The advertisement stage table.'
;

CREATE UNIQUE INDEX `STAGE_ADVERTISEMENT_AK` ON `STAGE_ADVERTISEMENT` (`AD_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ADVERTISEMENT` ADD  PRIMARY KEY (`AD_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_ADVERTISEMENT_IMPRESSION

CREATE TABLE `STAGE_ADVERTISEMENT_IMPRESSION`
(
  `IMPRESSION_DATE` Timestamp NULL
 COMMENT 'The impression date.',
  `SOURCE_SYSTEM_ID` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CAMPAIGN_WAVE_ID` Varchar(36)
 COMMENT 'The campaign wave identifier in the source system.',
  `CAMPAIGN_WAVE_NAME` Varchar(60)
 COMMENT 'The campaign wave name.',
  `CAMPAIGN_NAME` Varchar(60)
 COMMENT 'The campaign name.',
  `CAMPAIGN_WAVE_STATUS_DESC` Varchar(255)
 COMMENT 'The campaign wave status description.',
  `CAMPAIGN_WAVE_BUDGET_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The campaign wave budget amount.',
  `AD_GROUP_NAME` Varchar(60)
 COMMENT 'The ad group name.',
  `KEYWORD_DESC` Varchar(255)
 COMMENT 'The keyword phrase description.',
  `MATCHING_OPTION_DESC` Varchar(255)
 COMMENT 'The keyword phrase matching option description.',
  `KEYWORD_STATUS_DESC` Varchar(255)
 COMMENT 'The keyword phrase status description.',
  `MIN_CPC_AMT` Decimal(26,2)
 COMMENT 'The minimum cost per click amount.',
  `AD_ID` Varchar(36)
 COMMENT 'The advertisement identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an advertisement in the source.',
  `AD_BUSINESS_NAME` Varchar(60)
 COMMENT 'The advertisement business name.',
  `AD_NAME` Varchar(60)
 COMMENT 'The advertisement name.',
  `AD_DESC` Varchar(255)
 COMMENT 'The advertisement description.',
  `AD_1_DESC` Varchar(255)
 COMMENT 'The advertisement line 1 description.',
  `AD_2_DESC` Varchar(255)
 COMMENT 'The advertisement line 2 description.',
  `AD_BUSINESS_LOCATION_DESC` Varchar(255)
 COMMENT 'The advertisement business location.',
  `AD_BUSINESS_PHONE_NUMBER` Varchar(32)
 COMMENT 'The telephone number associated with the advertisement.',
  `AD_DISPLAY_URL_DESC` Varchar(255)
 COMMENT 'The display URL description.',
  `AD_DESTINATION_URL_DESC` Varchar(255)
 COMMENT 'The destination URL description.',
  `AD_TYPE_DESC` Varchar(255)
 COMMENT 'The advertisement type description.',
  `AD_STATUS_DESC` Varchar(255)
 COMMENT 'The advertisement status description.',
  `AD_DISTRIBUTION_DESC` Varchar(255)
 COMMENT 'The advertisement distribution description.  For example, Search Only, Content Only, etc.',
  `AD_GROUP_STATUS_DESC` Varchar(255)
 COMMENT 'The advertisement group status description.',
  `DESTINATION_URL` Varchar(255)
 COMMENT 'The advertisement destination URL description.',
  `MAX_CPC_AMT` Decimal(26,2)
 COMMENT 'The maximum cost per click amount.',
  `CONTENT_BID_AMT` Decimal(26,2)
 COMMENT 'The content bid amount.',
  `PREFERED_HIGH_RANK_QTY` Varchar(255)
 COMMENT 'The preferred high rank quantity.',
  `PREFERED_LOW_RANK_QTY` Varchar(255)
 COMMENT 'The preferred low rank quantity.',
  `KEYWORD_DESTINATION_URL_DESC` Varchar(255)
 COMMENT 'The keyword destination URL description.',
  `IMAGE_URL_DESC` Varchar(255)
 COMMENT 'A description of the advertisement image.',
  `AD_IMPRESSION_QTY` Int UNSIGNED
 COMMENT 'The advertisement impression quantity.',
  `AD_CLICK_QTY` Int UNSIGNED
 COMMENT 'The advertisement click quantity.',
  `AD_CLICK_RATE` Decimal(9,5)
 COMMENT 'The advertisement click rate.  Warning, this is not additive.',
  `CPC_AVERAGE_AMT` Decimal(26,2)
 COMMENT 'The average cost per click (CPC) amount (ad cost amount / ad click quantity).  Warning, this is not additive.',
  `AD_COST_AMT` Decimal(26,2)
 COMMENT 'The advertisement cost quantity.',
  `AVERAGE_POSITION_QTY` Int UNSIGNED
 COMMENT 'The average advertisement position quantity.  Warning, this is not additive.',
  `CURRENCY_ID` Varchar(32)
 COMMENT 'The currency identifier in the source system.',
  `DW_DIMENSION_LOAD_IND` Char(1)
 COMMENT 'This denotes a row has been sucessfully loaded into the dimension.  It implies the fact table load is pending.  Subsequent to the fact table load, the row iwll be hard deleted from the stage table.  This column is only used when a single stage table supports both a fact and dimension table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `SOURCE_FILE_NAME` Varchar(255)
 COMMENT 'The source file name.',
  `CPA_AMT` Decimal(26,2)
 COMMENT 'The cost per action amount.',
  `CONVERSION_RATE` Decimal(7,4)
 COMMENT 'The conversion rate.',
  `CONVERSION_QTY` Bigint
 COMMENT 'The conversion quantity.',
  `SPEND_AMT` Decimal(26,2)
 COMMENT 'The spend amount.',
  `AD_GROUP_ID` Varchar(36)
 COMMENT 'The advertisement group identifier.',
  `AD_GROUP_ITEM_ID` Varchar(36)
 COMMENT 'The advertisement group item identifier.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The account identifier.',
  `ACCOUNT_NUMBER` Varchar(36)
 COMMENT 'The account number.',
  `LANGUAGE_MARKET_DESC` Varchar(255)
 COMMENT 'The language market description.',
  `ACCOUNT_NAME` Varchar(60)
 COMMENT 'The account name.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.'
)
 COMMENT = 'The advertisement impression stage table.  This table was designed to maintain data from the Google Ad Detail Report (all columns selected).'
;

-- Table STAGE_AGREEMENT

CREATE TABLE `STAGE_AGREEMENT`
(
  `AGREEMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The agreement identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an agreement in the source.',
  `AGREEMENT_RENEWAL_NUMBER` Varchar(36) NOT NULL
 COMMENT 'The agreement renewal number.',
  `AGREEMENT_LINE_NUMBER` Varchar(36) NOT NULL
 COMMENT 'The agreement line number.',
  `AGREEMENT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system agreement SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `AGREEMENT_DESC` Varchar(255)
 COMMENT 'The agreement description.',
  `AGREEMENT_LINE_DESC` Varchar(255)
 COMMENT 'The agreement line description.',
  `AGREEMENT_CATEGORY` Varchar(32)
 COMMENT 'The agreement category.',
  `AGREEMENT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The agreement category name.',
  `AGREEMENT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The agreement category description.',
  `AGREEMENT_ACTIVATED_DATE` Datetime
 COMMENT 'The agreement activated date.',
  `AGREEMENT_START_DATE` Datetime
 COMMENT 'The agreement start date.',
  `AGREEMENT_END_DATE` Datetime
 COMMENT 'The agreement end date.',
  `AGREEMENT_RENEWAL_DATE` Datetime
 COMMENT 'The agreement renewal date.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The agreement stage table.'
;

CREATE UNIQUE INDEX `STAGE_AGREEMENT_PK` ON `STAGE_AGREEMENT` (`AGREEMENT_ID`,`AGREEMENT_RENEWAL_NUMBER`,`AGREEMENT_LINE_NUMBER`,`AGREEMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_AGREEMENT` ADD  PRIMARY KEY (`AGREEMENT_ID`,`AGREEMENT_RENEWAL_NUMBER`,`AGREEMENT_LINE_NUMBER`,`AGREEMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_APPLICATION_STATUS

CREATE TABLE `STAGE_APPLICATION_STATUS`
(
  `APPLICATION_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The application status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a application status in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `APPLICATION_STATUS_NAME` Varchar(60)
 COMMENT 'The application status name.',
  `APPLICATION_STATUS_DESC` Varchar(60)
 COMMENT 'The application status description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The application status stage table.'
;

ALTER TABLE `STAGE_APPLICATION_STATUS` ADD  PRIMARY KEY (`APPLICATION_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_BANK_ACCOUNT

CREATE TABLE `STAGE_BANK_ACCOUNT`
(
  `BANK_ACCOUNT_ID` Varchar(36) NOT NULL
 COMMENT 'The bank account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bank account in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `BANK_ACCOUNT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system bank account SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BANK_ACCOUNT_NAME` Varchar(60)
 COMMENT 'The bank account name.',
  `BANK_ACCOUNT_TYPE_ID` Varchar(36)
 COMMENT 'The bank account type idenfier in the source system.',
  `BANK_ACCOUNT_TYPE_CODE` Varchar(32)
 COMMENT 'The bank account type code.',
  `BANK_ACCOUNT_TYPE_NAME` Varchar(60)
 COMMENT 'The bank account type name.',
  `BANK_ACCOUNT_TYPE_DESC` Varchar(255)
 COMMENT 'The bank account type description.',
  `BANK_CODE` Varchar(32)
 COMMENT 'The bank code.',
  `BANK_NAME` Varchar(60)
 COMMENT 'The bank name.',
  `BANK_DESC` Varchar(255)
 COMMENT 'The bank description.',
  `BANK_ACCOUNT_STATUS_CODE` Varchar(32)
 COMMENT 'The bank account status code.',
  `BANK_ACCOUNT_STATUS_NAME` Varchar(60)
 COMMENT 'The bank account status name.',
  `BANK_ACCOUNT_STATUS_DESC` Varchar(255)
 COMMENT 'The bank account status description.',
  `CREDIT_RATING_TYPE_CODE` Varchar(32)
 COMMENT 'The credit rating type code.',
  `CREDIT_RATING_TYPE_NAME` Varchar(60)
 COMMENT 'The credit rating type name.',
  `CREDIT_RATING_TYPE_DESC` Varchar(255)
 COMMENT 'The credit rating type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

CREATE UNIQUE INDEX `STAGE_BANK_ACCOUNT_PK` ON `STAGE_BANK_ACCOUNT` (`BANK_ACCOUNT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BANK_ACCOUNT` ADD  PRIMARY KEY (`BANK_ACCOUNT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BANK_ACCOUNT` ADD UNIQUE `PK_STAGE_BANK_ACCOUNT` (`BANK_ACCOUNT_ID`,`BANK_ACCOUNT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_BILLING

CREATE TABLE `STAGE_BILLING`
(
  `INVOICE_ID` Varchar(36) NOT NULL
 COMMENT 'The invoice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `INVOICE_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The invoice line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `CUSTOMER_BILL_TO_ID` Varchar(36)
 COMMENT 'The bill to customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill to customer in the source.',
  `CUSTOMER_SHIP_TO_ID` Varchar(36)
 COMMENT 'The ship to customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a ship to customer in the source.',
  `CUSTOMER_BILL_TO_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system bill to customer SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_SHIP_TO_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system ship to customer SETID.  This column is often used as part of the unique identifer.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee (sales representative) identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `ORDER_TYPE_ID` Varchar(36)
 COMMENT 'The order type identifier in the source system.',
  `SALES_CHANNEL_ID` Varchar(36)
 COMMENT 'The order type identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `SALES_CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system sales channel SETID.  This column is often used as part of the unique identifer.  Not intended for display.',
  `BILL_TYPE_ID` Varchar(36)
 COMMENT 'The bill type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill type in the source.',
  `BILL_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system bill type SETID.  This column is often used as part of the unique identifer.',
  `BILL_STATUS_ID` Varchar(36)
 COMMENT 'The bill status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill status in the source.',
  `ACCOUNTING_DATE` Timestamp NULL
 COMMENT 'The accounting date.',
  `ORDER_CAPTURE_DATE` Timestamp NULL
 COMMENT 'The order date.',
  `INVOICE_DATE` Timestamp NULL
 COMMENT 'The invoice date.',
  `ORDER_CAPTURE_ID` Varchar(36)
 COMMENT 'The order (capture) source system identifier.  It is a degenerate dimension in the order capture fact table.',
  `ORDER_CAPTURE_LINE_ID` Varchar(36)
 COMMENT 'The order line number.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifer in the source system.  It is a degenerate dimenension in the order capture fact table.  Note:  this may or not be a numeric value.',
  `PURCHASE_ORDER_LINE_ID` Varchar(36)
 COMMENT 'The customer purchase order (PO) line identifer in the source system.  It is a degenerate dimenension in the order capture fact table.',
  `INVOICE_AMT` Double
 COMMENT 'The invoice amount.',
  `DISCOUNT_AMT` Double
 COMMENT 'The transaction discount amount.',
  `SURCHARGE_AMT` Double
 COMMENT 'The transaction surcharge amount.',
  `TAX_AMT` Double
 COMMENT 'The transaction tax amount.',
  `GROSS_EXTENDED_AMT` Double
 COMMENT 'The transaction gross extended amount.',
  `NET_EXTENDED_AMT` Double
 COMMENT 'The transaction net extended amount.',
  `BILLED_QTY` Double
 COMMENT 'The billed unit quantity.',
  `COST_AMT` Double
 COMMENT 'The transaction cost amount.',
  `FREIGHT_AMT` Double
 COMMENT 'The transaction freight amount.',
  `CREDIT_AMT` Double
 COMMENT 'The transaction credit amount.',
  `LIST_AMT` Double
 COMMENT 'The transaction list amount.',
  `REBATE_AMT` Double
 COMMENT 'The transaction rebate amount.',
  `SERVICE_FEE_AMT` Double
 COMMENT 'The transaction service fee amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(9,5) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_DIMENSION_LOAD_IND` Char(1)
 COMMENT 'This denotes a row has been sucessfully loaded into the dimension.  It implies the fact table load is pending.  Subsequent to the fact table load, the row iwll be hard deleted from the stage table.  This column is only used when a single stage table supports both a fact and dimension table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The billing (invoice line) stage table.'
;

ALTER TABLE `STAGE_BILLING` ADD  PRIMARY KEY (`INVOICE_ID`,`INVOICE_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_BILL_STATUS

CREATE TABLE `STAGE_BILL_STATUS`
(
  `BILL_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The bill status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill status in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `BILL_STATUS_NAME` Varchar(60)
 COMMENT 'The bill status name.',
  `BILL_STATUS_DESC` Varchar(255)
 COMMENT 'The bill status description.',
  `BILL_STATUS_GROUP_ID` Varchar(36)
 COMMENT 'The bill status group source system identifier.',
  `BILL_STATUS_GROUP_NAME` Varchar(60)
 COMMENT 'The bill status group name.',
  `BILL_STATUS_GROUP_DESC` Varchar(255)
 COMMENT 'The bill status group description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

CREATE UNIQUE INDEX `STAGE_BILL_STATUS_PK` ON `STAGE_BILL_STATUS` (`BILL_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BILL_STATUS` ADD  PRIMARY KEY (`BILL_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BILL_STATUS` ADD UNIQUE `PK_STAGE_BILL_STATUS` (`BILL_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_BILL_TYPE

CREATE TABLE `STAGE_BILL_TYPE`
(
  `BILL_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The bill type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill type in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `BILL_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system bill type SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `BILL_TYPE_NAME` Varchar(60)
 COMMENT 'The bill type name.',
  `BILL_TYPE_DESC` Varchar(255)
 COMMENT 'The bill type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

CREATE UNIQUE INDEX `STAGE_BILL_TYPE_PK` ON `STAGE_BILL_TYPE` (`BILL_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BILL_TYPE` ADD  PRIMARY KEY (`BILL_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BILL_TYPE` ADD UNIQUE `PK_STAGE_BILL_TYPE` (`BILL_TYPE_ID`,`BILL_TYPE_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_BUDGET_FORECAST

CREATE TABLE `STAGE_BUDGET_FORECAST`
(
  `BUDGET_FRCST_ID` Varchar(36) NOT NULL
 COMMENT 'The budget forecast identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a budget forecast  in the source.',
  `BUDGET_FRCST_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system budget forecast SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The budget forecast reference effective date.',
  `BUDGET_FRCST_NAME` Varchar(60)
 COMMENT 'The budget forecast name.',
  `BUDGET_FRCST_DESC` Varchar(255)
 COMMENT 'The budget forecast description.',
  `BUDGET_FRCST_FISCAL_YEAR_NUMBER` Smallint
 COMMENT 'The budget forecast fiscal year.',
  `BUDGET_FRCST_FISCAL_YEAR` Smallint
 COMMENT 'The budget forecast fiscal year.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The budget forecast stage table.'
;

ALTER TABLE `STAGE_BUDGET_FORECAST` ADD  PRIMARY KEY (`BUDGET_FRCST_ID`,`BUDGET_FRCST_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BUDGET_FORECAST` ADD UNIQUE `PK_STAGE_BUDGET_FORECAST` (`BUDGET_FRCST_ID`,`BUDGET_FRCST_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_BUSINESS_UNIT

CREATE TABLE `STAGE_BUSINESS_UNIT`
(
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_NAME` Varchar(60)
 COMMENT 'The business unit name.',
  `BUSINESS_UNIT_DESC` Varchar(60)
 COMMENT 'The business unit description',
  `BUSINESS_UNIT_ALT_ID` Varchar(36)
 COMMENT 'The alternate business unit identifier in the source system.',
  `BUSINESS_UNIT_TYPE_CODE` Varchar(32)
 COMMENT 'The business unit type code.',
  `BUSINESS_UNIT_TYPE_NAME` Varchar(20)
 COMMENT 'The business unit type name.',
  `BUSINESS_UNIT_TYPE_DESC` Varchar(20)
 COMMENT 'The business unit type description.',
  `BUSINESS_UNIT_CATEGORY` Varchar(32)
 COMMENT 'The business unit category.',
  `START_DATE` Timestamp NULL
 COMMENT 'The start date of the business unit.',
  `REMODEL_DATE` Timestamp NULL
 COMMENT 'The remodel date.',
  `STOP_DATE` Timestamp NULL
 COMMENT 'The stop date of the business unit.',
  `BUSINESS_UNIT_STATUS_CODE` Varchar(32)
 COMMENT 'The business unit status code.',
  `BUSINESS_UNIT_STATUS_NAME` Varchar(20)
 COMMENT 'The business unit status name.',
  `BUSINESS_UNIT_STATUS_DESC` Varchar(20)
 COMMENT 'The business unit status description.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The address line 1 description.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The address line 2 description.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The address line 3 description.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The address line 4 description.',
  `CITY_NAME` Varchar(255)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(255)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(6)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(255)
 COMMENT 'The state or province name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(255)
 COMMENT 'The country name.',
  `AREA_QTY` Double
 COMMENT 'The area quantity.',
  `AREA_UOM_ID` Varchar(32)
 COMMENT 'The area unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `REGION_NAME` Varchar(255)
 COMMENT 'The region name.',
  `DISTRICT_NAME` Varchar(255)
 COMMENT 'The district name.',
  `LATITUDE` Double
 COMMENT 'The latitude.',
  `LONGITUDE` Double
 COMMENT 'The longitude.',
  `PHONE_COUNTRY_CODE` Varchar(32)
 COMMENT 'The telephone country code.',
  `PHONE_REGION_CODE` Double
 COMMENT 'The phone region code.',
  `PARENT_BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The parent business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `PARENT_BUSINESS_UNIT_NAME` Varchar(60)
 COMMENT 'The parent business unit name.',
  `LEVEL_NUMBER` Double
 COMMENT 'The level number of the business unit in the business unit hierarchy.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1)
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1)
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The business unit stage dimension.'
;

ALTER TABLE `STAGE_BUSINESS_UNIT` ADD  PRIMARY KEY (`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_BUSINESS_UNIT` ADD UNIQUE `PK_STAGE_BUSINESS_UNIT` (`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_BUSINESS_UNIT_HIERARCHY

CREATE TABLE `STAGE_BUSINESS_UNIT_HIERARCHY`
(
  `PARENT_BUSINESS_UNIT_ID` Varchar(36) NOT NULL
 COMMENT 'The parent business unit identifier.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL
 COMMENT 'The (child) business unit identifier.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `PARENT_BUSINESS_UNIT_NAME` Varchar(60)
 COMMENT 'The parent business unit name.',
  `BUSINESS_UNIT_NAME` Varchar(60)
 COMMENT 'The (child) business unit name.',
  `LEVEL_NUMBER` Double
 COMMENT 'The level of the hierarchical relationship.  For the root (top of the hierarchy), this will be 0.  For the direct subsidiary, this will be 1, etc.',
  `BOTTOM_IND` Char(1)
 COMMENT 'This denotes the bottom of a particular hierarchy.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The business unit hierarchy stage table.'
;

ALTER TABLE `STAGE_BUSINESS_UNIT_HIERARCHY` ADD  PRIMARY KEY (`PARENT_BUSINESS_UNIT_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CALL_RESULT

CREATE TABLE `STAGE_CALL_RESULT`
(
  `CALL_RESULT_ID` Varchar(36) NOT NULL
 COMMENT 'The call result identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a call result in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `CALL_RESULT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system call result SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CALL_RESULT_NAME` Varchar(60)
 COMMENT 'The call result name.',
  `CALL_RESULT_DESC` Varchar(255)
 COMMENT 'The call result description.',
  `CALL_RESULT_CATEGORY` Varchar(36)
 COMMENT 'The call result category.',
  `CALL_RESULT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The call result category name.',
  `CALL_RESULT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The call result category description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The call result stage.'
;

CREATE UNIQUE INDEX `STAGE_CALL_RESULT_PK` ON `STAGE_CALL_RESULT` (`CALL_RESULT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CALL_RESULT` ADD  PRIMARY KEY (`CALL_RESULT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CALL_TYPE

CREATE TABLE `STAGE_CALL_TYPE`
(
  `CALL_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The call type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a call type in the source.',
  `CALL_TYPE_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system call type SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All STAGEs and base grain fact tables must include this column to enable multiple source system capability.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The effective date.',
  `CALL_TYPE_NAME` Varchar(60)
 COMMENT 'The call type name.',
  `CALL_TYPE_DESC` Varchar(255)
 COMMENT 'The call type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The call type stage.'
;

CREATE UNIQUE INDEX `STAGE_CALL_TYPE_PK` ON `STAGE_CALL_TYPE` (`CALL_TYPE_ID`,`CALL_TYPE_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CALL_TYPE` ADD  PRIMARY KEY (`CALL_TYPE_ID`,`CALL_TYPE_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CAMPAIGN_WAVE

CREATE TABLE `STAGE_CAMPAIGN_WAVE`
(
  `CAMPAIGN_ID` Varchar(36) NOT NULL
 COMMENT 'The marketing campaign identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign in the source.',
  `CAMPAIGN_WAVE_ID` Varchar(36) NOT NULL DEFAULT 1
 COMMENT 'The marketing campaign wave identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign wave in the source.  This column should be valued at 1 if null.',
  `CAMPAIGN_WAVE_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system campaign wave SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `CAMPAIGN_NAME` Varchar(60)
 COMMENT 'The campaign name.',
  `CAMPAIGN_WAVE_NAME` Varchar(60)
 COMMENT 'The campaign wave name.',
  `CAMPAIGN_WAVE_START_DATE` Timestamp NULL
 COMMENT 'The campaign start date.',
  `CAMPAIGN_WAVE_STOP_DATE` Timestamp NULL
 COMMENT 'The campaign stop date.',
  `CAMPAIGN_STATUS_CODE` Varchar(32)
 COMMENT 'The campaign status code.',
  `CAMPAIGN_STATUS_DESC` Varchar(255)
 COMMENT 'The campaign status description.',
  `CAMPAIGN_OBJECTIVE_CODE` Varchar(32)
 COMMENT 'The campaign objective code.',
  `CAMPAIGN_OBJECTIVE_DESC` Varchar(255)
 COMMENT 'The campaign objective description.',
  `CAMPAIGN_OFFER_NAME` Varchar(60)
 COMMENT 'The campaign offer name.',
  `CAMPAIGN_CONTENT_DESC` Varchar(255)
 COMMENT 'The campaign content desc.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_TYPE_NAME` Varchar(32)
 COMMENT 'The campaign content name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_TYPE_DESC` Varchar(255)
 COMMENT 'The campaign content  type description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `CAMPAIGN_CONTENT_SUBTYPE_NAME` Varchar(32)
 COMMENT 'The campaign content subtype name.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content Hierarchy.',
  `CAMPAIGN_CONTENT_SUBTYPE_DESC` Varchar(255)
 COMMENT 'The campaign content  subtype description.  This is part of the Campaign Content Type -> Content Subtype -> Campaign Content hierarchy.',
  `PROGRAM_OWNER_ID` Varchar(36)
 COMMENT 'The program owner source system identifier.',
  `PROGRAM_OWNER_NAME` Varchar(60)
 COMMENT 'The program owner name.',
  `CAMPAIGN_CONTENT_NAME` Varchar(60)
 COMMENT 'The campaign content name.',
  `CAMPAIGN_STATUS_NAME` Varchar(60)
 COMMENT 'The campaign status name.',
  `PROMOTION_CODE` Varchar(60)
 COMMENT 'The promotion code associated with the campaign.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The marketing campaign wave (promotion) stage table.'
;

CREATE UNIQUE INDEX `STAGE_MARKETING_CAMPAIGN_PK` ON `STAGE_CAMPAIGN_WAVE` (`CAMPAIGN_ID`,`CAMPAIGN_WAVE_ID`,`CAMPAIGN_WAVE_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CAMPAIGN_WAVE` ADD  PRIMARY KEY (`CAMPAIGN_ID`,`CAMPAIGN_WAVE_ID`,`CAMPAIGN_WAVE_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CAMPAIGN_WAVE` ADD UNIQUE `PK_STAGE_CAMPAIGN_WAVE` (`CAMPAIGN_ID`,`CAMPAIGN_WAVE_ID`,`CAMPAIGN_WAVE_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CARRIER

CREATE TABLE `STAGE_CARRIER`
(
  `CARRIER_ID` Varchar(36) NOT NULL,
  `CARRIER_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1,
  `CARRIER_NAME` Varchar(60),
  `CARRIER_DESC` Varchar(255),
  `FREIGHT_FORWARD_IND` Char(1),
  `FREIGHT_VENDOR_IND` Char(1),
  `TRUCK_IND` Char(1),
  `RAIL_IND` Char(1),
  `BARG_IND` Char(1),
  `VESSEL_IND` Char(1),
  `EFFECTIVE_STATUS_CODE` Varchar(32),
  `EFFECTIVE_STATUS_DATE` Timestamp NULL,
  `CITY_NAME` Varchar(60),
  `COUNTY_NAME` Varchar(60),
  `STATE_PROVINCE_CODE` Varchar(32),
  `STATE_PROVINCE_NAME` Varchar(60),
  `COUNTRY_CODE` Varchar(32),
  `COUNTRY_NAME` Varchar(60),
  `POSTAL_CODE` Varchar(32),
  `CONTINENT_NAME` Varchar(60),
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `STATUS_NAME` Varchar(60)
 COMMENT 'The status name.',
  `STATUS_CODE` Varchar(32)
 COMMENT 'The status code.',
  `STATUS_DATE` Datetime
 COMMENT 'The status date.'
)
 COMMENT = 'The carrier (shipper) stage table.'
;

ALTER TABLE `STAGE_CARRIER` ADD  PRIMARY KEY (`CARRIER_ID`,`CARRIER_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CASE

CREATE TABLE `STAGE_CASE`
(
  `CASE_ID` Varchar(36) NOT NULL
 COMMENT 'The caes identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CASE_DESC` Varchar(255)
 COMMENT 'The case description.',
  `CASE_TYPE_CODE` Varchar(32)
 COMMENT 'The case type code.',
  `CASE_TYPE_NAME` Varchar(60)
 COMMENT 'The case type name.',
  `CASE_OPEN_DATE` Datetime
 COMMENT 'The case open date.',
  `TARGET_CLOSE_DATE` Datetime
 COMMENT 'The target close date.',
  `RESTORE_DATE` Datetime
 COMMENT 'The restore date.',
  `RESTORE_MET_DATE` Datetime
 COMMENT 'The restore met date.',
  `RESPONSE_DATE` Datetime
 COMMENT 'The response date.',
  `RESPONSE_MET_DATE` Datetime
 COMMENT 'The response met date.',
  `CASE_CLOSED_DATE` Datetime
 COMMENT 'The case closed date.',
  `AGENT_ID` Varchar(36)
 COMMENT 'The agent identifier in the source system.',
  `AGENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system agent SETID.  This column is often used as part of the unique identifer.',
  `PRIOR_AGENT_ID` Varchar(36)
 COMMENT 'The prior agent identifier in the source system.',
  `PRIOR_AGENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system prior agent SETID.  This column is often used as part of the unique identifer.',
  `CASE_STATUS_ID` Varchar(36)
 COMMENT 'The case status identifier in the source system.',
  `CASE_STATUS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case status SETID.  This column is often used as part of the unique identifer.',
  `CASE_PRIORITY_ID` Varchar(36)
 COMMENT 'The case priority souce system identifier.',
  `CASE_PRIORITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case priority SETID.  This column is often used as part of the unique identifer.',
  `CASE_SEVERITY_ID` Varchar(36)
 COMMENT 'The case severity identifier in the source system.',
  `CASE_SEVERITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case severity SETID.  This column is often used as part of the unique identifer.',
  `CASE_SOURCE_ID` Varchar(36)
 COMMENT 'The case source identifier in the source system.',
  `CASE_SOURCE_NAME` Varchar(60)
 COMMENT 'The case source name.',
  `CONTACT_CENTER_CATEGORY` Varchar(36)
 COMMENT 'The contact center category.',
  `CONTACT_CENTER_CATEGORY_NAME` Varchar(60)
 COMMENT 'The contact center category name.',
  `CASE_SPECIALTY_TYPE_CODE` Varchar(36)
 COMMENT 'The case specialty type.',
  `CASE_SPECIALTY_TYPE_DESC` Varchar(255)
 COMMENT 'The case specialty type description.',
  `CASE_DETAIL_NAME` Varchar(60)
 COMMENT 'The case detail name.',
  `CASE_DETAIL_DESC` Varchar(255)
 COMMENT 'The case detail description.',
  `PROBLEM_TYPE_CODE` Varchar(36)
 COMMENT 'The problem type code.',
  `PROBLEM_TYPE_DESC` Varchar(255)
 COMMENT 'The problem type description.',
  `IMPACT_TYPE_NAME` Varchar(60)
 COMMENT 'The impact type name.',
  `IMPACT_TYPE_DESC` Varchar(255)
 COMMENT 'The impact type description.',
  `REOPEN_REASON_CODE` Varchar(36)
 COMMENT 'The reopen reason code.',
  `REOPEN_REASON_DESC` Varchar(255)
 COMMENT 'The reopen reason description.',
  `CLOSED_REASON_CODE` Varchar(36)
 COMMENT 'The case closed reason description.',
  `CLOSED_REASON_DESC` Varchar(255)
 COMMENT 'The case closed reason description.',
  `RESPONSE_IND` Varchar(1)
 COMMENT 'The response indicator.',
  `RESPONSE_DESC` Varchar(255)
 COMMENT 'The response description.',
  `RESTORE_CODE` Varchar(36)
 COMMENT 'The restore code.',
  `RESTORE_DESC` Varchar(255)
 COMMENT 'The restore description.',
  `PAY_FOR_SERVICE_IND` Varchar(1)
 COMMENT 'The pay for service indicator.',
  `ANONYMOUS_IND` Varchar(1)
 COMMENT 'The anonymous indicator.',
  `SECURE_CASE_IND` Varchar(1)
 COMMENT 'The secure case indicator.',
  `SLA_IND` Varchar(1)
 COMMENT 'The service level agreement (SLA) indicator.',
  `DW_STAGE_LOAD_IND` Char(1)
 COMMENT 'This denotes a row has been sucessfully loaded into the stage.  It implies the fact table load is pending.  Subsequent to the fact table load, the row iwll be hard deleted from the stage table.  This column is only used when a single stage table supports both a fact and stage table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

CREATE UNIQUE INDEX `STAGE_CASE_PK` ON `STAGE_CASE` (`CASE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CASE` ADD  PRIMARY KEY (`CASE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CASE_PRIORITY

CREATE TABLE `STAGE_CASE_PRIORITY`
(
  `CASE_PRIORITY_ID` Varchar(36) NOT NULL
 COMMENT 'The case priority identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case priority in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `CASE_PRIORITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case priority SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CASE_PRIORITY_CATEGORY` Varchar(1)
 COMMENT 'The case priority category.',
  `CASE_PRIORITY_CATEGORY_NAME` Varchar(60)
 COMMENT 'The case priority category name.',
  `CASE_PRIORITY_CATEGORY_DESC` Varchar(255)
 COMMENT 'The case priority category description.',
  `CASE_PRIORITY_NAME` Varchar(60)
 COMMENT 'The case priority name.',
  `CASE_PRIORITY_DESC` Varchar(255)
 COMMENT 'The case priority description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case priority stage table.'
;

CREATE UNIQUE INDEX `STAGE_CASE_PRIORITY_PK` ON `STAGE_CASE_PRIORITY` (`CASE_PRIORITY_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CASE_PRIORITY` ADD  PRIMARY KEY (`CASE_PRIORITY_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CASE_SEVERITY

CREATE TABLE `STAGE_CASE_SEVERITY`
(
  `CASE_SEVERITY_ID` Varchar(36) NOT NULL
 COMMENT 'The case severity identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case severity in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier key.  All stages and base grain fact tables must include this column to enable multiple source system capabililty.',
  `CASE_SEVERITY_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system case severity SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CASE_SEVERITY_NAME` Varchar(60)
 COMMENT 'The case severity name.',
  `CASE_SEVERITY_DESC` Varchar(255)
 COMMENT 'The case severity description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case severity stage table.'
;

CREATE UNIQUE INDEX `STAGE_CASE_SEVERITY_PK` ON `STAGE_CASE_SEVERITY` (`CASE_SEVERITY_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CASE_SEVERITY` ADD  PRIMARY KEY (`CASE_SEVERITY_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CASE_STATUS

CREATE TABLE `STAGE_CASE_STATUS`
(
  `CASE_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The case status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a case status in the source.',
  `CASE_STATUS_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system case status SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CASE_STATUS_CATEGORY` Varchar(1)
 COMMENT 'The case status category.',
  `CASE_STATUS_CATEGORY_NAME` Varchar(60)
 COMMENT 'The cases status category name.',
  `CASE_STATUS_CATEGORY_DESC` Varchar(255)
 COMMENT 'The cases status category description.',
  `CASE_STATUS_NAME` Varchar(60)
 COMMENT 'The case status name.',
  `CASE_STATUS_DESC` Varchar(255)
 COMMENT 'The case status description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The case status stage table.'
;

CREATE UNIQUE INDEX `STAGE_CASE_STATUS_PK` ON `STAGE_CASE_STATUS` (`CASE_STATUS_ID`,`CASE_STATUS_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CASE_STATUS` ADD  PRIMARY KEY (`CASE_STATUS_ID`,`CASE_STATUS_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CHARTFIELD

CREATE TABLE `STAGE_CHARTFIELD`
(
  `CHARTFIELD_ID` Varchar(36)
 COMMENT 'The chartfield identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a chartfield in the source.',
  `CHARTFIELD_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system chartfield SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `CHARTFIELD_TYPE_NAME` Varchar(60)
 COMMENT 'The chartfield type name.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The chartfield effective date.',
  `CHARTFIELD_NAME` Varchar(60)
 COMMENT 'The chartfield name.',
  `CHARTFIELD_DESC` Varchar(255)
 COMMENT 'The chartfield description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The chartfield stage table.'
;

-- Table STAGE_CLASSIFICATION

CREATE TABLE `STAGE_CLASSIFICATION`
(
  `CLASSIFICATION_ID` Varchar(36) NOT NULL
 COMMENT 'The classification identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a classification in the source.',
  `CLASSIFICATION_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system classification SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The class effective date.',
  `CLASSIFICATION_NAME` Varchar(60)
 COMMENT 'The classification name.',
  `CLASSIFICATION_DESC` Varchar(255)
 COMMENT 'The classification description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The classification stage table.'
;

ALTER TABLE `STAGE_CLASSIFICATION` ADD  PRIMARY KEY (`CLASSIFICATION_ID`,`CLASSIFICATION_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CLASSIFICATION` ADD UNIQUE `PK_STAGE_CLASSIFICATION` (`CLASSIFICATION_ID`,`CLASSIFICATION_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_COMPANY

CREATE TABLE `STAGE_COMPANY`
(
  `COMPANY_ID` Varchar(36) NOT NULL
 COMMENT 'The company identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `COMPANY_STATUS_CODE` Varchar(32)
 COMMENT 'The company status code.',
  `COMPANY_STATUS_DATE` Timestamp NULL
 COMMENT 'The effective date for the company status.',
  `COMPANY_STATUS_DESC` Varchar(40)
 COMMENT 'The company status description.',
  `COMPANY_NAME` Varchar(60)
 COMMENT 'The company name.',
  `COMPANY_DESC` Varchar(255)
 COMMENT 'The company description.',
  `COMPANY_ALT_DESC` Varchar(255)
 COMMENT 'The company alternate description.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(32)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(32)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `INDUSTRY_CODE` Varchar(32)
 COMMENT 'The industry code.',
  `INDUSTRY_NAME` Varchar(60)
 COMMENT 'The industry name.',
  `INDUSTRY_DESC` Varchar(255)
 COMMENT 'The industry description.',
  `INDUSTRY_SECTOR_CODE` Varchar(32)
 COMMENT 'The industry sector code.',
  `INDUSTRY_SECTOR_NAME` Varchar(60)
 COMMENT 'The industry sector name.',
  `INDUSTRY_SECTOR_DESC` Varchar(255)
 COMMENT 'The industry sector description.',
  `LEGAL_TYPE_CODE` Varchar(32)
 COMMENT 'The legal entity type code.',
  `LEGAL_TYPE_NAME` Varchar(60)
 COMMENT 'The legal entity type name.',
  `LEGAL_TYPE_DESC` Varchar(255)
 COMMENT 'The legal entity type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The company stage table.'
;

CREATE UNIQUE INDEX `STAGE_COMPANY_PK` ON `STAGE_COMPANY` (`COMPANY_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_COMPANY` ADD  PRIMARY KEY (`COMPANY_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_COMPANY_PAYGROUP

CREATE TABLE `STAGE_COMPANY_PAYGROUP`
(
  `COMPANY_ID` Varchar(36) NOT NULL
 COMMENT 'The company paygroup identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company paygroup in the source.',
  `PAYGROUP_ID` Varchar(36) NOT NULL
 COMMENT 'The paygroup identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a paygroup in the source',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PAYGROUP_STATUS_DATE` Timestamp NULL
 COMMENT 'The paygroup status effective date.',
  `PAYGROUP_STATUS_CODE` Varchar(32)
 COMMENT 'The paygroup status code.',
  `PAYGROUP_NAME` Varchar(60)
 COMMENT 'The paygroup name.',
  `PAYGROUP_DESC` Varchar(255)
 COMMENT 'The paygroup description.',
  `PAY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The pay frequency code.',
  `PAY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The pay frequency name.',
  `PAY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The pay frequency description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The company paygroup stage table.'
;

CREATE UNIQUE INDEX `STAGE_COMPANY_PAYGROUP_PK` ON `STAGE_COMPANY_PAYGROUP` (`COMPANY_ID`,`PAYGROUP_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_COMPANY_PAYGROUP` ADD  PRIMARY KEY (`COMPANY_ID`,`PAYGROUP_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CONTACT_CENTER_CALL

CREATE TABLE `STAGE_CONTACT_CENTER_CALL`
(
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  This relates to the customer stage table.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `AGENT_ID` Varchar(36)
 COMMENT 'The agent identifier in the source system.  This relates to the person stage table.',
  `AGENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system agent SETID.  This column is often used as part of the unique identifer.',
  `CALL_TYPE_ID` Varchar(36)
 COMMENT 'The call type identifier in the source system.  This relates to the call type stage table.',
  `CALL_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The call type source system SETID.  This column is often used as part of the unique identifer.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  This relates to the product stage table.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The product source system SETID.  This column is often used as part of the unique identifer.',
  `CASE_ID` Varchar(36)
 COMMENT 'The case identifier in the source system.  This relates to the case stage table.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  This relates to the currency stage table.',
  `SOURCE_SYSTEM_ID` Int DEFAULT 1
 COMMENT 'The source system identifier in the source system.  All stage tables and base grain stage tables must include this column to enable multiple source system capabililty.',
  `CALL_ID` Varchar(36)
 COMMENT 'The call identifier in the source system.  It is a degenerate stage table in the stage table.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It is a degenerate stage table in the stage table.',
  `CALL_START_DATE` Datetime
 COMMENT 'The call start date.',
  `CALL_END_DATE` Datetime
 COMMENT 'The call end date.',
  `CALL_QTY` Double
 COMMENT 'The quantity of calls.',
  `ABANDONED_QTY` Double
 COMMENT 'The quantity of abandoned calls.',
  `AGENT_QTY` Double
 COMMENT 'The quantity of agents assigned to the call.',
  `CONFERENCE_QTY` Double
 COMMENT 'The quantity of conference calls.',
  `HOLD_QTY` Double
 COMMENT 'The quantity of calls placed on hold.',
  `INBOUND_QTY` Double
 COMMENT 'The quantity of inbound calls.',
  `OUTBOUND_QTY` Double
 COMMENT 'The quantity of outbound calls.',
  `QUEUE_QTY` Double
 COMMENT 'The quantity of calls placed in the queue.',
  `SEGMENT_QTY` Double
 COMMENT 'The quantity of call segments.',
  `TRANSFER_QTY` Double
 COMMENT 'The quantity of transfer calls.',
  `CALL_SECOND_QTY` Double
 COMMENT 'The call second quantity.',
  `CONFERENCE_SECOND_QTY` Double
 COMMENT 'The conference second quantity.',
  `DIAL_SECOND_QTY` Double
 COMMENT 'The dial second quantity.',
  `RING_SECOND_QTY` Double
 COMMENT 'The ring second quantity.',
  `QUEUE_SECOND_QTY` Double
 COMMENT 'The queue second quantity.',
  `TRANSFER_SECOND_QTY` Double
 COMMENT 'The transfer second quantity.',
  `HOLD_SECOND_QTY` Double
 COMMENT 'The hold second quantity.',
  `CALL_BILL_AMT` Decimal(26,2)
 COMMENT 'The call bill amount.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

-- Table STAGE_CONTRACT

CREATE TABLE `STAGE_CONTRACT`
(
  `CONTRACT_ID` Varchar(36) NOT NULL
 COMMENT 'The contract identifier (number) in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a contract in the source.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It may be used in combination with other identifiers to uniquely identify a stage in the source system.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CONTRACT_NAME` Varchar(60)
 COMMENT 'The contract name.',
  `CONTRACT_DESC` Varchar(255)
 COMMENT 'The contract description.',
  `CONTRACT_TYPE_ID` Varchar(32)
 COMMENT 'The source system contract identifier.',
  `CONTRACT_TYPE_NAME` Varchar(60)
 COMMENT 'The contract type name.',
  `CONTRACT_TYPE_DESC` Varchar(255)
 COMMENT 'The contract type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The contract stage.'
;

ALTER TABLE `STAGE_CONTRACT` ADD  PRIMARY KEY (`CONTRACT_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CONTRACT` ADD UNIQUE `PK_STAGE_CONTRACT` (`CONTRACT_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_COST_CENTER

CREATE TABLE `STAGE_COST_CENTER`
(
  `COST_CENTER_ID` Varchar(36) NOT NULL
 COMMENT 'The cost center identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a cost center in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `COST_CENTER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system cost center SETID.  This column is often used as part of the unique identifer.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `COST_CENTER_NAME` Varchar(60)
 COMMENT 'The cost center name.',
  `COST_CENTER_DESC` Varchar(255)
 COMMENT 'The cost center description.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The cost center stage table.'
;

CREATE UNIQUE INDEX `STAGE_COST_CENTER_PK` ON `STAGE_COST_CENTER` (`COST_CENTER_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_COST_CENTER` ADD  PRIMARY KEY (`COST_CENTER_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_COST_CENTER` ADD UNIQUE `PK_STAGE_COST_CENTER` (`COST_CENTER_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CURRENCY

CREATE TABLE `STAGE_CURRENCY`
(
  `CURRENCY_ID` Varchar(36) NOT NULL DEFAULT NULL
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `CURRENCY_NAME` Varchar(60)
 COMMENT 'The currency name.',
  `CURRENCY_DESC` Varchar(255)
 COMMENT 'The currency description.',
  `DECIMAL_PLACE_QTY` Decimal(5,0)
 COMMENT 'The quantity of decimal places to the right of the separator punctuation (comma or period).  For example, USD would be 2 ($257.33).',
  `EFFECTIVE_STATUS_CODE` Char(1)
 COMMENT 'The effective status code.',
  `EFFECTIVE_STATUS_NAME` Varchar(60)
 COMMENT 'The effective status name.',
  `EFFECTIVE_STATUS_DATE` Timestamp NULL
 COMMENT 'The effective status date.',
  `CURRENCY_SYMBOL_CODE` Varchar(36)
 COMMENT 'The currency symbol code.',
  `CURRENCY_SYMBOL_SIDE_IND` Char(1)
 COMMENT 'This denotes if the currency symbol is displayed on either the left L or right R side of the currency value.  For example, the USD symbol would be to the left ($257.33), while the PLN symbol would be to the right (257.33zl).',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The currency dimension.'
;

CREATE UNIQUE INDEX `STAGE_CURRENCY_PK` ON `STAGE_CURRENCY` (`CURRENCY_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CURRENCY` ADD  PRIMARY KEY (`CURRENCY_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CURRENCY` ADD UNIQUE `PK_STAGE_CURRENCY` (`CURRENCY_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CUSTOMER

CREATE TABLE `STAGE_CUSTOMER`
(
  `CUSTOMER_ID` Varchar(36) NOT NULL
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `CUSTOMER_NAME` Varchar(60)
 COMMENT 'The customer name.  If the customer is a person, the name may be formatted FAMILY NAME, GIVEN NAME.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `DO_NOT_CONTACT_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted.',
  `DO_NOT_EMAIL_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted via email.',
  `DO_NOT_MAIL_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted via mail.',
  `DO_NOT_CALL_IND` Varchar(1)
 COMMENT 'This denotes if a customer can be contacted via telephone.',
  `CUSTOMER_TYPE_ID` Varchar(36)
 COMMENT 'The customer type identifier.',
  `CUSTOMER_TYPE_DESC` Varchar(255)
 COMMENT 'The customer type description.',
  `CUSTOMER_STATUS_CODE` Varchar(36)
 COMMENT 'The customer status code.',
  `CUSTOMER_STATUS_NAME` Varchar(60)
 COMMENT 'The customer status name.',
  `CUSTOMER_STATUS_DESC` Varchar(255)
 COMMENT 'The customer status description.',
  `CUSTOMER_STATUS_DATE` Timestamp NULL
 COMMENT 'The customer status date.',
  `GEO_CODE` Varchar(32)
 COMMENT 'The geographical code.',
  `IN_CITY_LIMIT_IND` Varchar(1)
 COMMENT 'This denotes if a customers is physically located within the city.',
  `TIMEZONE_NAME` Varchar(32)
 COMMENT 'The timezone name.',
  `LATITUDE` Decimal(25,20)
 COMMENT 'The latitude of the customer.',
  `LONGITUDE` Decimal(10,7)
 COMMENT 'The longitude of the customer.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `STATE_PROVINCE_CODE` Varchar(3)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `EMAIL_DOMAIN_DESC` Varchar(255)
 COMMENT 'The email domain.',
  `EMAIL_ADDRESS_DESC` Varchar(255)
 COMMENT 'The email address.',
  `PHONE_COUNTRY_CODE` Varchar(3)
 COMMENT 'The telephone country code.',
  `PHONE_NUMBER` Varchar(32)
 COMMENT 'The telephone number.',
  `PHONE_EXTENSION_NUMBER` Varchar(6)
 COMMENT 'The telephone extension number.',
  `SOLD_TO_IND` Varchar(1)
 COMMENT 'This denotes if a customer plays the role of sold to.',
  `SHIP_TO_IND` Varchar(1)
 COMMENT 'This denotes if a customer plays the role of ship to.',
  `BILL_TO_IND` Varchar(1)
 COMMENT 'This denotes if a customer plays the role of bill to.',
  `ALT_CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer alternate identifier.',
  `DUNS_NUMBER` Varchar(32)
 COMMENT 'The Dun & Bradstreet number.',
  `PARENT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The parent Dun & Bradstreet number.',
  `ULT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The ultimate (parent) Dun & Bradstreet number.',
  `LAST_NAME` Varchar(60)
 COMMENT 'The customer last name (when the customer is a person).',
  `ADD_DATE` Timestamp NULL
 COMMENT 'The date the customer was added to the source system.',
  `FIRST_NAME` Varchar(60)
 COMMENT 'The customer first name (when the customer is a person).',
  `SINCE_DATE` Timestamp NULL
 COMMENT 'The date the entity became a customer.',
  `BIRTH_DATE` Timestamp NULL
 COMMENT 'The customer birth date.',
  `DEATH_DATE` Timestamp NULL
 COMMENT 'The customer death date.',
  `MARITAL_STATUS_CAT` Varchar(32)
 COMMENT 'The marital status category.',
  `MARITAL_STATUS_DATE` Timestamp NULL
 COMMENT 'The marital status date.',
  `GENDER_CAT` Varchar(32)
 COMMENT 'The marital status category.',
  `CUSTOMER_AMT` Double DEFAULT 0
 COMMENT 'The customer amount.  This generic amount column can be used for amounts that act as a dimension attribute, rather than a fact table metric.',
  `INCOME_QTY` Double
 COMMENT 'The customer annual income (currency defied by the currency identifier).',
  `CREDIT_RATING_CAT` Varchar(32)
 COMMENT 'The credit rating category.',
  `CREDIT_SCORE_QTY` Double
 COMMENT 'The credit score.',
  `PHONE_REGION_CODE` Varchar(3)
 COMMENT 'The phone region, area, or city code.',
  `CREDIT_RATING_CODE` Varchar(32)
 COMMENT 'The credit rating code.',
  `CREDIT_RATING_NAME` Varchar(60)
 COMMENT 'The credit rating name.',
  `CUSTOMER_TYPE_CODE` Varchar(32)
 COMMENT 'The customer type code.',
  `CUSTOMER_TYPE_NAME` Varchar(60)
 COMMENT 'The customer type name.',
  `CUSTOMER_GROUP_CODE` Varchar(32)
 COMMENT 'The customer group code.',
  `CUSTOMER_GROUP_NAME` Varchar(60)
 COMMENT 'The customer group name.',
  `CUSTOMER_GROUP_DESC` Varchar(255)
 COMMENT 'The customer group description.',
  `CUSTOMER_CLASS_CODE` Varchar(32)
 COMMENT 'The customer class code.',
  `CUSTOMER_CLASS_NAME` Varchar(60)
 COMMENT 'The customer class name.',
  `CUSTOMER_CLASS_DESC` Varchar(255)
 COMMENT 'The customer class description.',
  `PARENT_CUSTOMER_ID` Varchar(36)
 COMMENT 'The parent customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a parent customer in the source.',
  `PARENT_CUSTOMER_NAME` Varchar(60)
 COMMENT 'The parent customer name.  If the parent customer is a person, the name may be formatted FAMILY NAME, GIVEN NAME.',
  `LEVEL_NUMBER` Double
 COMMENT 'The level number of the customer in the customer hierarchy.',
  `CREDIT_STATUS_CODE` Varchar(36)
 COMMENT 'The customer credit status code.',
  `CREDIT_STATUS_NAME` Varchar(60)
 COMMENT 'The customer credit status name.',
  `CREDIT_STATUS_DESC` Varchar(255)
 COMMENT 'The customer credit status description.',
  `CREDIT_STATUS_DATE` Datetime
 COMMENT 'The customer credit status date.',
  `GUARANTEED_CPC_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The guaranteed cost per click (CPC) amount.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The customer dimension stage table.'
;

CREATE UNIQUE INDEX `STAGE_CUSTOMER_PK` ON `STAGE_CUSTOMER` (`CUSTOMER_ID`,`CUSTOMER_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CUSTOMER` ADD  PRIMARY KEY (`CUSTOMER_ID`,`CUSTOMER_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_CUSTOMER` ADD UNIQUE `PK_STAGE_CUSTOMER` (`CUSTOMER_ID`,`CUSTOMER_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_CUSTOMER_CONTACT

CREATE TABLE `STAGE_CUSTOMER_CONTACT`
(
  `CUSTOMER_CONTACT_ID` Varchar(36) NOT NULL
 COMMENT 'The customer contact identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer contact in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `CUSTOMER_ID` Varchar(36) NOT NULL
 COMMENT 'The customer identifier in the source system.',
  `CUSTOMER_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_CONTACT_NAME` Varchar(60)
 COMMENT 'The customer contact name (GIVEN + FAMILY).',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The customer contact stage dimension.'
;

CREATE UNIQUE INDEX `STAGE_CUSTOMER_CONTACT_PK` ON `STAGE_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_ID`,`SOURCE_SYSTEM_ID`,`CUSTOMER_ID`,`CUSTOMER_SETID`)
;

ALTER TABLE `STAGE_CUSTOMER_CONTACT` ADD  PRIMARY KEY (`CUSTOMER_CONTACT_ID`,`SOURCE_SYSTEM_ID`,`CUSTOMER_ID`,`CUSTOMER_SETID`)
;

ALTER TABLE `STAGE_CUSTOMER_CONTACT` ADD UNIQUE `PK_STAGE_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_ID`,`SOURCE_SYSTEM_ID`,`CUSTOMER_ID`,`CUSTOMER_SETID`)
;

-- Table STAGE_DEPARTMENT

CREATE TABLE `STAGE_DEPARTMENT`
(
  `DEPARTMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `DEPARTMENT_NAME` Varchar(60)
 COMMENT 'The department name.',
  `DEPARTMENT_DESC` Varchar(255)
 COMMENT 'The department description.',
  `MANAGER_ID` Varchar(36)
 COMMENT 'The department manager identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department manager in the source.',
  `MANAGER_NAME` Varchar(60)
 COMMENT 'The department manager name.',
  `PARENT_DEPARTMENT_ID` Varchar(36)
 COMMENT 'The parent department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a parent department in the source.',
  `PARENT_DEPARTMENT_NAME` Varchar(60)
 COMMENT 'The parent department name.',
  `LEVEL_NUMBER` Double
 COMMENT 'The level number of the department in the department hierarchy.',
  `EFFECTIVE_STATUS_DATE` Timestamp NULL
 COMMENT 'The effective status date.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `EFFECTIVE_STATUS_NAME` Varchar(60)
 COMMENT 'The effective status name.',
  `EFFECTIVE_STATUS_DESC` Varchar(255)
 COMMENT 'The effective status description.',
  `BUDGET_LEVEL_CODE` Varchar(32)
 COMMENT 'The budget level code.',
  `BUDGET_LEVEL_NAME` Varchar(60)
 COMMENT 'The budget level name.',
  `BUDGET_LEVEL_DESC` Varchar(255)
 COMMENT 'The budget level description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The department stage table.'
;

ALTER TABLE `STAGE_DEPARTMENT` ADD  PRIMARY KEY (`DEPARTMENT_ID`,`DEPARTMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_DEPARTMENT` ADD UNIQUE `PK_STAGE_DEPARTMENT` (`DEPARTMENT_ID`,`DEPARTMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_DOCUMENT_TYPE

CREATE TABLE `STAGE_DOCUMENT_TYPE`
(
  `DOCUMENT_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The document type identifier in the source system.',
  `DOCUMENT_TYPE_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system document type SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DOCUMENT_TYPE_NAME` Varchar(60)
 COMMENT 'The document type name.',
  `DOCUMENT_TYPE_DESC` Varchar(255)
 COMMENT 'The document type description.',
  `DOCUMENT_TYPE_CAT` Varchar(60)
 COMMENT 'The document type category.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `DOCUMENT_TYPE_CATEGORY` Varchar(60)
 COMMENT 'The document type category.'
)
;

ALTER TABLE `STAGE_DOCUMENT_TYPE` ADD  PRIMARY KEY (`DOCUMENT_TYPE_ID`,`DOCUMENT_TYPE_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_DOCUMENT_TYPE` ADD UNIQUE `PK_STAGE_DOCUMENT_TYPE` (`DOCUMENT_TYPE_ID`,`DOCUMENT_TYPE_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_EMPLOYEE_JOB_ACTION

CREATE TABLE `STAGE_EMPLOYEE_JOB_ACTION`
(
  `EMPLOYEE_ID` Varchar(36) NOT NULL
 COMMENT 'The employee identifier in the source system.',
  `JOB_ACTION_ID` Varchar(36) NOT NULL
 COMMENT 'The job action identifier in the source system.',
  `EFFECTIVE_DATE` Timestamp NOT NULL
 COMMENT 'The job action effective date.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `JOB_ACTION_SEQUENCE_ID` Smallint
 COMMENT 'The job action sequence identifier (number) in the source system.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `COMPANY_ID` Varchar(36)
 COMMENT 'The company identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company in the source.',
  `DEPARTMENT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `JOBCODE_ID` Varchar(36)
 COMMENT 'The jobcode identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a jobcode in the source.',
  `JOBCODE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system jobcode SETID.  This column is often used as part of the unique identifer.',
  `POSITION_ID` Varchar(36)
 COMMENT 'The position identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a position in the source.',
  `PAYGROUP_ID` Varchar(36)
 COMMENT 'The company paygroup identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company paygroup in the source.',
  `MANAGER_ID` Varchar(36)
 COMMENT 'The manager identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a manager in the source.',
  `LOCATION_ID` Varchar(36)
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a location in the source.',
  `LOCATION_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system location SETID.  This column is often used as part of the unique identifer.',
  `SALARY_PLAN_ID` Varchar(36)
 COMMENT 'The salary plan identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a salary plan in the source.',
  `SALARY_PLAN_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system salary plan SETID.  This column is often used as part of the unique identifer.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The acount identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system account SETID.  This column is often used as part of the unique identifer.',
  `FUND_ID` Varchar(36)
 COMMENT 'The fund identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a fund in the source.',
  `FUND_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system fund SETID.  This column is often used as part of the unique identifer.',
  `CLASSIFICATION_ID` Varchar(36)
 COMMENT 'The classification identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a class in the source.',
  `CLASSIFICATION_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system classification SETID.  This column is often used as part of the unique identifer.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `OPERATING_UNIT_ID` Varchar(36)
 COMMENT 'The operating unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an operating unit in the source.',
  `OPERATING_UNIT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system operating unit SETID.  This column is often used as part of the unique identifer.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `CONTRACT_ID` Varchar(36)
 COMMENT 'The contract identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a contract in the source.',
  `JOB_ACTION_DATE` Timestamp NULL
 COMMENT 'The job action date.',
  `DEPARTMENT_START_DATE` Timestamp NULL
 COMMENT 'The department start date.',
  `GRADE_START_DATE` Timestamp NULL
 COMMENT 'The grade start date.',
  `JOB_START_DATE` Timestamp NULL
 COMMENT 'The job start date.',
  `EXPIRATION_DATE` Timestamp NULL DEFAULT '31-DEC-2199'
 COMMENT 'The job action expiration date.',
  `POSITION_START_DATE` Timestamp NULL
 COMMENT 'The position start date.',
  `STEP_START_DATE` Timestamp NULL
 COMMENT 'The step start date.',
  `HIRE_DATE` Timestamp NULL
 COMMENT 'The hire date.',
  `JOB_STOP_DATE` Timestamp NULL
 COMMENT 'The job stop date.',
  `JOB_ACTION_REASON_ID` Varchar(36)
 COMMENT 'The job action reason identifier in the source system.',
  `ASSIGNMENT_START_DATE` Timestamp NULL
 COMMENT 'The assigment start date.',
  `ASSIGNMENT_STOP_DATE` Timestamp NULL
 COMMENT 'The assigment stop date.',
  `LATEST_ACTION_IND` Char(1)
 COMMENT 'This indicator denotes if the the job action is the latest job action for an employee.',
  `STANDARD_HOURS_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The standard hours frequency code.',
  `STANDARD_HOURS_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The standard hours frequency description.',
  `COMPENSATION_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The compensation frequency code.',
  `COMPENSATION_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The compensation frequency description.',
  `LABOR_AGREEMENT_CODE` Varchar(32)
 COMMENT 'The labor agreement code.',
  `LABOR_AGREEMENT_DESC` Varchar(255)
 COMMENT 'The labor agreement description.',
  `EMPLOYEE_CLASS_CODE` Varchar(32)
 COMMENT 'The employee class code.',
  `EMPLOYEE_CLASS_DESC` Varchar(255)
 COMMENT 'The employee class description.',
  `BENEFIT_STATUS_CODE` Varchar(32)
 COMMENT 'The benefit status code.',
  `BENEFIT_STATUS_DESC` Varchar(255)
 COMMENT 'The benefit status description.',
  `BENEFIT_SOURCE_CODE` Varchar(32)
 COMMENT 'The benefit source code.',
  `BENEFIT_SOURCE_DESC` Varchar(255)
 COMMENT 'The benefit source description.',
  `EARNINGS_DISTRIBUTION_CODE` Varchar(32)
 COMMENT 'The earnings distribution code.',
  `EARNINGS_DISTRIBUTION_DESC` Varchar(255)
 COMMENT 'The earnings distribution description.',
  `EMPLOYEE_STATUS_CODE` Varchar(32)
 COMMENT 'The employee status code.',
  `EMPLOYEE_STATUS_DESC` Varchar(255)
 COMMENT 'The employee status description.',
  `EMPLOYEE_TYPE_CODE` Varchar(32)
 COMMENT 'The employee type code.',
  `EMPLOYEE_TYPE_DESC` Varchar(255)
 COMMENT 'The employee type description.',
  `FULL_PART_TIME_CODE` Varchar(32)
 COMMENT 'The full/part time code.',
  `FULL_PART_TIME_DESC` Varchar(255)
 COMMENT 'The full/part time description.',
  `HR_STATUS_CODE` Varchar(32)
 COMMENT 'The human resource status code.',
  `HR_STATUS_DESC` Varchar(255)
 COMMENT 'The human resource status description.',
  `JOB_INDICATOR_CODE` Varchar(32)
 COMMENT 'The job indicator code.',
  `JOB_INDICATOR_DESC` Varchar(255)
 COMMENT 'The job indicator description.',
  `REGULAR_TEMPORARY_CODE` Varchar(32)
 COMMENT 'The regular temporary indicator.',
  `REGULAR_TEMPORARY_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `JOB_SHIFT_CODE` Varchar(32)
 COMMENT 'The job shift code.',
  `JOB_SHIFT_DESC` Varchar(255)
 COMMENT 'The job shift description.',
  `PAY_TYPE_CODE` Varchar(32)
 COMMENT 'The pay type code.',
  `PAY_TYPE_DESC` Varchar(255)
 COMMENT 'The pay type description.',
  `FTE_EQUIVALENT_QTY` Double
 COMMENT 'The full time equivalent (FTE) quantity.',
  `ANNUAL_RATE` Double
 COMMENT 'The annual rate.',
  `ANNUAL_BENEFIT_BASE_RATE` Double
 COMMENT 'The annual benefit base rate.',
  `CHANGE_AMT` Double
 COMMENT 'The change amount.',
  `CHANGE_PCT` Double
 COMMENT 'The change percent.',
  `COMPENSATION_RATE` Double
 COMMENT 'The compensation rate.',
  `HOURLY_RATE` Double
 COMMENT 'The hourly rate.',
  `DAILY_RATE` Double
 COMMENT 'The daily rate.',
  `MONTHLY_RATE` Double
 COMMENT 'The monthly rate.',
  `SHIFT_RATE` Double
 COMMENT 'The shift rate.',
  `SHIFT_FACTOR_QTY` Double
 COMMENT 'The shift factor quantity.',
  `WORK_DAY_HOURS_QTY` Double
 COMMENT 'The quantity of hours in a work day.',
  `WORK_WEEK_HOURS_QTY` Double
 COMMENT 'The quantity of hours in a work week.',
  `JOB_DURATION_DAY_QTY` Double
 COMMENT 'The quantity of days in a job.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The employee job action stage.'
;

ALTER TABLE `STAGE_EMPLOYEE_JOB_ACTION` ADD  PRIMARY KEY (`EMPLOYEE_ID`,`JOB_ACTION_ID`,`EFFECTIVE_DATE`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_EMPLOYEE_JOB_ACTION` ADD UNIQUE `PK_STAGE_EMPLOYEE_JOB_ACTION` (`EMPLOYEE_ID`,`JOB_ACTION_ID`,`EFFECTIVE_DATE`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_FISCAL_DAY

CREATE TABLE `STAGE_FISCAL_DAY`
(
  `DAY_DATE` Timestamp NOT NULL
 COMMENT 'The date (date datatype).',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It may be used in combination with other identifiers to uniquely identify a stage in the source system.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `FISCAL_PERIOD_ID` Varchar(36) NOT NULL
 COMMENT 'The fiscal period identifier in the source system.',
  `FISCAL_PERIOD_NUMBER` Double
 COMMENT 'The fiscal year period number.',
  `FISCAL_PERIOD_NAME` Varchar(60)
 COMMENT 'The fiscal period name.',
  `FISCAL_QUARTER_NUMBER` Double
 COMMENT 'The fiscal quarter number.',
  `FISCAL_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal quarter name.',
  `DAY_OF_FISCAL_PERIOD_NUMBER` Double
 COMMENT 'The fiscal period day number.',
  `DAY_OF_FISCAL_PERIOD_QTY` Double
 COMMENT 'The fiscal period day quantity.',
  `DAY_OF_FISCAL_YEAR_NUMBER` Double
 COMMENT 'The number of days in the fiscal year.',
  `WEEK_OF_FISCAL_PERIOD_NUMBER` Double
 COMMENT 'The fiscal period week number.',
  `WEEK_OF_FISCAL_QUARTER_NUMBER` Double
 COMMENT 'The fiscal week quarter number.',
  `WEEK_OF_FISCAL_YEAR_NUMBER` Double
 COMMENT 'The week of fiscal year number.',
  `WEEK_OF_FISCAL_PERIOD_NAME` Varchar(60)
 COMMENT 'The week of fiscal period name.',
  `FISCAL_YEAR_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal year quarter name.',
  `FISCAL_YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'The fiscal year sort number.',
  `FISCAL_YEAR_NUMBER` Double
 COMMENT 'The fiscal year number.',
  `FISCAL_YEAR_NAME` Varchar(60)
 COMMENT 'The fiscal year name, e.g., FY2007.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The fiscal day (fiscal date) stage.'
;

CREATE UNIQUE INDEX `STAGE_FISCAL_DAY_PK` ON `STAGE_FISCAL_DAY` (`DAY_DATE`,`BUSINESS_UNIT_ID`)
;

ALTER TABLE `STAGE_FISCAL_DAY` ADD  PRIMARY KEY (`DAY_DATE`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_FISCAL_DAY` ADD UNIQUE `PK_STAGE_FISCAL_DAY` (`DAY_DATE`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_FISCAL_PERIOD

CREATE TABLE `STAGE_FISCAL_PERIOD`
(
  `FISCAL_PERIOD_ID` Varchar(36) NOT NULL
 COMMENT 'This fiscal period in the source system.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  It may be used in combination with other identifiers to uniquely identify a dimension in the source system.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `FISCAL_PERIOD_NUMBER` Double
 COMMENT 'The fiscal year period number.',
  `FISCAL_PERIOD_NAME` Varchar(60)
 COMMENT 'The fiscal period name.',
  `FISCAL_QUARTER_NUMBER` Double
 COMMENT 'The fiscal quarter number.',
  `FISCAL_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal quarter name.',
  `DAY_OF_FISCAL_PERIOD_NUMBER` Double
 COMMENT 'The fiscal period day number.',
  `DAY_OF_FISCAL_PERIOD_QTY` Double
 COMMENT 'The fiscal period day quantity.',
  `DAY_OF_FISCAL_YEAR_NUMBER` Double
 COMMENT 'The number of days in the fiscal year.',
  `WEEK_OF_FISCAL_PERIOD_NUMBER` Double
 COMMENT 'The fiscal period week number.',
  `WEEK_OF_FISCAL_QUARTER_NUMBER` Double
 COMMENT 'The fiscal week quarter number.',
  `WEEK_OF_FISCAL_YEAR_NUMBER` Double
 COMMENT 'The week of fiscal year number.',
  `WEEK_OF_FISCAL_PERIOD_NAME` Varchar(60)
 COMMENT 'The week of fiscal period name.',
  `FISCAL_YEAR_QUARTER_NAME` Varchar(60)
 COMMENT 'The fiscal year quarter name.',
  `FISCAL_YEAR_SORT_NUMBER` Varchar(4)
 COMMENT 'The fiscal year sort number.',
  `FISCAL_YEAR_NUMBER` Double
 COMMENT 'The fiscal year number.',
  `FISCAL_YEAR_NAME` Varchar(60)
 COMMENT 'The fiscal year name, e.g., FY2007.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The fiscal period stage table.'
;

CREATE UNIQUE INDEX `STAGE_FISCAL_PERIOD_PK` ON `STAGE_FISCAL_PERIOD` (`FISCAL_PERIOD_ID`)
;

ALTER TABLE `STAGE_FISCAL_PERIOD` ADD  PRIMARY KEY (`FISCAL_PERIOD_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_FUND

CREATE TABLE `STAGE_FUND`
(
  `FUND_ID` Varchar(36) NOT NULL
 COMMENT 'The fund identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a fund in the source.',
  `FUND_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system fund SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The fund effective date.',
  `FUND_NAME` Varchar(60)
 COMMENT 'The fund name.',
  `FUND_DESC` Varchar(255)
 COMMENT 'The fund description.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The fund stage table.'
;

ALTER TABLE `STAGE_FUND` ADD  PRIMARY KEY (`FUND_ID`,`FUND_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_FUND` ADD UNIQUE `PK_STAGE_FUND` (`FUND_ID`,`FUND_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_GEO_CITY_BLOCKS

CREATE TABLE `STAGE_GEO_CITY_BLOCKS`
(
  `LONG_IP_START_NUMBER` Int NOT NULL
 COMMENT 'The start number for the web organization long IP range.',
  `LONG_IP_END_NUMBER` Int NOT NULL
 COMMENT 'The end number for the web organization long IP range.',
  `GEO_LOCATION_ID` Double NOT NULL
 COMMENT 'The geographic location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a geographic location in the source.  Note:  this identiifier is reused by MaxMind.  This means that identifier ID 1 may point to a location in China in one file, but in a subsequent file it may point to Brazil.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains MaxMind GeoLite City data.  It allows you to use a visitor long IP address to determine a geographic location ID.  With this ID, you can determine a visitor country, state/region, city, US area code, metro code, latitude, and longitude information.   For greater accurracy, MaxMind sells the GeoIP? City Database at http://www.maxmind.com/.'
;

CREATE UNIQUE INDEX `STAGE_GEO_CITY_BLOCKS_UK` ON `STAGE_GEO_CITY_BLOCKS` (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`GEO_LOCATION_ID`)
;

CREATE UNIQUE INDEX `STAGE_GEO_CITY_BLOCKS_UK` ON `STAGE_GEO_CITY_BLOCKS` (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`GEO_LOCATION_ID`)
;

CREATE INDEX `STAGE_GEO_CITY_BLOCKS_LOC_FK` USING BTREE ON `STAGE_GEO_CITY_BLOCKS` (`GEO_LOCATION_ID`)
;

ALTER TABLE `STAGE_GEO_CITY_BLOCKS` ADD  PRIMARY KEY (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`GEO_LOCATION_ID`)
;

ALTER TABLE `STAGE_GEO_CITY_BLOCKS` ADD UNIQUE `PK_STAGE_GEO_CITY_BLOCKS` (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`GEO_LOCATION_ID`)
;

-- Table STAGE_GEO_CITY_LOCATION

CREATE TABLE `STAGE_GEO_CITY_LOCATION`
(
  `GEO_LOCATION_ID` Double NOT NULL
 COMMENT 'The geographic location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a geographic location in the source.  Note:  this identiifier is reused by MaxMind.  This means that identifier ID 1 may point to a location in China in one file, but in a subsequent file it may point to Brazil.',
  `ISO_3166_COUNTRY_CODE` Varchar(3)
 COMMENT 'ISO 3166 Country Codes',
  `GEO_REGION_CODE` Varchar(2)
 COMMENT 'If the country code is US or CA (USA or Canda), then this is the ISO code, otherwise it is the FIPS code.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `LATITUDE_NUMBER` Decimal(7,4)
 COMMENT 'This page contains the average latitude for US States and Territories or Countries.',
  `LONGITUDE_NUMBER` Decimal(7,4)
 COMMENT 'This page contains the average longitude for US States and Territories or Countries.',
  `DMA_CODE` Int
 COMMENT 'The Designated Market Areas (DMA) code.  DMA?s are used by Nielsen Media Research to identify TV stations whose broadcast signals reach a specific area and attract the most viewers. A DMA consists of all counties whose largest viewing share is given to stations of that same market area. Non-overlapping DMA?s cover the entire continental United States, Hawaii and parts of Alaska. There are currently 210 Designated Market Areas throughout the U.S.',
  `PHONE_REGION_CODE` Int
 COMMENT 'The phone region (area, city) code.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains MaxMind World Cities information.  It includes geographic ID, city, region, country, latitude and longitude information.  MaxMind also offers a paid verison of this file MaxMind World Cities with Population that includes population data for 34,894+ major cities on their website at http://www.maxmind.com/.'
;

CREATE UNIQUE INDEX `STAGE_GEO_CITY_LOCATION_PK` ON `STAGE_GEO_CITY_LOCATION` (`GEO_LOCATION_ID`)
;

ALTER TABLE `STAGE_GEO_CITY_LOCATION` ADD  PRIMARY KEY (`GEO_LOCATION_ID`)
;

ALTER TABLE `STAGE_GEO_CITY_LOCATION` ADD UNIQUE `PK_STAGE_GEO_CITY_LOCATION` (`GEO_LOCATION_ID`)
;

-- Table STAGE_GEO_DMA

CREATE TABLE `STAGE_GEO_DMA`
(
  `DMA_CODE` Varchar(32) NOT NULL
 COMMENT 'The designated marketing area (DMA) code.',
  `DMA_NAME` Varchar(60)
 COMMENT 'The designated marketing area (DMA) name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains designated marketing area (DMA) information.'
;

ALTER TABLE `STAGE_GEO_DMA` ADD  PRIMARY KEY (`DMA_CODE`)
;

ALTER TABLE `STAGE_GEO_DMA` ADD UNIQUE `PK_STAGE_GEO_DMA` (`DMA_CODE`)
;

-- Table STAGE_GEO_ISO_COUNTRY

CREATE TABLE `STAGE_GEO_ISO_COUNTRY`
(
  `ISO_3166_COUNTRY_CODE` Varchar(32) NOT NULL
 COMMENT 'The ISO 3166 country code.',
  `ISO_3166_COUNTRY_NAME` Varchar(60)
 COMMENT 'The ISO 3166 country name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains ISO country information.'
;

ALTER TABLE `STAGE_GEO_ISO_COUNTRY` ADD  PRIMARY KEY (`ISO_3166_COUNTRY_CODE`)
;

ALTER TABLE `STAGE_GEO_ISO_COUNTRY` ADD UNIQUE `PK_STAGE_GEO_ISO_COUNTRY` (`ISO_3166_COUNTRY_CODE`)
;

-- Table STAGE_GEO_ISO_COUNTRY_FIPS_REG

CREATE TABLE `STAGE_GEO_ISO_COUNTRY_FIPS_REG`
(
  `ISO_3166_COUNTRY_CODE` Varchar(32) NOT NULL
 COMMENT 'The ISO 3166 country code.',
  `FIPS_10_4_REGION_CODE` Varchar(32) NOT NULL DEFAULT 'Missing'
 COMMENT 'The FIPS 10-4 region code.',
  `FIPS_10_4_REGION_NAME` Varchar(60)
 COMMENT 'The FIPS 10-4 region name.',
  `HOSTED_CLIENT_SK` Double
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT SYSDATE
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains ISO country and FIPS region information.'
;

ALTER TABLE `STAGE_GEO_ISO_COUNTRY_FIPS_REG` ADD  PRIMARY KEY (`ISO_3166_COUNTRY_CODE`,`FIPS_10_4_REGION_CODE`)
;

ALTER TABLE `STAGE_GEO_ISO_COUNTRY_FIPS_REG` ADD UNIQUE `PK_STAGE_GEO_ISO_COUNTRY_FIPS_REG` (`ISO_3166_COUNTRY_CODE`,`FIPS_10_4_REGION_CODE`)
;

-- Table STAGE_GEO_ISO_COUNTRY_ISO_REG

CREATE TABLE `STAGE_GEO_ISO_COUNTRY_ISO_REG`
(
  `ISO_3166_COUNTRY_CODE` Varchar(32) NOT NULL
 COMMENT 'The ISO 3166 country code.',
  `ISO_3166_2_REGION_CODE` Varchar(32) NOT NULL
 COMMENT 'The ISO 3166-2 region code.',
  `ISO_3166_2_REGION_NAME` Varchar(60)
 COMMENT 'The ISO 3166-2 region name.',
  `HOSTED_CLIENT_SK` Double
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT SYSDATE
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains ISO country and region information.'
;

ALTER TABLE `STAGE_GEO_ISO_COUNTRY_ISO_REG` ADD  PRIMARY KEY (`ISO_3166_COUNTRY_CODE`,`ISO_3166_2_REGION_CODE`)
;

ALTER TABLE `STAGE_GEO_ISO_COUNTRY_ISO_REG` ADD UNIQUE `PK_STAGE_GEO_ISO_COUNTRY_ISO_REG` (`ISO_3166_COUNTRY_CODE`,`ISO_3166_2_REGION_CODE`)
;

-- Table STAGE_GEO_ORGANIZATION

CREATE TABLE `STAGE_GEO_ORGANIZATION`
(
  `LONG_IP_START_NUMBER` Int NOT NULL
 COMMENT 'The start number for the web organization long IP range.',
  `LONG_IP_END_NUMBER` Int NOT NULL
 COMMENT 'The end number for the web organization long IP range.',
  `WEB_ORGANIZATION_DESC` Varchar(255) NOT NULL
 COMMENT 'The web organization description.',
  `HOSTED_CLIENT_SK` Double
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT SYSDATE
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains MaxMind organization data.  It allows you to use a visitor long IP address to determine a vistors organization (i.e., company, ISP, etc.).'
;

CREATE UNIQUE INDEX `STAGE_GEO_ORGANIZATION_UK` ON `STAGE_GEO_ORGANIZATION` (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`WEB_ORGANIZATION_DESC`)
;

CREATE UNIQUE INDEX `STAGE_GEO_ORGANIZATION_UK` ON `STAGE_GEO_ORGANIZATION` (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`WEB_ORGANIZATION_DESC`)
;

ALTER TABLE `STAGE_GEO_ORGANIZATION` ADD  PRIMARY KEY (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`WEB_ORGANIZATION_DESC`)
;

ALTER TABLE `STAGE_GEO_ORGANIZATION` ADD UNIQUE `PK_STAGE_GEO_ORGANIZATION` (`LONG_IP_START_NUMBER`,`LONG_IP_END_NUMBER`,`WEB_ORGANIZATION_DESC`)
;

-- Table STAGE_GL_ADJUSTMENT

CREATE TABLE `STAGE_GL_ADJUSTMENT`
(
  `GL_ADJUSTMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The general ledger adjustment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies a general ledger adjustment in the source.',
  `GL_ADJUSTMENT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system general ledger adjustment SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The general ledger adjustment effective date.',
  `GL_ADJUSTMENT_NAME` Varchar(60)
 COMMENT 'The general ledger adjustment name.',
  `GL_ADJUSTMENT_DESC` Varchar(255)
 COMMENT 'The general ledger adjustment description',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT SYSDATE
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The general ledger adjustment stage table.'
;

ALTER TABLE `STAGE_GL_ADJUSTMENT` ADD  PRIMARY KEY (`GL_ADJUSTMENT_ID`,`GL_ADJUSTMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_GL_ADJUSTMENT` ADD UNIQUE `PK_STAGE_GL_ADJUSTMENT` (`GL_ADJUSTMENT_ID`,`GL_ADJUSTMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_GL_BOOK

CREATE TABLE `STAGE_GL_BOOK`
(
  `GL_BOOK_ID` Varchar(36) NOT NULL
 COMMENT 'The general ledger book code identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies a general ledger book in the source.',
  `GL_BOOK_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system general ledger book SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The general ledger book effective date.',
  `GL_BOOK_NAME` Varchar(60)
 COMMENT 'The general ledger book name.',
  `GL_BOOK_DESC` Varchar(255)
 COMMENT 'The general ledger book description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The general ledger book stage table.'
;

ALTER TABLE `STAGE_GL_BOOK` ADD  PRIMARY KEY (`GL_BOOK_ID`,`GL_BOOK_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_GL_BOOK` ADD UNIQUE `PK_STAGE_GL_BOOK` (`GL_BOOK_ID`,`GL_BOOK_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_GL_POSTED_TRANSACTION

CREATE TABLE `STAGE_GL_POSTED_TRANSACTION`
(
  `TRXN_ID` Varchar(36) NOT NULL
 COMMENT 'The transaction identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `TRXN_DATE` Timestamp NULL
 COMMENT 'The general ledger transaction date.',
  `BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The general ledger (GL) business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a GL business unit in the source.',
  `LEDGER_ID` Varchar(36)
 COMMENT 'The ledger identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subledger in the source.',
  `SUBLEDGER_ID` Varchar(36)
 COMMENT 'The subledger identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subledger in the source.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `DEPARTMENT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `OPERATING_UNIT_ID` Varchar(36)
 COMMENT 'The operating unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an operating unit in the source.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `FUND_ID` Varchar(36)
 COMMENT 'The fund identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a fund in the source.',
  `CLASSIFICATION_ID` Varchar(36)
 COMMENT 'The classification identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a classification in the source.',
  `PROGRAM_ID` Varchar(36)
 COMMENT 'The program identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a program in the source.',
  `BUDGET_ID` Varchar(36)
 COMMENT 'The budget identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a budget in the source.',
  `PROJECT_ID` Varchar(36)
 COMMENT 'The project identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a project in the source.',
  `GL_BOOK_ID` Varchar(36)
 COMMENT 'The general ledger book identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies a general ledger book in the source.',
  `GL_ADJUSTMENT_ID` Varchar(36)
 COMMENT 'The general ledger adjustment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies a general ledger adjustment in the source.',
  `GL_ADJUSTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system gl adjustment SETID.  This column is often used as part of the unique identifer.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction currency in the source.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a base currency in the source.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `STATISTICS_ID` Varchar(36)
 COMMENT 'The statistics identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies statistics in the source.',
  `COST_CENTER_ID` Varchar(36)
 COMMENT 'The cost center identifier in the source system.',
  `TRXN_AMT` Decimal(26,2)
 COMMENT 'The gl posted transaction amount (transaction currency).',
  `LEDGER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system ledger SETID.  This column is often used as part of the unique identifer.',
  `ACCOUNT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system account SETID.  This column is often used as part of the unique identifer.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `DEPARTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `OPERATING_UNIT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system operating unit SETID.  This column is often used as part of the unique identifer.',
  `PROGRAM_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The program source system SETID.  This column is often used as part of the unique identifer.',
  `CLASSIFICATION_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system classification SETID.  This column is often used as part of the unique identifer.',
  `FUND_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system fund SETID.  This column is often used as part of the unique identifer.',
  `STATISTICS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system statitics SETID.  This column is often used as part of the unique identifer.',
  `BUDGET_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system budget SETID.  This column is often used as part of the unique identifer.',
  `GL_BOOK_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system general ledger book SETID.  This column is often used as part of the unique identifer.',
  `COST_CENTER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system cost center SETID.  This column is often used as part of the unique identifer.',
  `TRXN_TYPE_ID` Varchar(36)
 COMMENT 'The transaction type identifier in the source system.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.',
  `BUDGET_FRCST_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system budget forecast SETID.  This column is often used as part of the unique identifer.',
  `BUDGET_FRCST_ID` Varchar(36)
 COMMENT 'The budget forecast identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a budget in the source.'
)
 COMMENT = 'The general ledger posted transaction stage table.'
;

ALTER TABLE `STAGE_GL_POSTED_TRANSACTION` ADD  PRIMARY KEY (`TRXN_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_GL_POSTED_TRANSACTION` ADD UNIQUE `PK_STAGE_GL_POSTED_TRANSACTION` (`TRXN_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_JOBCODE

CREATE TABLE `STAGE_JOBCODE`
(
  `JOBCODE_ID` Varchar(36) NOT NULL
 COMMENT 'The jobcode identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a jobcode in the source.',
  `JOBCODE_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system jobcode SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `JOBCODE_NAME` Varchar(60)
 COMMENT 'The jobcode name.',
  `JOBCODE_DESC` Varchar(255)
 COMMENT 'The jobcode description.',
  `COMPENSATION_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The compensation frequency code.',
  `COMPENSATION_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The compensation frequency name.',
  `COMPENSATION_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The compensation frequency description.',
  `JOB_ACCOUNTABILITY_PCT` Decimal(7,3)
 COMMENT 'The job accountability percent.',
  `JOB_ACCOUNTABILITY_POINTS_QTY` Double
 COMMENT 'The job accountability points quantity.',
  `JOB_FAMILY_CODE` Varchar(32)
 COMMENT 'The job family code.',
  `JOB_FAMILY_NAME` Varchar(60)
 COMMENT 'The job family name.',
  `JOB_FAMILY_DESC` Varchar(255)
 COMMENT 'The job family description.',
  `JOB_FUNCTION_CODE` Varchar(32)
 COMMENT 'The job function code.',
  `JOB_FUNCTION_NAME` Varchar(60)
 COMMENT 'The job function name.',
  `JOB_FUNCTION_DESC` Varchar(255)
 COMMENT 'The job function description.',
  `MANAGER_LEVEL_CODE` Varchar(32)
 COMMENT 'The manager level code.',
  `MANAGER_LEVEL_NAME` Varchar(60)
 COMMENT 'The manager level name.',
  `MANAGER_LEVEL_DESC` Varchar(255)
 COMMENT 'The manager level description.',
  `REGULAR_TEMP_CODE` Varchar(32)
 COMMENT 'The regular temporary code.',
  `REGULAR_TEMP_NAME` Varchar(60)
 COMMENT 'The regular temporary name.',
  `REGULAR_TEMP_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `SALARY_PLAN_ID` Varchar(36)
 COMMENT 'The salary plan identifier.',
  `SALARY_PLAN_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system salary plan SETID.  This column is often used as part of the unique identifer.',
  `SALARY_GRADE_ID` Varchar(36)
 COMMENT 'The salary grade identifier.',
  `SALARY_STEP_ID` Varchar(36)
 COMMENT 'The salary step identifier.',
  `STANDARD_HOURS_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The standard hours frequency code.',
  `SALARY_SURVERY_CODE` Varchar(32)
 COMMENT 'The salary survey code.',
  `SALARY_SURVEY_NAME` Varchar(60)
 COMMENT 'The salary survey name.',
  `SALARY_SURVEY_DESC` Varchar(255)
 COMMENT 'The salary survey description.',
  `SALARY_SURVEY_CURRENCY_ID` Varchar(36)
 COMMENT 'The salary survey currency source system identifier.',
  `SALARY_SURVEY_AMT` Double
 COMMENT 'The salary survey amount.',
  `LABOR_UNION_CODE` Varchar(32)
 COMMENT 'The labor union code.',
  `LABOR_UNION_NAME` Varchar(60)
 COMMENT 'The labor union name.',
  `LABOR_UNION_DESC` Varchar(255)
 COMMENT 'The labor union description.',
  `WORKERS_COMPENSATION_CODE` Varchar(32)
 COMMENT 'The workers compensation code.',
  `WORKERS_COMPENSATION_NAME` Varchar(60)
 COMMENT 'The workers compensation name.',
  `WORKERS_COMPENSATION_DESC` Varchar(255)
 COMMENT 'The workers compensation description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The job code stage table.'
;

ALTER TABLE `STAGE_JOBCODE` ADD  PRIMARY KEY (`JOBCODE_ID`,`JOBCODE_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_JOB_ACTION

CREATE TABLE `STAGE_JOB_ACTION`
(
  `JOB_ACTION_ID` Varchar(36) NOT NULL
 COMMENT 'The job action identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a job action in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `JOB_ACTION_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The job action effective date.',
  `JOB_ACTION_NAME` Varchar(60)
 COMMENT 'The job action name.',
  `JOB_ACTION_DESC` Varchar(255)
 COMMENT 'The job action description.',
  `JOB_ACTION_REASON_ID` Varchar(36)
 COMMENT 'The job action reason identifier in the source system.',
  `JOB_ACTION_REASON_EFF_DATE` Timestamp NULL
 COMMENT 'The job action reason effective date.',
  `JOB_ACTION_REASON_NAME` Varchar(60)
 COMMENT 'The job action reason name.',
  `JOB_ACTION_REASON_DESC` Varchar(255)
 COMMENT 'The job action reason description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The job action stage table.'
;

CREATE UNIQUE INDEX `STAGE_JOB_ACTION_PK` ON `STAGE_JOB_ACTION` (`JOB_ACTION_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_JOB_ACTION` ADD  PRIMARY KEY (`JOB_ACTION_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_LEDGER

CREATE TABLE `STAGE_LEDGER`
(
  `LEDGER_ID` Varchar(36) NOT NULL
 COMMENT 'The ledger identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a ledger in the source.',
  `LEDGER_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system ledger SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `LEDGER_NAME` Varchar(60)
 COMMENT 'The ledger name.',
  `LEDGER_GROUP_ID` Varchar(36)
 COMMENT 'The ledger group identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a ledger group in the source.',
  `LEDGER_GROUP_NAME` Varchar(60)
 COMMENT 'The ledger group name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The ledger stage table.'
;

ALTER TABLE `STAGE_LEDGER` ADD  PRIMARY KEY (`LEDGER_ID`,`LEDGER_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_LEDGER` ADD UNIQUE `PK_STAGE_LEDGER` (`LEDGER_ID`,`LEDGER_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_LOCATION

CREATE TABLE `STAGE_LOCATION`
(
  `LOCATION_ID` Varchar(36) NOT NULL
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a location in the source.',
  `LOCATION_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NOT NULL DEFAULT SYSDATE
 COMMENT 'The effective date.',
  `REGULATORY_REGION_ID` Varchar(32)
 COMMENT 'The regulatory region identifier.',
  `LOCATION_NAME` Varchar(60)
 COMMENT 'The location name.',
  `LOCATION_DESC` Varchar(255)
 COMMENT 'The location description',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The address line 1.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The address line 2.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The address line 3.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The address line 4.',
  `BUILDING_NAME` Varchar(60)
 COMMENT 'The building name.',
  `FLOOR_NUMBER` Varchar(32)
 COMMENT 'The floor number.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(32)
 COMMENT 'The state province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(32)
 COMMENT 'The country code.',
  `GEOGRAPHY_CODE` Varchar(32)
 COMMENT 'The geography code.',
  `ALT_GEOGRAPHY_CODE` Varchar(32)
 COMMENT 'The alternate geography code.',
  `JURSIDICTION_CODE` Varchar(32)
 COMMENT 'The jurisdiction code.',
  `SECTOR_NUMBER` Varchar(32)
 COMMENT 'The sector number.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The location stage dimension.'
;

CREATE UNIQUE INDEX `STAGE_LOCATION_PK` ON `STAGE_LOCATION` (`LOCATION_ID`,`LOCATION_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_LOCATION` ADD  PRIMARY KEY (`LOCATION_ID`,`LOCATION_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_LOCATION` ADD UNIQUE `PK_STAGE_LOCATION` (`LOCATION_ID`,`LOCATION_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_MARKETING_CHANNEL

CREATE TABLE `STAGE_MARKETING_CHANNEL`
(
  `CHANNEL_ID` Varchar(36) NOT NULL
 COMMENT 'The marekting channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a region in the source.',
  `CHANNEL_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `CHANNEL_NAME` Varchar(60)
 COMMENT 'The marketing channel name.',
  `CHANNEL_DESC` Varchar(255)
 COMMENT 'The channel description.',
  `CHANNEL_TYPE_CODE` Varchar(32)
 COMMENT 'The marketing channel type.',
  `CHANNEL_TYPE_NAME` Varchar(20)
 COMMENT 'The channel type name.',
  `CHANNEL_TYPE_DESC` Varchar(255)
 COMMENT 'The channel type description.',
  `CHANNEL_ACTIVITY_CODE` Varchar(32)
 COMMENT 'The channel activity code.',
  `CHANNEL_ACTIVITY_NAME` Varchar(60)
 COMMENT 'The channel activity name.',
  `CHANNEL_ACTIVITY_DESC` Varchar(255)
 COMMENT 'The channel activity description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1)
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The marketing channel dimension.'
;

CREATE UNIQUE INDEX `STAGE_MARKETING_CHANNEL_PK` ON `STAGE_MARKETING_CHANNEL` (`CHANNEL_ID`,`CHANNEL_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_MARKETING_CHANNEL` ADD  PRIMARY KEY (`CHANNEL_ID`,`CHANNEL_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_MARKETING_CHANNEL` ADD UNIQUE `PK_STAGE_MARKETING_CHANNEL` (`CHANNEL_ID`,`CHANNEL_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_MARKETING_SEGMENT

CREATE TABLE `STAGE_MARKETING_SEGMENT`
(
  `SEGMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The marketing segment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign in the source.',
  `SEGMENT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SEGMENT_NAME` Varchar(60)
 COMMENT 'The marketing segment name.',
  `SEGMENT_GROUP_ID` Varchar(32)
 COMMENT 'The marketing segment group source system identifier.',
  `SEGMENT_GROUP_NAME` Varchar(60)
 COMMENT 'The marketing segment group name.',
  `SEGMENT_GROUP_DESC` Varchar(255)
 COMMENT 'The marketing segment group description.',
  `INTERNAL_EXTERNAL_IND` Varchar(1)
 COMMENT 'This denotes an internal or external source.',
  `INTERNAL_EXTERNAL_DESC` Varchar(255)
 COMMENT 'The internal external source name.',
  `SEGMENT_CURRENT_LIST_IND` Varchar(1)
 COMMENT 'This denotes if the segment list is current.',
  `SEGMENT_LIST_DESC` Varchar(255)
 COMMENT 'The segment list description.',
  `SEGMENT_LIST_SOURCE_NAME` Varchar(60)
 COMMENT 'The segment list source name.',
  `SEGMENT_LIST_GENERATED_DATE` Timestamp NULL
 COMMENT 'The segment list generated date.',
  `SEGMENT_LIST_UPDATE_DATE` Timestamp NULL
 COMMENT 'The segment list updated date.',
  `FIXED_DYNAMIC_IND` Varchar(1)
 COMMENT 'This denotes a fixed or dymanic segment.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The marekting segment stage dimension.'
;

CREATE UNIQUE INDEX `STAGE_MARKETING_SEGMENT_PK` ON `STAGE_MARKETING_SEGMENT` (`SEGMENT_ID`,`SEGMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_MARKETING_SEGMENT` ADD  PRIMARY KEY (`SEGMENT_ID`,`SEGMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_MARKETING_SEGMENT` ADD UNIQUE `PK_STAGE_MARKETING_SEGMENT` (`SEGMENT_ID`,`SEGMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_MARKETING_STATUS

CREATE TABLE `STAGE_MARKETING_STATUS`
(
  `MARKETING_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The marketing status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing status in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `MARKETING_STATUS_DESC` Varchar(60)
 COMMENT 'The marketing status description.',
  `MARKETING_STATUS_NAME` Varchar(60)
 COMMENT 'The marekting status name.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The marketing status stage table.'
;

CREATE UNIQUE INDEX `STAGE_MKT_STATUS_PK` ON `STAGE_MARKETING_STATUS` (`MARKETING_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_MARKETING_STATUS` ADD  PRIMARY KEY (`MARKETING_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_OPERATING_UNIT

CREATE TABLE `STAGE_OPERATING_UNIT`
(
  `OPERATING_UNIT_ID` Varchar(36) NOT NULL
 COMMENT 'The operating unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an operating unit in the source.',
  `OPERATING_UNIT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system operating unit SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `OPERATING_UNIT_NAME` Varchar(60)
 COMMENT 'The operating unit name.',
  `OPERATING_UNIT_DESC` Varchar(255)
 COMMENT 'The operating unit description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The operating unit stage table.'
;

ALTER TABLE `STAGE_OPERATING_UNIT` ADD  PRIMARY KEY (`OPERATING_UNIT_ID`,`OPERATING_UNIT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_OPERATING_UNIT` ADD UNIQUE `PK_STAGE_OPERATING_UNIT` (`OPERATING_UNIT_ID`,`OPERATING_UNIT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_ORDER

CREATE TABLE `STAGE_ORDER`
(
  `RESERVED_QTY` Int DEFAULT 0
 COMMENT 'The reserved quanitity of a product at a particular unit of measure (e.g, five items, two case, one pallet).',
  `ORDER_ID` Varchar(36) NOT NULL
 COMMENT 'The order (capture) source system identifier.',
  `ORDER_LINE_NUMBER` Varchar(36) NOT NULL
 COMMENT 'The order (capture) line source system line number.  It is a degenerate dimenension in the order capture fact table.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `ORDER_DESC` Varchar(255)
 COMMENT 'The order capture description.',
  `ORDER_CAPTURE_DATE` Timestamp NULL
 COMMENT 'The order (capture) date.',
  `BILL_TO_TYPE_CODE` Varchar(32)
 COMMENT 'The bill to type code.',
  `CAMPAIGN_ID` Varchar(36)
 COMMENT 'The marketing campaign identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign in the source.',
  `CAMPAIGN_WAVE_ID` Varchar(36)
 COMMENT 'The marketing campaign wave identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign wave in the source.',
  `CAMPAIGN_WAVE_SETID` Varchar(5)
 COMMENT 'The source system campaign wave SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `CHANNEL_ID` Varchar(36)
 COMMENT 'The marketing segment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing segment in the source.',
  `CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system marketing channel SETID.  This column is often used as part of the unique identifer.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency identifier in the source system.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency indentifier in the source system.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_CONTACT_ID` Varchar(36)
 COMMENT 'The customer contact identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer contact in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee (sales representative) identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `LOCATION_ID` Varchar(36)
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a location in the source.',
  `LOCATION_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system location SETID.  This column is often used as part of the unique identifer.',
  `ORDER_STATUS_ID` Varchar(36)
 COMMENT 'The order status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an order status in the source.',
  `ORDER_STATUS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system order status SETID.  This column is often used as part of the unique identifer.',
  `ORDER_TYPE_ID` Varchar(36)
 COMMENT 'The order type source system identifier.',
  `REGION_ID` Varchar(36)
 COMMENT 'The region identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a region in the source.',
  `SEGMENT_ID` Varchar(36)
 COMMENT 'The marketing segment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing segment in the source.',
  `SEGMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system marketing segment SETID.  This column is often used as part of the unique identifer.',
  `UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `SOURCE_TYPE_CODE` Varchar(32)
 COMMENT 'The order source type code.',
  `SOURCE_TYPE_NAME` Varchar(20)
 COMMENT 'The source type name.',
  `CAPTURE_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.  Not intended for display.',
  `CAPTURE_TYPE_NAME` Varchar(60)
 COMMENT 'The capture type name.',
  `CAPTURE_TYPE_DESC` Varchar(255)
 COMMENT 'The capture type description.',
  `SOURCE_TYPE_DESC` Varchar(255)
 COMMENT 'The source type description.',
  `BILL_TO_TYPE_DESC` Varchar(255)
 COMMENT 'The bill to type description.',
  `BILL_TO_TYPE_NAME` Varchar(60)
 COMMENT 'The bill to type name.',
  `ORDER_NUMBER` Varchar(36)
 COMMENT 'The source system order number.',
  `PO_NUMBER` Varchar(32)
 COMMENT 'The purchase order number in the source system.  It is a degenerate dimenension in the order capture fact table.  Note:  this may or not be a numeric value.',
  `PO_LINE_NUMBER` Varchar(32)
 COMMENT 'The customer purchase order (PO) line number in the source system.  It is a degenerate dimenension in the order capture fact table.',
  `BILL_RECIPIENT_IND` Char(1)
 COMMENT 'This denotes if the recipient of the order is to be billed.',
  `BULK_ORDER_IND` Char(1)
 COMMENT 'This denotes a bulk order.',
  `PO_CONFIRMATION_IND` Char(1)
 COMMENT 'This denotes if a purchase order has been received.',
  `RESELL_IND` Varchar(1)
 COMMENT 'This denotes a resell.',
  `SHIP_PARTIAL_IND` Char(1)
 COMMENT 'This denotes if partial shipments are allowed for the order.',
  `RECURRING_PRICE_FREQUENCY_CODE` Varchar(2)
 COMMENT 'The recurring price frequency code.',
  `RECURRING_PRICE_AMT` Decimal(26,2)
 COMMENT 'The recurring price of a single product at a particular unit of measure (e.g, one item, one case, one pallet).',
  `ORDER_QTY` Decimal(26,2)
 COMMENT 'The sales quanitity of a product at a particular unit of measure (e.g, five items, two case, one pallet).',
  `SHIPPED_QTY` Decimal(26,2) DEFAULT 0
 COMMENT 'The shipped quanitity of a product at a particular unit of measure (e.g, five items, two case, one pallet).',
  `BILLED_QTY` Decimal(26,2) DEFAULT 0
 COMMENT 'The billed quanitity of a product at a particular unit of measure (e.g, five items, two case, one pallet).',
  `LOST_SALES_QTY` Decimal(26,2) DEFAULT 0
 COMMENT 'The lost sales quanitity of a product at a particular unit of measure (e.g, five items, two case, one pallet).',
  `LIST_PRICE_AMT` Decimal(26,2)
 COMMENT 'The list price of a single product at a particular unit of measure (e.g, one item, one case, one pallet).',
  `COST_AMT` Decimal(26,2)
 COMMENT 'The cost of a single product at a particular unit of measure (e.g, one item, one case, one pallet).',
  `PRICE_AMT` Decimal(26,2)
 COMMENT 'The sales price of a single product at a particular unit of measure (e.g, one item, one case, one pallet).',
  `DISCOUNT_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The discount amount for a single product at a particular unit of measure (e.g, one item, one case, one pallet).',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9)
 COMMENT 'The currency exchange rate.',
  `RETURN_AUTHORIZATION_ID` Varchar(36)
 COMMENT 'The return authorization identifier from the source system.',
  `RETURN_QTY` Decimal(26,2)
 COMMENT 'The return quantity at a particular unit of measure (e.g, five items, two case, one pallet).',
  `VOLUME_UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The volume unit of measure surrogate key. This relates to the unit of measure dimension.',
  `VOLUME_QTY` Decimal(26,2)
 COMMENT 'The sales volume quantity at a particular unit of measure (e.g, liter, gallon, etc.).',
  `WEIGHT_UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The weight unit of measure identifier in the source system.',
  `WEIGHT_QTY` Decimal(26,2)
 COMMENT 'The sales weight quantity at a particular unit of measure.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_DIMENSION_LOAD_IND` Char(1)
 COMMENT 'This denotes a row has been sucessfully loaded into the dimension.  It implies the fact table load is pending.  Subsequent to the fact table load, the row iwll be hard deleted from the stage table.  This column is only used when a single stage table supports both a fact and dimension table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'This stage table maintains customer order information at the order line grain.  All amount and quantity columns should come from the order line source table.  Keys, dates, and descriptions can come from either the header or line tables.'
;

CREATE UNIQUE INDEX `STAGE_ORDER_PK` ON `STAGE_ORDER` (`ORDER_ID`,`ORDER_LINE_NUMBER`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ORDER` ADD  PRIMARY KEY (`ORDER_ID`,`ORDER_LINE_NUMBER`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ORDER` ADD UNIQUE `PK_STAGE_ORDER` (`ORDER_ID`,`ORDER_LINE_NUMBER`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_ORDER_STATUS

CREATE TABLE `STAGE_ORDER_STATUS`
(
  `ORDER_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The order status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an order status in the source.',
  `ORDER_STATUS_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `ORDER_STATUS_NAME` Varchar(60)
 COMMENT 'The order status name.',
  `ORDER_STATUS_DESC` Varchar(255)
 COMMENT 'The order status description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The order status stage dimension.'
;

CREATE UNIQUE INDEX `STAGE_ORDER_STATUS_PK` ON `STAGE_ORDER_STATUS` (`ORDER_STATUS_ID`,`ORDER_STATUS_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ORDER_STATUS` ADD  PRIMARY KEY (`ORDER_STATUS_ID`,`ORDER_STATUS_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ORDER_STATUS` ADD UNIQUE `PK_STAGE_ORDER_STATUS` (`ORDER_STATUS_ID`,`ORDER_STATUS_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_ORDER_TYPE

CREATE TABLE `STAGE_ORDER_TYPE`
(
  `ORDER_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The order type identifier in the source system.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `ORDER_TYPE_NAME` Varchar(60)
 COMMENT 'The order type name.',
  `ORDER_TYPE_DESC` Varchar(255)
 COMMENT 'The order type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The order type stage table.'
;

CREATE UNIQUE INDEX `STAGE_ORDER_TYPE_PK` ON `STAGE_ORDER_TYPE` (`ORDER_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ORDER_TYPE` ADD  PRIMARY KEY (`ORDER_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_ORDER_TYPE` ADD UNIQUE `PK_STAGE_ORDER_TYPE` (`ORDER_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PARTNER

CREATE TABLE `STAGE_PARTNER`
(
  `PARTNER_ID` Varchar(36) NOT NULL
 COMMENT 'The partner identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a partner in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PARTNER_NAME` Varchar(60)
 COMMENT 'The partner name.',
  `PARTNER_STATUS_CODE` Varchar(36)
 COMMENT 'The partner status code.',
  `PARTNER_STATUS_DESC` Varchar(255)
 COMMENT 'The partner status description.',
  `CUSTOMER_IND` Varchar(1)
 COMMENT 'The customer indicator.',
  `TAX_EXEMPT_IND` Varchar(1)
 COMMENT 'The tax exempt indicator.',
  `PARTNER_SINCE_DATE` Datetime
 COMMENT 'The partner since date.',
  `EMPLOYEE_QTY` Int UNSIGNED
 COMMENT 'The quantity of employees.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The partner stage table.'
;

ALTER TABLE `STAGE_PARTNER` ADD  PRIMARY KEY (`PARTNER_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PARTNER_CONTACT

CREATE TABLE `STAGE_PARTNER_CONTACT`
(
  `PARTNER_CONTACT_ID` Varchar(36) NOT NULL
 COMMENT 'The partner contact identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a partner contact in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PARTNER_CONTACT_NAME` Varchar(60)
 COMMENT 'The partner contact name.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The partner contact stage table.'
;

CREATE UNIQUE INDEX `STAGE_PARTNER_CONTACT_PK` ON `STAGE_PARTNER_CONTACT` (`PARTNER_CONTACT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PARTNER_CONTACT` ADD  PRIMARY KEY (`PARTNER_CONTACT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PAYABLE_TIME

CREATE TABLE `STAGE_PAYABLE_TIME`
(
  `TIME_REPORT_ID` Varchar(36) NOT NULL
 COMMENT 'The time report identifier in the source system.  It is a degenerate dimension in the fact table.',
  `TIME_REPORT_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The time report line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `TIME_REPORT_CODE_ID` Varchar(36)
 COMMENT 'The time report code identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a time report code in the source.',
  `COMPANY_ID` Varchar(36)
 COMMENT 'The company identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company in the source.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `LOCATION_ID` Varchar(36)
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a location in the source.',
  `LOCATION_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system location SETID.  This column is often used as part of the unique identifer.',
  `DEPARTMENT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `JOBCODE_ID` Varchar(36)
 COMMENT 'The jobcode identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a jobcode in the source.',
  `JOBCODE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system jobcode SETID.  This column is often used as part of the unique identifer.',
  `POSITION_ID` Varchar(36)
 COMMENT 'The position identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a position in the source.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee (sales representative) identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `PROJECT_ID` Varchar(36)
 COMMENT 'The project identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a project in the source.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system account SETID.  This column is often used as part of the unique identifer.',
  `FUND_ID` Varchar(36)
 COMMENT 'The fund identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a fund in the source.',
  `FUND_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system fund SETID.  This column is often used as part of the unique identifer.',
  `CLASS_ID` Varchar(36)
 COMMENT 'The class identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a class in the source.',
  `CLASS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system class SETID.  This column is often used as part of the unique identifer.',
  `OPERATING_UNIT_ID` Varchar(36)
 COMMENT 'The operating unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an operating unit in the source.',
  `OPERATING_UNIT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system operating unit SETID.  This column is often used as part of the unique identifer.',
  `REPORT_DATE` Datetime
 COMMENT 'The time report date.',
  `HOUR_QTY` Double
 COMMENT 'The quantity of hours.',
  `HOUR_RATE` Decimal(26,2)
 COMMENT 'The rate per hour for the employee.',
  `PAYABLE_AMT` Decimal(26,2)
 COMMENT 'The payable time amount.',
  `DW_ERROR_IND` Char(1)
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'The payable time stage table.'
;

ALTER TABLE `STAGE_PAYABLE_TIME` ADD  PRIMARY KEY (`TIME_REPORT_ID`,`TIME_REPORT_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PAYMENT_METHOD

CREATE TABLE `STAGE_PAYMENT_METHOD`
(
  `PAYMENT_METHOD_ID` Varchar(36) NOT NULL
 COMMENT 'The payment method identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment method in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `PAYMENT_METHOD_NAME` Varchar(60)
 COMMENT 'The payment method name.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

ALTER TABLE `STAGE_PAYMENT_METHOD` ADD  PRIMARY KEY (`PAYMENT_METHOD_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PAYMENT_METHOD` ADD UNIQUE `PK_STAGE_PAYMENT_METHOD` (`PAYMENT_METHOD_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PAYMENT_TERMS

CREATE TABLE `STAGE_PAYMENT_TERMS`
(
  `PAYMENT_TERMS_ID` Varchar(36) NOT NULL
 COMMENT 'The payment terms identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment term in the source.',
  `PAYMENT_TERMS_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system payment terms SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The payment terms currency identifier in the source system',
  `PAYMENT_TERMS_NAME` Varchar(60)
 COMMENT 'The payment terms name.',
  `PAYMENT_TERMS_DATE` Timestamp NULL
 COMMENT 'The payment terms date.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `PAYMENT_TERMS_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The payment terms amount.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

ALTER TABLE `STAGE_PAYMENT_TERMS` ADD  PRIMARY KEY (`PAYMENT_TERMS_ID`,`PAYMENT_TERMS_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PAYMENT_TERMS` ADD UNIQUE `PK_STAGE_PAYMENT_TERMS` (`PAYMENT_TERMS_ID`,`PAYMENT_TERMS_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PERSON

CREATE TABLE `STAGE_PERSON`
(
  `PERSON_ID` Varchar(36) NOT NULL
 COMMENT 'The person identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an person in the source.',
  `PERSON_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `AGENT_ID` Varchar(36)
 COMMENT 'The agent identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an agent in the source.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an employee  in the source.',
  `ALTERNATE_EMPLOYEE_ID` Varchar(36)
 COMMENT 'The alternate employee identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an employyee in the source.',
  `NATIONAL_ID` Varchar(36)
 COMMENT 'The national identifier, for example a U.S. Social Security Number.',
  `APPLICANT_ID` Varchar(36)
 COMMENT 'The applicant identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an applicant in the source.',
  `APPLICATION_DATE` Timestamp NULL
 COMMENT 'The employment application date.',
  `BIRTH_DATE` Datetime
 COMMENT 'The birth date.',
  `DEATH_DATE` Datetime
 COMMENT 'The death date.',
  `LAST_NAME` Varchar(60)
 COMMENT 'The last (family) name.',
  `MIDDLE_NAME` Varchar(60)
 COMMENT 'The middle name.',
  `FIRST_NAME` Varchar(60)
 COMMENT 'The first (given) name.',
  `FULL_NAME` Varchar(60)
 COMMENT 'The full name of the sales representative.',
  `MARITAL_STATUS_CODE` Varchar(32)
 COMMENT 'The marital status code.',
  `MARITAL_STATUS_NAME` Varchar(60)
 COMMENT 'The marital status name.',
  `MARITAL_STATUS_DESC` Varchar(255)
 COMMENT 'The marital status description.',
  `MARITAL_STATUS_DATE` Timestamp NULL
 COMMENT 'The marital status date.',
  `GENDER_CODE` Varchar(1)
 COMMENT 'The gender code.',
  `GENDER_DESC` Varchar(255)
 COMMENT 'The gender description.',
  `FULL_TIME_STUDENT_IND` Char(1)
 COMMENT 'The denotes if a person is a full time student.',
  `US_WORK_ELIGIBILITY_IND` Char(1)
 COMMENT 'The denotes if a person is eligible to work in the United States.',
  `EU_WORK_ELIGIBILTY_IND` Char(1)
 COMMENT 'The denotes if a person is eligible to work in the European Union.',
  `US_CITIZEN_PROOF_DOC1_NAME` Varchar(60)
 COMMENT 'The name of document 1 used to prove US citizenship.',
  `US_CITIZEN_PROOF_DOC2_NAME` Varchar(60)
 COMMENT 'The name of document 2 used to prove US citizenship.',
  `MILITARY_STATUS_CODE` Char(1)
 COMMENT 'The military status code.',
  `HIGHEST_EDUCATION_LEVEL_CODE` Varchar(32)
 COMMENT 'The highest education level code.',
  `HIGHEST_EDUCATION_LEVEL_NAME` Varchar(60)
 COMMENT 'The highest education level name.',
  `HIGHEST_EDUCATION_LEVEL_DESC` Varchar(255)
 COMMENT 'The highest education level description.',
  `ETHNIC_GROUP_CODE` Varchar(32)
 COMMENT 'The ethnic group code.',
  `ETHNIC_GROUP_NAME` Varchar(60)
 COMMENT 'The ethnic group name.',
  `ETHNIC_GROUP_DESC` Varchar(255)
 COMMENT 'The ethnic group description.',
  `HIGH_COMPENSATION_IND` Char(1)
 COMMENT 'This denotes a high compensation person.',
  `HIGH_COMPENSATION_PLAN_IND` Char(1)
 COMMENT 'This denotes a high compensation plan membership.',
  `EXPERIENCE_YEAR_QTY` Double
 COMMENT 'The quantity of experience years for the person.',
  `REGULATORY_REGION_CODE` Varchar(32)
 COMMENT 'The regulatory region code.',
  `DISABLED_IND` Char(1)
 COMMENT 'This denotes a disabled person.',
  `DISABLED_VETRAN_IND` Char(1)
 COMMENT 'This denotes a disabled military veteran.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `SALES_REP_IND` Char(1)
 COMMENT 'This denotes if a person is a sales representative.',
  `SERVICE_REP_IND` Char(1)
 COMMENT 'This denotes if a person is a customer service representative.',
  `HOME_ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `HOME_ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `HOME_ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `HOME_ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `HOME_CITY_NAME` Varchar(60)
 COMMENT 'The home address city name.',
  `HOME_STATE_PROVINCE_CODE` Varchar(32)
 COMMENT 'The home address state code.',
  `HOME_STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The home address state name.',
  `HOME_POSTAL_CODE` Varchar(32)
 COMMENT 'The home address postal code.',
  `HOME_GEOGRAPHY_CODE` Varchar(32)
 COMMENT 'The home address geography code.',
  `HOME_COUNTRY_NAME` Varchar(60)
 COMMENT 'The home address country name.',
  `HOME_PHONE_COUNTRY_CODE` Varchar(32)
 COMMENT 'The telephone country code.',
  `HOME_PHONE_REGION_CODE` Varchar(32)
 COMMENT 'The phone region, area, or city code.',
  `HOME_PHONE_NUMBER` Varchar(32)
 COMMENT 'The home telephone number.',
  `CELL_PHONE_NUMBER` Varchar(32)
 COMMENT 'The cell phone number.',
  `BUSINESS_PHONE_NUMBER` Varchar(32)
 COMMENT 'The business phone number.',
  `SALES_USER_TYPE_CODE` Varchar(32)
 COMMENT 'The sales user type code.',
  `SALES_USER_TYPE_DESC` Varchar(255)
 COMMENT 'The sales user type description.',
  `QUOTA_TYPE_CODE` Varchar(32)
 COMMENT 'The quota type code.',
  `QUOTA_TYPE_DESC` Varchar(255)
 COMMENT 'The quota type description.',
  `UNIT_QUOTA_TYPE_CODE` Varchar(32)
 COMMENT 'The unit quota type code.',
  `UNIT_QUOTA_TYPE_DESC` Varchar(255)
 COMMENT 'The unit quota type description.',
  `MANAGER_QUOTA_TYPE_CODE` Varchar(32)
 COMMENT 'The manager quota type code.',
  `MANAGER_QUOTA_TYPE_DESC` Varchar(255)
 COMMENT 'The manager quota type description.',
  `JOBCODE_ID` Varchar(36)
 COMMENT 'The jobcode identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `JOBCODE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system jobcode SETID.  This column is often used as part of the unique identifer.',
  `LOCATION_ID` Varchar(36)
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `LOCATON_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system location SETID.  This column is often used as part of the unique identifer.',
  `EMPLOYEE_CLASS_CODE` Varchar(32)
 COMMENT 'The employee class code.',
  `FULL_PART_TIME_IND` Varchar(1)
 COMMENT 'This denotes if an employee is full or part-time.',
  `FULL_PART_TIME_DESC` Varchar(255)
 COMMENT 'The full or part time description.',
  `REG_TEMP_IND` Varchar(1)
 COMMENT 'This denotes if an employee is regular or temporary.',
  `REG_TEMP_DESC` Varchar(255)
 COMMENT 'The regular or temporary description.',
  `DEPT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `DEPT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `DEPT_NAME` Varchar(60)
 COMMENT 'The department name.',
  `DEPT_DESC` Varchar(255)
 COMMENT 'The department description.',
  `SALES_REGION_CODE` Varchar(32)
 COMMENT 'The sales region code.',
  `SALES_REGION_DESC` Varchar(255)
 COMMENT 'The sales region description.',
  `EMPLOYEE_CLASS_ID` Varchar(36)
 COMMENT 'The employee class identifier in the source system.',
  `EMPLOYEE_CLASS_NAME` Varchar(60)
 COMMENT 'The employee class name.',
  `EMPLOYEE_CLASS_DESC` Varchar(255)
 COMMENT 'The employee class description.',
  `REGULAR_TEMPORARY_IND` Varchar(1)
 COMMENT 'The regular temporary indicator.',
  `REGULAR_TEMPORARY_NAME` Varchar(60)
 COMMENT 'The regular temporary name.',
  `REGULAR_TEMPORARY_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `PERSON_STATUS_CODE` Varchar(36)
 COMMENT 'The person status code.',
  `PERSON_STATUS_NAME` Varchar(60)
 COMMENT 'The person status name.',
  `PERSON_STATUS_DESC` Varchar(255)
 COMMENT 'The person status description.',
  `PERSON_STATUS_DATE` Datetime
 COMMENT 'The person status date.',
  `PERSON_TYPE_ID` Varchar(36)
 COMMENT 'The person type identifier.',
  `PERSON_TYPE_NAME` Varchar(60)
 COMMENT 'The person type name.',
  `PERSON_TYPE_DESC` Varchar(255)
 COMMENT 'The person type description.',
  `PERSON_GROUP_CODE` Varchar(36)
 COMMENT 'The person group code.',
  `PERSON_GROUP_NAME` Varchar(60)
 COMMENT 'The person group name.',
  `PERSON_GROUP_DESC` Varchar(255)
 COMMENT 'The person group description.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The person (employee) stage table.  This tables does not include customers or customer contacts.'
;

ALTER TABLE `STAGE_PERSON` ADD  PRIMARY KEY (`PERSON_ID`,`PERSON_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PERSON` ADD UNIQUE `PK_STAGE_PERSON` (`PERSON_ID`,`PERSON_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PERSON_APPLICATION

CREATE TABLE `STAGE_PERSON_APPLICATION`
(
  `APPLICATION_ID` Varchar(36) NOT NULL
 COMMENT 'The application identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `POSITION_ID` Varchar(36)
 COMMENT 'The position identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a position in the source.',
  `APPLICANT_ID` Varchar(36)
 COMMENT 'The applicant identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an applicant in the source.',
  `RECRUITER_ID` Varchar(36)
 COMMENT 'The recruiter identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a recruiter in the source.',
  `RECRUITMENT_CHANNEL_ID` Varchar(36)
 COMMENT 'The recruitment channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a recruitment channel in the source.',
  `CAMPAIGN_WAVE_ID` Varchar(36)
 COMMENT 'The campaign wave identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a campaign wave in the source.',
  `RECRUITMENT_EVENT_ID` Varchar(36)
 COMMENT 'The recruitment event identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a recruitment event in the source.',
  `APPLICATION_STATUS_ID` Varchar(36)
 COMMENT 'The application status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an application status in the source.',
  `REQUISITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  This is a degenerated dimension in the fact table.',
  `APPLICATION_DATE` Datetime
 COMMENT 'The application date.',
  `REVIEW_DATE` Datetime
 COMMENT 'The application review date.',
  `TEST_DATE` Datetime
 COMMENT 'The applicant test date.',
  `REJECT_DATE` Datetime
 COMMENT 'The applicant rejection date.',
  `INTERVIEW_DATE` Datetime
 COMMENT 'The applicant interview date.',
  `OFFER_DATE` Datetime
 COMMENT 'The offer extended date.',
  `ACCEPT_DATE` Datetime
 COMMENT 'The offer acceptance date.',
  `DECLINE_DATE` Datetime
 COMMENT 'The offer declined date.',
  `START_DATE` Datetime
 COMMENT 'The applicant work start date.',
  `SCORE_QTY` Smallint DEFAULT 0
 COMMENT 'The applicant score quantity.',
  `INTERNAL_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of internal applicants.',
  `EXTERNAL_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of external applicants.',
  `DAY_TO_FILL_QTY` Smallint DEFAULT 0
 COMMENT 'The time to fill quantity in days.',
  `APPLICATION_QTY` Smallint DEFAULT 0
 COMMENT 'The application quantity.',
  `REVIEW_QTY` Smallint DEFAULT 0
 COMMENT 'The  quantity of applications in the review status.',
  `TEST_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of applications in the test status.',
  `REJECT_QTY` Smallint DEFAULT 0
 COMMENT 'The  quantity of applications in the rejected status.',
  `INTERVIEW_QTY` Smallint DEFAULT 0
 COMMENT 'The  quantity of applications in the interview status.',
  `OFFER_QTY` Smallint DEFAULT 0
 COMMENT 'The  quantity of applications in the extended offer status.',
  `ACCEPT_QTY` Smallint DEFAULT 0
 COMMENT 'The  quantity of applications in the accepted status.',
  `DECLINE_QTY` Smallint DEFAULT 0
 COMMENT 'The  quantity of applications in the declined status.',
  `HIGH_PERFORMER_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of candiates that become high performers.',
  `RECEIVED_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of applications in the received status.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The person application stage table.'
;

-- Table STAGE_PHYSICAL_INVENTORY

CREATE TABLE `STAGE_PHYSICAL_INVENTORY`
(
  `PRODUCT_ID` Varchar(36) DEFAULT 0
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.  Not intended for display.',
  `PRODUCT_LOT_ID` Varchar(36) NOT NULL DEFAULT 0
 COMMENT 'The product lot identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an product lot in the source.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 0
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WAREHOUSE_ID` Varchar(36)
 COMMENT 'The warehouse identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a warehouse in the source.',
  `SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a supplier in the source.',
  `SUPPLIER_SETID` Varchar(5)
 COMMENT 'The source system supplier SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `INV_UOM_ID` Varchar(36)
 COMMENT 'The inventory unit of measure identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an inventory unit of measure in the source.',
  `SNAPSHOT_DATE` Timestamp NULL
 COMMENT 'The physical inventory snapshot date.',
  `INV_OPEN_QTY` Double
 COMMENT 'The quantity of items in the open status.',
  `INV_RESTRICTED_QTY` Double
 COMMENT 'The quantity of items in the restricted status.',
  `INV_HOLD_QTY` Double
 COMMENT 'The quantity of items in the hold status.',
  `INV_REJECTED_QTY` Double
 COMMENT 'The quantity of items in the rejected status.',
  `INV_UNIT_COST_AMT` Decimal(26,2)
 COMMENT 'The unit cost of the product.  This is a sum of all costs that can be attributed to a product unit (e.g., raw material, transportation, indirect costs, etc.).',
  `INV_UNIT_PRICE_AMT` Decimal(26,2)
 COMMENT 'The standard unit price of the product offered to customers.  This is generic across customers and often does not reflect the price actually offered to customers.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT "1.000000000"
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction currency in the source.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a base currency in the source.'
)
;

-- Table STAGE_POSITION

CREATE TABLE `STAGE_POSITION`
(
  `POSITION_ID` Varchar(36) NOT NULL
 COMMENT 'The position identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a position in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `POSITION_NAME` Varchar(60)
 COMMENT 'The position name.',
  `POSITION_DESC` Varchar(255)
 COMMENT 'The position description.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `COMPANY_ID` Varchar(36)
 COMMENT 'The company identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company in the source.',
  `DEPARTMENT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `JOBCODE_ID` Varchar(36)
 COMMENT 'The jobcode identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a jobcode in the source.',
  `JOBCODE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system jobcode SETID.  This column is often used as part of the unique identifer.',
  `MANAGER_ID` Varchar(36)
 COMMENT 'The manager identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a manager in the source.',
  `LOCATION_ID` Varchar(36)
 COMMENT 'The location identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a location in the source.',
  `LOCATION_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system location SETID.  This column is often used as part of the unique identifer.',
  `SALARY_PLAN_ID` Varchar(36)
 COMMENT 'The salary plan identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a salary plan in the source.',
  `SALARY_PLAN_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system salary plan SETID.  This column is often used as part of the unique identifer.',
  `REGULATORY_REGION_ID` Varchar(36)
 COMMENT 'The regulatory region identifier in the source system.',
  `POSITION_STATUS_CODE` Varchar(32)
 COMMENT 'The position status code.',
  `POSITION_STATUS_NAME` Varchar(60)
 COMMENT 'The position status name.',
  `POSITION_STATUS_DESC` Varchar(255)
 COMMENT 'The position status description.',
  `POSITION_STATUS_DATE` Timestamp NULL
 COMMENT 'The position status date.',
  `POSITION_ESTABLISHED_DATE` Timestamp NULL
 COMMENT 'The position established date.',
  `LABOR_UNION_CODE` Varchar(32)
 COMMENT 'The labor union code.',
  `LABOR_UNION_NAME` Varchar(60)
 COMMENT 'The labor union name.',
  `LABOR_UNION_DESC` Varchar(255)
 COMMENT 'The labor union description.',
  `JOB_SHIFT_CODE` Varchar(32)
 COMMENT 'The job shift code.',
  `JOB_SHIFT_NAME` Varchar(60)
 COMMENT 'The job shift name.',
  `JOB_SHIFT_DESC` Varchar(255)
 COMMENT 'The job shift description.',
  `REGULAR_TEMPORARY_CODE` Varchar(32)
 COMMENT 'The regular temporary code.',
  `REGULAR_TEMPORARY_NAME` Varchar(60)
 COMMENT 'The regular temporary name.',
  `REGULAR_TEMPORARY_DESC` Varchar(255)
 COMMENT 'The regular temporary description.',
  `FULL_PART_TIME_CODE` Varchar(32)
 COMMENT 'The full part time code.',
  `FULL_PART_TIME_NAME` Varchar(60)
 COMMENT 'The full part time name.',
  `FULL_PART_TIME_DESC` Varchar(255)
 COMMENT 'The full part time description.',
  `DRUG_TEST_REQUIRED_QTY` Decimal(1,0)
 COMMENT 'The drug test required quantity (set to 1 if true).',
  `SECURITY_CLEARANCE_CODE` Varchar(32)
 COMMENT 'The security clearance code.',
  `SECURITY_CLEARANCE_NAME` Varchar(60)
 COMMENT 'The security clearance name.',
  `SECURITY_CLEARANCE_DESC` Varchar(255)
 COMMENT 'The security clearance description.',
  `FULL_TIME_EQUIVALENT_QTY` Decimal(9,6)
 COMMENT 'The full time equivalent quantity.',
  `ACADEMIC_RANK_CODE` Varchar(32)
 COMMENT 'The academic rank code.',
  `ACADEMIC_RANK_NAME` Varchar(60)
 COMMENT 'The academic rank name.',
  `ACADEMIC_RANK_DESC` Varchar(255)
 COMMENT 'The academic rank description.',
  `SERVICE_GROUP_CODE` Varchar(32)
 COMMENT 'The service group code.',
  `SERVICE_GROUP_NAME` Varchar(60)
 COMMENT 'The service group name.',
  `SERVICE_GROUP_DESC` Varchar(255)
 COMMENT 'The service group description.',
  `JOB_PROFILE_CODE` Varchar(32)
 COMMENT 'The job profile code.',
  `JOB_PROFILE_NAME` Varchar(60)
 COMMENT 'The job profile name.',
  `JOB_PROFILE_DESC` Varchar(255)
 COMMENT 'The job profile description.',
  `MAXIMUM_HEAD_COUNT_QTY` Decimal(4,0)
 COMMENT 'The maximum headcount quantity.',
  `BUDGETED_POSITION_QTY` Decimal(1,0)
 COMMENT 'The position budgeted quantity (set to 1 if true).',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The (employment) position stage table.'
;

ALTER TABLE `STAGE_POSITION` ADD  PRIMARY KEY (`POSITION_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PRODUCT

CREATE TABLE `STAGE_PRODUCT`
(
  `PRODUCT_ID` Varchar(36) NOT NULL
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `PRODUCT_CODE` Varchar(32)
 COMMENT 'The product code.',
  `PRODUCT_NAME` Varchar(60)
 COMMENT 'The product name.',
  `PRODUCT_DESC` Varchar(255)
 COMMENT 'The product description.',
  `MANUFACTURER_PRODUCT_ID` Varchar(36)
 COMMENT 'The manufacturers product identifier.',
  `PRODUCT_KIT_IND` Varchar(1)
 COMMENT 'This denotes if a product is a part of a kit.',
  `PRODUCT_UPPER_MARGIN_PCT` Decimal(5,2)
 COMMENT 'The product upper margin percent.',
  `PRODUCT_LOWER_MARGIN_PCT` Decimal(5,2)
 COMMENT 'The product lower margin percent.',
  `PRODUCT_STATUS_CODE` Varchar(1)
 COMMENT 'The product status code.',
  `PRODUCT_STATUS_NAME` Varchar(60)
 COMMENT 'The product status name.',
  `PRODUCT_STATUS_DESC` Varchar(255)
 COMMENT 'The product status description.',
  `PRODUCT_STATUS_DATE` Timestamp NULL
 COMMENT 'The product status date.',
  `PRODUCT_DEFAULT_UOM_ID` Varchar(3)
 COMMENT 'The default unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `PRODUCT_CATEGORY_CODE` Varchar(60)
 COMMENT 'The product category code.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The product cateogry name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The product category description.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_SUBCATEGORY_CODE` Varchar(32)
 COMMENT 'The product subcategory code. It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_SUBCATEGORY_NAME` Varchar(60)
 COMMENT 'The product subcategory name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_SUBCATEGORY_DESC` Varchar(255)
 COMMENT 'The product subcategory description. It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PARENT_PRODUCT_CATEGORY_NAME` Varchar(60)
 COMMENT 'The product category name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PARENT_PRODUCT_CATEGORY_DESC` Varchar(255)
 COMMENT 'The product category description.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_BRAND_CODE` Varchar(32)
 COMMENT 'The product brand code.',
  `PRODUCT_BRAND_NAME` Varchar(60)
 COMMENT 'The product brand name.',
  `PRODUCT_BRAND_DESC` Varchar(255)
 COMMENT 'The product brand description.',
  `PRODUCT_FAMILY_CODE` Varchar(32)
 COMMENT 'The product family code.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_FAMILY_NAME` Varchar(60)
 COMMENT 'The product family name.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_FAMILY_DESC` Varchar(255)
 COMMENT 'The product family description.  It is part of the PRODUCT FAMILY -> PARENT PRODUCT CATEGORY -> PRODUCT CATEGORY -> PRODUCT SUBCATEGORY hierarchy.',
  `PRODUCT_DEPARTMENT_NAME` Varchar(60)
 COMMENT 'The product department name.',
  `WEIGHT_QTY` Double
 COMMENT 'The weight quantity (as defined by the weight unit of measure).',
  `WEIGHT_UOM_ID` Varchar(32)
 COMMENT 'The weight unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `LENGTH_QTY` Double
 COMMENT 'The length quantity (as defined by the dimension unit of measure).',
  `WIDTH_QTY` Double
 COMMENT 'The width quantity (as defined by the dimension unit of measure).',
  `HEIGHT_QTY` Double
 COMMENT 'The height quantity (as defined by the dimension unit of measure).',
  `DIMENSION_UOM_ID` Varchar(36)
 COMMENT 'The dimension unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `VOLUME_QTY` Double
 COMMENT 'The volume quantity (as defined by the volume unit of measure).',
  `VOLUME_UOM_ID` Varchar(36)
 COMMENT 'The volume unit of measure identifier in the source system. Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `SELL_UNIT_QTY` Double
 COMMENT 'The standard quantity of units sold as this product (as defined by the unit unit of measure).',
  `CASE_UNIT_QTY` Double
 COMMENT 'The number of these products that define a case.',
  `PALLET_UNIT_QTY` Double
 COMMENT 'The number of these products that define a shipping pallet.',
  `UNIT_UOM_ID` Varchar(36)
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `INVENTORY_ITEM_ID` Varchar(36)
 COMMENT 'The inventory item identifier for the product (finished good) in the source system.',
  `EAN_UPC_NUMBER` Varchar(32)
 COMMENT 'The international article number (EAN/UPC).',
  `ALT_EAN_UPC_NUMBER` Varchar(32)
 COMMENT 'The alternate international article number (EAN/UPC).',
  `EAN_UPC_TYPE_NAME` Varchar(60)
 COMMENT 'The EAN/UPC type name.  For example, Manufacturer EAN; Manufacturer Short EAN; ITF Code; 16 Character, ITF Code; Instore EAN; Instore Short EAN; UPC; Velocity Code; etc.',
  `ALT_EAN_UPC_TYPE_NAME` Varchar(60)
 COMMENT 'The alternate EAN/UPC type name.  For example, Manufacturer EAN; Manufacturer Short EAN; ITF Code; 16 Character, ITF Code; Instore EAN; Instore Short EAN; UPC; Velocity Code; etc.',
  `PRICE_EACH_AMT` Decimal(26,2)
 COMMENT 'The standard each price of the product offered to customers.  This is generic across customers and often does not reflect the price actually offered to customers.',
  `COST_EACH_AMT` Decimal(26,2)
 COMMENT 'The each cost of the product.  This is a sum of all costs that can be attributed to a product (e.g., raw material, transportation, indirect costs, etc.).',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The product (material) stage dimension.'
;

CREATE UNIQUE INDEX `STAGE_PRODUCT_PK` ON `STAGE_PRODUCT` (`PRODUCT_ID`,`PRODUCT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PRODUCT` ADD  PRIMARY KEY (`PRODUCT_ID`,`PRODUCT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PRODUCT` ADD UNIQUE `PK_STAGE_PRODUCT` (`PRODUCT_ID`,`PRODUCT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PROGRAM

CREATE TABLE `STAGE_PROGRAM`
(
  `PROGRAM_ID` Varchar(36) NOT NULL
 COMMENT 'The program identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a program in the source.',
  `PROGRAM_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The program source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The program effective date.',
  `PROGRAM_NAME` Varchar(60)
 COMMENT 'The program name.',
  `PROGRAM_DESC` Varchar(255)
 COMMENT 'The program description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.'
)
 COMMENT = 'The program stage table.'
;

ALTER TABLE `STAGE_PROGRAM` ADD  PRIMARY KEY (`PROGRAM_ID`,`PROGRAM_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PROJECT

CREATE TABLE `STAGE_PROJECT`
(
  `PROJECT_ID` Varchar(36) NOT NULL
 COMMENT 'The project identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a project in the source.',
  `PROJECT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system project SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `PROJECT_DESC` Varchar(255)
 COMMENT 'The project description.',
  `PROJECT_NAME` Varchar(60)
 COMMENT 'The project name.',
  `PROJECT_TYPE_CODE` Varchar(32)
 COMMENT 'The project type code.',
  `PROJECT_TYPE_NAME` Varchar(60)
 COMMENT 'The project type name.',
  `PROJECT_TYPE_DESC` Varchar(255)
 COMMENT 'The project type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The project stage table.'
;

ALTER TABLE `STAGE_PROJECT` ADD  PRIMARY KEY (`PROJECT_ID`,`PROJECT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PROVIDER_GROUP

CREATE TABLE `STAGE_PROVIDER_GROUP`
(
  `PROVIDER_GROUP_ID` Varchar(36) NOT NULL
 COMMENT 'The provider group identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a provider group in the source.',
  `PROVIDER_GROUP_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system provider group SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PROVIDER_GROUP_DESC` Varchar(255)
 COMMENT 'The provider group description.',
  `PROVIDER_GROUP_TYPE_CODE` Varchar(32)
 COMMENT 'The provider group type code.',
  `PROVIDER_GROUP_TYPE_DESC` Varchar(255)
 COMMENT 'The provider group type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The provider group stage table.'
;

ALTER TABLE `STAGE_PROVIDER_GROUP` ADD  PRIMARY KEY (`PROVIDER_GROUP_ID`,`PROVIDER_GROUP_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PURCHASE_ORDER

CREATE TABLE `STAGE_PURCHASE_ORDER`
(
  `PURCHASE_ORDER_ID` Varchar(36) NOT NULL
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The purchase order line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 0
 COMMENT 'The source system identifier.',
  `HOSTED_CLIENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `SUPPLIER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system supplier SETID.  This column is often used as part of the unique identifer.',
  `SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `REQUESTER_ID` Varchar(36)
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `REQUESTER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system requester SETID.  This column is often used as part of the unique identifer.',
  `PURCHASER_ID` Varchar(36)
 COMMENT 'The purchaser surrogate key.  This relates to the person dimension.',
  `PURCHASER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system purchaser SETID.  This column is often used as part of the unique identifer.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `PURCHASE_ORDER_UOM_ID` Varchar(36)
 COMMENT 'The purchase order unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `REQUEST_DATE` Datetime
 COMMENT 'The purchase order request date.',
  `REQUISITION_DATE` Datetime
 COMMENT 'The requisition date.',
  `PURCHASE_ORDER_DATE` Datetime
 COMMENT 'The purchase order date.',
  `REQUISITION_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `REQUISITION_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_QTY` Double
 COMMENT 'The quantity of product requested for purchase.  This may or may not be the actual amount later purchased from a supplier using a purchase order.',
  `PURCHASE_ORDER_TRXN_AMT` Decimal(26,2)
 COMMENT 'The purchase order transaction amount.',
  `PURCHASE_ORDER_BASE_AMT` Decimal(26,2)
 COMMENT 'The purchase order base amount.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The purchase order stage table maintains information about supplier purchase orders.  Processed purchase orders will drive the creation of shipping notices and shipments.'
;

ALTER TABLE `STAGE_PURCHASE_ORDER` ADD  PRIMARY KEY (`PURCHASE_ORDER_ID`,`PURCHASE_ORDER_LINE_ID`,`SOURCE_SYSTEM_ID`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `STAGE_PURCHASE_ORDER` ADD UNIQUE `PK_STAGE_PURCHASE_ORDER` (`PURCHASE_ORDER_ID`,`PURCHASE_ORDER_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_RECRUITMENT_CHANNEL

CREATE TABLE `STAGE_RECRUITMENT_CHANNEL`
(
  `RECRUITMENT_CHANNEL_ID` Varchar(36) NOT NULL
 COMMENT 'The recruitment channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a recruitment channel in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `RECRUITMENT_CHANNEL_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The recruitment channel source system SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `RECRUITMENT_CHANNEL_NAME` Varchar(60)
 COMMENT 'The channel name.',
  `RECRUITMENT_CHANNEL_DESC` Varchar(255)
 COMMENT 'The channel description.',
  `RECRUITMENT_CHANNEL_TYPE_CODE` Varchar(32)
 COMMENT 'The recruitment channel type.',
  `RECRUITMENT_CHANNEL_TYPE_NAME` Varchar(60)
 COMMENT 'The recruitment channel type name.',
  `RECRUITMENT_CHANNEL_TYPE_DESC` Varchar(255)
 COMMENT 'The channel type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The recruitment channel stage.'
;

CREATE UNIQUE INDEX `STAGE_RECRUIT_CHANNEL_PK` ON `STAGE_RECRUITMENT_CHANNEL` (`RECRUITMENT_CHANNEL_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_RECRUITMENT_CHANNEL` ADD  PRIMARY KEY (`RECRUITMENT_CHANNEL_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_RECRUITMENT_EVENT

CREATE TABLE `STAGE_RECRUITMENT_EVENT`
(
  `RECRUITMENT_EVENT_ID` Varchar(36) NOT NULL
 COMMENT 'The recruitment event identifier in the source system.  Alone, or in combination with other columns, (e.g., recruitment event, setid, source system), this value uniquely identifiers a recruitment event in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `RECRUITMENT_EVENT_NAME` Varchar(60)
 COMMENT 'The recruitment event name.',
  `RECRUITMENT_EVENT_DESC` Varchar(60)
 COMMENT 'The recruitment event description',
  `RECRUITMENT_EVENT_TYPE_CODE` Varchar(36)
 COMMENT 'The recruitment event type.',
  `RECRUITMENT_EVENT_TYPE_NAME` Varchar(60)
 COMMENT 'The recruitment event type name.',
  `RECRUITMENT_EVENT_TYPE_DESC` Varchar(255)
 COMMENT 'The recruitment event type description.',
  `START_DATE` Datetime
 COMMENT 'The start date of the recruitment event.',
  `STOP_DATE` Datetime
 COMMENT 'The stop date of the recruitment event.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The address line 1 description.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The address line 2 description.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The address line 3 description.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The address line 4 description.',
  `CITY_NAME` Varchar(255)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(255)
 COMMENT 'The county name.',
  `STATE_PROVINCE_CODE` Varchar(6)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(255)
 COMMENT 'The state or province name.',
  `POSTAL_CODE` Varchar(36)
 COMMENT 'The postal code.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(255)
 COMMENT 'The country name.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `SUPER_NATIONAL_NAME` Varchar(60)
 COMMENT 'The super national name, e.g., European Union.',
  `LATITUDE` Decimal(7,4)
 COMMENT 'The latitude.',
  `LONGITUDE` Decimal(7,4)
 COMMENT 'The longitude.',
  `PHONE_COUNTRY_CODE` Smallint
 COMMENT 'The telephone country code.',
  `PHONE_REGION_CODE` Smallint
 COMMENT 'The phone region code.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The recruitment event stage.'
;

CREATE UNIQUE INDEX `STAGE_RECRUITMENT_EVENT_PK` ON `STAGE_RECRUITMENT_EVENT` (`RECRUITMENT_EVENT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_RECRUITMENT_EVENT` ADD  PRIMARY KEY (`RECRUITMENT_EVENT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_REGION

CREATE TABLE `STAGE_REGION`
(
  `REGION_ID` Varchar(36) NOT NULL
 COMMENT 'The region identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a region in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `REGION_NAME` Varchar(60)
 COMMENT 'The region name.',
  `PARENT_REGION_ID` Varchar(36)
 COMMENT 'The parent region identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a region in the source.',
  `PARENT_REGION_NAME` Varchar(60)
 COMMENT 'The parent region name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The region stage table.'
;

CREATE UNIQUE INDEX `STAGE_REGION_PK` ON `STAGE_REGION` (`REGION_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_REGION` ADD  PRIMARY KEY (`REGION_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_REGION` ADD UNIQUE `PK_STAGE_REGION` (`REGION_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_REGULATORY_REGION

CREATE TABLE `STAGE_REGULATORY_REGION`
(
  `REGULATORY_REGION_ID` Varchar(36) NOT NULL
 COMMENT 'The regulatory region source system identifier.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `REGULATORY_REGION_NAME` Varchar(60)
 COMMENT 'The regulatory region name.',
  `REGULATORY_REGION_DESC` Varchar(255)
 COMMENT 'The regulatory region description.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The regulatory region stage table.'
;

ALTER TABLE `STAGE_REGULATORY_REGION` ADD  PRIMARY KEY (`REGULATORY_REGION_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_REQUISITION

CREATE TABLE `STAGE_REQUISITION`
(
  `REQUISITION_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition identifier in the source system.',
  `REQUISITION_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The requisition line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 0
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `SUPPLIER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system supplier SETID.  This column is often used as part of the unique identifer.',
  `SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `REQUESTER_ID` Varchar(36)
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `REQUESTER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system requester SETID.  This column is often used as part of the unique identifer.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `REQUISITION_UOM_ID` Varchar(36)
 COMMENT 'The requisition unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `REQUEST_DATE` Datetime
 COMMENT 'The requisition request date.',
  `REQUISITION_DATE` Datetime
 COMMENT 'The requisition date.',
  `REQUISITION_QTY` Double
 COMMENT 'The quantity of product requested for purchase.  This may or may not be the actual amount later purchased from a supplier using a purchase order.',
  `REQUISITION_TRXN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The requisition transaction amount.',
  `REQUISITION_BASE_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The requisition base amount.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The requisition stage table maintains information about internal product purchase requests.  Approved requisitions will drive the creation of purchase orders.'
;

ALTER TABLE `STAGE_REQUISITION` ADD  PRIMARY KEY (`REQUISITION_ID`,`REQUISITION_LINE_ID`,`SOURCE_SYSTEM_ID`,`HOSTED_CLIENT_SK`)
;

-- Table STAGE_RETURN

CREATE TABLE `STAGE_RETURN`
(
  `RETURN_AUTHORIZATION_ID` Varchar(36) NOT NULL
 COMMENT 'The return authorization number.  It is a degenerate dimension in the fact table.',
  `RETURN_AUTHORIZATION_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The return authorization line identifier.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a supplier in the source.',
  `SUPPLIER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system supplier SETID.  This column is often used as part of the unique identifer.',
  `BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `AUTHORIZER_ID` Varchar(36)
 COMMENT 'The return authorizer employee identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a return authorizer in the source.',
  `RETURN_REASON_ID` Varchar(36)
 COMMENT 'The return reason identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a return reason in the source.',
  `RETURN_TYPE_ID` Varchar(36)
 COMMENT 'The return type source system identifier.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency identifier in the source system.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency identifier in the source system.',
  `RETURN_UOM_ID` Varchar(36)
 COMMENT 'The return unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `REQUEST_DATE` Datetime
 COMMENT 'The return request date.',
  `RETURN_DATE` Datetime
 COMMENT 'The return date.',
  `RETURN_QTY` Double
 COMMENT 'The return quantity.',
  `REFUND_QTY` Double
 COMMENT 'The quantity of returns that resulted in refunds.',
  `EXCHANGE_QTY` Double
 COMMENT 'The quantity of returns that resulted in exchanges.',
  `RETURN_AMT` Double
 COMMENT 'The return transaction amount.',
  `RETURN_COST_AMT` Double
 COMMENT 'The return cost transaction amount.',
  `HANDLING_AMT` Double
 COMMENT 'The handling transaction amount (charged to customer).',
  `FREIGHT_AMT` Double
 COMMENT 'The freignt transaction amount (charged to customer).',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The customer return stage table maintains information about products returned by customers.'
;

ALTER TABLE `STAGE_RETURN` ADD  PRIMARY KEY (`RETURN_AUTHORIZATION_ID`,`RETURN_AUTHORIZATION_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_RETURN` ADD UNIQUE `PK_STAGE_RETURN` (`RETURN_AUTHORIZATION_ID`,`RETURN_AUTHORIZATION_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_RETURN_REASON

CREATE TABLE `STAGE_RETURN_REASON`
(
  `RETURN_REASON_ID` Varchar(36) NOT NULL
 COMMENT 'The return reason identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an return reason in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `RETURN_REASON_NAME` Varchar(60)
 COMMENT 'The return reason name.',
  `RETURN_REASON_DESC` Varchar(255)
 COMMENT 'The return reason description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The return reason stage table.'
;

CREATE UNIQUE INDEX `STAGE_RETURN_REASON_PK` ON `STAGE_RETURN_REASON` (`RETURN_REASON_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_RETURN_REASON` ADD  PRIMARY KEY (`RETURN_REASON_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_RETURN_REASON` ADD UNIQUE `PK_STAGE_RETURN_REASON` (`RETURN_REASON_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_RETURN_TYPE

CREATE TABLE `STAGE_RETURN_TYPE`
(
  `RETURN_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The return type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an return type in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `RETURN_TYPE_NAME` Varchar(60)
 COMMENT 'The return type name.',
  `RETURN_TYPE_DESC` Varchar(255)
 COMMENT 'The return type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The return type stage table.'
;

ALTER TABLE `STAGE_RETURN_TYPE` ADD  PRIMARY KEY (`RETURN_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SALARY_PLAN

CREATE TABLE `STAGE_SALARY_PLAN`
(
  `SALARY_PLAN_ID` Varchar(36) NOT NULL
 COMMENT 'The salary admin plan identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a salary admin plan in the source.',
  `SALARY_PLAN_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system salary admin plan SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SALARY_PLAN_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The salary plan effective date.',
  `SALARY_GRADE_ID` Varchar(36)
 COMMENT 'The salary grade source system identifier.',
  `SALARY_GRADE_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The salary grade effective date.',
  `SALARY_STEP_ID` Varchar(36)
 COMMENT 'The salary step identifier.',
  `SALARY_STEP_EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The salary step effective date.',
  `SALARY_PLAN_NAME` Varchar(60)
 COMMENT 'The salary plan name.',
  `SALARY_PLAN_DESC` Varchar(255)
 COMMENT 'The salary plan description.',
  `SALARY_GRADE_NAME` Varchar(60)
 COMMENT 'The salary grade name.',
  `SALARY_GRADE_DESC` Varchar(255)
 COMMENT 'The salary grade description.',
  `SALARY_STEP_DESC` Varchar(255)
 COMMENT 'The salary step description.',
  `SALARY_STEP_NAME` Varchar(60)
 COMMENT 'The salary step name.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.',
  `COMPANY_ID` Varchar(36)
 COMMENT 'The company identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company in the source.',
  `SALARY_PLAN_EFF_STATUS_CODE` Varchar(32)
 COMMENT 'The salary plan effective status code.',
  `SALARY_PLAN_SCOPE_CODE` Varchar(32)
 COMMENT 'The salary plan scope code.',
  `SALARY_PLAN_SCOPE_NAME` Varchar(60)
 COMMENT 'The salary plan scope name.',
  `SALARY_PLAN_SCOPE_DESC` Varchar(255)
 COMMENT 'The salary plan scope description.',
  `SALARY_BASIS_CODE` Varchar(32)
 COMMENT 'The salary basis code.',
  `SALARY_BASIS_NAME` Varchar(60)
 COMMENT 'The salary basis name.',
  `SALARY_BASIS_DESC` Varchar(255)
 COMMENT 'The salary basis description.',
  `DAILY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The daily frequency code.',
  `DAILY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The daily frequency name.',
  `DAILY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The daily frequency description.',
  `HOURLY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The hourly frequency code.',
  `HOURLY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The hourly frequency name.',
  `HOURLY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The hourly frequency description.',
  `MONTHLY_FREQUENCY_CODE` Varchar(32)
 COMMENT 'The monthly frequency code.',
  `MONTHLY_FREQUENCY_NAME` Varchar(60)
 COMMENT 'The monthly frequency name.',
  `MONTHLY_FREQUENCY_DESC` Varchar(255)
 COMMENT 'The monthly frequency description.',
  `MAX_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The maximum annual rate.',
  `MID_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The midpoint annual rate.',
  `MIN_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The minimum annual rate.',
  `MAX_MONTHLY_RATE` Decimal(18,3)
 COMMENT 'The maximum monthly rate.',
  `MID_MONTHLY_RATE` Decimal(18,3)
 COMMENT 'The midpoint montly rate.',
  `MIN_MONTHLY_RATE` Decimal(18,3)
 COMMENT 'The minimum montly rate.',
  `MAX_DAILY_RATE` Decimal(18,3)
 COMMENT 'The maximum daily rate.',
  `MID_DAILY_RATE` Decimal(18,3)
 COMMENT 'The midpoint daily rate.',
  `MIN_DAILY_RATE` Decimal(18,3)
 COMMENT 'The minimum daily rate.',
  `MAX_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The maximum hourly rate.',
  `MID_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The midpoint hourly rate.',
  `MIN_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The minimum hourly rate.',
  `INCREMENT_DAY_QTY` Decimal(4,0)
 COMMENT 'The quantity of increment days.',
  `INCREMENT_WEEK_QTY` Decimal(4,0)
 COMMENT 'The quantity of increment weeks.',
  `STEP_ANNUAL_RATE` Decimal(18,3)
 COMMENT 'The step annual rate.',
  `STEP_DAILY_RATE` Decimal(18,3)
 COMMENT 'The step daily rate.',
  `STEP_HOURLY_RATE` Decimal(18,3)
 COMMENT 'The step hourly rate.',
  `STEP_BIWEEKLY_RATE` Decimal(18,3)
 COMMENT 'The step biweekly rate.',
  `STEP_MONTHLY_RATE` Decimal(21,3)
 COMMENT 'The step monthly rate.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The salary plan stage table.'
;

ALTER TABLE `STAGE_SALARY_PLAN` ADD  PRIMARY KEY (`SALARY_PLAN_ID`,`SALARY_PLAN_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SALES_CHANNEL

CREATE TABLE `STAGE_SALES_CHANNEL`
(
  `SALES_CHANNEL_ID` Varchar(36) NOT NULL
 COMMENT 'The sales channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales channel in the source.',
  `SALES_CHANNEL_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The sales channel source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `SALES_CHANNEL_NAME` Varchar(60)
 COMMENT 'The sales channel name.',
  `SALES_CHANNEL_DESC` Varchar(255)
 COMMENT 'The sales channel description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

ALTER TABLE `STAGE_SALES_CHANNEL` ADD  PRIMARY KEY (`SALES_CHANNEL_ID`,`SALES_CHANNEL_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_SALES_CHANNEL` ADD UNIQUE `PK_STAGE_SALES_CHANNEL` (`SALES_CHANNEL_ID`,`SALES_CHANNEL_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SALES_LEAD

CREATE TABLE `STAGE_SALES_LEAD`
(
  `SALES_LEAD_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The sales lead identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead in the source.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source. In this context, it is used to facilitate updates from PeopleSoft source systems, it should not be displayed.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SALES_LEAD_OWNER_ID` Varchar(36)
 COMMENT 'The sales lead owner identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead owner in the source.',
  `SALES_LEAD_OWNER_NAME` Varchar(60)
 COMMENT 'The sales lead owner name.',
  `SALES_LEAD_TYPE_ID` Varchar(36)
 COMMENT 'The sales lead type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead type in the source.',
  `SALES_LEAD_TYPE_NAME` Varchar(60)
 COMMENT 'The sales lead type name.',
  `SALES_LEAD_TYPE_DESC` Varchar(255)
 COMMENT 'The sales lead type description.',
  `SALES_LEAD_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The sales lead line identifier.  It is a degenerate dimension in the stage table.',
  `SALES_LEAD_CHANNEL_ID` Varchar(36)
 COMMENT 'The sales lead channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales lead channel in the source.',
  `SALES_LEAD_CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system sales lead channel SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_CONTACT_ID` Varchar(36)
 COMMENT 'The customer contact identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer contact in the source.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee (sales representative) identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `CAMPAIGN_WAVE_ID` Varchar(36)
 COMMENT 'The marketing campaign wave identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign wave in the source.',
  `MARKETING_CHANNEL_ID` Varchar(36)
 COMMENT 'The marketing channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing channel in the source.',
  `CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system marketing channel SETID.  This column is often used as part of the unique identifer.',
  `UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `CREATED_DATE` Datetime
 COMMENT 'The sales lead created date.',
  `ASSIGNED_DATE` Datetime
 COMMENT 'The sales lead assigned date.',
  `IN_PROCESS_DATE` Datetime
 COMMENT 'The sales lead in process date.',
  `QUALIFIED_DATE` Datetime
 COMMENT 'The sales lead qualified date.',
  `DEAD_DATE` Datetime
 COMMENT 'The sales lead dead date.',
  `RECYCLED_DATE` Datetime
 COMMENT 'The sales lead recycled date.',
  `SALES_LEAD_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The sales lead amount.',
  `PRODUCT_QTY` Smallint DEFAULT 0
 COMMENT 'The sales lead quantity of a product at a particular unit of measure (e.g, five items, two case, one pallet).',
  `CREATED_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of sales leads in the created status.',
  `ASSIGNED_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of sales leads in the assigned status.',
  `IN_PROCESS_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of sales leads in the in process status.',
  `DEAD_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of sales leads in the dead status.',
  `RECYCLED_QTY` Smallint DEFAULT 0
 COMMENT 'The quantity of sales leads in the recycled status.',
  `QUALIFIED_QTY` Smallint DEFAULT 0
 COMMENT 'The sales lead qualified quantity.',
  `DW_DIMENSION_LOAD_IND` Char(1)
 COMMENT 'This denotes a row has been sucessfully loaded into the dimension.  It implies the fact table load is pending.  Subsequent to the fact table load, the row iwll be hard deleted from the stage table.  This column is only used when a single stage table supports both a fact and dimension table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales lead stage table.'
;

CREATE UNIQUE INDEX `STAGE_SALES_LEAD_PK` ON `STAGE_SALES_LEAD` (`SALES_LEAD_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_SALES_LEAD` ADD  PRIMARY KEY (`SALES_LEAD_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SALES_LEAD_CHANNEL

CREATE TABLE `STAGE_SALES_LEAD_CHANNEL`
(
  `SALES_LEAD_CHANNEL_ID` Varchar(36)
 COMMENT 'The lead channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a lead channel in the source.',
  `SALES_LEAD_CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The lead channel source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SALES_LEAD_CHANNEL_NAME` Varchar(60)
 COMMENT 'The lead channel name.',
  `SALES_LEAD_CHANNEL_DESC` Varchar(255)
 COMMENT 'The lead channel description.',
  `SALES_LEAD_CHANNEL_CAT` Varchar(32)
 COMMENT 'The sales lead channel category.',
  `SALES_LEAD_CHANNEL_CAT_DESC` Varchar(255)
 COMMENT 'The sales lead channel category description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

CREATE UNIQUE INDEX `STAGE_SALES_LEAD_CHANNEL_PK` ON `STAGE_SALES_LEAD_CHANNEL` (`SALES_LEAD_CHANNEL_ID`,`SALES_LEAD_CHANNEL_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SALES_LEAD_TYPE

CREATE TABLE `STAGE_SALES_LEAD_TYPE`
(
  `SALES_LEAD_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The sales lead type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an sales lead type in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SALES_LEAD_TYPE_NAME` Varchar(60)
 COMMENT 'The sales lead type name.',
  `SALES_LEAD_TYPE_DESC` Varchar(255)
 COMMENT 'The sales lead type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales lead stage table.'
;

ALTER TABLE `STAGE_SALES_LEAD_TYPE` ADD  PRIMARY KEY (`SALES_LEAD_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SALES_OPPORTUNITY

CREATE TABLE `STAGE_SALES_OPPORTUNITY`
(
  `SALES_OPPORTUNITY_ID` Varchar(36) NOT NULL
 COMMENT 'The sales opportunity identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales opportunity in the source.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source. In this context, it is used to facilitate updates from PeopleSoft source systems, it should not be displayed.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SALES_OPPORTUNITY_DESC` Varchar(255)
 COMMENT 'The sales opportunity description.',
  `SALES_OPPORTUNITY_LINE_ID` Varchar(36)
 COMMENT 'The sales opportunity line identifer.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_CONTACT_ID` Varchar(36)
 COMMENT 'The customer contact identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer contact in the source.',
  `EMPLOYEE_ID` Varchar(36)
 COMMENT 'The employee (sales representative) identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a sales representative in the source.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `SALES_LEAD_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The sales lead identifier in the source system.  It is a degenerate dimension in the fact table.',
  `CAMPAIGN_WAVE_ID` Varchar(36)
 COMMENT 'The marketing campaign wave identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing campaign wave in the source.',
  `MARKETING_CHANNEL_ID` Varchar(36)
 COMMENT 'The marketing channel identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a marketing channel in the source.',
  `CHANNEL_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system marketing channel SETID.  This column is often used as part of the unique identifer.',
  `UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `QUALIFIED_DATE` Datetime
 COMMENT 'The qualified date.',
  `PROSPECTING_DATE` Datetime
 COMMENT 'The prospecting date.',
  `DECISION_MAKER_ID_DATE` Datetime
 COMMENT 'The decision maker id date.',
  `NEEDS_ANALYSIS_DATE` Datetime
 COMMENT 'The needs analysis date.',
  `VALUE_PROPOSITION_DATE` Datetime
 COMMENT 'The value proposition date.',
  `PERCEPTION_ANALYSIS_DATE` Datetime
 COMMENT 'The perception analysis date.',
  `PRICE_QUOTE_DATE` Datetime
 COMMENT 'The price quote date.',
  `NEGOTIATION_DATE` Datetime
 COMMENT 'The negotiation date.',
  `CLOSED_LOST_DATE` Datetime
 COMMENT 'The closed lost date.',
  `CLOSED_WON_DATE` Datetime
 COMMENT 'The closed won date.',
  `SALES_OPPORTUNITY_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The sales opportunity amount.',
  `CONFIDENCE_SCORE_QTY` Double DEFAULT 0
 COMMENT 'The win confidence score quantity.',
  `PRODUCT_QTY` Smallint DEFAULT 0
 COMMENT 'The product opportunity quantity.',
  `QUALIFIED_QTY` Smallint DEFAULT 0
 COMMENT 'The qualified quantity.  Set to one if the opportunity is in the qualified status.',
  `PROSPECTING_QTY` Smallint DEFAULT 0
 COMMENT 'The prospecting quantity.  Set to one if the opportunity is in the prospecting status.',
  `DECISION_MAKER_ID_QTY` Smallint DEFAULT 0
 COMMENT 'The decision maker id quantity.  Set to one if the opportunity is in the decision maker id status.',
  `NEEDS_ANALYSIS_QTY` Smallint DEFAULT 0
 COMMENT 'The needs analysis quantity.  Set to one if the opportunity is in the needs analysis status.',
  `VALUE_PROPOSITION_QTY` Smallint DEFAULT 0
 COMMENT 'The value proposition quantity.  Set to one if the opportunity is in the value proposition status.',
  `PERCEPTION_ANALYSIS_QTY` Smallint DEFAULT 0
 COMMENT 'The perception analysis quantity.  Set to one if the opportunity is in the perception analysis status.',
  `PRICE_QUOTE_QTY` Smallint DEFAULT 0
 COMMENT 'The price quote quantity.  Set to one if the opportunity is in the price quote status.',
  `NEGOTIATION_QTY` Smallint DEFAULT 0
 COMMENT 'The negotiation quantity.  Set to one if the opportunity is in the negotiation status.',
  `CLOSED_LOST_QTY` Smallint DEFAULT 0
 COMMENT 'The closed lost quantity.  Set to one if the opportunity is in the closed lost status.',
  `CLOSED_WON_QTY` Smallint DEFAULT 0
 COMMENT 'The closed won quantity.  Set to one if the opportunity is in the closed won status.',
  `SALES_OPPORTUNITY_NAME` Varchar(60)
 COMMENT 'The sales opportunity name.',
  `SALES_OPPORTUNITY_TYPE_ID` Varchar(36)
 COMMENT 'The sales opportunity type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a sales opportunity type in the source.',
  `SALES_OPPORTUNITY_TYPE_NAME` Varchar(60)
 COMMENT 'The sales opportunity type name.',
  `SALES_OPPORTUNITY_TYPE_DESC` Varchar(60)
 COMMENT 'The sales opportunity type description.',
  `DW_DIMENSION_LOAD_IND` Char(1)
 COMMENT 'This denotes a row has been sucessfully loaded into the dimension.  It implies the fact table load is pending.  Subsequent to the fact table load, the row iwll be hard deleted from the stage table.  This column is only used when a single stage table supports both a fact and dimension table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The sales opportunity stage table.'
;

CREATE UNIQUE INDEX `STAGE_SALES_OPPORTUNITY_PK` ON `STAGE_SALES_OPPORTUNITY` (`SALES_OPPORTUNITY_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_SALES_OPPORTUNITY` ADD  PRIMARY KEY (`SALES_OPPORTUNITY_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SHIPMENT

CREATE TABLE `STAGE_SHIPMENT`
(
  `SHIPMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The source system shipment identifier.  A degenerate dimension in this context.',
  `SHIPMENT_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The source system shipment line identifier (number).',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `INV_ITEM_ID` Varchar(36)
 COMMENT 'The inventory item identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an inventory item in the source.',
  `INV_ITEM_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system inventory item SETID.  This column is often used as part of the unique identifer.  Not intended for display.',
  `CARRIER_ID` Varchar(36)
 COMMENT 'The carrier identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a carrier in the source.',
  `CUSTOMER_BILL_TO_ID` Varchar(36)
 COMMENT 'The bill to customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bill to customer in the source.',
  `CUSTOMER_SHIP_TO_ID` Varchar(36)
 COMMENT 'The ship to customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a ship to customer in the source.',
  `CUSTOMER_BILL_TO_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system bill to customer SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_SHIP_TO_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system ship to customer SETID.  This column is often used as part of the unique identifer.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a currency in the source.',
  `DEPARTMENT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `WAREHOUSE_ID` Varchar(36)
 COMMENT 'The warehouse identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a warehouse in the source.',
  `VEHICLE_ID` Varchar(36)
 COMMENT 'The shipment vehicle number.  Depending on the method of transport, this may be the number for the aircraft, trailer, rail car, vessel, or barge.',
  `ORDER_ID` Varchar(36)
 COMMENT 'The order (capture) source system identifier.',
  `SHIP_PRIORITY_ID` Varchar(36)
 COMMENT 'The shipment priority identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment priority in the source.',
  `SHIP_ROUTE_ID` Varchar(36)
 COMMENT 'The shipment route identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment route in the source.',
  `SHIP_TYPE_ID` Varchar(36)
 COMMENT 'The shipment type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment type in the source.',
  `BACKORDER_CANCEL_QTY` Double
 COMMENT 'The quantity of back-ordered items that have been cancelled.',
  `SCHEDULED_QTY` Double
 COMMENT 'The quantity of items scheduled for shipment.',
  `SHIPPED_QTY` Double
 COMMENT 'The quantity of items shipped.',
  `BACKORDER_QTY` Double
 COMMENT 'The quantity of items on back-order.',
  `LIST_PRICE_AMT` Double
 COMMENT 'The list price transaction amount.',
  `NET_UNIT_PRICE_AMT` Double
 COMMENT 'The net unit price transaction amount.',
  `SHIP_AMT` Double
 COMMENT 'The ship transaction amount.',
  `SHIP_WEIGHT_QTY` Double
 COMMENT 'The ship weight quantity.',
  `SHIP_VOLUME_QTY` Double
 COMMENT 'The ship volume quantity.',
  `SHIP_UOM_ID` Varchar(36)
 COMMENT 'The shipment unit of measure.',
  `VOLUME_UOM_ID` Varchar(36)
 COMMENT 'The shipment volume unit of measure.',
  `WEIGHT_UOM_ID` Varchar(36)
 COMMENT 'The shipment weight unit of measure.',
  `SHIP_TO_ORDER_DAY_QTY` Double
 COMMENT 'The quantity of days between the order date and the ship date.',
  `SHIP_TO_DEMAND_DAY_QTY` Double
 COMMENT 'The quantity of days between the demand date and the ship date.',
  `DISTANCE_QTY` Double
 COMMENT 'The shipment distance.',
  `DISTANCE_UOM_ID` Varchar(36)
 COMMENT 'The shipment distance unit of measure.',
  `TRAVEL_TIME_QTY` Double
 COMMENT 'The shipment travel time.',
  `TRAVEL_TIME_UOM_ID` Varchar(36)
 COMMENT 'The shipment time unit of measure.',
  `SHIP_LINE_CNT` Double DEFAULT 1
 COMMENT 'The number of shipment lines (used in aggregate queries).',
  `ORDER_CAPTURE_DATE` Datetime
 COMMENT 'The order capture date.',
  `ORIGINAL_SCHEDULE_DATE` Datetime
 COMMENT 'The original schedule date.',
  `SCHEDULE_DATE` Datetime
 COMMENT 'The actual schedule date.',
  `SHIP_EARLY_DATE` Datetime
 COMMENT 'The ship early date.',
  `SHIP_LATE_DATE` Datetime
 COMMENT 'The ship late date.',
  `DEMAND_DATE` Datetime
 COMMENT 'The demand date.',
  `SHIP_DATE` Datetime
 COMMENT 'The ship date.',
  `PICK_DATE` Datetime
 COMMENT 'The date the shipment items were picked from inventory.',
  `PACK_DATE` Datetime
 COMMENT 'The date that the items picked from inventory were packed for shipment.',
  `LOAD_DATE` Datetime
 COMMENT 'The date the items packed for shipment were loaded.',
  `DELIVER_DATE` Datetime
 COMMENT 'The date the item was delivered to the customer.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_DIMENSION_LOAD_IND` Char(1)
 COMMENT 'This denotes a row has been sucessfully loaded into the dimension.  It implies the fact table load is pending.  Subsequent to the fact table load, the row iwll be hard deleted from the stage table.  This column is only used when a single stage table supports both a fact and dimension table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipment stage table maintains shipment line metrics.'
;

ALTER TABLE `STAGE_SHIPMENT` ADD  PRIMARY KEY (`SHIPMENT_ID`,`SHIPMENT_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SHIPMENT_PRIORITY

CREATE TABLE `STAGE_SHIPMENT_PRIORITY`
(
  `SHIP_PRIORITY_ID` Varchar(36) NOT NULL
 COMMENT 'The shipment priority identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment priority in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SHIP_PRIORITY_NAME` Varchar(60)
 COMMENT 'The shipment priority name.',
  `SHIP_PRIORITY_DESC` Varchar(255)
 COMMENT 'The shipment priority description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipmenet priority stage table.'
;

ALTER TABLE `STAGE_SHIPMENT_PRIORITY` ADD  PRIMARY KEY (`SHIP_PRIORITY_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SHIPMENT_ROUTE

CREATE TABLE `STAGE_SHIPMENT_ROUTE`
(
  `SHIP_ROUTE_ID` Varchar(36) NOT NULL
 COMMENT 'The shipment route identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment route in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SHIP_ROUTE_NAME` Varchar(60)
 COMMENT 'The shipment route name.',
  `SHIP_ROUTE_DESC` Varchar(255)
 COMMENT 'The shipment route description.',
  `SHIP_ROUTE_DISTANCE_QTY` Double
 COMMENT 'The route travel distance.',
  `DISTANCE_UOM_ID` Varchar(36)
 COMMENT 'The route travel distance unit of measure',
  `TRAVEL_MINUTE_QTY` Double
 COMMENT 'The route travel time in minutes',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipmenet route stage table.'
;

ALTER TABLE `STAGE_SHIPMENT_ROUTE` ADD  PRIMARY KEY (`SHIP_ROUTE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SHIPMENT_TYPE

CREATE TABLE `STAGE_SHIPMENT_TYPE`
(
  `SHIP_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The shipment type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a shipment type in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SHIP_TYPE_NAME` Varchar(60)
 COMMENT 'The shipment type name.',
  `SHIP_TYPE_DESC` Varchar(255)
 COMMENT 'The shipment type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipment type stage table.'
;

ALTER TABLE `STAGE_SHIPMENT_TYPE` ADD  PRIMARY KEY (`SHIP_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SHIPPING_NOTICE

CREATE TABLE `STAGE_SHIPPING_NOTICE`
(
  `SHIPPING_NOTICE_ID` Varchar(36) NOT NULL
 COMMENT 'The shipping notice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SHIPPING_NOTICE_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The source system shipping notice line identifier (number).',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier identifier in the source system',
  `SUPPLIER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system supplier SETID.  This column is often used as part of the unique identifer.',
  `REQUESTER_ID` Varchar(36)
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `PURCHASER_ID` Varchar(36)
 COMMENT 'The purchaser identifier in the source system',
  `CONTRACT_ID` Varchar(36)
 COMMENT 'The contract identifier in the source system',
  `WAREHOUSE_ID` Varchar(36)
 COMMENT 'The warehouse identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a warehouse in the source.',
  `BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The business unit identifier in the source system.',
  `SHIPPED_UOM_ID` Varchar(36)
 COMMENT 'The shipment unit of measure.',
  `REQUISITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `REQUEST_DATE` Datetime
 COMMENT 'The request date.',
  `REQUISITION_DATE` Datetime
 COMMENT 'The requisition date.',
  `PURCHASE_ORDER_DATE` Datetime
 COMMENT 'The purchase order date.',
  `SHIPPING_NOTICE_DATE` Datetime
 COMMENT 'The shipping notice date.',
  `SHIP_DATE` Datetime
 COMMENT 'The shipped date.',
  `SHIPPED_QTY` Int
 COMMENT 'The quantity of product shipped by the supplier.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The shipping notice stage table maintains information about the products shipped by suppliers (as reported by suppliers).'
;

-- Table STAGE_STATISTICS

CREATE TABLE `STAGE_STATISTICS`
(
  `STATISTICS_ID` Varchar(36) NOT NULL
 COMMENT 'The statistics identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies statistics in the source.',
  `STATISTICS_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The statistics source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Timestamp NULL
 COMMENT 'The effective date.',
  `STATISTICS_NAME` Varchar(60)
 COMMENT 'The statistics name.',
  `STATISTICS_DESC` Varchar(255)
 COMMENT 'The statistics description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The statistics stage table.'
;

ALTER TABLE `STAGE_STATISTICS` ADD  PRIMARY KEY (`STATISTICS_ID`,`STATISTICS_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_STATISTICS` ADD UNIQUE `PK_STAGE_STATISTICS` (`STATISTICS_ID`,`STATISTICS_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SUBLEDGER

CREATE TABLE `STAGE_SUBLEDGER`
(
  `SUBLEDGER_ID` Varchar(36) NOT NULL
 COMMENT 'The subledger identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subledger in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `SUBLEDGER_NAME` Varchar(60)
 COMMENT 'The subledger name.',
  `SUBLEDGER_DESC` Varchar(255)
 COMMENT 'The subledger description.',
  `SUBLEDGER_TYPE_ID` Varchar(36)
 COMMENT 'The subledger type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a subledger type in the source.',
  `SUBLEDGER_TYPE_NAME` Varchar(60)
 COMMENT 'The subledger type name.',
  `SUBLEDGER_TYPE_DESC` Varchar(255)
 COMMENT 'The subledger type description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The subledger stage table.'
;

ALTER TABLE `STAGE_SUBLEDGER` ADD  PRIMARY KEY (`SUBLEDGER_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_SUBLEDGER` ADD UNIQUE `PK_STAGE_SUBLEDGER` (`SUBLEDGER_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_SUPPLIER

CREATE TABLE `STAGE_SUPPLIER`
(
  `SUPPLIER_ID` Varchar(36) NOT NULL
 COMMENT 'The supplier identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a supplier in the source.',
  `SUPPLIER_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `SUPPLIER_NAME` Varchar(60)
 COMMENT 'The supplier name.  If the supplier is a person, the name may be formatted FAMILY NAME, GIVEN NAME.',
  `DUNS_NUMBER` Varchar(32)
 COMMENT 'The Dun & Bradstreet number.',
  `PARENT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The parent Dun & Bradstreet number.',
  `ULT_DUNS_NUMBER` Varchar(32)
 COMMENT 'The ultimate (parent) Dun & Bradstreet number.',
  `ALT_SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier alternate identifier.',
  `SINCE_DATE` Timestamp NULL
 COMMENT 'The date the entity became a supplier.',
  `ADD_DATE` Timestamp NULL
 COMMENT 'The date the supplier was added to the source system.',
  `SUPPLIER_STATUS_CODE` Varchar(1)
 COMMENT 'The supplier status code.',
  `SUPPLIER_STATUS_NAME` Varchar(60)
 COMMENT 'The supplier status name.',
  `SUPPLIER_STATUS_DESC` Varchar(255)
 COMMENT 'The supplier status description.',
  `SUPPLIER_STATUS_DATE` Timestamp NULL
 COMMENT 'The supplier status date.',
  `GEO_CODE` Varchar(32)
 COMMENT 'The geographical code.',
  `IN_CITY_LIMIT_IND` Varchar(1)
 COMMENT 'This denotes if a suppliers is physically located within the city.',
  `TIMEZONE_NAME` Varchar(32)
 COMMENT 'The timezone name.',
  `LATITUDE` Decimal(7,4)
 COMMENT 'The latitude of the supplier.',
  `LONGITUDE` Decimal(7,4)
 COMMENT 'The longitude of the supplier.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `STATE_PROVINCE_CODE` Varchar(3)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `SUPER_NATIONAL_NAME` Varchar(60)
 COMMENT 'The super national name.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `EMAIL_DOMAIN_DESC` Varchar(255)
 COMMENT 'The email domain.',
  `EMAIL_ADDRESS_DESC` Varchar(255)
 COMMENT 'The email address.',
  `PHONE_COUNTRY_CODE` Varchar(3)
 COMMENT 'The telephone country code.',
  `PHONE_REGION_CODE` Varchar(3)
 COMMENT 'The phone region, area, or city code.',
  `PHONE_NUMBER` Varchar(32)
 COMMENT 'The telephone number.',
  `PHONE_EXTENSION_NUMBER` Varchar(6)
 COMMENT 'The telephone extension number.',
  `SUPPLIER_TYPE_ID` Varchar(36)
 COMMENT 'The supplier type identifier.',
  `SUPPLIER_TYPE_CODE` Varchar(32)
 COMMENT 'The supplier type code.',
  `SUPPLIER_TYPE_NAME` Varchar(60)
 COMMENT 'The supplier type name.',
  `SUPPLIER_TYPE_DESC` Varchar(255)
 COMMENT 'The supplier type description.',
  `SUPPLIER_GROUP_CODE` Varchar(32)
 COMMENT 'The supplier group code.',
  `SUPPLIER_GROUP_NAME` Varchar(60)
 COMMENT 'The supplier group name.',
  `SUPPLIER_GROUP_DESC` Varchar(255)
 COMMENT 'The supplier group description.',
  `SUPPLIER_CLASS_CODE` Varchar(32)
 COMMENT 'The supplier classification code.',
  `SUPPLIER_CLASS_NAME` Varchar(60)
 COMMENT 'The supplier classification name.',
  `SUPPLIER_CLASS_DESC` Varchar(255)
 COMMENT 'The supplier classification description.',
  `PARENT_SUPPLIER_ID` Varchar(36)
 COMMENT 'The parent supplier identifier in the source system.',
  `PARENT_SUPPLIER_NAME` Varchar(60)
 COMMENT 'The parent supplier name.',
  `LEVEL_NUMBER` Double
 COMMENT 'The level number of the supplier in the supplier hierarchy.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The supplier dimension.'
;

ALTER TABLE `STAGE_SUPPLIER` ADD  PRIMARY KEY (`SUPPLIER_ID`,`SUPPLIER_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_SUPPLIER` ADD UNIQUE `PK_STAGE_SUPPLIER` (`SUPPLIER_ID`,`SUPPLIER_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_TIME_REPORT_CODE

CREATE TABLE `STAGE_TIME_REPORT_CODE`
(
  `TIME_REPORT_CODE_ID` Varchar(36) NOT NULL
 COMMENT 'The time report code identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a time report code in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `EFFECTIVE_STATUS_DATE` Timestamp NULL
 COMMENT 'The effective status date.',
  `TIME_REPORT_CODE` Varchar(36)
 COMMENT 'The time report code.',
  `EFFECTIVE_STATUS_CODE` Varchar(32)
 COMMENT 'The effective status code.',
  `TIME_REPORT_CODE_NAME` Varchar(60)
 COMMENT 'The time report code name.',
  `TIME_REPORT_CODE_DESC` Varchar(255)
 COMMENT 'The time report code description.',
  `TIME_REPORT_CODE_TYPE_CODE` Varchar(36)
 COMMENT 'The time report code type code.',
  `TIME_REPORT_CODE_TYPE_NAME` Varchar(60)
 COMMENT 'The time report code type name.',
  `TIME_REPORT_CODE_TYPE_DESC` Varchar(255)
 COMMENT 'The time report code type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The time report stage table.'
;

ALTER TABLE `STAGE_TIME_REPORT_CODE` ADD  PRIMARY KEY (`TIME_REPORT_CODE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_TRANSACTION_STATUS

CREATE TABLE `STAGE_TRANSACTION_STATUS`
(
  `TRXN_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The transaction status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction status in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `TRXN_STATUS_NAME` Varchar(60)
 COMMENT 'The transaction status name.',
  `TRXN_STATUS_DESC` Varchar(255)
 COMMENT 'The transaction status description.',
  `TRXN_STATUS_CATEGORY` Varchar(60)
 COMMENT 'The transaction status category.',
  `TRXN_STATUS_CATEGORY_NAME` Varchar(60)
 COMMENT 'The transaction status category name.',
  `TRXN_STATUS_CATEGORY_DESC` Varchar(255)
 COMMENT 'The transaction status category description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
;

ALTER TABLE `STAGE_TRANSACTION_STATUS` ADD  PRIMARY KEY (`TRXN_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_TRANSACTION_STATUS` ADD UNIQUE `PK_STAGE_TRANSACTION_STATUS` (`TRXN_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_TRANSACTION_TYPE

CREATE TABLE `STAGE_TRANSACTION_TYPE`
(
  `TRXN_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The transaction type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction type in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `TRXN_TYPE_NAME` Varchar(60)
 COMMENT 'The transaction type name.',
  `TRXN_TYPE_DESC` Varchar(255)
 COMMENT 'The transaction type description.',
  `TRXN_TYPE_CATEGORY` Varchar(60)
 COMMENT 'The transaction type category.',
  `TRXN_TYPE_CATEGORY_NAME` Varchar(60)
 COMMENT 'The transaction type category name.',
  `TRXN_TYPE_CATEGORY_DESC` Varchar(255)
 COMMENT 'The transaction type category description.',
  `TRXN_TYPE_OBJECT_NAME` Varchar(60)
 COMMENT 'The transaction type object name.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The transaction type stage table.'
;

ALTER TABLE `STAGE_TRANSACTION_TYPE` ADD  PRIMARY KEY (`TRXN_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_UNIT_OF_MEASURE

CREATE TABLE `STAGE_UNIT_OF_MEASURE`
(
  `UNIT_OF_MEASURE_ID` Varchar(36) NOT NULL
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a unit of measure in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `UNIT_OF_MEASURE_NAME` Varchar(60)
 COMMENT 'The unit of measure name.',
  `UNIT_OF_MEASURE_DESC` Varchar(255)
 COMMENT 'The unit of measure description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The unit of measure stage dimension.'
;

CREATE UNIQUE INDEX `STAGE_UNIT_OF_MEASURE_PK` ON `STAGE_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_UNIT_OF_MEASURE` ADD  PRIMARY KEY (`UNIT_OF_MEASURE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_UNIT_OF_MEASURE` ADD UNIQUE `PK_STAGE_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WAREHOUSE

CREATE TABLE `STAGE_WAREHOUSE`
(
  `WAREHOUSE_ID` Varchar(36) NOT NULL
 COMMENT 'The warehouse identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a warehouse in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WAREHOUSE_NAME` Varchar(60)
 COMMENT 'The warehouse name.',
  `WAREHOUSE_DESC` Varchar(255)
 COMMENT 'The warehouse description.',
  `WAREHOUSE_STATUS_CODE` Varchar(1)
 COMMENT 'The warehouse status code.',
  `WAREHOUSE_STATUS_NAME` Varchar(60)
 COMMENT 'The warehouse status name.',
  `WAREHOUSE_STATUS_DESC` Varchar(255)
 COMMENT 'The warehouse status description.',
  `WAREHOUSE_STATUS_DATE` Timestamp NULL
 COMMENT 'The warehouse status date.',
  `WAREHOUSE_OWNERSHIP_IND` Varchar(32)
 COMMENT 'The warehouse ownership code.',
  `WAREHOUSE_OWNERSHIP_NAME` Varchar(60)
 COMMENT 'The warehouse ownership name.',
  `WAREHOUSE_OWNERSHIP_DESC` Varchar(255)
 COMMENT 'The warehouse ownership description.',
  `WAREHOUSE_TYPE_CODE` Varchar(32)
 COMMENT 'The warehouse type code.',
  `WAREHOUSE_TYPE_NAME` Varchar(60)
 COMMENT 'The warehouse type name.',
  `WAREHOUSE_TYPE_DESC` Varchar(255)
 COMMENT 'The warehouse type description.',
  `CLIMATE_CONTROL_IND` Varchar(1)
 COMMENT 'This denotes if a warehouse has climate control capabilities.',
  `GEO_CODE` Varchar(32)
 COMMENT 'The geographical code.',
  `IN_CITY_LIMIT_IND` Varchar(1)
 COMMENT 'This denotes if a warehouses is physically located within the city.',
  `TIMEZONE_NAME` Varchar(32)
 COMMENT 'The timezone name.',
  `LATITUDE` Decimal(25,20)
 COMMENT 'The latitude of the warehouse.',
  `LONGITUDE` Decimal(10,7)
 COMMENT 'The longitude of the warehouse.',
  `ADDRESS_LINE1_DESC` Varchar(255)
 COMMENT 'The first line of the address.',
  `ADDRESS_LINE2_DESC` Varchar(255)
 COMMENT 'The second line of the address.',
  `ADDRESS_LINE3_DESC` Varchar(255)
 COMMENT 'The third line of the address.',
  `ADDRESS_LINE4_DESC` Varchar(255)
 COMMENT 'The fourth line of the address.',
  `CITY_NAME` Varchar(60)
 COMMENT 'The city name.',
  `COUNTY_NAME` Varchar(60)
 COMMENT 'The county name.',
  `POSTAL_CODE` Varchar(32)
 COMMENT 'The postal code.',
  `STATE_PROVINCE_CODE` Varchar(3)
 COMMENT 'The state or province code.',
  `STATE_PROVINCE_NAME` Varchar(60)
 COMMENT 'The state or province name.',
  `COUNTRY_CODE` Varchar(3)
 COMMENT 'The country code.',
  `COUNTRY_NAME` Varchar(60)
 COMMENT 'The country name.',
  `SUPER_NATIONAL_NAME` Varchar(60)
 COMMENT 'The super national name, i.e., European Union.',
  `CONTINENT_NAME` Varchar(60)
 COMMENT 'The continent name.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The warehouse stage table.'
;

ALTER TABLE `STAGE_WAREHOUSE` ADD  PRIMARY KEY (`WAREHOUSE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WAREHOUSE_RECEIPT

CREATE TABLE `STAGE_WAREHOUSE_RECEIPT`
(
  `WAREHOUSE_RECEIPT_ID` Varchar(36) NOT NULL
 COMMENT 'The shipping notice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `WAREHOUSE_RECEIPT_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The source system shipping notice line identifier (number).',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier identifier in the source system',
  `SUPPLIER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system supplier SETID.  This column is often used as part of the unique identifer.',
  `REQUESTER_ID` Varchar(36)
 COMMENT 'The requestor surrogate key.  This relates to the person dimension.',
  `PURCHASER_ID` Varchar(36)
 COMMENT 'The purchaser identifier in the source system',
  `RECEIVER_ID` Varchar(36)
 COMMENT 'The receiver identifier in the source system',
  `CONTRACT_ID` Varchar(36)
 COMMENT 'The contract identifier in the source system',
  `WAREHOUSE_ID` Varchar(36)
 COMMENT 'The warehouse identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a warehouse in the source.',
  `BUSINESS_UNIT_ID` Varchar(36)
 COMMENT 'The business unit identifier in the source system.',
  `RECEIVED_UOM_ID` Varchar(36)
 COMMENT 'The received unit of measure.',
  `REQUISITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SHIPPING_NOTICE_ID` Varchar(36)
 COMMENT 'The warehouse receipt identifier in the source system.',
  `REQUEST_DATE` Datetime
 COMMENT 'The request date.',
  `REQUISITION_DATE` Datetime
 COMMENT 'The requisition date.',
  `PURCHASE_ORDER_DATE` Datetime
 COMMENT 'The purchase order date.',
  `SHIPPING_NOTICE_DATE` Datetime
 COMMENT 'The shipping notice date.',
  `WAREHOUSE_RECEIPT_DATE` Datetime
 COMMENT 'The shipping notice date.',
  `SHIP_DATE` Datetime
 COMMENT 'The shipped date.',
  `RECEIVED_QTY` Int
 COMMENT 'The quantity of product received by the warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The warehouse receipt stage table.'
;

ALTER TABLE `STAGE_WAREHOUSE_RECEIPT` ADD  PRIMARY KEY (`WAREHOUSE_RECEIPT_ID`,`WAREHOUSE_RECEIPT_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WEB_BOT_LIST

CREATE TABLE `STAGE_WEB_BOT_LIST`
(
  `IP_ADDRESS_DESC` Varchar(255) NOT NULL
 COMMENT 'The IP address description.',
  `BOT_NAME` Varchar(60) DEFAULT 'Unknown'
 COMMENT 'The BOT name.',
  `BOT_SOURCE_DESC` Varchar(255)
 COMMENT 'The BOT source description.',
  `BOT_REVIEWED_IND` Char(1) DEFAULT 'N'
 COMMENT 'This indicates if a BOT has been reviewed.  The default value for suspect BOTs is N.',
  `HOSTED_CLIENT_SK` Double DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'This stage table maintains a list of BOTs by IP address.'
;

ALTER TABLE `STAGE_WEB_BOT_LIST` ADD  PRIMARY KEY (`IP_ADDRESS_DESC`)
;

ALTER TABLE `STAGE_WEB_BOT_LIST` ADD UNIQUE `PK_STAGE_WEB_BOT_LIST` (`IP_ADDRESS_DESC`)
;

-- Table STAGE_WEB_REQUEST

CREATE TABLE `STAGE_WEB_REQUEST`
(
  `IP_ADDRESS_DESC` Varchar(2000)
 COMMENT 'The IP address description, e.g., 192.168.0.100.',
  `LONG_IP_NUMBER` Int
 COMMENT 'The long IP address.',
  `SOURCE_SYSTEM_ID` Int DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `REQUEST_DATE` Timestamp NULL
 COMMENT 'The web page request date.',
  `REQUEST_DATE_SK` Double
 COMMENT 'The page request date surrogate key, fomat YYYYMMDD.',
  `REQUEST_TIME_ID` Varchar(32)
 COMMENT 'The web server request time identifier - format HH24MI, e.g., 2109.',
  `COOKIE_DESC` Varchar(2000) DEFAULT null
 COMMENT 'The web cookie.',
  `WEB_VISITOR_LOGIN_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The web visitor login name (rarely used).',
  `WEB_VISITOR_FULL_NAME` Varchar(60) DEFAULT 'demo'
 COMMENT 'The web visitor full name (rarely used).',
  `WEB_FILE_NAME` Varchar(4000)
 COMMENT 'The web file name (e.g., /etl_maps.html).',
  `REQUEST_CAT` Varchar(32)
 COMMENT 'The web server request type (e.g., GET).',
  `HTTP_VERSION_DESC` Varchar(255)
 COMMENT 'The HTTP version name, e.g., HTTP/1.1.',
  `SERVER_STATUS_CODE` Varchar(32)
 COMMENT 'The web server status code, e.g., 404, 401, 200, 304, etc.',
  `WEB_FILE_BYTE_QTY` Double DEFAULT 0
 COMMENT 'The web file byte quantity.',
  `REFERER_URL_DESC` Varchar(4000)
 COMMENT 'The referer URL description.',
  `WEB_BROWSER_OS_DESC` Varchar(2000)
 COMMENT 'The web browser operating system description.',
  `GMT_OFFSET_CAT` Varchar(32)
 COMMENT 'The GMT offset category, e.g., -0700.',
  `MINUTE_QTY` Decimal(2,0)
 COMMENT 'The minute value from the request time.',
  `HOUR_24_QTY` Decimal(2,0)
 COMMENT 'The hour value from the request time.',
  `ROBOT_PAGE_VIEW_QTY` Double DEFAULT 0
 COMMENT 'The robot/crawler/spider view quantity.',
  `SCREEN_SIZE_CAT` Varchar(32)
 COMMENT 'The screen cateogry size.    This is only populated by the page tagger.',
  `SCREEN_PIXEL_DEPTH_QTY` Double
 COMMENT 'The screen pixel depth quantity.  This is only populated by the page tagger.',
  `SCREEN_COLOR_DEPTH_QTY` Double
 COMMENT 'The screen color depth quantity.  This is only populated by the page tagger.',
  `JAVA_ENABLED_IND` Varchar(1)
 COMMENT 'This indicator denotes if a client has java enabled.    This is only populated by the page tagger.',
  `URL_PARAMS_DESC` Varchar(4000)
 COMMENT 'The URL parameters description.  It is parsed from the full url request (characters that follow the ?).',
  `CLIENT_PAGE_LOAD_TIMESTAMP` Varchar(255)
 COMMENT 'This is the timstamp that a client loaded a page.  This is only populated by the page tagger.',
  `CLIENT_PAGE_UNLOAD_TIMESTAMP` Varchar(255)
 COMMENT 'This is the timstamp that a client unloaded a page.  This is only populated by the page tagger.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  This column relates to the hosted client stage table.  The default value is -1, this hides the data from the demo server.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT SYSDATE
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The web server request stage table.  This table maintains relatively raw data from the web server log.'
;

CREATE INDEX `STG_WEB_SERVER_REQUEST_IDX` ON `STAGE_WEB_REQUEST` (`LONG_IP_NUMBER`)
;

-- Table STAGE_WEB_VISITOR

CREATE TABLE `STAGE_WEB_VISITOR`
(
  `WEB_VISITOR_FULL_NAME` Varchar(60) NOT NULL DEFAULT 'demo'
 COMMENT 'The web visitor full name (rarely used).',
  `LONG_IP_NUMBER` Int NOT NULL
 COMMENT 'The long IP address.',
  `HOSTED_CLIENT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WEB_VISITOR_LOGIN_NAME` Varchar(60) DEFAULT 'Missing'
 COMMENT 'The web visitor login name (rarely used).',
  `WEB_BROWSER_OS_DESC` Varchar(255)
 COMMENT 'The web browser operating system description.',
  `IP_ADDRESS_DESC` Varchar(2000)
 COMMENT 'The IP address description.',
  `COOKIE_DESC` Varchar(2000)
 COMMENT 'The cookie description.',
  `DW_ERROR_IND` Char(1)
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The web visitor stage table.  This table is staged from the web server file.  The only purpose is to lower the query cost of loading a subsequent dimension table.'
;

ALTER TABLE `STAGE_WEB_VISITOR` ADD  PRIMARY KEY (`WEB_VISITOR_FULL_NAME`,`LONG_IP_NUMBER`,`HOSTED_CLIENT_SK`)
;

ALTER TABLE `STAGE_WEB_VISITOR` ADD UNIQUE `PK_STAGE_WEB_VISITOR` (`WEB_VISITOR_FULL_NAME`,`LONG_IP_NUMBER`,`HOSTED_CLIENT_SK`)
;

-- Table STAGE_WORK_ORDER

CREATE TABLE `STAGE_WORK_ORDER`
(
  `WORK_ORDER_ID` Varchar(36) NOT NULL
 COMMENT 'The work order identifier in the source system.',
  `WORK_ORDER_LINE_ID` Varchar(36) NOT NULL DEFAULT '1'
 COMMENT 'The work order line identifier in the source system.',
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a busines unit in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `COMPANY_ID` Varchar(36)
 COMMENT 'The company identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a company in the source.',
  `WORK_ORDER_STATUS_ID` Varchar(36)
 COMMENT 'The work order status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a work order status in the source.',
  `SUPERVISOR_ID` Varchar(36)
 COMMENT 'The work order supervisor identifier in the source system.',
  `PLANNER_ID` Varchar(36)
 COMMENT 'The work order planner identifier in the source system.',
  `ORIGINATOR_ID` Varchar(36)
 COMMENT 'The work order originator identifier in the source system.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `ORDER_TYPE_ID` Varchar(36)
 COMMENT 'The order type identifier in the source system.',
  `RELATED_ORDER_TYPE_ID` Varchar(36)
 COMMENT 'The related order type identifier in the source system.',
  `WORK_ORDER_TYPE_ID` Varchar(36)
 COMMENT 'The work order type identifier in the source system.',
  `WORK_ORDER_VARIANCE_ID` Varchar(36)
 COMMENT 'The work order variance identifier in the source system.',
  `WORK_ORDER_PHASE_ID` Varchar(36)
 COMMENT 'The work order phase identifier in the source system.',
  `WORK_ORDER_CATEGORY1_ID` Varchar(36)
 COMMENT 'The work order category1 identifier in the source system.',
  `WORK_ORDER_CATEGORY2_ID` Varchar(36)
 COMMENT 'The work order category2 identifier in the source system.',
  `WORK_ORDER_UOM_ID` Varchar(36)
 COMMENT 'The work order unit of measure identifier in the source system.',
  `WORK_ORDER_DATE` Datetime
 COMMENT 'The work order date.',
  `WORK_ORDER_ORDER_DATE` Datetime
 COMMENT 'The work order ordered date.',
  `WORK_ORDER_ASSIGN_DATE` Datetime
 COMMENT 'The work order assigned date.',
  `WORK_ORDER_START_DATE` Datetime
 COMMENT 'The work order start date.',
  `WORK_ORDER_COMPLETE_DATE` Datetime
 COMMENT 'The work order completed date.',
  `SCRAPPED_PRIMARY_QTY` Int
 COMMENT 'The scrapped primary quantity.',
  `SHIPPED_PRIMARY_QTY` Int
 COMMENT 'The shipped primary quantity.',
  `ORDERED_PRIMARY_QTY` Int
 COMMENT 'The ordered primary quantity.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order stage table.'
;

ALTER TABLE `STAGE_WORK_ORDER` ADD  PRIMARY KEY (`WORK_ORDER_ID`,`WORK_ORDER_LINE_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER` ADD UNIQUE `PK_STAGE_WORK_ORDER` (`WORK_ORDER_ID`,`WORK_ORDER_LINE_ID`,`BUSINESS_UNIT_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WORK_ORDER_CATEGORY

CREATE TABLE `STAGE_WORK_ORDER_CATEGORY`
(
  `WORK_ORDER_CATEGORY_ID` Varchar(36) NOT NULL
 COMMENT 'The work order category identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order category in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Geometrycollection DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WORK_ORDER_CATEGORY_DESC` Varchar(255)
 COMMENT 'The work order category description.',
  `WORK_ORDER_CATEGORY_NAME` Varchar(60)
 COMMENT 'The work order category name.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order category stage table.'
;

CREATE UNIQUE INDEX `STAGE_WO_CATEGORY_PK` ON `STAGE_WORK_ORDER_CATEGORY` (`WORK_ORDER_CATEGORY_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_CATEGORY` ADD  PRIMARY KEY (`WORK_ORDER_CATEGORY_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_CATEGORY` ADD UNIQUE `PK_STAGE_WORK_ORDER_CATEGORY` (`WORK_ORDER_CATEGORY_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WORK_ORDER_PHASE

CREATE TABLE `STAGE_WORK_ORDER_PHASE`
(
  `WORK_ORDER_PHASE_ID` Varchar(36) NOT NULL
 COMMENT 'The work order phase identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order phase in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `WORK_ORDER_PHASE_NAME` Varchar(60)
 COMMENT 'The work order phase name.',
  `WORK_ORDER_PHASE_DESC` Varchar(255)
 COMMENT 'The work order phase description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order phase stage table.'
;

CREATE UNIQUE INDEX `STAGE_WO_PHASE_PK` ON `STAGE_WORK_ORDER_PHASE` (`WORK_ORDER_PHASE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_PHASE` ADD  PRIMARY KEY (`WORK_ORDER_PHASE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_PHASE` ADD UNIQUE `PK_STAGE_WORK_ORDER_PHASE` (`WORK_ORDER_PHASE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WORK_ORDER_STATUS

CREATE TABLE `STAGE_WORK_ORDER_STATUS`
(
  `WORK_ORDER_STATUS_ID` Varchar(36) NOT NULL
 COMMENT 'The work order status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order status in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WORK_ORDER_STATUS_NAME` Varchar(60)
 COMMENT 'The work order status name.',
  `WORK_ORDER_STATUS_DESC` Varchar(255)
 COMMENT 'The work order status description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order status stage table.'
;

CREATE UNIQUE INDEX `STAGE_WO_STATUS_PK` ON `STAGE_WORK_ORDER_STATUS` (`WORK_ORDER_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_STATUS` ADD  PRIMARY KEY (`WORK_ORDER_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_STATUS` ADD UNIQUE `PK_STAGE_WORK_ORDER_STATUS` (`WORK_ORDER_STATUS_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WORK_ORDER_TYPE

CREATE TABLE `STAGE_WORK_ORDER_TYPE`
(
  `WORK_ORDER_TYPE_ID` Varchar(36) NOT NULL
 COMMENT 'The work order type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order type in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WORK_ORDER_TYPE_NAME` Varchar(60)
 COMMENT 'The work order type name.',
  `WORK_ORDER_TYPE_DESC` Varchar(255)
 COMMENT 'The work order type description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order type stage table.'
;

CREATE UNIQUE INDEX `STAGE_WO_TYPE_PK` ON `STAGE_WORK_ORDER_TYPE` (`WORK_ORDER_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_TYPE` ADD  PRIMARY KEY (`WORK_ORDER_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_TYPE` ADD UNIQUE `PK_STAGE_WORK_ORDER_TYPE` (`WORK_ORDER_TYPE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_WORK_ORDER_VARIANCE

CREATE TABLE `STAGE_WORK_ORDER_VARIANCE`
(
  `WORK_ORDER_VARIANCE_ID` Varchar(36) NOT NULL
 COMMENT 'The work order variance identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an work order variance in the source.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WORK_ORDER_VARIANCE_NAME` Varchar(60)
 COMMENT 'The work order variance name.',
  `WORK_ORDER_VARIANCE_DESC` Varchar(255)
 COMMENT 'The work order variance description.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The work order variance stage table.'
;

CREATE UNIQUE INDEX `STAGE_WO_VARIANCE_PK` ON `STAGE_WORK_ORDER_VARIANCE` (`WORK_ORDER_VARIANCE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_VARIANCE` ADD  PRIMARY KEY (`WORK_ORDER_VARIANCE_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_WORK_ORDER_VARIANCE` ADD UNIQUE `PK_STAGE_WORK_ORDER_VARIANCE` (`WORK_ORDER_VARIANCE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table TREE_ACCOUNT

CREATE TABLE `TREE_ACCOUNT`
(
  `ACCOUNT_TREE_SK` Int NOT NULL
 COMMENT 'The account tree surrogate key.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT "0"
 COMMENT 'The account surrogate key.  This key should be loaded from a database sequence or be defined as an identity column.',
  `HIERARCHY_TYPE_NAME` Varchar(60) NOT NULL DEFAULT "ACCOUNT"
 COMMENT 'The type of hierarcy.',
  `ACCOUNT_ID` Varchar(36) NOT NULL DEFAULT "0"
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) NOT NULL DEFAULT "SHARE"
 COMMENT 'The source system account SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `ACCOUNT_NAME` Varchar(60)
 COMMENT 'The account name.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The effective date.',
  `ACCOUNT_0_SK` Int
 COMMENT 'The account level 0 surrogate key',
  `ACCOUNT_0_ID` Varchar(36)
 COMMENT 'The account level 0 identifier in the source system.',
  `ACCOUNT_0_NAME` Varchar(60)
 COMMENT 'The account level 0 name.',
  `ACCOUNT_1_SK` Int
 COMMENT 'The account level 1 surrogate key',
  `ACCOUNT_1_ID` Varchar(36)
 COMMENT 'The account level 1 identifier in the source system.',
  `ACCOUNT_1_NAME` Varchar(60)
 COMMENT 'The account level 1 name.',
  `ACCOUNT_LEVEL1_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 1 identifier in the source system hierarchy.  This is the top or root level.',
  `ACCOUNT_LEVEL1_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 1 name in the source system hierarchy.  This is the top or root level.',
  `ACCOUNT_2_SK` Int
 COMMENT 'The account level 2 surrogate key',
  `ACCOUNT_2_ID` Varchar(36)
 COMMENT 'The account level 2 identifier in the source system.',
  `ACCOUNT_2_NAME` Varchar(60)
 COMMENT 'The account level 2 name.',
  `ACCOUNT_LEVEL2_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 2 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL2_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 2 name in the source system hierarchy.',
  `ACCOUNT_3_SK` Int
 COMMENT 'The account level 3 surrogate key',
  `ACCOUNT_3_ID` Varchar(36)
 COMMENT 'The account level 3 identifier in the source system.',
  `ACCOUNT_3_NAME` Varchar(60)
 COMMENT 'The account level 3 name.',
  `ACCOUNT_LEVEL3_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 3 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL3_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 3 name in the source system hierarchy.',
  `ACCOUNT_4_SK` Int
 COMMENT 'The account level 4 surrogate key',
  `ACCOUNT_4_ID` Varchar(36)
 COMMENT 'The account level 4 identifier in the source system.',
  `ACCOUNT_4_NAME` Varchar(60)
 COMMENT 'The account level 4 name.',
  `ACCOUNT_LEVEL4_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 4 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL4_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 4 name in the source system hierarchy.',
  `ACCOUNT_5_SK` Int
 COMMENT 'The account level 5 surrogate key',
  `ACCOUNT_5_ID` Varchar(36)
 COMMENT 'The account level 5 identifier in the source system.',
  `ACCOUNT_5_NAME` Varchar(60)
 COMMENT 'The account level 5 name.',
  `ACCOUNT_LEVEL5_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 5 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL5_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 5 name in the source system hierarchy.',
  `ACCOUNT_6_SK` Int
 COMMENT 'The account level 6 surrogate key',
  `ACCOUNT_6_ID` Varchar(36)
 COMMENT 'The account level 6 identifier in the source system.',
  `ACCOUNT_6_NAME` Varchar(60)
 COMMENT 'The account level 6 name.',
  `ACCOUNT_7_SK` Int
 COMMENT 'The account level 7 surrogate key',
  `ACCOUNT_7_ID` Varchar(36)
 COMMENT 'The account level 7 identifier in the source system.',
  `ACCOUNT_7_NAME` Varchar(60)
 COMMENT 'The account level 7 name.',
  `ACCOUNT_8_SK` Int
 COMMENT 'The account level 8 surrogate key',
  `ACCOUNT_8_ID` Varchar(36)
 COMMENT 'The account level 8 identifier in the source system.',
  `ACCOUNT_8_NAME` Varchar(60)
 COMMENT 'The account level 8 name.',
  `ACCOUNT_9_SK` Int
 COMMENT 'The account level 9 surrogate key',
  `ACCOUNT_9_ID` Varchar(36)
 COMMENT 'The account level 9 identifier in the source system.',
  `ACCOUNT_9_NAME` Varchar(60)
 COMMENT 'The account level 9 name.',
  `ACCOUNT_10_SK` Int
 COMMENT 'The account level 10 surrogate key',
  `ACCOUNT_10_ID` Varchar(36)
 COMMENT 'The account level 10 identifier in the source system.',
  `ACCOUNT_10_NAME` Varchar(60)
 COMMENT 'The account level 10 name.',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '01-JAN-1900'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '31-DEC-2199'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT SYSDATE
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account finance hierarchy tree.'
;

CREATE UNIQUE INDEX `TREE_ACCOUNT_PK` ON `TREE_ACCOUNT` (`ACCOUNT_TREE_SK`)
;

CREATE UNIQUE INDEX `TREE_ACCOUNT_AK` USING BTREE ON `TREE_ACCOUNT` (`ACCOUNT_ID`,`HIERARCHY_TYPE_NAME`,`ACCOUNT_SETID`,`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `DIMENSION_ACCOUNT_AK` USING BTREE ON `TREE_ACCOUNT` (`ACCOUNT_ID`,`ACCOUNT_SETID`,`HIERARCHY_TYPE_NAME`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `TREE_ACCOUNT` ADD  PRIMARY KEY (`ACCOUNT_TREE_SK`)
;

ALTER TABLE `TREE_ACCOUNT` ADD UNIQUE `PK_TREE_ACCOUNT` (`ACCOUNT_TREE_SK`)
;

-- Table TREE_BUSINESS_UNIT

CREATE TABLE `TREE_BUSINESS_UNIT`
(
  `BUSINESS_UNIT_TREE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit tree surrogate key.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit level 0 surrogate key',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `BUSINESS_UNIT_0_ID` Varchar(36)
 COMMENT 'The business unit level 0 identifier in the source system.',
  `BUSINESS_UNIT_1_ID` Varchar(36)
 COMMENT 'The business unit level 1 identifier in the source system.',
  `BUSINESS_UNIT_2_ID` Varchar(36)
 COMMENT 'The business unit level 2 identifier in the source system.',
  `BUSINESS_UNIT_3_ID` Varchar(36)
 COMMENT 'The business unit level 3 identifier in the source system.',
  `BUSINESS_UNIT_4_ID` Varchar(36)
 COMMENT 'The business unit level 4 identifier in the source system.',
  `BUSINESS_UNIT_5_ID` Varchar(36)
 COMMENT 'The business unit level 5 identifier in the source system.',
  `BUSINESS_UNIT_6_ID` Varchar(36)
 COMMENT 'The business unit level 6 identifier in the source system.',
  `BUSINESS_UNIT_7_ID` Varchar(36)
 COMMENT 'The business unit level 7 identifier in the source system.',
  `BUSINESS_UNIT_8_ID` Varchar(36)
 COMMENT 'The business unit level 8 identifier in the source system.',
  `BUSINESS_UNIT_9_ID` Varchar(36)
 COMMENT 'The business unit level 9 identifier in the source system.',
  `BUSINESS_UNIT_10_ID` Varchar(36)
 COMMENT 'The business unit level 10 identifier in the source system.',
  `BUSINESS_UNIT_0_NAME` Varchar(60)
 COMMENT 'The business unit level 0 name.',
  `BUSINESS_UNIT_1_NAME` Varchar(60)
 COMMENT 'The business unit level 1 name.',
  `BUSINESS_UNIT_2_NAME` Varchar(60)
 COMMENT 'The business unit level 2 name.',
  `BUSINESS_UNIT_3_NAME` Varchar(60)
 COMMENT 'The business unit level 3 name.',
  `BUSINESS_UNIT_4_NAME` Varchar(60)
 COMMENT 'The business unit level 4 name.',
  `BUSINESS_UNIT_5_NAME` Varchar(60)
 COMMENT 'The business unit level 5 name.',
  `BUSINESS_UNIT_6_NAME` Varchar(60)
 COMMENT 'The business unit level 6 name.',
  `BUSINESS_UNIT_7_NAME` Varchar(60)
 COMMENT 'The business unit level 7 name.',
  `BUSINESS_UNIT_8_NAME` Varchar(60)
 COMMENT 'The business unit level 8 name.',
  `BUSINESS_UNIT_9_NAME` Varchar(60)
 COMMENT 'The business unit level 9 name.',
  `BUSINESS_UNIT_10_NAME` Varchar(60)
 COMMENT 'The business unit level 10 name.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The business unit tree table.'
;

ALTER TABLE `TREE_BUSINESS_UNIT` ADD  PRIMARY KEY (`BUSINESS_UNIT_TREE_SK`)
;

-- Table TREE_PERSON

CREATE TABLE `TREE_PERSON`
(
  `PERSON_TREE_SK` Int NOT NULL
 COMMENT 'The person tree surrogate key.',
  `PERSON_0_SK` Int
 COMMENT 'The person level 0 surrogate key',
  `PERSON_1_SK` Int
 COMMENT 'The person level 1 surrogate key',
  `PERSON_2_SK` Int
 COMMENT 'The person level 2 surrogate key',
  `PERSON_3_SK` Int
 COMMENT 'The person level 3 surrogate key',
  `PERSON_4_SK` Int
 COMMENT 'The person level 4 surrogate key',
  `PERSON_5_SK` Int
 COMMENT 'The person level 5 surrogate key',
  `PERSON_6_SK` Int
 COMMENT 'The person level 6 surrogate key',
  `PERSON_7_SK` Int
 COMMENT 'The person level 7 surrogate key',
  `PERSON_8_SK` Int
 COMMENT 'The person level 8 surrogate key',
  `PERSON_9_SK` Int
 COMMENT 'The person level 9 surrogate key',
  `PERSON_10_SK` Int
 COMMENT 'The person level 10 surrogate key',
  `SOURCE_SYSTEM_SK` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `PERSON_0_ID` Varchar(36)
 COMMENT 'The person level 0 identifier in the source system.',
  `PERSON_0_NAME` Varchar(60)
 COMMENT 'The person level 0 name.',
  `PERSON_1_ID` Varchar(36)
 COMMENT 'The person level 1 identifier in the source system.',
  `PERSON_1_NAME` Varchar(60)
 COMMENT 'The person level 1 name.',
  `PERSON_2_ID` Varchar(36)
 COMMENT 'The person level 2 identifier in the source system.',
  `PERSON_2_NAME` Varchar(60)
 COMMENT 'The person level 2 name.',
  `PERSON_3_ID` Varchar(36)
 COMMENT 'The person level 3 identifier in the source system.',
  `PERSON_3_NAME` Varchar(60)
 COMMENT 'The person level 3 name.',
  `PERSON_4_ID` Varchar(36)
 COMMENT 'The person level 4 identifier in the source system.',
  `PERSON_4_NAME` Varchar(60)
 COMMENT 'The person level 4 name.',
  `PERSON_5_ID` Varchar(36)
 COMMENT 'The person level 5 identifier in the source system.',
  `PERSON_5_NAME` Varchar(60)
 COMMENT 'The person level 5 name.',
  `PERSON_6_ID` Varchar(36)
 COMMENT 'The person level 6 identifier in the source system.',
  `PERSON_6_NAME` Varchar(60)
 COMMENT 'The person level 6 name.',
  `PERSON_7_ID` Varchar(36)
 COMMENT 'The person level 7 identifier in the source system.',
  `PERSON_7_NAME` Varchar(60)
 COMMENT 'The person level 7 name.',
  `PERSON_8_ID` Varchar(36)
 COMMENT 'The person level 8 identifier in the source system.',
  `PERSON_8_NAME` Varchar(60)
 COMMENT 'The person level 8 name.',
  `PERSON_9_ID` Varchar(36)
 COMMENT 'The person level 9 identifier in the source system.',
  `PERSON_9_NAME` Varchar(60)
 COMMENT 'The person level 9 name.',
  `PERSON_10_ID` Varchar(36)
 COMMENT 'The person level 10 identifier in the source system.',
  `PERSON_10_NAME` Varchar(60)
 COMMENT 'The person level 10 name.',
  `DW_VERSION_NUMBER` Smallint DEFAULT 1
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT 'Y'
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NULL DEFAULT '1971-01-01 00:00:00'
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NULL DEFAULT '2036-12-31 00:00:00'
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The person tree table.'
;

CREATE UNIQUE INDEX `TREE_PERSON_PK` ON `TREE_PERSON` (`PERSON_TREE_SK`)
;

ALTER TABLE `TREE_PERSON` ADD  PRIMARY KEY (`PERSON_TREE_SK`)
;

-- Table STAGE_ACCOUNT_PAYABLE

CREATE TABLE `STAGE_ACCOUNT_PAYABLE`
(
  `BUSINESS_UNIT_ID` Varchar(36) NOT NULL
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `PAYMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The payment identifier in the source system.  It is a degenerate dimension in the stage table.',
  `PAYMENT_LINE_ID` Varchar(36) NOT NULL DEFAULT 1
 COMMENT 'The payment line identifier in the source system.  It is a degenerate dimension in the stage table.',
  `SUPPLIER_ID` Varchar(36)
 COMMENT 'The supplier identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a supplier in the source.',
  `SUPPLIER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system SETID.  This column is often used as part of the unique identifer.',
  `AP_PERSON_ID` Varchar(36)
 COMMENT 'The accounts payable person identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an accounts payable person in the source.',
  `DOCUMENT_TYPE_ID` Varchar(36)
 COMMENT 'The document type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a document type in the source.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system account SETID.  This column is often used as part of the unique identifer.',
  `DOCUMENT_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system document type SETID.  This column is often used as part of the unique identifer.',
  `PAYMENT_TRXN_TYPE_ID` Varchar(36)
 COMMENT 'The payment transaction type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment transaction type in the source.',
  `PAYMENT_TRXN_STATUS_ID` Varchar(36)
 COMMENT 'The payment transaction status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment transaction status in the source.',
  `TRXN_POST_STATUS_ID` Varchar(36)
 COMMENT 'The posted transaction status identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a posted transasction status in the source.',
  `BANK_ACCOUNT_ID` Varchar(36)
 COMMENT 'The bank account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a bank account in the source.',
  `BANK_ACCOUNT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system bank account SETID.  This column is often used as part of the unique identifer.',
  `PAYMENT_METHOD_ID` Varchar(36)
 COMMENT 'The payment method identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment method in the source.',
  `PAYMENT_TERMS_ID` Varchar(36)
 COMMENT 'The payment terms identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a payment term in the source.',
  `PAYMENT_TERMS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system payment terms SETID.  This column is often used as part of the unique identifer.',
  `CONTRACT_ID` Varchar(36)
 COMMENT 'The contract identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a contract in the source.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a base currency in the source.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction currency in the source.',
  `TRXN_DATE` Datetime
 COMMENT 'The transaction date.',
  `TRXN_DUE_DATE` Datetime
 COMMENT 'The transaction due date.',
  `DISCOUNT_DUE_DATE` Datetime
 COMMENT 'The discount due date.',
  `MAX_SCHEDULED_PAYMENT_DATE` Datetime
 COMMENT 'The maximum scheduled payment date.',
  `REQUSITION_ID` Varchar(36)
 COMMENT 'The requisition identifier in the source system.  It is a degenerate dimension in the stage table.',
  `PURCHASE_ORDER_ID` Varchar(36)
 COMMENT 'The purchase order identifier in the source system.  It is a degenerate dimension in the stage table.',
  `WAREHOUSE_RECEIPT_ID` Varchar(36)
 COMMENT 'The warehouse receipt identifier in the source system.  It is a degenerate dimension in the stage table.',
  `SOURCE_SYSTEM_ID` Int DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `TRXN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction amount.',
  `TRXN_DISCOUNT_ELIGIBLE_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The discount eligible transaction amount.',
  `TRXN_ADJUSTMENT_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction adjustment amount.',
  `TRXN_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction paid amount.',
  `TRXN_OPEN_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction open amount.',
  `TRXN_GROSS_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction gross paid amount.',
  `TRXN_DISCOUNT_ON_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction discount on paid amount.',
  `TRXN_DISCOUNT_LOST_ON_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction discount lost on paid amount.',
  `TRXN_LATE_CHARGE_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction late charge amount.',
  `TRXN_LATE_CHARGE_DENIED_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction late charge denied amount.',
  `TRXN_LATE_CHARGE_PAID_AMT` Decimal(26,2) DEFAULT 0
 COMMENT 'The transaction late charge paid amount.',
  `HOSTED_CLIENT_SK` Int
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(9,5) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account payable stage table.'
;

CREATE UNIQUE INDEX `STAGE_ACCOUNT_PAY_PK` ON `STAGE_ACCOUNT_PAYABLE` (`BUSINESS_UNIT_ID`,`PAYMENT_ID`,`PAYMENT_LINE_ID`)
;

ALTER TABLE `STAGE_ACCOUNT_PAYABLE` ADD  PRIMARY KEY (`BUSINESS_UNIT_ID`,`PAYMENT_ID`,`PAYMENT_LINE_ID`)
;

-- Table STAGE_ACCOUNT_RECEIVABLE

CREATE TABLE `STAGE_ACCOUNT_RECEIVABLE`
(
  `RECEIVABLE_ID` Varchar(36) NOT NULL DEFAULT 1
 COMMENT 'The receivable identifier in the source system.  It is a degenerate dimension in the fact table.',
  `RECEIVABLE_LINE_ID` Varchar(36) NOT NULL
 COMMENT 'The receivable line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system surrogate key.  All stages and base grain fact tables must include this column to enable multiple source system capability.',
  `JOURNAL_DATE` Datetime
 COMMENT 'The journal entry date.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 'SHARE'
 COMMENT 'The general ledger business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.',
  `OPERATING_UNIT_ID` Varchar(36)
 COMMENT 'The operating unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an operating unit in the source.',
  `OPERATING_UNIT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system operating unit SETID.  This column is often used as part of the unique identifer.',
  `LEDGER_ID` Varchar(36)
 COMMENT 'The ledger identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a ledger in the source.',
  `LEDGER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system general ledger SETID.  This column is often used as part of the unique identifer.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system account SETID.  This column is often used as part of the unique identifer.',
  `CLASS_ID` Varchar(36)
 COMMENT 'The class identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a class in the source.',
  `CLASS_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system class SETID.  This column is often used as part of the unique identifer.',
  `FUND_ID` Varchar(36)
 COMMENT 'The fund identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a fund in the source.',
  `FUND_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system fund SETID.  This column is often used as part of the unique identifer.',
  `DEPARTMENT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system department SETID.  This column is often used as part of the unique identifer.',
  `PROGRAM_ID` Varchar(36)
 COMMENT 'The program identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a program in the source.',
  `PROGRAM_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system program SETID.  This column is often used as part of the unique identifer.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The base currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a base currency in the source.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The transaction currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction currency in the source.',
  `BUDGET_ID` Varchar(36)
 COMMENT 'The budget identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a budget in the source.',
  `BUDGET_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system budget SETID.  This column is often used as part of the unique identifer.',
  `INVOICE_ID` Varchar(36)
 COMMENT 'The invoice identifier in the source system.  It is a degenerate dimension in the fact table.',
  `INVOICE_LINE_ID` Varchar(36)
 COMMENT 'The invoice line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PAYMENT_ID` Varchar(36)
 COMMENT 'The payment identifier in the source system.  It is a degenerate dimension in the fact table.',
  `PAYMENT_LINE_ID` Varchar(36)
 COMMENT 'The payment line identifier in the source system.  It is a degenerate dimension in the fact table.',
  `DOCUMENT_TYPE_ID` Varchar(36)
 COMMENT 'The document type identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a document type in the source.',
  `DOCUMENT_TYPE_SETID` Varchar(5) DEFAULT 'SHARE'
 COMMENT 'The source system document type SETID.  This column is often used as part of the unique identifer.',
  `TRXN_RECEIVABLE_AMT` Decimal(26,2)
 COMMENT 'The transaction receivable amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(9,5) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
)
 COMMENT = 'The account receivable stage table.'
;

ALTER TABLE `STAGE_ACCOUNT_RECEIVABLE` ADD  PRIMARY KEY (`RECEIVABLE_ID`,`RECEIVABLE_LINE_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_PRODUCT_LOT

CREATE TABLE `STAGE_PRODUCT_LOT`
(
  `PRODUCT_LOT_ID` Varchar(36) NOT NULL
 COMMENT 'The product lot identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a product in the source.',
  `PRODUCT_LOT_SETID` Varchar(5) NOT NULL DEFAULT 'SHARE'
 COMMENT 'The source system product lot SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT 1
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `PRODUCT_LOT_NAME` Varchar(60)
 COMMENT 'The product lot name.',
  `PRODUCT_LOT_DESC` Varchar(255)
 COMMENT 'The product lot description.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_ERROR_IND` Char(1) DEFAULT 'N'
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `PRODUCT_ID` Varchar(36) NOT NULL
 COMMENT 'The product identifier in the source system.'
)
 COMMENT = 'The product (material) lot stage dimension.'
;

CREATE UNIQUE INDEX `STAGE_PRODUCT_PK` ON `STAGE_PRODUCT_LOT` (`PRODUCT_LOT_ID`,`PRODUCT_LOT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PRODUCT_LOT` ADD  PRIMARY KEY (`PRODUCT_LOT_ID`,`PRODUCT_LOT_SETID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_PRODUCT_LOT` ADD UNIQUE `PK_STAGE_PRODUCT_LOT` (`PRODUCT_LOT_ID`,`PRODUCT_LOT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table FACT_CUSTOMER_LIFECYCLE

CREATE TABLE `FACT_CUSTOMER_LIFECYCLE`
(
  `CUSTOMER_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The customer surrogate key.  This relates to the customer dimension.',
  `CUSTOMER_CONTACT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The customer contact surrogate key.  This relates to the customer contact dimension.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The source system surrogate key.  This enables multiple source system capability.',
  `SALES_LEAD_CHANNEL_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales lead channel surrogate key.  This relates to the sales lead channel dimension.',
  `SALES_REPRESENTATIVE_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The sales person surrogate key.  This relates to the person dimension.',
  `BUSINESS_UNIT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `CREATED_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The account created date surrogate key.  This relates to the day dimension.',
  `SUSPECT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The account suspect date surrogate key.  This relates to the day dimension.',
  `PROSPECT_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The account prospect date surrogate key.  This relates to the day dimension.',
  `CUSTOMER_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The account customer date surrogate key.  This relates to the day dimension.',
  `LOYALIST_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The account loyalist date surrogate key.  This relates to the day dimension.',
  `BASE_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `TRXN_CURRENCY_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `CREATED_DATE` Datetime
 COMMENT 'The account created date.',
  `SUSPECT_DATE` Datetime
 COMMENT 'The account suspect date.',
  `PROSPECT_DATE` Datetime
 COMMENT 'The account prospect date.',
  `CUSTOMER_DATE` Datetime
 COMMENT 'The account customer date.',
  `LOYALIST_DATE` Datetime
 COMMENT 'The account customer loyalist date.',
  `SUSPECT_QTY` Tinyint DEFAULT 0
 COMMENT 'The quantity of accounts the suspect status.',
  `PROSPECT_QTY` Tinyint DEFAULT 0
 COMMENT 'The quantity of accounts in the in prospect status.',
  `CUSTOMER_QTY` Tinyint DEFAULT 0
 COMMENT 'The quantity of accounts in the customer status.',
  `LOYALIST_QTY` Tinyint DEFAULT 0
 COMMENT 'The quantity of accounts in the loyalist status.',
  `HOSTED_CLIENT_SK` Int DEFAULT 0
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or update in the table.'
)
 COMMENT = 'Customer lifecyle information at the customer (account) grain.'
;

CREATE INDEX `FACT_SL_BU_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_SL_CUST_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`CUSTOMER_SK`)
;

CREATE INDEX `FACT_SL_CUST_CONTACT_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`CUSTOMER_CONTACT_SK`)
;

CREATE INDEX `FACT_SL_CHANNEL_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`SALES_LEAD_CHANNEL_SK`)
;

CREATE INDEX `FACT_SL_SALES_REP_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`SALES_REPRESENTATIVE_SK`)
;

CREATE INDEX `FACT_CL_CREATED_DATE_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`CREATED_DATE_SK`)
;

CREATE INDEX `FACT_CL_SUSPECT_DATE_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`SUSPECT_DATE_SK`)
;

CREATE INDEX `FACT_CL_PROSPECT_DATE_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`PROSPECT_DATE_SK`)
;

CREATE INDEX `FACT_CL_CUST_DATE_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`CUSTOMER_DATE_SK`)
;

CREATE INDEX `FACT_CL_LOYALIST_DATE_BI` ON `FACT_CUSTOMER_LIFECYCLE` (`LOYALIST_DATE_SK`)
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD  PRIMARY KEY (`CUSTOMER_SK`,`SOURCE_SYSTEM_SK`)
;

-- Table STAGE_INVENTORY_TRANSACTION

CREATE TABLE `STAGE_INVENTORY_TRANSACTION`
(
  `TRXN_ID` Varchar(36) NOT NULL
 COMMENT 'The inventory transaction source system identifier.  It is a degenerate dimension in the inventory transaction fact table.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT "1"
 COMMENT 'The source system identifier.  This enables multiple source system capability.',
  `TRANSACTION_DATE` Datetime NOT NULL
 COMMENT 'The inventory transaction date.',
  `PRODUCT_ID` Varchar(36) DEFAULT 0
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an inventory item in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system product SETID.  This column is often used as part of the unique identifer.  Not intended for display.',
  `PRODUCT_LOT_ID` Varchar(36) DEFAULT 0
 COMMENT 'The product lot identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an inventory item lot in the source.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT 0
 COMMENT 'The business unit identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a business unit in the source.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5)
 COMMENT 'The source system customer SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `WAREHOUSE_ID` Varchar(36) DEFAULT 0
 COMMENT 'The warehouse identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a warehouse in the source.',
  `SUPPLIER_ID` Varchar(36) DEFAULT 0
 COMMENT 'The supplier identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers a supplier in the source.',
  `SUPPLIER_SETID` Varchar(5)
 COMMENT 'The source system supplier SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `TRXN_TYPE_ID` Varchar(36) DEFAULT 0
 COMMENT 'The transaction type identifier in the source system.',
  `INV_UOM_ID` Varchar(36) DEFAULT 0
 COMMENT 'The inventory unit of measure identifier in the source system.  Alone, or in combination with other columns, (e.g., business unit, source system), this value uniquely identifiers an inventory unit of measure in the source.',
  `INV_ADJUSTMENT_ID` Varchar(36) DEFAULT 0
 COMMENT 'The inventory adjustment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies an inventory adjustment in the source.',
  `INV_ADJUSTMENT_SETID` Varchar(5)
 COMMENT 'The source system inventory adjustment SETID.  This column is often used as part of the unique identifer.',
  `INV_TRXN_QTY` Int DEFAULT "0"
 COMMENT 'The quantity of items associated with the transaction.',
  `TRXN_CURRENCY_ID` Varchar(36) DEFAULT 0
 COMMENT 'The transaction currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a transaction currency in the source.',
  `BASE_CURRENCY_ID` Varchar(36) DEFAULT 0
 COMMENT 'The base currency identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifiers a base currency in the source.',
  `INV_TRXN_COST_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The cost of the product.  This is a sum of all costs that can be attributed to a product unit (e.g., raw material, transportation, indirect costs, etc.).',
  `INV_TRXN_PRICE_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The standard unit price of the product offered to customers.  This is generic across customers and often does not reflect the price actually offered to customers.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT "1.00000"
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `WEIGHT_UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The weight unit of measure identifier in the source system.',
  `WEIGHT_QTY` Decimal(26,2)
 COMMENT 'The weight quantity at a particular unit of measure.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `TRXN_DATE` Datetime NOT NULL
 COMMENT 'The inventory transaction date.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The inventory transaction stage fact.'
;

ALTER TABLE `STAGE_INVENTORY_TRANSACTION` ADD  PRIMARY KEY (`TRXN_ID`,`SOURCE_SYSTEM_ID`)
;

ALTER TABLE `STAGE_INVENTORY_TRANSACTION` ADD UNIQUE `PK_STAGE_INVENTORY_TRANSACTION` (`TRXN_ID`,`SOURCE_SYSTEM_ID`)
;

-- Table FACT_INVENTORY_TRANSACTION

CREATE TABLE `FACT_INVENTORY_TRANSACTION`
(
  `TRXN_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The inventory transaction date surrogate key.  This column may be used to partition the fact table by time.',
  `TRXN_ID` Varchar(32) NOT NULL
 COMMENT 'The inventory transaction source system identifier.  It is a degenerate dimension in the inventory transaction fact table.',
  `SOURCE_SYSTEM_SK` Int UNSIGNED NOT NULL
 COMMENT 'The source system surrogate key.  All dimensions and base grain fact tables must include this column to enable multiple source system capability.',
  `BUSINESS_UNIT_SK` Int DEFAULT 0
 COMMENT 'The business unit surrogate key.  This relates to the business unit dimension.',
  `PRODUCT_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The product surrogate key.  This relates to the product dimension.',
  `PRODUCT_LOT_SK` Int DEFAULT 0
 COMMENT 'The inventory item lot surrogate key.  This relates to the inventory item lot dimension.',
  `CUSTOMER_SK` Int UNSIGNED DEFAULT 0
 COMMENT 'The customer surrogate key.  This points to the customer dimension.',
  `SUPPLIER_SK` Int DEFAULT 0
 COMMENT 'The supplier surrogate key.  This relates to the supplier dimension.',
  `WAREHOUSE_SK` Int DEFAULT 0
 COMMENT 'The warehouse surrogate key.  This relates to the warehouse dimension.',
  `TRXN_TYPE_SK` Int DEFAULT 0
 COMMENT 'The inventory transaction type surrogate key.  This relates to the transaction type dimension.',
  `INV_UOM_SK` Int DEFAULT 0
 COMMENT 'The inventory unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `INV_ADJUSTMENT_SK` Int DEFAULT "0"
 COMMENT 'The inventory adjustment surrogate key.  This relates to the inventory adjustment dimension.',
  `WEIGHT_UNIT_OF_MEASURE_SK` Int DEFAULT 0
 COMMENT 'The weight unit of measure surrogate key.  This relates to the unit of measure dimension.',
  `TRXN_CURRENCY_SK` Int DEFAULT 0
 COMMENT 'The transaction currency surrogate key.  This relates to the currency dimension.',
  `BASE_CURRENCY_SK` Int DEFAULT 0
 COMMENT 'The base currency surrogate key.  This relates to the currency dimension.',
  `TRXN_DATE` Datetime NOT NULL
 COMMENT 'The inventory transaction date.',
  `INV_TRXN_QTY` Int DEFAULT "0"
 COMMENT 'The quantity of items associated with the transaction.',
  `INV_TRXN_COST_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The unit cost of the product.  This is a sum of all costs that can be attributed to a product unit (e.g., raw material, transportation, indirect costs, etc.).',
  `INV_TRXN_PRICE_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The standard unit price of the product offered to customers.  This is generic across customers and often does not reflect the price actually offered to customers.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT 1
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `WEIGHT_QTY` Decimal(26,2)
 COMMENT 'The weight quantity at a particular unit of measure.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The inventory transaction fact table.'
;

CREATE INDEX `FACT_INV_TRXN_DATE_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`TRXN_DATE_SK`)
;

CREATE INDEX `FACT_INV_TRXN_PRODUCT_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`PRODUCT_SK`)
;

CREATE INDEX `FACT_INV_TRXN_LOT_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`PRODUCT_LOT_SK`)
;

CREATE INDEX `FACT_INV_TRXN_BU_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`BUSINESS_UNIT_SK`)
;

CREATE INDEX `FACT_INV_TRXN_WAREHOUSE_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`WAREHOUSE_SK`)
;

CREATE INDEX `FACT_INV_TRXN_SUPPLIER_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`SUPPLIER_SK`)
;

CREATE INDEX `FACT_INV_TRXN_UOM_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`INV_UOM_SK`)
;

CREATE INDEX `FACT_INV_TRXN_SOURCE_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`SOURCE_SYSTEM_SK`)
;

CREATE INDEX `FACT_INV_TRXN_TRXN_TYPE_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`TRXN_TYPE_SK`)
;

CREATE INDEX `FACT_INV_TRXN_T_CRNCY_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`TRXN_CURRENCY_SK`)
;

CREATE INDEX `FACT_INV_TRXN_B_CRNCY_BI` USING BTREE ON `FACT_INVENTORY_TRANSACTION` (`BASE_CURRENCY_SK`)
;

CREATE INDEX `FACT_INV_TRXN_INV_ADJUST_BI` ON `FACT_INVENTORY_TRANSACTION` (`INV_ADJUSTMENT_SK`)
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD  PRIMARY KEY (`TRXN_ID`,`SOURCE_SYSTEM_SK`,`TRXN_DATE_SK`)
;

-- Table TREE_ACCOUNT

CREATE TABLE `TREE_ACCOUNT`
(
  `ACCOUNT_TREE_SK` Int NOT NULL
 COMMENT 'The account tree surrogate key.',
  `ACCOUNT_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The account surrogate key.  This key should be loaded from a database sequence or be defined as an identity column.',
  `HIERARCHY_TYPE_NAME` Varchar(60) NOT NULL DEFAULT "ACCOUNT"
 COMMENT 'The type of hierarcy.',
  `ACCOUNT_ID` Varchar(36) NOT NULL DEFAULT "0"
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) NOT NULL DEFAULT "SHARE"
 COMMENT 'The source system account SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `ACCOUNT_NAME` Varchar(60)
 COMMENT 'The account name.',
  `SOURCE_SYSTEM_SK` Int NOT NULL DEFAULT "1"
 COMMENT 'The source system surrogate key.  All dimensions and base grain fact tables must include this column to enable multiple source system capability.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The effective date.',
  `ACCOUNT_LEVEL1_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 1 identifier in the source system hierarchy.  This is the top or root level.',
  `ACCOUNT_LEVEL2_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 2 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL3_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 3 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL4_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 4 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL5_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 5 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL1_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 1 name in the source system hierarchy.  This is the top or root level.',
  `ACCOUNT_LEVEL2_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 2 name in the source system hierarchy.',
  `ACCOUNT_LEVEL3_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 3 name in the source system hierarchy.',
  `ACCOUNT_LEVEL4_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 4 name in the source system hierarchy.',
  `ACCOUNT_LEVEL5_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 5 name in the source system hierarchy.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint UNSIGNED DEFAULT "1"
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT "Y"
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used..',
  `DW_START_DATE` Timestamp NOT NULL DEFAULT "1971-01-01 00:00:00"
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NOT NULL DEFAULT "2036-12-31 00:00:00"
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The account finance hierarchy tree.'
;

ALTER TABLE `TREE_ACCOUNT` ADD  PRIMARY KEY (`ACCOUNT_SK`,`ACCOUNT_TREE_SK`)
;

ALTER TABLE `TREE_ACCOUNT` ADD UNIQUE `ACCOUNT_TREE_SK` (`ACCOUNT_TREE_SK`)
;

-- Table ADMIN_COUNTRY

CREATE TABLE `ADMIN_COUNTRY`
(
  `COUNTRY_SK` Bigint NOT NULL,
  `ISO_3166_COUNTRY_CODE` Varchar(32),
  `ISO_3166_COUNTRY_NAME` Varchar(60),
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The country admin table.'
;

ALTER TABLE `ADMIN_COUNTRY` ADD  PRIMARY KEY (`COUNTRY_SK`)
;

-- Table ADMIN_HOSTED_CLIENT

CREATE TABLE `ADMIN_HOSTED_CLIENT`
(
  `HOSTED_CLIENT_SK` Bigint NOT NULL,
  `HOSTED_CLIENT_ID` Varchar(32),
  `HOSTED_CLIENT_NAME` Varchar(60),
  `HOSTED_CLIENT_DESC` Varchar(255),
  `CONTACT_NAME` Varchar(60),
  `CONTACT_EMAIL_DESC` Varchar(255),
  `HOSTED_CLIENT_GROUP_CAT` Varchar(32),
  `PARENT_HOSTED_CLIENT_NAME` Varchar(32),
  `PARENT_HOSTED_CLIENT_SK` Double,
  `MONDRIAN_VIEW_SUFFIX_NAME` Varchar(60),
  `MONDRIAN_CUBE_SUFFIX_NAME` Varchar(60),
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The hosted client admin table.'
;

ALTER TABLE `ADMIN_HOSTED_CLIENT` ADD  PRIMARY KEY (`HOSTED_CLIENT_SK`)
;

-- Table ADMIN_JOB_CONTROL

CREATE TABLE `ADMIN_JOB_CONTROL`
(
  `ID_JOB` Int NOT NULL,
  `JOBNAME` Varchar(255),
  `STATUS` Varchar(15),
  `LINES_READ` Bigint,
  `LINES_WRITTEN` Bigint,
  `LINES_UPDATED` Bigint,
  `LINES_INPUT` Bigint,
  `LINES_OUTPUT` Bigint,
  `ERRORS` Bigint,
  `STARTDATE` Datetime,
  `ENDDATE` Datetime,
  `LOGDATE` Datetime,
  `DEPDATE` Datetime,
  `REPLAYDATE` Datetime,
  `LOG_FIELD` Mediumtext
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The job control admin table (generated by Kettle/PDI).'
;

ALTER TABLE `ADMIN_JOB_CONTROL` ADD  PRIMARY KEY (`ID_JOB`)
;

-- Table ADMIN_MODULE

CREATE TABLE `ADMIN_MODULE`
(
  `MODULE_SK` Int NOT NULL AUTO_INCREMENT,
  `MODULE_NAME` Varchar(60),
  `MODULE_DESC` Varchar(255),
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`MODULE_SK`)
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The module admin table (one entry for each module).'
;

-- Table ADMIN_MODULE_MONDRIAN_OBJECT

CREATE TABLE `ADMIN_MODULE_MONDRIAN_OBJECT`
(
  `MODULE_SK` Int NOT NULL,
  `MONDRIAN_OBJECT_SK` Int NOT NULL,
  `ACTIVE_IND` Char(1) DEFAULT "N"
 COMMENT 'The active indicator, Y = active, N= inactive.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Fixed
 COMMENT = 'The module mondrian object admin table.'
;

ALTER TABLE `ADMIN_MODULE_MONDRIAN_OBJECT` ADD  PRIMARY KEY (`MODULE_SK`,`MONDRIAN_OBJECT_SK`)
;

-- Table ADMIN_MODULE_PARTNER

CREATE TABLE `ADMIN_MODULE_PARTNER`
(
  `MODULE_SK` Int NOT NULL DEFAULT "0",
  `PARTNER_SK` Int NOT NULL DEFAULT "0",
  `ACTIVE_IND` Char(1) DEFAULT "N"
 COMMENT 'The active indicator, Y = active, N= inactive.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Fixed
 COMMENT = 'The module partner admin table (associates a BBBI partner to modules).'
;

ALTER TABLE `ADMIN_MODULE_PARTNER` ADD  PRIMARY KEY (`MODULE_SK`,`PARTNER_SK`)
;

-- Table ADMIN_MONDRIAN_OBJECT

CREATE TABLE `ADMIN_MONDRIAN_OBJECT`
(
  `MONDRIAN_OBJECT_SK` Int NOT NULL AUTO_INCREMENT
 COMMENT 'The mondrian object surrogate key.  This key should be loaded from a database sequence or be defined as an identity column.',
  `MONDRIAN_OBJECT_NAME` Varchar(60)
 COMMENT 'The name the mondrian object.',
  `MONDRIAN_OBJECT_VERSION_NUMBER` Int DEFAULT "1"
 COMMENT 'The mondrian object version number.',
  `MONDRIAN_OBJECT_CAT` Varchar(60)
 COMMENT 'The category of the mondrian object, e.g. dimension, cube, etc.',
  `MONDRIAN_OBJECT_TXT` Longtext NOT NULL
 COMMENT 'The text of the mondrian object.',
  `DW_CURRENT_IND` Char(1) DEFAULT "Y"
 COMMENT 'The current version row for a particular mondrian object.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  PRIMARY KEY (`MONDRIAN_OBJECT_SK`)
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The mondrian object table.'
;

CREATE UNIQUE INDEX `MONDRIAN_OBJECT_AK` USING BTREE ON `ADMIN_MONDRIAN_OBJECT` (`MONDRIAN_OBJECT_NAME`,`MONDRIAN_OBJECT_VERSION_NUMBER`)
;

-- Table ADMIN_PARTNER

CREATE TABLE `ADMIN_PARTNER`
(
  `PARTNER_SK` Int NOT NULL,
  `PARTNER_ID` Varchar(32),
  `PARTNER_NAME` Varchar(60),
  `PARTNER_DESC` Varchar(255),
  `EMAIL_ADDRESS_DESC` Varchar(255),
  `ACTIVE_IND` Char(1) DEFAULT "N"
 COMMENT 'The active indicator, Y = active, N= inactive.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The partner admin table.'
;

ALTER TABLE `ADMIN_PARTNER` ADD  PRIMARY KEY (`PARTNER_SK`)
;

-- Table ADMIN_PARTNER_COUNTRY

CREATE TABLE `ADMIN_PARTNER_COUNTRY`
(
  `PARTNER_SK` Bigint NOT NULL,
  `COUNTRY_SK` Bigint NOT NULL,
  `ACTIVE_IND` Varchar(1) DEFAULT "Y",
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The partner country admin table (associates a parnter to countries).'
;

CREATE INDEX `ADMIN_PARTNER_COUNTRY_CNTRY_FK` USING BTREE ON `ADMIN_PARTNER_COUNTRY` (`COUNTRY_SK`)
;

ALTER TABLE `ADMIN_PARTNER_COUNTRY` ADD  PRIMARY KEY (`PARTNER_SK`,`COUNTRY_SK`)
;

-- Table ADMIN_ROLE

CREATE TABLE `ADMIN_ROLE`
(
  `ROLE_SK` Bigint NOT NULL,
  `ROLE_ID` Varchar(32),
  `ROLE_NAME` Varchar(60),
  `ROLE_DESC` Varchar(255),
  `ROLE_GROUP_CAT` Varchar(32),
  `PARENT_ROLE_NAME` Varchar(32),
  `PARENT_ROLE_SK` Double,
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The role admin table.'
;

ALTER TABLE `ADMIN_ROLE` ADD  PRIMARY KEY (`ROLE_SK`)
;

-- Table ADMIN_TRANSFORMATION_CONTROL

CREATE TABLE `ADMIN_TRANSFORMATION_CONTROL`
(
  `ID_BATCH` Int,
  `TRANSNAME` Varchar(255),
  `STATUS` Varchar(15),
  `LINES_READ` Bigint,
  `LINES_WRITTEN` Bigint,
  `LINES_UPDATED` Bigint,
  `LINES_INPUT` Bigint,
  `LINES_OUTPUT` Bigint,
  `ERRORS` Bigint,
  `STARTDATE` Datetime,
  `ENDDATE` Datetime,
  `LOGDATE` Datetime,
  `DEPDATE` Datetime,
  `REPLAYDATE` Datetime,
  `LOG_FIELD` Mediumtext
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The transformation control admin table (generated by Kettle/PDI).'
;

-- Table ADMIN_USER

CREATE TABLE `ADMIN_USER`
(
  `USER_SK` Bigint NOT NULL,
  `HOSTED_CLIENT_SK` Bigint NOT NULL,
  `PARTNER_SK` Bigint NOT NULL,
  `USER_ID` Varchar(32),
  `USER_NAME` Varchar(60),
  `USER_DESC` Varchar(255),
  `USER_GROUP_CAT` Varchar(32),
  `PARENT_USER_NAME` Varchar(32),
  `PARENT_USER_SK` Double,
  `EMAIL_ADDRESS_DESC` Varchar(255)
 COMMENT 'The user email address.',
  `LOGO_URL_DESC` Varchar(255) DEFAULT "http://www.breadboardbi.com/images/logo.gif"
 COMMENT 'The logo URL description.  For example,  http://www.breadboardbi.com/images/logo.gif.',
  `ACTIVE_IND` Char(1) DEFAULT "N"
 COMMENT 'The active indicator, Y = active, N= inactive.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The user admin table.'
;

CREATE INDEX `ADMIN_USER_HOSTED_CLIENT_FK` USING BTREE ON `ADMIN_USER` (`HOSTED_CLIENT_SK`)
;

CREATE INDEX `ADMIN_USER_PARTNER_FK` USING BTREE ON `ADMIN_USER` (`PARTNER_SK`)
;

ALTER TABLE `ADMIN_USER` ADD  PRIMARY KEY (`USER_SK`)
;

-- Table ADMIN_USER_ROLE

CREATE TABLE `ADMIN_USER_ROLE`
(
  `ROLE_SK` Bigint NOT NULL,
  `USER_SK` Bigint NOT NULL,
  `START_DATE` Datetime,
  `STOP_DATE` Datetime,
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Fixed
 COMMENT = 'The user role admin table.'
;

CREATE INDEX `ADMIN_USER_ROLE_USER_FK` USING BTREE ON `ADMIN_USER_ROLE` (`USER_SK`)
;

ALTER TABLE `ADMIN_USER_ROLE` ADD  PRIMARY KEY (`ROLE_SK`,`USER_SK`)
;

-- Table ADMIN_MODULE_TABLE

CREATE TABLE `ADMIN_MODULE_TABLE`
(
  `TABLE_SK` Int NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` Varchar(60),
  `TABLE_DESC` Varchar(255),
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TABLE_SK`)
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The module table admin table.'
;

-- Table ADMIN_MODULE_TABLE_TABLE

CREATE TABLE `ADMIN_MODULE_TABLE_TABLE`
(
  `TABLE_SK` Bigint NOT NULL,
  `MODULE_SK` Bigint NOT NULL,
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = MyISAM
 ROW_FORMAT = Fixed
 COMMENT = 'The module table table admin table (associates modules to tables).'
;

ALTER TABLE `ADMIN_MODULE_TABLE_TABLE` ADD  PRIMARY KEY (`TABLE_SK`,`MODULE_SK`)
;

-- Table BRIDGE_CUSTOMER_CAMPAIGN_WAVE

CREATE TABLE `BRIDGE_CUSTOMER_CAMPAIGN_WAVE`
(
  `CUSTOMER_SK` Bigint NOT NULL DEFAULT "0"
 COMMENT 'The customer surrogate key.  This key should be loaded from a database sequence or be defined as an identity column.',
  `CAMPAIGN_WAVE_SK` Bigint NOT NULL DEFAULT "0"
 COMMENT 'The campaign wave surrogate key.  This key should be loaded from a database sequence or be defined as an identity column.',
  `CUSTOMER_ID` Varchar(36) NOT NULL DEFAULT "-"
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `SOURCE_SYSTEM_SK` Bigint DEFAULT "0"
 COMMENT 'The source system surrogate key.  All dimensions and base grain fact tables must include this column to enable multiple source system capabililty.',
  `CAMPAIGN_ID` Varchar(36) NOT NULL DEFAULT "-"
 COMMENT 'The marketing campaign identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a marketing campaign in the source.',
  `CAMPAIGN_WAVE_ID` Varchar(36) NOT NULL DEFAULT "-"
 COMMENT 'The marketing campaign wave identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a marketing campaign wave in the source.',
  `CAMPAIGN_WAVE_SETID` Varchar(32) DEFAULT "SHARE"
 COMMENT 'The source system campaign wave SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  This relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT "1"
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT "Y"
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_START_DATE` Timestamp NOT NULL DEFAULT "1971-01-01 03:00:00"
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NOT NULL DEFAULT "2036-12-31 03:00:00"
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT "0000-00-00 00:00:00"
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The customer campaign wave bridge table (associates customer to campaigns).'
;

ALTER TABLE `BRIDGE_CUSTOMER_CAMPAIGN_WAVE` ADD  PRIMARY KEY (`CUSTOMER_SK`,`CAMPAIGN_WAVE_SK`)
;

-- Table DIMENSION_INVENTORY_ADJUSTMENT

CREATE TABLE `DIMENSION_INVENTORY_ADJUSTMENT`
(
  `INV_ADJUSTMENT_SK` Int NOT NULL DEFAULT "0"
 COMMENT 'The inventory adjustment surrogate key.',
  `INV_ADJUSTMENT_ID` Varchar(36) NOT NULL DEFAULT "0"
 COMMENT 'The inventory adjustment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies an inventory adjustment in the source.',
  `INV_ADJUSTMENT_SETID` Varchar(5) NOT NULL DEFAULT "SHARE"
 COMMENT 'The source system inventory adjustment SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_SK` Int DEFAULT "1"
 COMMENT 'The source system surrogate key.  All dimensions and base grain fact tables must include this column to enable multiple source system capability.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The inventory adjustment effective date.',
  `INV_ADJUSTMENT_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The inventory adjustment name.',
  `INV_ADJUSTMENT_DESC` Varchar(255)
 COMMENT 'The inventory adjustment description',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint DEFAULT "1"
 COMMENT 'The version number for the row.',
  `DW_CURRENT_IND` Char(1) DEFAULT "Y"
 COMMENT 'The current row for a particular entity when Slowly Changing Dimension Type 2 (SCD2) functionality is used..',
  `DW_START_DATE` Timestamp NOT NULL DEFAULT "1971-01-01 03:00:00"
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NOT NULL DEFAULT "2036-12-31 03:00:00"
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT "0000-00-00 00:00:00"
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The inventory adjustment dimension.'
;

CREATE UNIQUE INDEX `DIMENSION_INV_ADJUSTMENT_AK` USING BTREE ON `DIMENSION_INVENTORY_ADJUSTMENT` (`INV_ADJUSTMENT_ID`,`INV_ADJUSTMENT_SETID`,`SOURCE_SYSTEM_SK`)
;

ALTER TABLE `DIMENSION_INVENTORY_ADJUSTMENT` ADD  PRIMARY KEY (`INV_ADJUSTMENT_SK`)
;

-- Table DIMENSION_MSA

CREATE TABLE `DIMENSION_MSA`
(
  `MSA_SK` Int(10) UNSIGNED NOT NULL
 COMMENT 'metropolitan statistical areas (MSA) surrogate key.',
  `MSA_CODE` Smallint NOT NULL
 COMMENT 'metropolitan statistical areas (MSA) code.',
  `MSA_NAME` Varchar(60) NOT NULL
 COMMENT 'metropolitan statistical areas (MSA) name.',
  `MSA_TYPE_CAT` Varchar(32) NOT NULL
 COMMENT 'metropolitan statistical areas (MSA) category.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_VERSION_NUMBER` Smallint NOT NULL DEFAULT "1"
 COMMENT 'The version number for the row.',
  `DW_START_DATE` Timestamp NOT NULL DEFAULT "1971-01-01 03:00:00"
 COMMENT 'The start date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_STOP_DATE` Timestamp NOT NULL DEFAULT "2036-12-31 03:00:00"
 COMMENT 'The stop date for the row when Slowly Changing Dimension Type 2 (SCD2) functionality is used.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT "0000-00-00 00:00:00"
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The metropolitan service area (MSA) dimension.'
;

ALTER TABLE `DIMENSION_MSA` ADD  PRIMARY KEY (`MSA_SK`)
;

-- Table STAGE_BUDGET_FORECAST_ITEM

CREATE TABLE `STAGE_BUDGET_FORECAST_ITEM`
(
  `BUDGET_FRCST_ID` Varchar(36) NOT NULL
 COMMENT 'The budget forecast identifier.',
  `BUDGET_FRCST_ITEM_ID` Varchar(36) NOT NULL
 COMMENT 'The budget forecast item identifier.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT "1"
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `BUDGET_FRCST_SETID` Varchar(5) NOT NULL DEFAULT "SHARE"
 COMMENT 'The budget forecast SETID.  This column is often used as part of the unique identifer.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `BUDGET_FRCST_ITEM_NAME` Varchar(60)
 COMMENT 'The budget forecast item name.',
  `BUDGET_FRCST_ITEM_CAT_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The budget forecast item category identifier.',
  `BUDGET_FRCST_ITEM_CAT_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The budget forecast item category name.',
  `BUDGET_FRCST_ITEM_CAT_DESC` Varchar(255) DEFAULT "Missing"
 COMMENT 'The budget forecast item category description.',
  `BUDGET_FRCST_ITEM_SUBCAT_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The budget forecast item subcategory identifier.',
  `BUDGET_FRCST_ITEM_SUBCAT_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The budget forecast item subcategory name.',
  `BUDGET_FRCST_ITEM_SUBCAT_DESC` Varchar(255) DEFAULT "Missing"
 COMMENT 'The budget forecast item subcategory description.',
  `BUDGET_FRCST_NAME` Varchar(60)
 COMMENT 'The budget forecast name.',
  `BUDGET_FRCST_DESC` Varchar(255)
 COMMENT 'The budget forecast description.',
  `DW_ERROR_IND` Char(1) DEFAULT "N"
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT "N"
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The budget forecast item stage.'
;

ALTER TABLE `STAGE_BUDGET_FORECAST_ITEM` ADD  PRIMARY KEY (`BUDGET_FRCST_ID`,`BUDGET_FRCST_ITEM_ID`,`SOURCE_SYSTEM_ID`,`BUDGET_FRCST_SETID`)
;

-- Table STAGE_BUDGET_FORECAST_MEASURES

CREATE TABLE `STAGE_BUDGET_FORECAST_MEASURES`
(
  `FISCAL_PERIOD_ID` Varchar(36)
 COMMENT 'This fiscal period in the source system.',
  `BUSINESS_UNIT_ID` Varchar(36) DEFAULT "SHARE"
 COMMENT 'The business unit identifier in the source system.  It may be used in combination with other identifiers to uniquely identify a dimension in the source system.',
  `BUDGET_ID` Varchar(36)
 COMMENT 'The budget source system id.',
  `BUDGET_ITEM_ID` Varchar(36)
 COMMENT 'The budget item identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a budget item in the source.',
  `BUDGET_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system budget SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `FRCST_ID` Varchar(36)
 COMMENT 'The forecast source system id.',
  `FRCST_ITEM_ID` Varchar(36)
 COMMENT 'The forecast item identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a budget item in the source.',
  `FRCST_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system forecast SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `COST_CENTER_ID` Varchar(36)
 COMMENT 'The cost center identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a cost center in the source.',
  `COST_CENTER_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system cost center SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `DEPARTMENT_ID` Varchar(36)
 COMMENT 'The department identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a department in the source.',
  `DEPARTMENT_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system department SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `CUSTOMER_ID` Varchar(36)
 COMMENT 'The customer identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a customer in the source.',
  `CUSTOMER_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `PRODUCT_ID` Varchar(36)
 COMMENT 'The product identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a product in the source.',
  `PRODUCT_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `OPERATING_UNIT_ID` Varchar(36)
 COMMENT 'The operating unit identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers an operating unit in the source.',
  `OPERATING_UNIT_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system operating unit SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `ACCOUNT_ID` Varchar(36)
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) DEFAULT "SHARE"
 COMMENT 'The source system account SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `UNIT_OF_MEASURE_ID` Varchar(36)
 COMMENT 'The unit of measure identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a unit of measure in the source.',
  `TRXN_CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a currency in the source.',
  `BASE_CURRENCY_ID` Varchar(36)
 COMMENT 'The currency identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers a currency in the source.',
  `ORDER_BUDGET_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The order budget amount.',
  `ORDER_BUDGET_QTY` Int DEFAULT "0"
 COMMENT 'The order budget quantity.',
  `ORDER_FRCST_AMT` Decimal(26,2)
 COMMENT 'The order forecast amount.',
  `ORDER_FRCST_QTY` Int
 COMMENT 'The order forecast quantity.',
  `ORDER_ACTUALS_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The order actuals amount.',
  `ORDER_ACTUALS_QTY` Int DEFAULT "0"
 COMMENT 'The order actuals quantity.',
  `MANUFACTURING_BUDGET_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The manufacturing budget amount.',
  `MANUFACTURING_BUDGET_QTY` Int DEFAULT "0"
 COMMENT 'The manufacturing budget quantity.',
  `MANUFACTURING_FRCST_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The manufacturing forecast amount.',
  `MANUFACTURING_FRCST_QTY` Int DEFAULT "0"
 COMMENT 'The manufacturing forecast quantity.',
  `MANUFACTURING_ACTUALS_QTY` Int DEFAULT "0"
 COMMENT 'The manufacturing actuals quantity.',
  `MANUFACTURING_ACTUALS_AMT` Decimal(26,2) DEFAULT "0.00"
 COMMENT 'The manufacturing actuals amount.',
  `BASE_CURRENCY_EXCHANGE_RATE` Decimal(26,9) DEFAULT "1.000000000"
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `DW_ERROR_IND` Char(1)
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1)
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The budget forecast item stage fact table.'
;

-- Table STAGE_INVENTORY_ADJUSTMENT

CREATE TABLE `STAGE_INVENTORY_ADJUSTMENT`
(
  `INV_ADJUSTMENT_ID` Varchar(36) NOT NULL
 COMMENT 'The inventory adjustment identifier in the source system.  Alone, or in combination with other columns, this value uniquely identifies an inventory adjustment in the source.',
  `INV_ADJUSTMENT_SETID` Varchar(5) NOT NULL DEFAULT "SHARE"
 COMMENT 'The source system inventory adjustment SETID.  This column is often used as part of the unique identifer.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT "1"
 COMMENT 'The source system identifer.  This enables multiple source system capability.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The inventory adjustment effective date.',
  `INV_ADJUSTMENT_NAME` Varchar(60)
 COMMENT 'The inventory adjustment name.',
  `INV_ADJUSTMENT_DESC` Varchar(255)
 COMMENT 'The inventory adjustment description',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_ERROR_IND` Char(1) DEFAULT "N"
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT "N"
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The inventory adjustment stage table.'
;

ALTER TABLE `STAGE_INVENTORY_ADJUSTMENT` ADD  PRIMARY KEY (`INV_ADJUSTMENT_ID`,`INV_ADJUSTMENT_SETID`,`SOURCE_SYSTEM_ID`)
;

-- Table STAGE_TREE_ACCOUNT

CREATE TABLE `STAGE_TREE_ACCOUNT`
(
  `ACCOUNT_ID` Varchar(36) NOT NULL
 COMMENT 'The account identifier in the source system.  Alone, or in combination with other columns (e.g., business unit, setid, source system), this value uniquely identifiers an account in the source.',
  `ACCOUNT_SETID` Varchar(5) NOT NULL DEFAULT "SHARE"
 COMMENT 'The source system account SETID.  In PeopleSoft, this column is often used as part of the unique identifer, similar to the MANDT (CLIENT) column in SAP.',
  `HIERARCHY_TYPE_NAME` Varchar(60) NOT NULL DEFAULT "ACCOUNT"
 COMMENT 'The type of hierarcy.',
  `SOURCE_SYSTEM_ID` Int NOT NULL DEFAULT "1"
 COMMENT 'The source system surrogate key.  All dimensions and base grain fact tables must include this column to enable multiple source system capability.',
  `EFFECTIVE_DATE` Datetime
 COMMENT 'The effective date.',
  `ACCOUNT_NAME` Varchar(60)
 COMMENT 'The account name.',
  `ACCOUNT_LEVEL1_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 1 identifier in the source system hierarchy.  This is the top or root level.',
  `ACCOUNT_LEVEL2_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 2 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL3_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 3 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL4_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 4 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL5_ID` Varchar(36) DEFAULT "0"
 COMMENT 'The account level 5 identifier in the source system hierarchy.',
  `ACCOUNT_LEVEL1_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 1 name in the source system hierarchy.  This is the top or root level.',
  `ACCOUNT_LEVEL2_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 2 name in the source system hierarchy.',
  `ACCOUNT_LEVEL3_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 2 name in the source system hierarchy.',
  `ACCOUNT_LEVEL4_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 2 name in the source system hierarchy.',
  `ACCOUNT_LEVEL5_NAME` Varchar(60) DEFAULT "Missing"
 COMMENT 'The account level 2 name in the source system hierarchy.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.',
  `DW_ERROR_IND` Char(1) DEFAULT "N"
 COMMENT 'This denotes if a particular row in the staging table has failed a previous load attempt.',
  `DW_SOFT_DELETE_IND` Char(1) DEFAULT "N"
 COMMENT 'This denotes that a row in the stage table has been soft-deleted.  Soft deleted have been sucessfully loaded into the data warehouse.'
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The account finance stage hierarchy tree.'
;

ALTER TABLE `STAGE_TREE_ACCOUNT` ADD  PRIMARY KEY (`ACCOUNT_ID`,`ACCOUNT_SETID`,`HIERARCHY_TYPE_NAME`,`SOURCE_SYSTEM_ID`)
;

-- Table ADMIN_MODULE_TABLE_COLUMN

CREATE TABLE `ADMIN_MODULE_TABLE_COLUMN`
(
  `COLUMN_SK` Int NOT NULL AUTO_INCREMENT,
  `TABLE_SK` Int NOT NULL,
  `TABLE_NAME` Varchar(64) NOT NULL,
  `COLUMN_NAME` Varchar(64) NOT NULL,
  `LOGICAL_NAME` Varchar(64),
  `PRESENTATION_LAYER_IND` Char(1) DEFAULT "Y"
 COMMENT 'The indicator that denotes if a column should be exposed in the presentation layer.',
  PRIMARY KEY (`COLUMN_SK`)
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The module table column admin table.'
;

-- Table ADMIN_MODULE_TABLE_RELATION

CREATE TABLE `ADMIN_MODULE_TABLE_RELATION`
(
  `RELATION_SK` Int NOT NULL DEFAULT 0 AUTO_INCREMENT,
  `RELATIONSHIP_NAME` Varchar(64),
  `PARENT_TABLE_SK` Int,
  `PARENT_TABLE_NAME` Varchar(64) NOT NULL,
  `PARENT_COLUMN_SK` Int,
  `PARENT_COLUMN_NAME` Varchar(64) NOT NULL,
  `CHILD_TABLE_SK` Int,
  `CHILD_TABLE_NAME` Varchar(64),
  `CHILD_COLUMN_SK` Int NOT NULL,
  `CHILD_COLUMN_NAME` Varchar(64),
  `DW_LOAD_DATE` Timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`RELATION_SK`)
) ENGINE = MyISAM
 ROW_FORMAT = Dynamic
 COMMENT = 'The module table relation admin table.'
;

-- Table FACT_CURRENCY_EXCHANGE

CREATE TABLE `FACT_CURRENCY_EXCHANGE`
(
  `CURRENCY_TO_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The currency to (buying) surrogate key.  This relates to the currency dimension.',
  `CURRENCY_FROM_SK` Int NOT NULL DEFAULT 0
 COMMENT 'The currency from (selling) surrogate key.  This relates to the currency dimension.',
  `EXCHANGE_RATE_START_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The currency exchange range start date (range) surrogate key.  This relates to the day dimension.',
  `EXCHANGE_RATE_STOP_DATE_SK` Int UNSIGNED NOT NULL DEFAULT 0
 COMMENT 'The currency exchange range stop date (range) surrogate key.  This relates to the day dimension.',
  `EXCHANGE_RATE_START_DATE` Datetime
 COMMENT 'The currency exchange rate range start date.',
  `EXCHANGE_RATE_STOP_DATE` Datetime
 COMMENT 'The currency exchange rate range stop date.',
  `EXCHANGE_RATE` Decimal(26,9) DEFAULT "1.000000000"
 COMMENT 'The currency exchange rate used to convert the transaction amount to the base amount.  This column defaults to 1.',
  `HOSTED_CLIENT_SK` Int DEFAULT "0"
 COMMENT 'The hosted client surrogate key.  The relates to the hosted client admin table.',
  `DW_LOAD_DATE` Timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
 COMMENT 'The date the row was inserted or updated into the data warehouse table.'
) ENGINE = MyISAM
 ROW_FORMAT = Fixed
 COMMENT = 'The currency exchange fact table.'
;

ALTER TABLE `FACT_CURRENCY_EXCHANGE` ADD  PRIMARY KEY (`CURRENCY_FROM_SK`,`CURRENCY_TO_SK`,`EXCHANGE_RATE_START_DATE_SK`,`EXCHANGE_RATE_STOP_DATE_SK`)
;

-- Create views section -------------------------------------------------

CREATE DEFINER = 'mdw_user'@'%'
VIEW `FACT_AD_IMPRESSION_DEMO`
AS select `FACT_ADVERTISEMENT_IMPRESSION`.`IMPRESSION_DATE_SK` AS `IMPRESSION_DATE_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`CAMPAIGN_WAVE_SK` AS `CAMPAIGN_WAVE_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`AD_SK` AS `AD_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`CUSTOMER_SK` AS `CUSTOMER_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`KEYWORD_SK` AS `KEYWORD_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`AD_IMPRESSION_QTY` AS `AD_IMPRESSION_QTY`,`FACT_ADVERTISEMENT_IMPRESSION`.`AD_CLICK_QTY` AS `AD_CLICK_QTY`,`FACT_ADVERTISEMENT_IMPRESSION`.`AD_COST_AMT` AS `AD_COST_AMT`,`FACT_ADVERTISEMENT_IMPRESSION`.`AVERAGE_POSITION_QTY` AS `AVERAGE_POSITION_QTY`,`FACT_ADVERTISEMENT_IMPRESSION`.`DW_LOAD_DATE` AS `DW_LOAD_DATE`,`FACT_ADVERTISEMENT_IMPRESSION`.`IMPRESSION_DATE` AS `IMPRESSION_DATE`,`FACT_ADVERTISEMENT_IMPRESSION`.`TRXN_CURRENCY_SK` AS `TRXN_CURRENCY_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`PRODUCT_SK` AS `PRODUCT_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`CPC_AVERAGE_AMT` AS `CPC_AVERAGE_AMT`,`FACT_ADVERTISEMENT_IMPRESSION`.`AD_CLICK_RATE` AS `AD_CLICK_RATE`,`FACT_ADVERTISEMENT_IMPRESSION`.`CONTENT_BID_AMT` AS `CONTENT_BID_AMT`,`FACT_ADVERTISEMENT_IMPRESSION`.`PREFERED_HIGH_RANK_QTY` AS `PREFERED_HIGH_RANK_QTY`,`FACT_ADVERTISEMENT_IMPRESSION`.`PREFERED_LOW_RANK_QTY` AS `PREFERED_LOW_RANK_QTY`,`FACT_ADVERTISEMENT_IMPRESSION`.`SOURCE_SYSTEM_SK` AS `SOURCE_SYSTEM_SK`,`FACT_ADVERTISEMENT_IMPRESSION`.`HOSTED_CLIENT_SK` AS `HOSTED_CLIENT_SK` from `FACT_ADVERTISEMENT_IMPRESSION` where (`FACT_ADVERTISEMENT_IMPRESSION`.`HOSTED_CLIENT_SK` = 0)
;

CREATE DEFINER = 'mdw_user'@'%'
VIEW `FACT_PHYSICAL_INVENTORY_V`
AS select `FACT_PHYSICAL_INVENTORY`.`SNAPSHOT_DATE_SK` AS `SNAPSHOT_DATE_SK`,`FACT_PHYSICAL_INVENTORY`.`PRODUCT_SK` AS `PRODUCT_SK`,`FACT_PHYSICAL_INVENTORY`.`PRODUCT_LOT_SK` AS `PRODUCT_LOT_SK`,`FACT_PHYSICAL_INVENTORY`.`BUSINESS_UNIT_SK` AS `BUSINESS_UNIT_SK`,`FACT_PHYSICAL_INVENTORY`.`WAREHOUSE_SK` AS `WAREHOUSE_SK`,`FACT_PHYSICAL_INVENTORY`.`SUPPLIER_SK` AS `SUPPLIER_SK`,`FACT_PHYSICAL_INVENTORY`.`INV_UOM_SK` AS `INV_UOM_SK`,`FACT_PHYSICAL_INVENTORY`.`BASE_CURRENCY_SK` AS `BASE_CURRENCY_SK`,`FACT_PHYSICAL_INVENTORY`.`TRXN_CURRENCY_SK` AS `TRXN_CURRENCY_SK`,`FACT_PHYSICAL_INVENTORY`.`SOURCE_SYSTEM_SK` AS `SOURCE_SYSTEM_SK`,`FACT_PHYSICAL_INVENTORY`.`SNAPSHOT_DATE` AS `SNAPSHOT_DATE`,`FACT_PHYSICAL_INVENTORY`.`LATEST_SNAPSHOT_IND` AS `LATEST_SNAPSHOT_IND`,`FACT_PHYSICAL_INVENTORY`.`INV_OPEN_QTY` AS `INV_OPEN_QTY`,`FACT_PHYSICAL_INVENTORY`.`INV_RESTRICTED_QTY` AS `INV_RESTRICTED_QTY`,`FACT_PHYSICAL_INVENTORY`.`INV_HOLD_QTY` AS `INV_HOLD_QTY`,`FACT_PHYSICAL_INVENTORY`.`INV_REJECTED_QTY` AS `INV_REJECTED_QTY`,`FACT_PHYSICAL_INVENTORY`.`INV_UNIT_COST_AMT` AS `INV_UNIT_COST_AMT`,`FACT_PHYSICAL_INVENTORY`.`INV_UNIT_PRICE_AMT` AS `INV_UNIT_PRICE_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_OPEN_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_COST_AMT`) AS `INV_OPEN_COST_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_RESTRICTED_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_COST_AMT`) AS `INV_RESTRICTED_COST_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_HOLD_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_COST_AMT`) AS `INV_HOLD_COST_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_REJECTED_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_COST_AMT`) AS `INV_REJECTED_COST_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_OPEN_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_PRICE_AMT`) AS `INV_OPEN_PRICE_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_RESTRICTED_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_PRICE_AMT`) AS `INV_RESTRICTED_PRICE_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_HOLD_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_PRICE_AMT`) AS `INV_HOLD_PRICE_AMT`,(`FACT_PHYSICAL_INVENTORY`.`INV_REJECTED_QTY` * `FACT_PHYSICAL_INVENTORY`.`INV_UNIT_PRICE_AMT`) AS `INV_REJECTED_PRICE_AMT`,`FACT_PHYSICAL_INVENTORY`.`BASE_CURRENCY_EXCHANGE_RATE` AS `BASE_CURRENCY_EXCHANGE_RATE`,`FACT_PHYSICAL_INVENTORY`.`HOSTED_CLIENT_SK` AS `HOSTED_CLIENT_SK`,`FACT_PHYSICAL_INVENTORY`.`DW_LOAD_DATE` AS `DW_LOAD_DATE` from `FACT_PHYSICAL_INVENTORY`
;

CREATE DEFINER = 'mdw_user'@'%'
VIEW `FACT_WEB_PAGE_VIEW_DEMO`
AS select `FACT_WEB_PAGE_VIEW`.`REQUEST_DATE` AS `REQUEST_DATE`,`FACT_WEB_PAGE_VIEW`.`WEB_VISITOR_SK` AS `WEB_VISITOR_SK`,`FACT_WEB_PAGE_VIEW`.`WEB_FILE_SK` AS `WEB_FILE_SK`,`FACT_WEB_PAGE_VIEW`.`SOURCE_SYSTEM_SK` AS `SOURCE_SYSTEM_SK`,`FACT_WEB_PAGE_VIEW`.`REQUEST_DATE_SK` AS `REQUEST_DATE_SK`,`FACT_WEB_PAGE_VIEW`.`REQUEST_TIME_SK` AS `REQUEST_TIME_SK`,`FACT_WEB_PAGE_VIEW`.`GEO_LOCATION_SK` AS `GEO_LOCATION_SK`,`FACT_WEB_PAGE_VIEW`.`REFERER_URL_SK` AS `REFERER_URL_SK`,`FACT_WEB_PAGE_VIEW`.`WEB_BROWSER_OS_SK` AS `WEB_BROWSER_OS_SK`,`FACT_WEB_PAGE_VIEW`.`CUSTOMER_SK` AS `CUSTOMER_SK`,`FACT_WEB_PAGE_VIEW`.`CAMPAIGN_WAVE_SK` AS `CAMPAIGN_WAVE_SK`,`FACT_WEB_PAGE_VIEW`.`PRODUCT_SK` AS `PRODUCT_SK`,`FACT_WEB_PAGE_VIEW`.`KEYWORD_SK` AS `KEYWORD_SK`,`FACT_WEB_PAGE_VIEW`.`CLICK_ID` AS `CLICK_ID`,`FACT_WEB_PAGE_VIEW`.`VIEW_ORDER_NUMBER` AS `VIEW_ORDER_NUMBER`,`FACT_WEB_PAGE_VIEW`.`WEB_FILE_BYTE_QTY` AS `WEB_FILE_BYTE_QTY`,`FACT_WEB_PAGE_VIEW`.`WEB_PAGE_VIEW_QTY` AS `WEB_PAGE_VIEW_QTY`,`FACT_WEB_PAGE_VIEW`.`ROBOT_PAGE_VIEW_QTY` AS `ROBOT_PAGE_VIEW_QTY`,`FACT_WEB_PAGE_VIEW`.`VIEW_SECONDS_QTY` AS `VIEW_SECONDS_QTY`,`FACT_WEB_PAGE_VIEW`.`LANDING_PAGE_QTY` AS `LANDING_PAGE_QTY`,`FACT_WEB_PAGE_VIEW`.`EXIT_PAGE_QTY` AS `EXIT_PAGE_QTY`,`FACT_WEB_PAGE_VIEW`.`PAID_VIEW_QTY` AS `PAID_VIEW_QTY`,`FACT_WEB_PAGE_VIEW`.`ORGANIC_VIEW_QTY` AS `ORGANIC_VIEW_QTY`,`FACT_WEB_PAGE_VIEW`.`SYNDICATION_VIEW_QTY` AS `SYNDICATION_VIEW_QTY`,`FACT_WEB_PAGE_VIEW`.`BOUNCE_QTY` AS `BOUNCE_QTY`,`FACT_WEB_PAGE_VIEW`.`HOSTED_CLIENT_SK` AS `HOSTED_CLIENT_SK`,`FACT_WEB_PAGE_VIEW`.`DW_LOAD_DATE` AS `DW_LOAD_DATE` from `FACT_WEB_PAGE_VIEW` where (`FACT_WEB_PAGE_VIEW`.`HOSTED_CLIENT_SK` = 0)
;

CREATE DEFINER = 'mdw_user'@'%'
VIEW `FACT_WEB_SITE_REFERER_DEMO`
AS select `FACT_WEB_SITE_REFERER`.`REFERRAL_DATE_SK` AS `REFERRAL_DATE_SK`,`FACT_WEB_SITE_REFERER`.`REFERER_URL_SK` AS `REFERER_URL_SK`,`FACT_WEB_SITE_REFERER`.`WEB_FILE_SK` AS `WEB_FILE_SK`,`FACT_WEB_SITE_REFERER`.`GEO_LOCATION_SK` AS `GEO_LOCATION_SK`,`FACT_WEB_SITE_REFERER`.`WEB_VISITOR_SK` AS `WEB_VISITOR_SK`,`FACT_WEB_SITE_REFERER`.`KEYWORD_SK` AS `KEYWORD_SK`,`FACT_WEB_SITE_REFERER`.`SOURCE_SYSTEM_SK` AS `SOURCE_SYSTEM_SK`,`FACT_WEB_SITE_REFERER`.`HOSTED_CLIENT_SK` AS `HOSTED_CLIENT_SK`,`FACT_WEB_SITE_REFERER`.`CUSTOMER_SK` AS `CUSTOMER_SK`,`FACT_WEB_SITE_REFERER`.`PRODUCT_SK` AS `PRODUCT_SK`,`FACT_WEB_SITE_REFERER`.`REFERRAL_QTY` AS `REFERRAL_QTY`,`FACT_WEB_SITE_REFERER`.`WEB_FILE_BYTE_QTY` AS `WEB_FILE_BYTE_QTY`,`FACT_WEB_SITE_REFERER`.`WEB_PAGE_VIEW_QTY` AS `WEB_PAGE_VIEW_QTY`,`FACT_WEB_SITE_REFERER`.`VIEW_SECONDS_QTY` AS `VIEW_SECONDS_QTY`,`FACT_WEB_SITE_REFERER`.`PAID_VIEW_QTY` AS `PAID_VIEW_QTY`,`FACT_WEB_SITE_REFERER`.`ORGANIC_VIEW_QTY` AS `ORGANIC_VIEW_QTY`,`FACT_WEB_SITE_REFERER`.`SYNDICATION_VIEW_QTY` AS `SYNDICATION_VIEW_QTY`,`FACT_WEB_SITE_REFERER`.`DW_LOAD_DATE` AS `DW_LOAD_DATE` from `FACT_WEB_SITE_REFERER` where (`FACT_WEB_SITE_REFERER`.`HOSTED_CLIENT_SK` = 0)
;

CREATE DEFINER = 'mdw_user'@'%'
VIEW `FACT_WEB_SITE_VISIT_DEMO`
AS select `FACT_WEB_SITE_VISIT`.`VISIT_DATE_SK` AS `VISIT_DATE_SK`,`FACT_WEB_SITE_VISIT`.`SOURCE_SYSTEM_SK` AS `SOURCE_SYSTEM_SK`,`FACT_WEB_SITE_VISIT`.`GEO_LOCATION_SK` AS `GEO_LOCATION_SK`,`FACT_WEB_SITE_VISIT`.`WEB_VISITOR_SK` AS `WEB_VISITOR_SK`,`FACT_WEB_SITE_VISIT`.`CAMPAIGN_WAVE_SK` AS `CAMPAIGN_WAVE_SK`,`FACT_WEB_SITE_VISIT`.`CUSTOMER_SK` AS `CUSTOMER_SK`,`FACT_WEB_SITE_VISIT`.`EXIT_WEB_FILE_SK` AS `EXIT_WEB_FILE_SK`,`FACT_WEB_SITE_VISIT`.`KEYWORD_SK` AS `KEYWORD_SK`,`FACT_WEB_SITE_VISIT`.`LANDING_WEB_FILE_SK` AS `LANDING_WEB_FILE_SK`,`FACT_WEB_SITE_VISIT`.`PRODUCT_SK` AS `PRODUCT_SK`,`FACT_WEB_SITE_VISIT`.`REFERER_URL_SK` AS `REFERER_URL_SK`,`FACT_WEB_SITE_VISIT`.`WEB_BROWSER_OS_SK` AS `WEB_BROWSER_OS_SK`,`FACT_WEB_SITE_VISIT`.`WEB_NAVIGATION_PATH_SK` AS `WEB_NAVIGATION_PATH_SK`,`FACT_WEB_SITE_VISIT`.`VISIT_DATE` AS `VISIT_DATE`,`FACT_WEB_SITE_VISIT`.`WEB_VISIT_QTY` AS `WEB_VISIT_QTY`,`FACT_WEB_SITE_VISIT`.`WEB_FILE_BYTE_QTY` AS `WEB_FILE_BYTE_QTY`,`FACT_WEB_SITE_VISIT`.`WEB_PAGE_VIEW_QTY` AS `WEB_PAGE_VIEW_QTY`,`FACT_WEB_SITE_VISIT`.`NEW_VISITOR_QTY` AS `NEW_VISITOR_QTY`,`FACT_WEB_SITE_VISIT`.`RETURNING_VISITOR_QTY` AS `RETURNING_VISITOR_QTY`,`FACT_WEB_SITE_VISIT`.`ROBOT_PAGE_VIEW_QTY` AS `ROBOT_PAGE_VIEW_QTY`,`FACT_WEB_SITE_VISIT`.`VIEW_SECONDS_QTY` AS `VIEW_SECONDS_QTY`,`FACT_WEB_SITE_VISIT`.`PAID_VISIT_QTY` AS `PAID_VISIT_QTY`,`FACT_WEB_SITE_VISIT`.`ORGANIC_VISIT_QTY` AS `ORGANIC_VISIT_QTY`,`FACT_WEB_SITE_VISIT`.`SYNDICATION_VIEW_QTY` AS `SYNDICATION_VIEW_QTY`,`FACT_WEB_SITE_VISIT`.`HOSTED_CLIENT_SK` AS `HOSTED_CLIENT_SK`,`FACT_WEB_SITE_VISIT`.`DW_LOAD_DATE` AS `DW_LOAD_DATE` from `FACT_WEB_SITE_VISIT` where (`FACT_WEB_SITE_VISIT`.`HOSTED_CLIENT_SK` = 0)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_AD_FK` FOREIGN KEY (`AD_SK`) REFERENCES `DIMENSION_ADVERTISEMENT` (`AD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_AGREEMENT_FK` FOREIGN KEY (`AGREEMENT_SK`) REFERENCES `DIMENSION_AGREEMENT` (`AGREEMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_STATUS_FK` FOREIGN KEY (`APPLICATION_STATUS_SK`) REFERENCES `DIMENSION_APPLICATION_STATUS` (`APPLICATION_STATUS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_BANK_ACCOUNT_FK` FOREIGN KEY (`BANK_ACCOUNT_SK`) REFERENCES `DIMENSION_BANK_ACCOUNT` (`BANK_ACCOUNT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_BILL_STATUS_FK` FOREIGN KEY (`BILL_STATUS_SK`) REFERENCES `DIMENSION_BILL_STATUS` (`BILL_STATUS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_BILL_TYPE_FK` FOREIGN KEY (`BILL_TYPE_SK`) REFERENCES `DIMENSION_BILL_TYPE` (`BILL_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_BUDGET_FK` FOREIGN KEY (`BUDGET_SK`) REFERENCES `DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_BUDGET_FK` FOREIGN KEY (`BUDGET_SK`) REFERENCES `DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_BUDGET_FK` FOREIGN KEY (`BUDGET_SK`) REFERENCES `DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_BUDGET_FORECAST_ITEM` ADD CONSTRAINT `DIM_BDGT_FRCST_FK` FOREIGN KEY (`BUDGET_FRCST_SK`) REFERENCES `DIMENSION_BUDGET_FORECAST` (`BUDGET_FRCST_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_BUDGET_ITEM_FK` FOREIGN KEY (`BUDGET_FRCST_ITEM_SK`) REFERENCES `DIMENSION_BUDGET_FORECAST_ITEM` (`BUDGET_FRCST_ITEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_AR_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_GL_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_GL_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_BUSINESS_UNIT_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `TREE_BUSINESS_UNIT` ADD CONSTRAINT `TREE_BUSINESS_UNIT_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_RESULT_FK` FOREIGN KEY (`CALL_RESULT_SK`) REFERENCES `DIMENSION_CALL_RESULT` (`CALL_RESULT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_RESULT_FK` FOREIGN KEY (`CALL_RESULT_SK`) REFERENCES `DIMENSION_CALL_RESULT` (`CALL_RESULT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_TYPE_FK` FOREIGN KEY (`CALL_TYPE_SK`) REFERENCES `DIMENSION_CALL_TYPE` (`CALL_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_TYPE_FK` FOREIGN KEY (`CALL_TYPE_SK`) REFERENCES `DIMENSION_CALL_TYPE` (`CALL_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_CAMPAIGN_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CAMPAIGN_WAVE_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_CMPGN_WV_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_CMPGN_WAVE_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_CMPGN_WAVE_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_CMPGN_WAVE_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_CMPGN_WAVE_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_CMPGN_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_CMPGN_FK` FOREIGN KEY (`CAMPAIGN_WAVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE` (`CAMPAIGN_WAVE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_CARRIER_FK` FOREIGN KEY (`CARRIER_SK`) REFERENCES `DIMENSION_CARRIER` (`CARRIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_CASE_FK` FOREIGN KEY (`CASE_SK`) REFERENCES `DIMENSION_CASE` (`CASE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CASE_FK` FOREIGN KEY (`CASE_SK`) REFERENCES `DIMENSION_CASE` (`CASE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_CASE_FK` FOREIGN KEY (`CASE_SK`) REFERENCES `DIMENSION_CASE` (`CASE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_CLASS_FK` FOREIGN KEY (`CLASSIFICATION_SK`) REFERENCES `DIMENSION_CLASSIFICATION` (`CLASSIFICATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_CLASS_FK` FOREIGN KEY (`CLASSIFICATION_SK`) REFERENCES `DIMENSION_CLASSIFICATION` (`CLASSIFICATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_CLASS_FK` FOREIGN KEY (`CLASSIFICATION_SK`) REFERENCES `DIMENSION_CLASSIFICATION` (`CLASSIFICATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_CLASS_FK` FOREIGN KEY (`CLASSIFICATION_SK`) REFERENCES `DIMENSION_CLASSIFICATION` (`CLASSIFICATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_COMPANY_FK` FOREIGN KEY (`COMPANY_SK`) REFERENCES `DIMENSION_COMPANY` (`COMPANY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_COMPANY_FK` FOREIGN KEY (`COMPANY_SK`) REFERENCES `DIMENSION_COMPANY` (`COMPANY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_COMPANY_FK` FOREIGN KEY (`COMPANY_SK`) REFERENCES `DIMENSION_COMPANY` (`COMPANY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_COMPANY_FK` FOREIGN KEY (`COMPANY_SK`) REFERENCES `DIMENSION_COMPANY` (`COMPANY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_COMPANY_FK` FOREIGN KEY (`COMPANY_SK`) REFERENCES `DIMENSION_COMPANY` (`COMPANY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_PAYGROUP_FK` FOREIGN KEY (`PAYGROUP_SK`) REFERENCES `DIMENSION_COMPANY_PAYGROUP` (`PAYGROUP_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_CONTRACT_FK` FOREIGN KEY (`CONTRACT_SK`) REFERENCES `DIMENSION_CONTRACT` (`CONTRACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_CONTRACT_FK` FOREIGN KEY (`CONTRACT_SK`) REFERENCES `DIMENSION_CONTRACT` (`CONTRACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_CONTRACT_FK` FOREIGN KEY (`CONTRACT_SK`) REFERENCES `DIMENSION_CONTRACT` (`CONTRACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_CONTRACT_FK` FOREIGN KEY (`CONTRACT_SK`) REFERENCES `DIMENSION_CONTRACT` (`CONTRACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_CONTRACT_FK` FOREIGN KEY (`CONTRACT_SK`) REFERENCES `DIMENSION_CONTRACT` (`CONTRACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_CONTRACT_FK` FOREIGN KEY (`CONTRACT_SK`) REFERENCES `DIMENSION_CONTRACT` (`CONTRACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_COST_CENTER_FK` FOREIGN KEY (`COST_CENTER_SK`) REFERENCES `DIMENSION_COST_CENTER` (`COST_CENTER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_COST_CENTER_FK` FOREIGN KEY (`COST_CENTER_SK`) REFERENCES `DIMENSION_COST_CENTER` (`COST_CENTER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_COST_CENTER_FK` FOREIGN KEY (`COST_CENTER_SK`) REFERENCES `DIMENSION_COST_CENTER` (`COST_CENTER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_CRNCY_FK` FOREIGN KEY (`CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_PAYMENT_TERMS` ADD CONSTRAINT `DIM_PAY_TERMS_CRNCY_FK` FOREIGN KEY (`CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_TRXN_CURRENCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_TRXN_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_TRXN_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_CURRENCY_FK` FOREIGN KEY (`CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_CURRENCY_FK` FOREIGN KEY (`CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_CURRENCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_BASE_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_TRXN_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAYABLE_TIME_CURRENCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_PO_BASE_CRNCY_FK` FOREIGN KEY (`REQUISITION_TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `F_PROCURE_RQSTN_TRXN_CRNCY_FK` FOREIGN KEY (`REQUISITION_BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_BASE_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_TRXN_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_BASE_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_TRXN_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_BASE_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_TRXN_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_BASE_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_TRXN_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_TRXN_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_BASE_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESS_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_KEYWORD_PHRASE` ADD CONSTRAINT `DIM_KEYWORD_PHRASE_CRNCY_FK` FOREIGN KEY (`CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `F_PROCURE_RQSTN_BASE_CRNCY_FK` FOREIGN KEY (`PO_TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `F_PROCURE_PO_TRXN_CRNCY_FK` FOREIGN KEY (`PO_BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_TRXN_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_BASE_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_BILL_CUST_FK` FOREIGN KEY (`CUSTOMER_BILL_TO_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_SHIP_CUST_FK` FOREIGN KEY (`CUSTOMER_SHIP_TO_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_CUSTOMER_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_CUSTOMER_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_BILL_CUST_FK` FOREIGN KEY (`BILL_CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_SHIP_CUST_FK` FOREIGN KEY (`SHIP_CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REFERER_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_CUSTOMER_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_CUST_CONTACT_FK` FOREIGN KEY (`CUSTOMER_CONTACT_SK`) REFERENCES `DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_CUST_CONTACT_FK` FOREIGN KEY (`CUSTOMER_CONTACT_SK`) REFERENCES `DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_CUST_CONTACT_FK` FOREIGN KEY (`CUSTOMER_CONTACT_SK`) REFERENCES `DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_CUST_CONTACT_FK` FOREIGN KEY (`CUSTOMER_CONTACT_SK`) REFERENCES `DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_CUST_CONTACT_FK` FOREIGN KEY (`CUSTOMER_CONTACT_SK`) REFERENCES `DIMENSION_CUSTOMER_CONTACT` (`CUSTOMER_CONTACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_ACT_DT_FK` FOREIGN KEY (`EFFECTIVE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_ASGN_SP_DT_FK` FOREIGN KEY (`JOB_ACTION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_ASGN_ST_DT_FK` FOREIGN KEY (`EXPIRATION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_DEPT_DT_FK` FOREIGN KEY (`DEPARTMENT_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_EFF_DT_FK` FOREIGN KEY (`GRADE_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_EXP_DT_FK` FOREIGN KEY (`JOB_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_GRADE_DT_FK` FOREIGN KEY (`JOB_STOP_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_HIRE_DT_FK` FOREIGN KEY (`POSITION_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_JOB_DT_FK` FOREIGN KEY (`STEP_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_EFFECTIVE_DT_FK` FOREIGN KEY (`EFFECTIVE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_ESTABLISH_DT_FK` FOREIGN KEY (`POSITION_ESTABLISHED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_DISCOUNT_DUE_DATE_FK` FOREIGN KEY (`TRXN_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_MAX_SCH_PAY_DUE_DT_FK` FOREIGN KEY (`TRXN_DUE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_TRXN_DATE_FK` FOREIGN KEY (`DISCOUNT_DUE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_TRXN_DUE_DATE_FK` FOREIGN KEY (`MAX_SCHEDULED_PAYMENT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_JRNL_DATE_FK` FOREIGN KEY (`JOURNAL_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_DAY_FK` FOREIGN KEY (`IMPRESSION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_ACCOUNT_DATE_FK` FOREIGN KEY (`ORDER_CAPTURE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_INVOICE_DATE_FK` FOREIGN KEY (`INVOICE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_ORDER_DATE_FK` FOREIGN KEY (`ACCOUNTING_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_CLOSED_DT_FK` FOREIGN KEY (`CASE_OPEN_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_OPEN_DT_FK` FOREIGN KEY (`CASE_CLOSED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_END_DT_FK` FOREIGN KEY (`CALL_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_START_DT_FK` FOREIGN KEY (`CALL_END_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_END_DT_FK` FOREIGN KEY (`CALL_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_START_DT_FK` FOREIGN KEY (`CALL_END_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_TRXN_DATE_FK` FOREIGN KEY (`TRXN_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_SALE_DATE_FK` FOREIGN KEY (`SALE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_CAPTURE_DATE_FK` FOREIGN KEY (`ORDER_CAPTURE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_REPORT_DT_FK` FOREIGN KEY (`REPORT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_ACCEPT_DT_FK` FOREIGN KEY (`APPLICATION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_DECLINE_DT_FK` FOREIGN KEY (`REVIEW_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_DT_FK` FOREIGN KEY (`TEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_INTRVW_DT_FK` FOREIGN KEY (`REJECT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_OFFER_DT_FK` FOREIGN KEY (`INTERVIEW_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_REJECT_DT_FK` FOREIGN KEY (`OFFER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_REVIEW_DT_FK` FOREIGN KEY (`ACCEPT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_START_DT_FK` FOREIGN KEY (`DECLINE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_TEST_DT_FK` FOREIGN KEY (`START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_SNAP_DATE_FK` FOREIGN KEY (`SNAPSHOT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_PO_DT_FK` FOREIGN KEY (`REQUEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_REQSTN_DT_FK` FOREIGN KEY (`REQUISITION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_SHIP_DT_FK` FOREIGN KEY (`PURCHASE_ORDER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_SN_DT_FK` FOREIGN KEY (`SHIPPING_NOTICE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_WR_DT_FK` FOREIGN KEY (`SHIP_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_PO_DATE_FK` FOREIGN KEY (`REQUEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_REQUEST_FK` FOREIGN KEY (`REQUISITION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_REQUISITION_DATE_FK` FOREIGN KEY (`PURCHASE_ORDER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_DATE_FK` FOREIGN KEY (`REQUEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_REQUEST_FK` FOREIGN KEY (`REQUISITION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_DATE_FK` FOREIGN KEY (`REQUEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_REQUEST_FK` FOREIGN KEY (`RETURN_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_ASSIGNED_DATE_FK` FOREIGN KEY (`CREATED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_CREATED_DATE_FK` FOREIGN KEY (`ASSIGNED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_DEAD_DATE_FK` FOREIGN KEY (`IN_PROCESS_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_IN_PROCESS_DATE_FK` FOREIGN KEY (`QUALIFIED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_QUALIFIED_DATE_FK` FOREIGN KEY (`DEAD_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_RECYCLED_DATE_FK` FOREIGN KEY (`RECYCLED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_CLSD_LST_DT_FK` FOREIGN KEY (`QUALIFIED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_CLSD_WON_DT_FK` FOREIGN KEY (`PROSPECTING_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_DCSN_MKR_ID_DT_FK` FOREIGN KEY (`DECISION_MAKER_ID_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_NDS_ANLYS_DT_FK` FOREIGN KEY (`NEEDS_ANALYSIS_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_NGTTN_DT_FK` FOREIGN KEY (`VALUE_PROPOSITION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_PRCE_QT_DT_FK` FOREIGN KEY (`PERCEPTION_ANALYSIS_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_PRCPT_ANLYS_DT_FK` FOREIGN KEY (`PRICE_QUOTE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_PRSPCTNG_DT_FK` FOREIGN KEY (`NEGOTIATION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_QLFD_DT_FK` FOREIGN KEY (`CLOSED_LOST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_VAL_PRPSTN_DT_FK` FOREIGN KEY (`CLOSED_WON_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_DEMAND_DATE_FK` FOREIGN KEY (`ORDER_CAPTURE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_ORDER_DATE_FK` FOREIGN KEY (`DEMAND_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_ORIG_SCHD_DATE_FK` FOREIGN KEY (`ORIGINAL_SCHEDULE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_SCHD_DATE_FK` FOREIGN KEY (`SCHEDULE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_SHIP_DATE_FK` FOREIGN KEY (`PICK_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_SHIP_EARLY_DATE_FK` FOREIGN KEY (`PACK_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_SHIP_LATE_DATE_FK` FOREIGN KEY (`LOAD_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_PO_DATE_FK` FOREIGN KEY (`REQUEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_REQUEST_FK` FOREIGN KEY (`REQUISITION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_REQUISITION_DATE_FK` FOREIGN KEY (`PURCHASE_ORDER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_SHIP_DATE_FK` FOREIGN KEY (`SHIPPING_NOTICE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_SHIP_NOTICE_DATE_FK` FOREIGN KEY (`SHIP_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_PO_DT_FK` FOREIGN KEY (`REQUEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_REQUEST_DT_FK` FOREIGN KEY (`REQUISITION_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_RQSTN_DT_FK` FOREIGN KEY (`PURCHASE_ORDER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_SHIP_DT_FK` FOREIGN KEY (`SHIPPING_NOTICE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_SN_DT_FK` FOREIGN KEY (`SHIP_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_WR_DT_FK` FOREIGN KEY (`WAREHOUSE_RECEIPT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_DAY_FK` FOREIGN KEY (`REQUEST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REF_DATE_FK` FOREIGN KEY (`REFERRAL_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_DATE_FK` FOREIGN KEY (`VISIT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_ASSIGN_DATE_FK` FOREIGN KEY (`WORK_ORDER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_COMPLETE_FK` FOREIGN KEY (`WORK_ORDER_ORDER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_DATE_FK` FOREIGN KEY (`WORK_ORDER_ASSIGN_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_ORDER_DATE_FK` FOREIGN KEY (`WORK_ORDER_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_START_DATE_FK` FOREIGN KEY (`WORK_ORDER_COMPLETE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_POS_ST_DT_FK` FOREIGN KEY (`HIRE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_JOB_STP_DT_FK` FOREIGN KEY (`ASSIGNMENT_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_STEP_ST_DT_FK` FOREIGN KEY (`ASSIGNMENT_STOP_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_CASE` ADD CONSTRAINT `DIM_CASE_OPEN_DATE_FK` FOREIGN KEY (`CASE_OPEN_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_REQUEST_DT_FK` FOREIGN KEY (`WAREHOUSE_RECEIPT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_PICK_DATE_FK` FOREIGN KEY (`SHIP_EARLY_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_PACK_DATE_FK` FOREIGN KEY (`SHIP_LATE_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_LOAD_DATE_FK` FOREIGN KEY (`SHIP_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_DELIVER_DATE_FK` FOREIGN KEY (`DELIVER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_CREATED_DATE_FK` FOREIGN KEY (`CREATED_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_SUSPECT_DATE_FK` FOREIGN KEY (`SUSPECT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_PROSPECT_DATE_FK` FOREIGN KEY (`PROSPECT_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_CUST_DATE_FK` FOREIGN KEY (`CUSTOMER_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_LOYALIST_DATE_FK` FOREIGN KEY (`LOYALIST_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAYABLE_TIME_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_DEPT_FK` FOREIGN KEY (`DEPARTMENT_SK`) REFERENCES `DIMENSION_DEPARTMENT` (`DEPARTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_DOCUMENT_TYPE_FK` FOREIGN KEY (`DOCUMENT_TYPE_SK`) REFERENCES `DIMENSION_DOCUMENT_TYPE` (`DOCUMENT_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_DOCUMENT_TYPE_FK` FOREIGN KEY (`DOCUMENT_TYPE_SK`) REFERENCES `DIMENSION_DOCUMENT_TYPE` (`DOCUMENT_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_EMPL_JOB_ACTN_FK` FOREIGN KEY (`EMPLOYEE_JOB_ACTION_SK`) REFERENCES `DIMENSION_EMPLOYEE_JOB_ACTION` (`EMPLOYEE_JOB_ACTION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_PERIOD_FK` FOREIGN KEY (`FISCAL_PERIOD_SK`) REFERENCES `DIMENSION_FISCAL_PERIOD` (`FISCAL_PERIOD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_FISCAL_PERIOD_FK` FOREIGN KEY (`FISCAL_PERIOD_SK`) REFERENCES `DIMENSION_FISCAL_PERIOD` (`FISCAL_PERIOD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_FUND_FK` FOREIGN KEY (`FUND_SK`) REFERENCES `DIMENSION_FUND` (`FUND_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_FUND_FK` FOREIGN KEY (`FUND_SK`) REFERENCES `DIMENSION_FUND` (`FUND_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_FUND_FK` FOREIGN KEY (`FUND_SK`) REFERENCES `DIMENSION_FUND` (`FUND_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_FUND_FK` FOREIGN KEY (`FUND_SK`) REFERENCES `DIMENSION_FUND` (`FUND_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_WEB_VISITOR` ADD CONSTRAINT `DIM_WEB_VISITOR_GEO_LOC_FK` FOREIGN KEY (`GEO_LOCATION_SK`) REFERENCES `DIMENSION_GEOGRAPHIC_LOCATION` (`GEO_LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_GEO_LOC_FK` FOREIGN KEY (`GEO_LOCATION_SK`) REFERENCES `DIMENSION_GEOGRAPHIC_LOCATION` (`GEO_LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REF_GEO_LOC_FK` FOREIGN KEY (`GEO_LOCATION_SK`) REFERENCES `DIMENSION_GEOGRAPHIC_LOCATION` (`GEO_LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_GEO_LOC_FK` FOREIGN KEY (`GEO_LOCATION_SK`) REFERENCES `DIMENSION_GEOGRAPHIC_LOCATION` (`GEO_LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_ADJUSTMENT_FK` FOREIGN KEY (`GL_ADJUSTMENT_SK`) REFERENCES `DIMENSION_GL_ADJUSTMENT` (`GL_ADJUSTMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_BOOK_FK` FOREIGN KEY (`GL_BOOK_SK`) REFERENCES `DIMENSION_GL_BOOK` (`GL_BOOK_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_BOOK_FK` FOREIGN KEY (`GL_BOOK_SK`) REFERENCES `DIMENSION_GL_BOOK` (`GL_BOOK_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_PRODUCT_LOT` FOREIGN KEY (`PRODUCT_LOT_SK`) REFERENCES `DIMENSION_PRODUCT_LOT` (`PRODUCT_LOT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_JOBCODE_FK` FOREIGN KEY (`JOBCODE_SK`) REFERENCES `DIMENSION_JOBCODE` (`JOBCODE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_JOBCODE_FK` FOREIGN KEY (`JOBCODE_SK`) REFERENCES `DIMENSION_JOBCODE` (`JOBCODE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_JOBCODE_FK` FOREIGN KEY (`JOBCODE_SK`) REFERENCES `DIMENSION_JOBCODE` (`JOBCODE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_JOBCODE_FK` FOREIGN KEY (`JOBCODE_SK`) REFERENCES `DIMENSION_JOBCODE` (`JOBCODE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_ACTION_FK` FOREIGN KEY (`JOB_ACTION_SK`) REFERENCES `DIMENSION_JOB_ACTION` (`JOB_ACTION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_KEYWORD_FK` FOREIGN KEY (`KEYWORD_SK`) REFERENCES `DIMENSION_KEYWORD_PHRASE` (`KEYWORD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_KEYWORD_FK` FOREIGN KEY (`KEYWORD_SK`) REFERENCES `DIMENSION_KEYWORD_PHRASE` (`KEYWORD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_KEYWORD_FK` FOREIGN KEY (`KEYWORD_SK`) REFERENCES `DIMENSION_KEYWORD_PHRASE` (`KEYWORD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REF_KEYWORD_FK` FOREIGN KEY (`KEYWORD_SK`) REFERENCES `DIMENSION_KEYWORD_PHRASE` (`KEYWORD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_LEDGER_FK` FOREIGN KEY (`LEDGER_SK`) REFERENCES `DIMENSION_LEDGER` (`LEDGER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_LEDGER_FK` FOREIGN KEY (`LEDGER_SK`) REFERENCES `DIMENSION_LEDGER` (`LEDGER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_LEDGER_FK` FOREIGN KEY (`LEDGER_SK`) REFERENCES `DIMENSION_LEDGER` (`LEDGER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_LOCATION_FK` FOREIGN KEY (`LOCATION_SK`) REFERENCES `DIMENSION_LOCATION` (`LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_LOCATION_FK` FOREIGN KEY (`LOCATION_SK`) REFERENCES `DIMENSION_LOCATION` (`LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_LOCATION_FK` FOREIGN KEY (`LOCATION_SK`) REFERENCES `DIMENSION_LOCATION` (`LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_LOC_FK` FOREIGN KEY (`LOCATION_SK`) REFERENCES `DIMENSION_LOCATION` (`LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_LOCATION_FK` FOREIGN KEY (`LOCATION_SK`) REFERENCES `DIMENSION_LOCATION` (`LOCATION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_MKT_CHANNEL_FK` FOREIGN KEY (`MARKETING_CHANNEL_SK`) REFERENCES `DIMENSION_MARKETING_CHANNEL` (`MARKETING_CHANNEL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_MKT_CHANNEL_FK` FOREIGN KEY (`MARKETING_CHANNEL_SK`) REFERENCES `DIMENSION_MARKETING_CHANNEL` (`MARKETING_CHANNEL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_MKT_CHANNEL_FK` FOREIGN KEY (`MARKETING_CHANNEL_SK`) REFERENCES `DIMENSION_MARKETING_CHANNEL` (`MARKETING_CHANNEL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_MKT_SEG_FK` FOREIGN KEY (`MARKETING_SEGMENT_SK`) REFERENCES `DIMENSION_MARKETING_SEGMENT` (`MARKETING_SEGMENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_MONTH_FK` FOREIGN KEY (`MONTH_SK`) REFERENCES `DIMENSION_MONTH` (`MONTH_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_OPER_UNIT_FK` FOREIGN KEY (`OPERATING_UNIT_SK`) REFERENCES `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_OPERATING_UNIT_FK` FOREIGN KEY (`OPERATING_UNIT_SK`) REFERENCES `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_OPER_UNIT_FK` FOREIGN KEY (`OPERATING_UNIT_SK`) REFERENCES `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_OPER_UNIT_FK` FOREIGN KEY (`OPERATING_UNIT_SK`) REFERENCES `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_OPER_UNIT_FK` FOREIGN KEY (`OPERATING_UNIT_SK`) REFERENCES `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_OPRTNG_UNIT_FK` FOREIGN KEY (`OPERATING_UNIT_SK`) REFERENCES `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_OPERATING_UNIT_FK` FOREIGN KEY (`OPERATING_UNIT_SK`) REFERENCES `DIMENSION_OPERATING_UNIT` (`OPERATING_UNIT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_OC_FK` FOREIGN KEY (`ORDER_CAPTURE_SK`) REFERENCES `DIMENSION_ORDER_CAPTURE` (`ORDER_CAPTURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_OC_FK` FOREIGN KEY (`ORDER_CAPTURE_SK`) REFERENCES `DIMENSION_ORDER_CAPTURE` (`ORDER_CAPTURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_OC_FK` FOREIGN KEY (`ORDER_CAPTURE_SK`) REFERENCES `DIMENSION_ORDER_CAPTURE` (`ORDER_CAPTURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_ORDER_STATUS_FK` FOREIGN KEY (`ORDER_STATUS_SK`) REFERENCES `DIMENSION_ORDER_STATUS` (`ORDER_STATUS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_ORDER_TYPE_FK` FOREIGN KEY (`ORDER_TYPE_SK`) REFERENCES `DIMENSION_ORDER_TYPE` (`ORDER_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_ORDER_TYPE_FK` FOREIGN KEY (`ORDER_TYPE_SK`) REFERENCES `DIMENSION_ORDER_TYPE` (`ORDER_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_ORDER_TYPE_FK` FOREIGN KEY (`ORDER_TYPE_SK`) REFERENCES `DIMENSION_ORDER_TYPE` (`ORDER_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_RELATED_ORDER_TYPE_FK` FOREIGN KEY (`RELATED_ORDER_TYPE_SK`) REFERENCES `DIMENSION_ORDER_TYPE` (`ORDER_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_PARTNER_FK` FOREIGN KEY (`PARTNER_SK`) REFERENCES `DIMENSION_PARTNER` (`PARTNER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_PARTNER_CONTACT_FK` FOREIGN KEY (`PARTNER_CONTACT_SK`) REFERENCES `DIMENSION_PARTNER_CONTACT` (`PARTNER_CONTACT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_PAYMENT_METHOD_FK` FOREIGN KEY (`PAYMENT_METHOD_SK`) REFERENCES `DIMENSION_PAYMENT_METHOD` (`PAYMENT_METHOD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_PAYMENT_TERMS_FK` FOREIGN KEY (`PAYMENT_TERMS_SK`) REFERENCES `DIMENSION_PAYMENT_TERMS` (`PAYMENT_TERMS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_CASE` ADD CONSTRAINT `DIM_CASE_AGENT_FK` FOREIGN KEY (`AGENT_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_CASE` ADD CONSTRAINT `DIM_CASE_PRIOR_AGENT_FK` FOREIGN KEY (`PRIOR_AGENT_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_EMPL_FK` FOREIGN KEY (`MANAGER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_MANAGER_FK` FOREIGN KEY (`EMPLOYEE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_MANAGER_FK` FOREIGN KEY (`MANAGER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_SALES_PERSON_FK` FOREIGN KEY (`SALES_REPRESENTATIVE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_AGENT_FK` FOREIGN KEY (`AGENT_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_PRIOR_AGENT_FK` FOREIGN KEY (`PRIOR_AGENT_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_AGENT_FK` FOREIGN KEY (`AGENT_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_AGENT_FK` FOREIGN KEY (`AGENT_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_SALES_PERSON_FK` FOREIGN KEY (`SALES_REPRESENTATIVE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_PERSON_FK` FOREIGN KEY (`EMPLOYEE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_APPLICANT_FK` FOREIGN KEY (`APPLICANT_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_RECRUITER_FK` FOREIGN KEY (`RECRUITER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_PURCHASER_FK` FOREIGN KEY (`REQUESTER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_REQUESTER_FK` FOREIGN KEY (`PURCHASER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_REQUESTER_FK` FOREIGN KEY (`REQUESTER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_AUTHORIZER_FK` FOREIGN KEY (`AUTHORIZER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_SALES_PERSON_FK` FOREIGN KEY (`SALES_REPRESENTATIVE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_SALES_PERSON_FK` FOREIGN KEY (`SALES_REPRESENTATIVE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_PURCHASER_FK` FOREIGN KEY (`PURCHASER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_REQUESTER_FK` FOREIGN KEY (`REQUESTER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_PURCHASER_FK` FOREIGN KEY (`REQUESTER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_RECEIVER_FK` FOREIGN KEY (`PURCHASER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_REQUESTER_FK` FOREIGN KEY (`RECEIVER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_EMPLOYEE_SK` FOREIGN KEY (`MANAGER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_ORIGINATOR_FK` FOREIGN KEY (`PLANNER_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_PLANNER_FK` FOREIGN KEY (`SUPERVISOR_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_SUPERVISOR_FK` FOREIGN KEY (`ORIGINATOR_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_PERSON_FK` FOREIGN KEY (`AP_PERSON_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_MANAGER_SK` FOREIGN KEY (`EMPLOYEE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_SALES_PERSON_FK` FOREIGN KEY (`SALES_REPRESENTATIVE_SK`) REFERENCES `DIMENSION_PERSON` (`PERSON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_POSITION_FK` FOREIGN KEY (`POSITION_SK`) REFERENCES `DIMENSION_POSITION` (`POSITION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_POSITION_FK` FOREIGN KEY (`POSITION_SK`) REFERENCES `DIMENSION_POSITION` (`POSITION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_POSITION_FK` FOREIGN KEY (`POSITION_SK`) REFERENCES `DIMENSION_POSITION` (`POSITION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_POSITION_FK` FOREIGN KEY (`POSITION_SK`) REFERENCES `DIMENSION_POSITION` (`POSITION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_PRODUCT1_FK` FOREIGN KEY (`PRODUCT1_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_PRODUCT2_FK` FOREIGN KEY (`PRODUCT2_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REFER_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_PRODUCT_SK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_RECEIVABLE` ADD CONSTRAINT `FACT_AR_PROGRAM_FK` FOREIGN KEY (`PROGRAM_SK`) REFERENCES `DIMENSION_PROGRAM` (`PROGRAM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_PROGRAM_FK` FOREIGN KEY (`PROGRAM_SK`) REFERENCES `DIMENSION_PROGRAM` (`PROGRAM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_PROJECT_FK` FOREIGN KEY (`PROJECT_SK`) REFERENCES `DIMENSION_PROJECT` (`PROJECT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_PROJECT_FK` FOREIGN KEY (`PROJECT_SK`) REFERENCES `DIMENSION_PROJECT` (`PROJECT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_PROVIDER_GROUP_FK` FOREIGN KEY (`PROVIDER_GROUP_SK`) REFERENCES `DIMENSION_PROVIDER_GROUP` (`PROVIDER_GROUP_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_RCRT_CHNNL_FK` FOREIGN KEY (`RECRUITMENT_CHANNEL_SK`) REFERENCES `DIMENSION_RECRUITMENT_CHANNEL` (`RECRUITMENT_CHANNEL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_RCRT_EVENT_FK` FOREIGN KEY (`RECRUITMENT_EVENT_SK`) REFERENCES `DIMENSION_RECRUITMENT_EVENT` (`RECRUITMENT_EVENT_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_REGION_FK` FOREIGN KEY (`REGION_SK`) REFERENCES `DIMENSION_REGION` (`REGION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_REGION_FK` FOREIGN KEY (`REGION_SK`) REFERENCES `DIMENSION_REGION` (`REGION_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_REASON_FK` FOREIGN KEY (`RETURN_REASON_SK`) REFERENCES `DIMENSION_RETURN_REASON` (`RETURN_REASON_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_TYPE_FK` FOREIGN KEY (`RETURN_TYPE_SK`) REFERENCES `DIMENSION_RETURN_TYPE` (`RETURN_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_SAL_PLAN_FK` FOREIGN KEY (`SALARY_PLAN_SK`) REFERENCES `DIMENSION_SALARY_PLAN` (`SALARY_PLAN_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_SAL_PLAN_FK` FOREIGN KEY (`SALARY_PLAN_SK`) REFERENCES `DIMENSION_SALARY_PLAN` (`SALARY_PLAN_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_SALARY_PLAN_FK` FOREIGN KEY (`SALARY_PLAN_SK`) REFERENCES `DIMENSION_SALARY_PLAN` (`SALARY_PLAN_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_JOBCODE` ADD CONSTRAINT `DIM_JOBCODE_SALARY_PLAN_FK` FOREIGN KEY (`SALARY_PLAN_SK`) REFERENCES `DIMENSION_SALARY_PLAN` (`SALARY_PLAN_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_SALES_CHANNEL_SK` FOREIGN KEY (`SALES_CHANNEL_SK`) REFERENCES `DIMENSION_SALES_CHANNEL` (`SALES_CHANNEL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_SALES_LEAD_FK` FOREIGN KEY (`SALES_LEAD_SK`) REFERENCES `DIMENSION_SALES_LEAD` (`SALES_LEAD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_SALES_LEAD_FK` FOREIGN KEY (`SALES_LEAD_SK`) REFERENCES `DIMENSION_SALES_LEAD` (`SALES_LEAD_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_SALES_LEAD_CHANNEL_FK` FOREIGN KEY (`SALES_LEAD_CHANNEL_SK`) REFERENCES `DIMENSION_SALES_LEAD_CHANNEL` (`SALES_LEAD_CHANNEL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CUSTOMER_LIFECYCLE` ADD CONSTRAINT `FACT_CUST_LIFE_LEAD_CHNL_FK` FOREIGN KEY (`SALES_LEAD_CHANNEL_SK`) REFERENCES `DIMENSION_SALES_LEAD_CHANNEL` (`SALES_LEAD_CHANNEL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_SALES_LEAD_TYPE_FK` FOREIGN KEY (`SALES_LEAD_TYPE_SK`) REFERENCES `DIMENSION_SALES_LEAD_TYPE` (`SALES_LEAD_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_SALES_OPRTNTY_FK` FOREIGN KEY (`SALES_OPPORTUNITY_SK`) REFERENCES `DIMENSION_SALES_OPPORTUNITY` (`SALES_OPPORTUNITY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_PRIORITY_FK` FOREIGN KEY (`SHIP_PRIORITY_SK`) REFERENCES `DIMENSION_SHIPMENT_PRIORITY` (`SHIP_PRIORITY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_ROUTE_FK` FOREIGN KEY (`SHIP_ROUTE_SK`) REFERENCES `DIMENSION_SHIPMENT_ROUTE` (`SHIP_ROUTE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_TYPE_FK` FOREIGN KEY (`SHIP_TYPE_SK`) REFERENCES `DIMENSION_SHIPMENT_TYPE` (`SHIP_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_DAY` ADD CONSTRAINT `DIM_DAY_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_EMPLOYEE_JOB_ACTION` ADD CONSTRAINT `DIM_EMPL_JOB_ACT_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_POSITION` ADD CONSTRAINT `DIM_POSITION_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_SOURCE_SK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ADVERTISEMENT_IMPRESSION` ADD CONSTRAINT `FACT_AD_IMPRESSION_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PERSON_APPLICATION` ADD CONSTRAINT `FACT_PERSON_APPL_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REF_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORKFORCE_OVERVIEW` ADD CONSTRAINT `FACT_WF_SNAP_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_TRXN_SRC_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIPMENT_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_CURRENCY` ADD CONSTRAINT `DIM_CURRENCY_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_KEYWORD_PHRASE` ADD CONSTRAINT `DIM_KEYWORD_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_ADVERTISEMENT` ADD CONSTRAINT `DIM_AD_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_CAMPAIGN_WAVE` ADD CONSTRAINT `DIM_CAMPAIGN_WAVE_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_PRODUCT` ADD CONSTRAINT `DIM_PRODUCT_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_CUSTOMER` ADD CONSTRAINT `DIM_CUSTOMER_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_STATISTICS_FK` FOREIGN KEY (`STATISTICS_SK`) REFERENCES `DIMENSION_STATISTICS` (`STATISTICS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_SLEDGER_FK` FOREIGN KEY (`SUBLEDGER_SK`) REFERENCES `DIMENSION_SUBLEDGER` (`SUBLEDGER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_GL_SNAPSHOT` ADD CONSTRAINT `FACT_GL_SNAP_SLEDGER_FK` FOREIGN KEY (`SUBLEDGER_SK`) REFERENCES `DIMENSION_SUBLEDGER` (`SUBLEDGER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_CLOSED_TIME_FK` FOREIGN KEY (`CASE_OPEN_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_OPEN_TIME_FK` FOREIGN KEY (`CASE_CLOSED_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CASE` ADD CONSTRAINT `FACT_CASE_RESPONSE_TIME_FK` FOREIGN KEY (`RESPONSE_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_END_TIME_FK` FOREIGN KEY (`CALL_START_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_CALL` ADD CONSTRAINT `FACT_CC_CALL_START_TIME_FK` FOREIGN KEY (`CALL_END_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_END_TIME_FK` FOREIGN KEY (`CALL_START_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_CONTACT_CENTER_OUT_CALL` ADD CONSTRAINT `FACT_CC_OUT_CALL_START_TIME_FK` FOREIGN KEY (`CALL_END_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_TIME_FK` FOREIGN KEY (`REQUEST_TIME_SK`) REFERENCES `DIMENSION_TIME` (`TIME_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PAYABLE_TIME` ADD CONSTRAINT `FACT_PAY_TIME_RPT_CD_FK` FOREIGN KEY (`TIME_REPORT_CODE_SK`) REFERENCES `DIMENSION_TIME_REPORT_CODE` (`TIME_REPORT_CODE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_PAYMENT_TRXN_STATUS_FK` FOREIGN KEY (`PAYMENT_TRXN_STATUS_SK`) REFERENCES `DIMENSION_TRANSACTION_STATUS` (`TRXN_STATUS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_VCHR_TRXN_POST_STAT_FK` FOREIGN KEY (`TRXN_POST_STATUS_SK`) REFERENCES `DIMENSION_TRANSACTION_STATUS` (`TRXN_STATUS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ACCOUNT_PAYABLE` ADD CONSTRAINT `FACT_AP_PAYMENT_TRXN_TYPE_FK` FOREIGN KEY (`TRXN_TYPE_SK`) REFERENCES `DIMENSION_TRANSACTION_TYPE` (`TRXN_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BILLING` ADD CONSTRAINT `FACT_BILLING_UOM_FK` FOREIGN KEY (`UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_BUDGET_FORECAST` ADD CONSTRAINT `FACT_BUDGET_UOM_FK` FOREIGN KEY (`UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_MARKET_BASKET` ADD CONSTRAINT `FACT_MKT_BASKET_UOM_FK` FOREIGN KEY (`PRODUCT_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_UOM_FK` FOREIGN KEY (`UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_UOM_FK` FOREIGN KEY (`INV_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_PO_UOM_FK` FOREIGN KEY (`REQUISITION_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_RECEIVED_UOM_FK` FOREIGN KEY (`PO_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_RQSTN_UOM_FK` FOREIGN KEY (`SHIPPED_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_SHIPPED_UOM_FK` FOREIGN KEY (`RECEIVED_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PURCHASE_ORDER` ADD CONSTRAINT `FACT_PO_UOM_FK` FOREIGN KEY (`PURCHASE_ORDER_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_REQUISITION` ADD CONSTRAINT `FACT_REQUISITION_UOM_FK` FOREIGN KEY (`REQUISITION_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_RETURN` ADD CONSTRAINT `FACT_RETURN_UOM_FK` FOREIGN KEY (`RETURN_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_LEAD` ADD CONSTRAINT `FACT_LEAD_UOM_FK` FOREIGN KEY (`UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SALES_OPPORTUNITY` ADD CONSTRAINT `FACT_OPRTNTY_UOM_FK` FOREIGN KEY (`UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_DISTANCE_UOM_FK` FOREIGN KEY (`SHIP_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_SHIP_UOM_FK` FOREIGN KEY (`VOLUME_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_TRAVEL_TIME_UOM_FK` FOREIGN KEY (`WEIGHT_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_VOLUME_UOM_FK` FOREIGN KEY (`DISTANCE_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_WEIGHT_UOM_FK` FOREIGN KEY (`TRAVEL_TIME_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_UOM_FK` FOREIGN KEY (`SHIPPED_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_UOM_FK` FOREIGN KEY (`RECEIVED_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_UOM_FK` FOREIGN KEY (`WORK_ORDER_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSICAL_INV_WRHSE_FK` FOREIGN KEY (`WAREHOUSE_SK`) REFERENCES `DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPMENT` ADD CONSTRAINT `FACT_SHIP_WAREHOUSE_FK` FOREIGN KEY (`WAREHOUSE_SK`) REFERENCES `DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_SHIPPING_NOTICE` ADD CONSTRAINT `FACT_SN_WAREHOUSE_FK` FOREIGN KEY (`WAREHOUSE_SK`) REFERENCES `DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WAREHOUSE_RECEIPT` ADD CONSTRAINT `FACT_WRHS_RCPT_WRHS_FK` FOREIGN KEY (`WAREHOUSE_SK`) REFERENCES `DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_PROCUREMENT` ADD CONSTRAINT `FACT_PROCURE_WAREHOUSE_FK` FOREIGN KEY (`WAREHOUSE_SK`) REFERENCES `DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_BROW_OS_FK` FOREIGN KEY (`WEB_BROWSER_OS_SK`) REFERENCES `DIMENSION_WEB_BROWSER_OS` (`WEB_BROWSER_OS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_BROWSER_FK` FOREIGN KEY (`WEB_BROWSER_OS_SK`) REFERENCES `DIMENSION_WEB_BROWSER_OS` (`WEB_BROWSER_OS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `DIMENSION_WEB_VISITOR` ADD CONSTRAINT `DIM_WEB_VISITOR_BROW_OS_FK` FOREIGN KEY (`WEB_BROWSER_OS_SK`) REFERENCES `DIMENSION_WEB_BROWSER_OS` (`WEB_BROWSER_OS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_FILE_FK` FOREIGN KEY (`WEB_FILE_SK`) REFERENCES `DIMENSION_WEB_FILE` (`WEB_FILE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REF_WEB_FILE_FK` FOREIGN KEY (`WEB_FILE_SK`) REFERENCES `DIMENSION_WEB_FILE` (`WEB_FILE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_EXIT_FILE_FK` FOREIGN KEY (`EXIT_WEB_FILE_SK`) REFERENCES `DIMENSION_WEB_FILE` (`WEB_FILE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_LAND_FILE_FK` FOREIGN KEY (`LANDING_WEB_FILE_SK`) REFERENCES `DIMENSION_WEB_FILE` (`WEB_FILE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_PATH_SK` FOREIGN KEY (`WEB_NAVIGATION_PATH_SK`) REFERENCES `DIMENSION_WEB_NAVIGATION_PATH` (`WEB_NAVIGATION_PATH_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VIEW_REFERER_FK` FOREIGN KEY (`REFERER_URL_SK`) REFERENCES `DIMENSION_WEB_SITE_REFERER` (`REFERER_URL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REF_REFERER_FK` FOREIGN KEY (`REFERER_URL_SK`) REFERENCES `DIMENSION_WEB_SITE_REFERER` (`REFERER_URL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_REFERER_FK` FOREIGN KEY (`REFERER_URL_SK`) REFERENCES `DIMENSION_WEB_SITE_REFERER` (`REFERER_URL_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_PAGE_VIEW` ADD CONSTRAINT `FACT_WEB_PAGE_VISITOR_FK` FOREIGN KEY (`WEB_VISITOR_SK`) REFERENCES `DIMENSION_WEB_VISITOR` (`WEB_VISITOR_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_REFERER` ADD CONSTRAINT `FACT_WEB_SITE_REF_VISITOR_FK` FOREIGN KEY (`WEB_VISITOR_SK`) REFERENCES `DIMENSION_WEB_VISITOR` (`WEB_VISITOR_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WEB_SITE_VISIT` ADD CONSTRAINT `FACT_WEB_SITE_VISIT_VISITOR_FK` FOREIGN KEY (`WEB_VISITOR_SK`) REFERENCES `DIMENSION_WEB_VISITOR` (`WEB_VISITOR_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_CATEGORY1_FK` FOREIGN KEY (`WORK_ORDER_CATEGORY1_SK`) REFERENCES `DIMENSION_WORK_ORDER_CATEGORY` (`WORK_ORDER_CATEGORY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_CATEGORY2_FK` FOREIGN KEY (`WORK_ORDER_CATEGORY2_SK`) REFERENCES `DIMENSION_WORK_ORDER_CATEGORY` (`WORK_ORDER_CATEGORY_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_PHASE_FK` FOREIGN KEY (`WORK_ORDER_PHASE_SK`) REFERENCES `DIMENSION_WORK_ORDER_PHASE` (`WORK_ORDER_PHASE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_STATUS_FK` FOREIGN KEY (`WORK_ORDER_STATUS_SK`) REFERENCES `DIMENSION_WORK_ORDER_STATUS` (`WORK_ORDER_STATUS_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_TYPE_FK` FOREIGN KEY (`WORK_ORDER_TYPE_SK`) REFERENCES `DIMENSION_WORK_ORDER_TYPE` (`WORK_ORDER_TYPE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_WORK_ORDER` ADD CONSTRAINT `FACT_WO_VARIANCE_FK` FOREIGN KEY (`WORK_ORDER_VARIANCE_SK`) REFERENCES `DIMENSION_WORK_ORDER_VARIANCE` (`WORK_ORDER_VARIANCE_SK`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `STAGE_GEO_CITY_BLOCKS` ADD CONSTRAINT `STAGE_GEO_CITY_BLOCKS_LOC_FK` FOREIGN KEY (`GEO_LOCATION_ID`) REFERENCES `STAGE_GEO_CITY_LOCATION` (`GEO_LOCATION_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_VOLUME_UOM_FK` FOREIGN KEY (`VOLUME_UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_PRODUCT` ADD CONSTRAINT `DIM_PRODUCT_CURRENCY_FK` FOREIGN KEY (`CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_GL_POSTED_TRANSACTION` ADD CONSTRAINT `FACT_GL_POSTED_TRXN_TYPE_FK` FOREIGN KEY (`TRXN_TYPE_SK`) REFERENCES `DIMENSION_TRANSACTION_TYPE` (`TRXN_TYPE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_CUST` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_ORDER_CAPTURE` ADD CONSTRAINT `FACT_OC_WEIGHT_UOM_FK` FOREIGN KEY (`WEIGHT_UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_WEIGHT_UOM_FK` FOREIGN KEY (`WEIGHT_UNIT_OF_MEASURE_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `TREE_ACCOUNT` ADD CONSTRAINT `TREE_ACCOUNT_ACCOUNT_FK` FOREIGN KEY (`ACCOUNT_SK`) REFERENCES `DIMENSION_ACCOUNT` (`ACCOUNT_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN_WAVE` ADD CONSTRAINT `DIM_CAMPAIGN_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_ADVERTISEMENT` ADD CONSTRAINT `DIM_AD_CUST_FK` FOREIGN KEY (`CUSTOMER_SK`) REFERENCES `DIMENSION_CUSTOMER` (`CUSTOMER_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_BU_FK` FOREIGN KEY (`BUSINESS_UNIT_SK`) REFERENCES `DIMENSION_BUSINESS_UNIT` (`BUSINESS_UNIT_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_WAREHOUSE_FK` FOREIGN KEY (`WAREHOUSE_SK`) REFERENCES `DIMENSION_WAREHOUSE` (`WAREHOUSE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_PRODUCT_FK` FOREIGN KEY (`PRODUCT_SK`) REFERENCES `DIMENSION_PRODUCT` (`PRODUCT_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_INV_UOM_FK` FOREIGN KEY (`INV_UOM_SK`) REFERENCES `DIMENSION_UNIT_OF_MEASURE` (`UNIT_OF_MEASURE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_SUPPLIER_FK` FOREIGN KEY (`SUPPLIER_SK`) REFERENCES `DIMENSION_SUPPLIER` (`SUPPLIER_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_PRODUCT_LOT_FK` FOREIGN KEY (`PRODUCT_LOT_SK`) REFERENCES `DIMENSION_PRODUCT_LOT` (`PRODUCT_LOT_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_SOURCE_FK` FOREIGN KEY (`SOURCE_SYSTEM_SK`) REFERENCES `DIMENSION_SOURCE_SYSTEM` (`SOURCE_SYSTEM_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSCL_INV_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_PHYSICAL_INVENTORY` ADD CONSTRAINT `FACT_PHYSCL_INV_TRXN_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_TRXN_CRNCY_FK` FOREIGN KEY (`TRXN_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_BASE_CRNCY_FK` FOREIGN KEY (`BASE_CURRENCY_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_TRXN_TYPE_FK` FOREIGN KEY (`TRXN_TYPE_SK`) REFERENCES `DIMENSION_TRANSACTION_TYPE` (`TRXN_TYPE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_INV_ADJSTMNT_FK` FOREIGN KEY (`INV_ADJUSTMENT_SK`) REFERENCES `DIMENSION_INVENTORY_ADJUSTMENT` (`INV_ADJUSTMENT_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_INVENTORY_TRANSACTION` ADD CONSTRAINT `FACT_INV_TRXN_DAY_FK` FOREIGN KEY (`TRXN_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `ADMIN_MODULE_TABLE_RELATION` ADD CONSTRAINT `A_MDL_TBL_RELATE_PARENT_TBL_FK` FOREIGN KEY (`PARENT_TABLE_SK`) REFERENCES `ADMIN_MODULE_TABLE` (`TABLE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `ADMIN_MODULE_TABLE_RELATION` ADD CONSTRAINT `A_MDL_TBL_RELATE_CHILD_TBL_FK` FOREIGN KEY (`CHILD_TABLE_SK`) REFERENCES `ADMIN_MODULE_TABLE` (`TABLE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `ADMIN_MODULE_TABLE_RELATION` ADD CONSTRAINT `A_MDL_TBL_COL_RLTE_PRNT_TBL_FK` FOREIGN KEY (`PARENT_COLUMN_SK`) REFERENCES `ADMIN_MODULE_TABLE_COLUMN` (`COLUMN_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `ADMIN_MODULE_TABLE_RELATION` ADD CONSTRAINT `A_MDL_TBL_COL_RLTE_CHLD_TBL_FK` FOREIGN KEY (`CHILD_COLUMN_SK`) REFERENCES `ADMIN_MODULE_TABLE_COLUMN` (`COLUMN_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_DAY` ADD CONSTRAINT `DIM_DAY_MONTH_FK` FOREIGN KEY (`MONTH_SK`) REFERENCES `DIMENSION_MONTH` (`MONTH_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_KEYWORD_PHRASE` ADD CONSTRAINT `DIM_KEYWORD_STATUS_FK` FOREIGN KEY (`KEYWORD_STATUS_SK`) REFERENCES `DIMENSION_KEYWORD_STATUS` (`KEYWORD_STATUS_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_KEYWORD_PHRASE` ADD CONSTRAINT `DIM_KEYWORD_MATCHING_FK` FOREIGN KEY (`KEYWORD_MATCHING_SK`) REFERENCES `DIMENSION_KEYWORD_MATCHING` (`KEYWORD_MATCHING_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_ADVERTISEMENT` ADD CONSTRAINT `DIM_AD_AD_TYPE_FK` FOREIGN KEY (`AD_TYPE_SK`) REFERENCES `DIMENSION_ADVERTISEMENT_TYPE` (`AD_TYPE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_ADVERTISEMENT` ADD CONSTRAINT `DIM_AD_AD_STATUS_FK` FOREIGN KEY (`AD_STATUS_SK`) REFERENCES `DIMENSION_ADVERTISEMENT_STATUS` (`AD_STATUS_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_MONTH` ADD CONSTRAINT `DIM_MONTH_QUARTER_FK` FOREIGN KEY (`QUARTER_SK`) REFERENCES `DIMENSION_QUARTER` (`QUARTER_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_DAY` ADD CONSTRAINT `DIM_DAY_QUARTER_FK` FOREIGN KEY (`QUARTER_SK`) REFERENCES `DIMENSION_QUARTER` (`QUARTER_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_QUARTER` ADD CONSTRAINT `DIM_QUARTER_YEAR_FK` FOREIGN KEY (`YEAR_SK`) REFERENCES `DIMENSION_YEAR` (`YEAR_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_DAY` ADD CONSTRAINT `DIM_DAY_YEAR_FK` FOREIGN KEY (`YEAR_SK`) REFERENCES `DIMENSION_YEAR` (`YEAR_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_MONTH` ADD CONSTRAINT `DIM_MONTH_YEAR_FK` FOREIGN KEY (`YEAR_SK`) REFERENCES `DIMENSION_YEAR` (`YEAR_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_DAY` ADD CONSTRAINT `DIM_DAY_WEEK_FK` FOREIGN KEY (`WEEK_SK`) REFERENCES `DIMENSION_WEEK` (`WEEK_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_WEEK` ADD CONSTRAINT `DIM_WEEK_YEAR_FK` FOREIGN KEY (`YEAR_SK`) REFERENCES `DIMENSION_YEAR` (`YEAR_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN_WAVE` ADD CONSTRAINT `DIM_CAMPAIGN_WAVE_CAMPAIGN_FK` FOREIGN KEY (`CAMPAIGN_SK`) REFERENCES `DIMENSION_CAMPAIGN` (`CAMPAIGN_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN` ADD CONSTRAINT `DIM_CAMPAIGN_CAMPAIGN_TYPE_FK` FOREIGN KEY (`CAMPAIGN_TYPE_SK`) REFERENCES `DIMENSION_CAMPAIGN_TYPE` (`CAMPAIGN_TYPE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN_SUBTYPE` ADD CONSTRAINT `DIM_CAMPAIGN_SUBTYPE_TYPE_FK` FOREIGN KEY (`CAMPAIGN_TYPE_SK`) REFERENCES `DIMENSION_CAMPAIGN_TYPE` (`CAMPAIGN_TYPE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN` ADD CONSTRAINT `DIM_CAMPAIGN_SUBTYPE_FK` FOREIGN KEY (`CAMPAIGN_SUBTYPE_SK`) REFERENCES `DIMENSION_CAMPAIGN_SUBTYPE` (`CAMPAIGN_SUBTYPE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN` ADD CONSTRAINT `DIM_CAMPAIGN_CAMPAIGN_STATUS_FK` FOREIGN KEY (`CAMPAIGN_STATUS_SK`) REFERENCES `DIMENSION_CAMPAIGN_STATUS` (`CAMPAIGN_STATUS_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN_WAVE` ADD CONSTRAINT `DIM_CAMPAIGN_WAVE_STATUS_FK` FOREIGN KEY (`CAMPAIGN_WAVE_STATUS_SK`) REFERENCES `DIMENSION_CAMPAIGN_WAVE_STATUS` (`CAMPAIGN_WAVE_STATUS_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `DIMENSION_CAMPAIGN` ADD CONSTRAINT `DIM_CAMPAIGN_OBJECTIVE_FK` FOREIGN KEY (`CAMPAIGN_OBJECTIVE_SK`) REFERENCES `DIMENSION_CAMPAIGN_OBJECTIVE` (`CAMPAIGN_OBJECTIVE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_CURRENCY_EXCHANGE` ADD CONSTRAINT `FACT_CRNCY_EX_TRXN_CRNCY_TO_FK` FOREIGN KEY (`CURRENCY_TO_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_CURRENCY_EXCHANGE` ADD CONSTRAINT `FACT_CRNCY_EX_TRXN_CRNCY_FR_FK` FOREIGN KEY (`CURRENCY_FROM_SK`) REFERENCES `DIMENSION_CURRENCY` (`CURRENCY_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_CURRENCY_EXCHANGE` ADD CONSTRAINT `FACT_CRNCY_EX_TRXN_STRT_DT_FK` FOREIGN KEY (`EXCHANGE_RATE_START_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE `FACT_CURRENCY_EXCHANGE` ADD CONSTRAINT `FACT_CRNCY_EX_TRXN_STOP_DT_FK` FOREIGN KEY (`EXCHANGE_RATE_STOP_DATE_SK`) REFERENCES `DIMENSION_DAY` (`DATE_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
;



