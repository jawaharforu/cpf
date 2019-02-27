/*
SQLyog Community v13.1.0 (64 bit)
MySQL - 5.7.19 : Database - cpfindia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cpfindia` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cpfindia`;

/*Table structure for table `agreement` */

DROP TABLE IF EXISTS `agreement`;

CREATE TABLE `agreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_name` varchar(255) DEFAULT NULL,
  `attachment_id` varchar(1024) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement` */

/*Table structure for table `agreement_attachment` */

DROP TABLE IF EXISTS `agreement_attachment`;

CREATE TABLE `agreement_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_id` int(11) DEFAULT NULL,
  `agreement_request_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement_attachment` */

/*Table structure for table `agreement_attachment_status` */

DROP TABLE IF EXISTS `agreement_attachment_status`;

CREATE TABLE `agreement_attachment_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_attachment_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement_attachment_status` */

/*Table structure for table `agreement_copy` */

DROP TABLE IF EXISTS `agreement_copy`;

CREATE TABLE `agreement_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_request_id` int(11) DEFAULT NULL,
  `document` longtext,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `doc_type` varchar(255) DEFAULT NULL,
  `space` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement_copy` */

/*Table structure for table `agreement_copy_log` */

DROP TABLE IF EXISTS `agreement_copy_log`;

CREATE TABLE `agreement_copy_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_copy_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `document` longtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `doc_type` varchar(255) DEFAULT NULL,
  `space` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement_copy_log` */

/*Table structure for table `agreement_request` */

DROP TABLE IF EXISTS `agreement_request`;

CREATE TABLE `agreement_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_id` int(11) DEFAULT NULL,
  `new_renewal` varchar(50) DEFAULT NULL,
  `pca_id` int(11) DEFAULT NULL,
  `vendor_name` varchar(255) DEFAULT NULL,
  `address` text,
  `vendor_code` varchar(255) DEFAULT NULL,
  `own_lease_representative` varchar(255) DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `consideration_rs` varchar(1024) DEFAULT NULL,
  `documents_attached` text,
  `deposit` text,
  `other_information` text,
  `state_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `ticket_no` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `other_attachment` varchar(255) DEFAULT NULL,
  `other_attachment1` varchar(255) DEFAULT NULL,
  `signed_doc` varchar(255) DEFAULT NULL,
  `exist_ticket_no` varchar(255) DEFAULT NULL,
  `renewal_need` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement_request` */

/*Table structure for table `agreement_sample_document` */

DROP TABLE IF EXISTS `agreement_sample_document`;

CREATE TABLE `agreement_sample_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `document` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement_sample_document` */

/*Table structure for table `agreement_status` */

DROP TABLE IF EXISTS `agreement_status`;

CREATE TABLE `agreement_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_request_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `agreement_status` */

/*Table structure for table `attachment` */

DROP TABLE IF EXISTS `attachment`;

CREATE TABLE `attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discription` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Data for the table `attachment` */

insert  into `attachment`(`id`,`attachment_name`,`created_at`,`updated_at`,`discription`) values 
(1,'PAN CARD','2019-02-26 09:44:32',NULL,'PAN CARD'),
(2,'AADHAR CARD','2019-02-26 09:44:44',NULL,'AADHAR CARD'),
(3,'BANK PASS BOOK','2019-02-26 09:45:01',NULL,'BANK PASS BOOK'),
(4,'APPROVED IOM FOR CONSIDERATION (CHARGES)','2019-02-26 09:45:10',NULL,'APPROVED IOM FOR CONSIDERATION (CHARGES)'),
(5,'VEHICLE RC','2019-02-26 09:45:19',NULL,'VEHICLE RC'),
(6,'VEHICLE INSURANCE','2019-02-26 09:45:31',NULL,'VEHICLE INSURANCE'),
(7,'GST','2019-02-26 09:45:47',NULL,'GST'),
(8,'PF','2019-02-26 09:45:55',NULL,'PF'),
(9,'ESI','2019-02-26 09:46:06',NULL,'ESI'),
(10,'LAND DOCUMENTS','2019-02-26 09:46:14',NULL,'LAND DOCUMENTS'),
(11,'LEASE DEED','2019-02-26 09:46:23',NULL,'LEASE DEED'),
(12,'MORTGAGE / LOAN DETAILS','2019-02-26 09:47:14',NULL,'MORTGAGE / LOAN DETAILS'),
(13,'BANK NOC','2019-02-26 09:47:26',NULL,'BANK NOC'),
(14,'LETTER OF INTENT','2019-02-26 09:47:35',NULL,'LETTER OF INTENT'),
(15,'PROFILE','2019-02-26 09:47:42',NULL,'PROFILE'),
(16,'PASSPORT SIZE PHOTO','2019-02-26 09:47:49',NULL,'PASSPORT SIZE PHOTO'),
(17,'SURETY DOCUMNTS (BG/DEPOSIT/CHEQUES/DEDUCTION ETC.) [RECEIPT]','2019-02-26 09:47:59',NULL,'SURETY DOCUMNTS (BG/DEPOSIT/CHEQUES/DEDUCTION ETC.) [RECEIPT]'),
(18,'VALID ADDRESS PROOF - OFFICE/OUTLET/LOCATION OF DISTRIBUTION','2019-02-26 09:48:10',NULL,'VALID ADDRESS PROOF - OFFICE/OUTLET/LOCATION OF DISTRIBUTION'),
(19,'VALID ADDRESS PROOF - RESIDENCE','2019-02-26 09:48:26',NULL,'VALID ADDRESS PROOF - RESIDENCE'),
(20,'AREA MEASUREMENTS (SQR.FT)','2019-02-26 09:48:37',NULL,'AREA MEASUREMENTS (SQR.FT)'),
(21,'POWER OF ATTORNEY OR AUTHORISATION','2019-02-26 09:48:48',NULL,'POWER OF ATTORNEY OR AUTHORISATION'),
(22,'REGISTRATIONS OR PARTNERSHIP DEED','2019-02-26 09:48:55',NULL,'REGISTRATIONS OR PARTNERSHIP DEED'),
(23,'LICENCES','2019-02-26 09:49:04',NULL,'LICENCES'),
(24,'FSSAI','2019-02-26 09:49:12',NULL,'FSSAI'),
(25,'SHOP & ESTABLISHMENT','2019-02-26 09:49:21',NULL,'SHOP & ESTABLISHMENT'),
(26,'APPROVED CREDIT LIMIT & CREDIT PERIOD BY MGMT','2019-02-26 09:49:30',NULL,'APPROVED CREDIT LIMIT & CREDIT PERIOD BY MGMT'),
(27,'APPROVAL/PROOF FOR REFUNDABLE SECURITY DEPOSIT-[PAYMENT]','2019-02-26 09:49:40',NULL,'APPROVAL/PROOF FOR REFUNDABLE SECURITY DEPOSIT-[PAYMENT]'),
(28,'PROOF FOR FRANCHISEE FEES','2019-02-26 09:49:56',NULL,'PROOF FOR FRANCHISEE FEES'),
(29,'RETENTION','2019-02-26 09:50:03',NULL,'RETENTION'),
(30,'PREVIOUS AGREEMENT (S)','2019-02-26 09:50:11',NULL,'PREVIOUS AGREEMENT (S)'),
(31,'ANY OTHER APPLICABLE DOCUMENT','2019-02-26 09:50:34',NULL,'ANY OTHER APPLICABLE DOCUMENT');

/*Table structure for table `business_unit` */

DROP TABLE IF EXISTS `business_unit`;

CREATE TABLE `business_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_unit_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `business_unit_code` int(11) DEFAULT NULL,
  `business_unit_doc_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `business_unit` */

insert  into `business_unit`(`id`,`business_unit_name`,`created_at`,`updated_at`,`business_unit_code`,`business_unit_doc_code`) values 
(1,'CPI Head Office','2019-02-26 08:57:16',NULL,6000,'A'),
(2,'CPA Head Office','2019-02-26 08:57:27',NULL,6001,'A'),
(3,'CPI Southern','2019-02-26 08:57:37',NULL,6300,'A'),
(4,'CPI Eastern','2019-02-26 08:57:47',NULL,6301,'A'),
(5,'CPI Western','2019-02-26 08:57:57',NULL,6302,'A'),
(6,'CPI Northern','2019-02-26 08:58:06',NULL,6303,'A'),
(7,'CPI Northeast','2019-02-26 08:58:16',NULL,6304,'A'),
(8,'CPI Foods','2019-02-26 08:58:24',NULL,6305,'A'),
(9,'CPI Aqua Feed','2019-02-26 08:58:34',NULL,6500,'A'),
(10,'CPA Aqua Feed','2019-02-26 08:58:44',NULL,6501,'A'),
(11,'CPA Aqua Farm','2019-02-26 08:59:02',NULL,6600,'A'),
(12,'CPI Aqua Farm','2019-02-26 08:59:11',NULL,6607,'A'),
(13,'CPA Aqua Foods','2019-02-26 08:59:20',NULL,6700,'A'),
(14,'CPI Aqua Foods','2019-02-26 08:59:30',NULL,6702,'A');

/*Table structure for table `cim_table` */

DROP TABLE IF EXISTS `cim_table`;

CREATE TABLE `cim_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL DEFAULT '0',
  `cim` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `cim_description` longtext NOT NULL,
  `notify_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `cim_table` */

insert  into `cim_table`(`id`,`employee_id`,`cim`,`company_id`,`cim_description`,`notify_id`) values 
(1,295,1,38,'test',13),
(2,295,1,38,'test',13),
(3,295,1,38,'test',13),
(4,295,1,38,'test',13),
(5,295,1,38,'test',13),
(6,295,1,38,'test',13),
(7,295,1,38,'test',13),
(8,295,1,38,'test',13),
(9,295,1,38,'jai',13),
(10,295,1,38,'jai',13),
(11,295,1,38,'Govinda',13);

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `city_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `city` */

insert  into `city`(`id`,`state_id`,`city_name`,`created_at`,`updated_at`) values 
(1,56,'Chennai','2018-11-22 08:44:15',NULL);

/*Table structure for table `cms_apicustom` */

DROP TABLE IF EXISTS `cms_apicustom`;

CREATE TABLE `cms_apicustom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci,
  `responses` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_apicustom` */

/*Table structure for table `cms_apikey` */

DROP TABLE IF EXISTS `cms_apikey`;

CREATE TABLE `cms_apikey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_apikey` */

/*Table structure for table `cms_dashboard` */

DROP TABLE IF EXISTS `cms_dashboard`;

CREATE TABLE `cms_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_dashboard` */

/*Table structure for table `cms_email_queues` */

DROP TABLE IF EXISTS `cms_email_queues`;

CREATE TABLE `cms_email_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci,
  `email_attachments` text COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_email_queues` */

/*Table structure for table `cms_email_templates` */

DROP TABLE IF EXISTS `cms_email_templates`;

CREATE TABLE `cms_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_email_templates` */

insert  into `cms_email_templates`(`id`,`name`,`slug`,`subject`,`content`,`description`,`from_name`,`from_email`,`cc_email`,`created_at`,`updated_at`) values 
(1,'Email Template Forgot Password Backend','forgot_password_backend',NULL,'<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>','[password]','System','system@crudbooster.com',NULL,'2018-11-20 10:48:20',NULL);

/*Table structure for table `cms_logs` */

DROP TABLE IF EXISTS `cms_logs`;

CREATE TABLE `cms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_logs` */

insert  into `cms_logs`(`id`,`ipaddress`,`useragent`,`url`,`description`,`details`,`id_cms_users`,`created_at`,`updated_at`) values 
(1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1','',1,'2018-11-20 10:51:26',NULL),
(2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1','',1,'2018-11-22 07:09:50',NULL),
(3,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/city/add-save','Add New Data  at City','',1,'2018-11-22 08:44:15',NULL),
(4,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/division/add-save','Add New Data Agro at Division','',1,'2018-11-22 09:32:03',NULL),
(5,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/division/add-save','Add New Data Aqua at Division','',1,'2018-11-22 09:32:21',NULL),
(6,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data Farm BC at Business Unit','',1,'2018-11-22 09:42:50',NULL),
(7,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1','',1,'2018-11-26 06:18:21',NULL),
(8,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/attachment/add-save','Add New Data photo at Attachment','',1,'2018-11-26 09:21:23',NULL),
(9,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/attachment/add-save','Add New Data ID at Attachment','',1,'2018-11-26 09:21:30',NULL),
(10,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-11-27 04:52:48',NULL),
(11,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-11-28 05:00:17',NULL),
(12,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-11-28 09:45:41',NULL),
(13,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/logout',' logout','',2,'2018-11-28 12:31:14',NULL),
(14,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-11-28 12:31:32',NULL),
(15,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-11-29 04:57:46',NULL),
(16,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data Imogene Rush at Users Management','',1,'2018-11-29 09:07:30',NULL),
(17,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/6','Update data Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>',1,'2018-11-29 09:08:04',NULL),
(18,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-11-29 09:16:15',NULL),
(19,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data Forrest Potter at Business Unit','',1,'2018-11-29 09:30:29',NULL),
(20,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-11-29 11:59:09',NULL),
(21,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-06 03:40:22',NULL),
(22,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2018-12-06 05:59:29',NULL),
(23,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/users/delete-image','Delete the image of Imogene Rush at Users Management','',1,'2018-12-06 05:59:53',NULL),
(24,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/users/edit-save/2','Update data Imogene Rush at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2018-12/ac_avatar_ug.png</td></tr><tr><td>password</td><td>$2y$10$lKcObFmkZquYddtH1AaPEekBo0mXzpx/JeUN/1J42k0pTjdghZDWS</td><td>$2y$10$AfqsDuuINkcgRwgnV6f1R.JBrl4GPp3Oizpt4S8a0ORvYicsDZjDu</td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>division_id</td><td>1</td><td></td></tr><tr><td>state_id</td><td>36,37,</td><td></td></tr><tr><td>pca_id</td><td>1,2,</td><td></td></tr></tbody></table>',1,'2018-12-06 06:00:08',NULL),
(25,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-06 06:00:21',NULL),
(26,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_request/action-selected','Delete data 8,7,6,5,4,3,2,1 at Agreement Request','',2,'2018-12-06 06:00:41',NULL),
(27,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/module_generator/delete/14','Delete data Business Unit at Module Generator','',1,'2018-12-06 08:26:58',NULL),
(28,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/pca/add-save','Add New Data Kotturpuram Office at PCA','',1,'2018-12-06 09:16:55',NULL),
(29,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/pca/add-save','Add New Data Feedmill Chittoor at PCA','',1,'2018-12-06 11:13:40',NULL),
(30,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-06 11:21:45',NULL),
(31,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-07 06:29:25',NULL),
(32,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/attachment/add-save','Add New Data proof at Attachment','',1,'2018-12-07 06:47:39',NULL),
(33,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement/delete/2','Delete data second at Agreement','',1,'2018-12-07 06:47:52',NULL),
(34,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement/delete/1','Delete data afsdfadsf at Agreement','',1,'2018-12-07 06:47:57',NULL),
(35,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-07 06:56:38',NULL),
(36,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-10 05:04:32',NULL),
(37,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-10 05:05:45',NULL),
(38,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data verifier at Users Management','',1,'2018-12-10 09:54:22',NULL),
(39,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2018-12-10 10:42:40',NULL),
(40,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-11 05:30:23',NULL),
(41,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-11 05:50:30',NULL),
(42,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-14 05:04:42',NULL),
(43,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-14 05:05:36',NULL),
(44,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/delete/1','Delete data City at Menu Management','',1,'2018-12-14 05:22:46',NULL),
(45,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-14 07:09:59',NULL),
(46,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/logout','admin@admin.com logout','',1,'2018-12-14 09:43:27',NULL),
(47,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-14 09:48:17',NULL),
(48,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/logout','admin@admin.com logout','',1,'2018-12-14 09:51:53',NULL),
(49,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-14 10:18:52',NULL),
(50,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data tamilnadu at State','',1,'2018-12-14 10:21:09',NULL),
(51,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/logout','admin@admin.com logout','',1,'2018-12-14 11:00:42',NULL),
(52,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-17 05:20:29',NULL),
(53,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-17 06:08:17',NULL),
(54,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-21 05:52:27',NULL),
(55,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2018-12-21 05:53:35',NULL),
(56,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-21 06:02:31',NULL),
(57,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/6','Update data Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>',1,'2018-12-21 06:03:19',NULL),
(58,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-21 10:12:18',NULL),
(59,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-24 05:06:30',NULL),
(60,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-24 05:07:44',NULL),
(61,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2018-12-24 09:40:36',NULL),
(62,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2018-12-26 05:23:16',NULL),
(63,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2018-12-26 05:23:33',NULL),
(64,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-26 05:45:21',NULL),
(65,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data Approver at Users Management','',1,'2018-12-26 05:47:57',NULL),
(66,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data agcadmin at Users Management','',1,'2018-12-26 05:49:50',NULL),
(67,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data AGC Verifier at Users Management','',1,'2018-12-26 05:51:26',NULL),
(68,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/users/edit-save/5','Update data AGC Admin at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>agcadmin</td><td>AGC Admin</td></tr><tr><td>password</td><td>$2y$10$w0OcDqawgAC5HsimLXw2r.i0hrJPozuXyZrB3tdUWRC./pTM73eke</td><td></td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>division_id</td><td>1</td><td></td></tr><tr><td>state_id</td><td></td><td></td></tr><tr><td>pca_id</td><td></td><td></td></tr><tr><td>agreement_id</td><td></td><td></td></tr></tbody></table>',1,'2018-12-26 05:52:17',NULL),
(69,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2018-12-26 06:49:30',NULL),
(70,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2018-12-26 06:51:46',NULL),
(71,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2018-12-26 06:52:10',NULL),
(72,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2018-12-26 06:53:29',NULL),
(73,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2018-12-26 06:53:44',NULL),
(74,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-27 05:24:51',NULL),
(75,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2018-12-28 04:40:46',NULL),
(76,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-28 04:41:07',NULL),
(77,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2018-12-28 04:42:33',NULL),
(78,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_sample_document/add-save','Add New Data uploads/1/2018-12/completedepes.docx at Agreement Sample Document','',1,'2018-12-28 09:23:29',NULL),
(79,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_sample_document/add-save','Add New Data uploads/1/2018-12/completedepes.docx at Agreement Sample Document','',1,'2018-12-28 09:43:29',NULL),
(80,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_sample_document/delete/1','Delete data uploads/1/2018-12/completedepes.docx at Agreement Sample Document','',1,'2018-12-28 09:43:54',NULL),
(81,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2018-12-31 05:00:01',NULL),
(82,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2018-12-31 05:05:48',NULL),
(83,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-03 04:58:10',NULL),
(84,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-03 04:59:00',NULL),
(85,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-03 05:05:35',NULL),
(86,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_request','Try view the data :name at Agreement Request','',3,'2019-01-03 05:05:38',NULL),
(87,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_request','Try view the data :name at Agreement Request','',3,'2019-01-03 05:36:01',NULL),
(88,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-03 06:11:40',NULL),
(89,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-03 06:11:46',NULL),
(90,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/add-save','Add New Data Agreement Request  List at Menu Management','',1,'2019-01-03 06:13:56',NULL),
(91,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/add-save','Add New Data Request List at Menu Management','',1,'2019-01-03 06:16:35',NULL),
(92,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/delete/13','Delete data Request List at Menu Management','',1,'2019-01-03 06:17:32',NULL),
(93,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/12','Update data Agreement Request  List at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>',1,'2019-01-03 06:19:36',NULL),
(94,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/12','Update data List of Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Agreement Request  List</td><td>List of Agreement Request</td></tr><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>',1,'2019-01-03 06:20:27',NULL),
(95,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/status_type/add-save','Add New Data Waiting to send Doc verifier at Agreement Status','',1,'2019-01-03 06:24:06',NULL),
(96,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/status_type/add-save','Add New Data Doc Verifier  Approved at Agreement Status','',1,'2019-01-03 06:26:19',NULL),
(97,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/status_type/add-save','Add New Data Waiting for Doc Approver at Agreement Status','',1,'2019-01-03 06:27:05',NULL),
(98,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/status_type/add-save','Add New Data Doc Approver Approved at Agreement Status','',1,'2019-01-03 06:27:29',NULL),
(99,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/status_type/add-save','Add New Data Waiting for AGC Admin at Agreement Status','',1,'2019-01-03 06:27:50',NULL),
(100,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_request','Try view the data :name at Agreement Request','',3,'2019-01-03 06:40:33',NULL),
(101,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_request','Try view the data :name at Agreement Request','',3,'2019-01-03 06:40:36',NULL),
(102,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/6','Update data Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>',1,'2019-01-03 06:41:06',NULL),
(103,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-03 06:46:45',NULL),
(104,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-03 06:47:12',NULL),
(105,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/12','Update data List of Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>',1,'2019-01-03 06:48:21',NULL),
(106,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/agreement_request','Try view the data :name at Agreement Request','',3,'2019-01-03 07:05:36',NULL),
(107,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-04 06:31:49',NULL),
(108,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-04 06:36:32',NULL),
(109,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-07 05:15:18',NULL),
(110,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data verifier one at Users Management','',1,'2019-01-07 05:18:41',NULL),
(111,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data Approver at Users Management','',1,'2019-01-07 05:19:20',NULL),
(112,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/edit-save/8','Update data Approver one at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Approver</td><td>Approver one</td></tr><tr><td>password</td><td>$2y$10$DdRdS5l0n4MHE2J.DcFd5ucQFnE/EEW4McG/C8iW9KXoiJQATb7oq</td><td></td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>division_id</td><td>1</td><td></td></tr><tr><td>state_id</td><td>36,56</td><td></td></tr><tr><td>pca_id</td><td>1,2</td><td></td></tr><tr><td>agreement_id</td><td></td><td></td></tr></tbody></table>',1,'2019-01-07 05:42:36',NULL),
(113,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-07 05:54:35',NULL),
(114,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-07 05:55:54',NULL),
(115,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-07 05:58:31',NULL),
(116,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/edit-save/7','Update data verifier one at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td></td><td>$2y$10$zDhXHgJXl/eaYC/QYu6VS.oE6kFB.X0pppeh/p.isXNYR1thvT/FW</td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>division_id</td><td>1</td><td></td></tr><tr><td>state_id</td><td>36,56</td><td></td></tr><tr><td>pca_id</td><td>1,2</td><td></td></tr><tr><td>agreement_id</td><td></td><td></td></tr></tbody></table>',1,'2019-01-07 05:59:23',NULL),
(117,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier1@gmail.com login with IP Address 127.0.0.1','',7,'2019-01-07 05:59:30',NULL),
(118,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier1@gmail.com logout','',7,'2019-01-07 07:31:46',NULL),
(119,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-07 07:31:52',NULL),
(120,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver1@gmail.com login with IP Address 127.0.0.1','',8,'2019-01-07 07:32:03',NULL),
(121,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-07 07:32:12',NULL),
(122,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver1@gmail.com logout','',8,'2019-01-07 08:40:46',NULL),
(123,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-07 08:40:53',NULL),
(124,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data AGC Incharge at Users Management','',1,'2019-01-07 09:02:34',NULL),
(125,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data AGC Approver at Users Management','',1,'2019-01-07 09:03:43',NULL),
(126,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-07 09:09:19',NULL),
(127,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-07 09:09:26',NULL),
(128,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-07 11:28:27',NULL),
(129,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-07 11:28:43',NULL),
(130,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-09 06:15:57',NULL),
(131,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-11 07:03:21',NULL),
(132,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-11 07:04:29',NULL),
(133,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-11 09:52:47',NULL),
(134,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-11 09:55:11',NULL),
(135,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-11 09:55:26',NULL),
(136,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-11 09:55:59',NULL),
(137,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-11 09:56:12',NULL),
(138,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-11 10:02:02',NULL),
(139,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-11 10:02:15',NULL),
(140,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-11 10:03:07',NULL),
(141,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-11 10:03:18',NULL),
(142,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-11 10:04:19',NULL),
(143,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-11 10:04:33',NULL),
(144,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-12 05:09:10',NULL),
(145,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-14 05:02:14',NULL),
(146,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/agreement_sample_document/edit-save/2','Update data uploads/1/2018-12/completedepes.docx at Agreement Sample Document','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>filename1</td><td></td><td>uploads/1/2019-01/ac_avatar_ug.png</td></tr></tbody></table>',1,'2019-01-14 05:25:44',NULL),
(147,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-14 05:54:30',NULL),
(148,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-14 06:04:00',NULL),
(149,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-14 06:12:46',NULL),
(150,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-14 06:12:52',NULL),
(151,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-14 06:13:25',NULL),
(152,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-14 06:13:31',NULL),
(153,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-14 06:15:24',NULL),
(154,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-14 06:15:44',NULL),
(155,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-14 06:16:29',NULL),
(156,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-14 06:16:44',NULL),
(157,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-14 06:17:33',NULL),
(158,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-14 06:17:40',NULL),
(159,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-14 08:50:13',NULL),
(160,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcapprover@gmail.com login with IP Address 127.0.0.1','',10,'2019-01-14 08:50:24',NULL),
(161,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcapprover@gmail.com logout','',10,'2019-01-14 08:51:02',NULL),
(162,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-14 08:51:09',NULL),
(163,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-17 06:08:29',NULL),
(164,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-17 06:09:36',NULL),
(165,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-17 06:48:26',NULL),
(166,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-17 06:48:47',NULL),
(167,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-17 06:49:37',NULL),
(168,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-17 06:50:01',NULL),
(169,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-17 06:50:12',NULL),
(170,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-17 06:51:32',NULL),
(171,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-17 06:51:47',NULL),
(172,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-17 07:33:03',NULL),
(173,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-17 07:33:09',NULL),
(174,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-18 04:53:29',NULL),
(175,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-18 04:55:25',NULL),
(176,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-18 04:56:50',NULL),
(177,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-18 04:56:57',NULL),
(178,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-21 10:35:50',NULL),
(179,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-22 05:40:02',NULL),
(180,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-22 05:41:11',NULL),
(181,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-22 05:58:08',NULL),
(182,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-22 05:58:21',NULL),
(183,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-22 05:59:00',NULL),
(184,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-22 05:59:17',NULL),
(185,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-22 05:59:44',NULL),
(186,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-22 05:59:55',NULL),
(187,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-22 06:00:56',NULL),
(188,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-22 06:01:18',NULL),
(189,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-22 06:01:34',NULL),
(190,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-22 06:29:16',NULL),
(191,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/add-save','Add New Data Users Management at Menu Management','',1,'2019-01-22 06:32:21',NULL),
(192,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/15','Update data Users Management at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>',1,'2019-01-22 06:36:37',NULL),
(193,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/15','Update data Users Management at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>type</td><td>Route</td><td>URL</td></tr><tr><td>path</td><td>users</td><td>/admin/users</td></tr><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>',1,'2019-01-22 06:38:48',NULL),
(194,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-22 06:54:21',NULL),
(195,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/add-save','Add New Data farmer at Users Management','',1,'2019-01-22 07:39:12',NULL),
(196,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-22 07:39:41',NULL),
(197,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/edit-save/11','Update data farmer at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td></td><td>$2y$10$tqbZxx7eItcqw6tiPmPsJOUbOWU.0LjsEccIRqbsmQLNqCIlBL8Py</td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>division_id</td><td></td><td></td></tr><tr><td>state_id</td><td></td><td></td></tr><tr><td>pca_id</td><td></td><td></td></tr><tr><td>agreement_id</td><td></td><td></td></tr></tbody></table>',1,'2019-01-22 07:40:12',NULL),
(198,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','john1234@gmail.com login with IP Address 127.0.0.1','',11,'2019-01-22 07:40:21',NULL),
(199,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-23 05:29:08',NULL),
(200,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-23 09:04:10',NULL),
(201,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-23 09:18:03',NULL),
(202,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/attachment/edit-save/3','Update data proof at Attachment','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>discription</td><td></td><td>upload proof</td></tr></tbody></table>',1,'2019-01-23 09:34:26',NULL),
(203,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/attachment/edit-save/2','Update data ID at Attachment','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>discription</td><td></td><td>all ID\'s</td></tr></tbody></table>',1,'2019-01-23 09:35:12',NULL),
(204,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/attachment/edit-save/1','Update data photo at Attachment','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>discription</td><td></td><td>your photos</td></tr></tbody></table>',1,'2019-01-23 09:35:32',NULL),
(205,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-23 11:03:32',NULL),
(206,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-23 11:03:58',NULL),
(207,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-24 04:54:45',NULL),
(208,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-24 05:01:13',NULL),
(209,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-24 05:01:19',NULL),
(210,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-25 05:02:42',NULL),
(211,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-25 05:02:50',NULL),
(212,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-25 05:03:04',NULL),
(213,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-25 05:03:27',NULL),
(214,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-25 05:43:12',NULL),
(215,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-25 05:43:19',NULL),
(216,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-25 07:26:21',NULL),
(217,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-25 07:26:30',NULL),
(218,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-25 07:27:02',NULL),
(219,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-25 07:27:13',NULL),
(220,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-25 07:29:40',NULL),
(221,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-25 07:29:54',NULL),
(222,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-25 09:01:38',NULL),
(223,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-25 09:04:20',NULL),
(224,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-25 11:09:21',NULL),
(225,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcapprover@gmail.com login with IP Address 127.0.0.1','',10,'2019-01-25 11:09:32',NULL),
(226,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-25 12:44:20',NULL),
(227,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-25 12:44:29',NULL),
(228,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-28 05:26:56',NULL),
(229,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-28 05:27:12',NULL),
(230,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-28 05:55:03',NULL),
(231,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-28 05:55:09',NULL),
(232,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-28 05:56:00',NULL),
(233,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-28 06:27:20',NULL),
(234,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-28 06:28:42',NULL),
(235,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-28 06:28:54',NULL),
(236,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-28 06:30:00',NULL),
(237,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-28 06:30:07',NULL),
(238,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-28 07:05:36',NULL),
(239,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-28 07:05:54',NULL),
(240,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-28 07:07:10',NULL),
(241,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-28 07:07:21',NULL),
(242,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-28 09:56:59',NULL),
(243,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-28 09:57:22',NULL),
(244,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-28 09:58:01',NULL),
(245,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-28 09:58:10',NULL),
(246,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-28 10:01:28',NULL),
(247,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-28 10:01:52',NULL),
(248,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-28 10:02:16',NULL),
(249,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-28 10:02:25',NULL),
(250,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-28 10:02:41',NULL),
(251,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-28 10:03:12',NULL),
(252,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-28 10:03:18',NULL),
(253,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-28 10:05:13',NULL),
(254,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-28 10:05:44',NULL),
(255,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-28 10:08:08',NULL),
(256,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-28 10:09:12',NULL),
(257,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-28 10:10:36',NULL),
(258,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0','http://localhost:8000/admin/login','agcapprover@gmail.com login with IP Address 127.0.0.1','',10,'2019-01-28 10:10:41',NULL),
(259,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-28 10:14:12',NULL),
(260,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-28 10:35:50',NULL),
(261,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-28 10:35:59',NULL),
(262,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-28 10:43:43',NULL),
(263,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-28 10:43:58',NULL),
(264,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-28 10:46:48',NULL),
(265,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-28 10:47:00',NULL),
(266,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-28 10:47:57',NULL),
(267,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcapprover@gmail.com login with IP Address 127.0.0.1','',10,'2019-01-28 10:48:28',NULL),
(268,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/agreement_sample_document/edit-save/2','Update data  at Agreement Sample Document','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>filename</td><td>uploads/1/2018-12/completedepes.docx</td><td></td></tr><tr><td>document</td><td>uploads/1/2019-01/ac_avatar_ug.png</td><td><p class=\"p\"><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">List the primary job duties and responsibilities using headings and then give examples of the types of activities under each heading. Using headings and giving examples of the types of activities to be done allows you to develop a flexible job description that encourages employee to ‘work outside the box’ and within reason, discourages “that’s not my job”.</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Identify between three and eight primary duties and responsibilities for the position</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">List the primary duties and responsibilities in order of importance</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Begin each statement with an action verb</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Use the present tense of verbs</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Use gender neutral language such as s/he</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Use generic language such a photocopy instead of Xerox</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Where appropriate use qualifiers to clarify the task – where, when, why or how often – for example instead of “greet visitor to the office” use “greet visitors to the office in a professional and friendly manner”</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Avoid words that are open to interpretation – for example instead of “handle incoming mail” use “sort and distribute incoming mail”</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p></td></tr></tbody></table>',1,'2019-01-28 10:58:52',NULL),
(269,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcapprover@gmail.com logout','',10,'2019-01-28 11:07:18',NULL),
(270,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-28 11:07:39',NULL),
(271,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-29 05:39:28',NULL),
(272,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-29 05:40:18',NULL),
(273,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-29 05:40:49',NULL),
(274,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-29 05:47:04',NULL),
(275,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-29 06:59:35',NULL),
(276,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-29 06:59:45',NULL),
(277,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-29 07:02:07',NULL),
(278,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-29 07:02:19',NULL),
(279,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-01-29 07:03:26',NULL),
(280,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-29 07:03:36',NULL),
(281,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-29 07:10:58',NULL),
(282,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-29 07:11:04',NULL),
(283,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-29 07:35:51',NULL),
(284,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-29 07:35:58',NULL),
(285,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-01-29 07:37:45',NULL),
(286,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-29 07:37:58',NULL),
(287,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/agreement_sample_document/edit-save/2','Update data  at Agreement Sample Document','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>filename</td><td>uploads/1/2018-12/completedepes.docx</td><td></td></tr><tr><td>document</td><td><p class=\"p\"><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">List the primary job duties and responsibilities using headings and then give examples of the types of activities under each heading. Using headings and giving examples of the types of activities to be done allows you to develop a flexible job description that encourages employee to ‘work outside the box’ and within reason, discourages “that’s not my job”.</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Identify between three and eight primary duties and responsibilities for the position</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">List the primary duties and responsibilities in order of importance</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Begin each statement with an action verb</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Use the present tense of verbs</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Use gender neutral language such as s/he</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Use generic language such a photocopy instead of Xerox</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Where appropriate use qualifiers to clarify the task – where, when, why or how often – for example instead of “greet visitor to the office” use “greet visitors to the office in a professional and friendly manner”</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-top:5.0000pt;margin-bottom:5.0000pt;margin-left:36.0000pt;mso-margin-top-alt:auto;mso-margin-bottom-alt:auto;text-indent:-18.0000pt;mso-pagination:widow-orphan;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:Symbol;mso-fareast-font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">·&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:Georgia;font-size:10.0000pt;mso-font-kerning:0.0000pt;\">Avoid words that are open to interpretation – for example instead of “handle incoming mail” use “sort and distribute incoming mail”</span><span style=\"mso-spacerun:\'yes\';font-family:Calibri;mso-fareast-font-family:SimSun;mso-bidi-font-family:\'Times New Roman\';font-size:12.0000pt;mso-font-kerning:0.0000pt;\"><o:p></o:p></span></p></td><td><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></b></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\">RENTAL AGREEMENT</span></u></b><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p></o:p></span></u></b></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">THIS INDENTURE of rental agreement is applicable from the 10</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;day of April, 2017 at Bangalore, between Smt. Manjula V residing at #123, Ashok Nilaya, 20</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;Cross, K.R. Layout JP Nagar 6</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;phase, Bangalore 560078. Herein after called the ‘OWNER’ of the one part:</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\">AND</span></u></b><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p></o:p></span></u></b></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;background:rgb(255,255,0);mso-highlight:rgb(255,255,0);\">Jitendra S/0</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;the Expression OWNER and TENANT wherever the context so admits shall be taken to mean and include their respective heirs, legal representatives, executors and assigns.Whereas the OWNER is the absolute owner of the house premises situated in the ground floor of &nbsp;&nbsp;#123, Ashok Nilaya, 20</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;Cross, K.R. Layout JP Nagar 6</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;phase, Bangalore 560078 and hereinafter referred to as Scheduled premises.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\">NOW THIS AGREEMENT WITNESSETH AS FOLLOWS</span></u><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p></o:p></span></u></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p>&nbsp;</o:p></span></u></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">1.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">The Tenancy is executed for a period of 12 months and shall commence from the above said date. It may be renewed for further periods with mutual consent of both the parties.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">2.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">The TENANT has this day paid a sum of Rs. 50,000 (Rupees Forty Thousand only) to the OWNER by as advance before the following witnesses which sum the OWNER shall be acknowledged. This advance shall not carry any interest and is refundable to the tenant at the time of vacating the schedule premises subject to the deductions of arrears of rent, electricity charges etc, if any.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">3.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">The TENANT shall pay monthly rent of Rs. 6500/- (Rupees Five thousand five hundred only) to the OWNER on or before the 10</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;of every month regularly </span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">4.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">Every year on renewal of agreement rent will be increased by 5%.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">5.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">The TENANT shall also pay the electricity charges and Water charges of the schedule premises as per bills every month without keeping any arrears.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">6.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">The TENANT shall under no circumstances shall sublet or underlet or in any way part with the possession of the schedule premises and Tenant will not include any other members in this present scheduled premise other than members in the agreement without written consent of the OWNER.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">7.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">In case of any damages to the schedule property the TENANT shall get it repaired at his own cost and expenses and the damages are found at the time of vacating the equivalent amount for repairing/painting will be deducted from the advance.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"margin-left:36.0000pt;text-indent:-18.0000pt;text-align:justify;text-justify:inter-ideograph;mso-list:l0 level1 lfo1;\"><!--[if !supportLists]--><span style=\"font-family:\'Times New Roman\';font-size:12.0000pt;\">8.&nbsp;</span><!--[endif]--><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">The OWNER shall pay the annual corporation/Municipal tax of the schedule premises. </span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center;\"><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\">S C H E D U L E</span></u></b><b><u><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\"><o:p></o:p></span></u></b></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">All the piece and parcel of the property bearing premises #123, ground floor Ashok Nilaya, 20</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;Cross, K.R. Layout JP Nagar 6</span><sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;vertical-align:super;\">th</span></sup><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;phase, Bangalore 560078.Consisting of One Bedroom, One Hall, Kitchen, Bathroom, Lavatory and RCC roofing thereon.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">For Tenant convenience the Schedule premises is provided with two fans, Geyser, 1 cot and one almirah which will be returned to the owner in good condition at time of vacating.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" align=\"justify\" style=\"text-align:justify;text-justify:inter-ideograph;\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">IN WITNESS WHEREOF of the above name parties affixed their signatures to this possession Rental Agreement on this day month, and year as mentioned above written at Bangalore.</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">WITNESSES &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">1. &nbsp;&nbsp;&nbsp;</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">	</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OWNER</span><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:\'Times New Roman\';font-size:12.0000pt;\">2.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 12pt;\">TENANT</span></p></td></tr></tbody></table>',1,'2019-01-29 08:57:32',NULL),
(288,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/pca_mapping/delete/2','Delete data 2 at PCA Mapping','',1,'2019-01-29 09:08:37',NULL),
(289,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-29 12:05:45',NULL),
(290,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/agreement_sample_document/add-save','Add New Data  at Agreement Sample Document','',1,'2019-01-29 12:23:31',NULL),
(291,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-29 12:24:38',NULL),
(292,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-29 12:26:03',NULL),
(293,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-29 12:26:13',NULL),
(294,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-01-29 12:27:54',NULL),
(295,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-01-29 12:28:12',NULL),
(296,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-30 05:17:27',NULL),
(297,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-30 05:18:33',NULL),
(298,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-30 05:18:39',NULL),
(299,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-01-30 06:00:14',NULL),
(300,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-01-30 06:01:18',NULL),
(301,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcapprover@gmail.com login with IP Address 127.0.0.1','',10,'2019-01-30 06:01:24',NULL),
(302,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-01-31 05:10:00',NULL),
(303,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-01-31 06:00:02',NULL),
(304,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout',' logout','',NULL,'2019-01-31 09:23:35',NULL),
(305,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-01-31 09:59:04',NULL),
(306,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-01-31 10:01:32',NULL),
(307,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-01-31 10:01:52',NULL),
(308,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-01-31 10:03:24',NULL),
(309,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-01-31 10:03:36',NULL),
(310,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-04 05:12:07',NULL),
(311,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-04 05:12:32',NULL),
(312,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-04 06:47:38',NULL),
(313,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-06 05:01:47',NULL),
(314,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-06 05:12:15',NULL),
(315,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-06 09:05:04',NULL),
(316,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-06 09:07:44',NULL),
(317,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-02-06 09:07:51',NULL),
(318,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-02-06 09:14:00',NULL),
(319,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-02-06 09:14:09',NULL),
(320,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-02-06 09:22:33',NULL),
(321,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-06 09:22:47',NULL),
(322,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-06 09:23:06',NULL),
(323,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-02-06 09:23:18',NULL),
(324,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-02-06 09:23:48',NULL),
(325,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-02-06 09:24:01',NULL),
(326,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-02-06 09:31:34',NULL),
(327,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-06 09:33:40',NULL),
(328,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-06 09:34:32',NULL),
(329,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-02-06 09:34:43',NULL),
(330,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-02-06 09:35:24',NULL),
(331,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-02-06 09:35:40',NULL),
(332,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-02-06 09:49:23',NULL),
(333,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-02-06 09:49:40',NULL),
(334,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-02-06 09:51:11',NULL),
(335,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-02-06 09:51:24',NULL),
(336,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-07 05:10:25',NULL),
(337,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-07 05:12:05',NULL),
(338,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcverifier@gmail.com login with IP Address 127.0.0.1','',6,'2019-02-07 05:30:31',NULL),
(339,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/division/edit-save/2','Update data Aqua at Division','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>state_id</td><td>56</td><td></td></tr><tr><td>city_id</td><td>1</td><td></td></tr><tr><td>division_doc_code</td><td></td><td>Q</td></tr></tbody></table>',1,'2019-02-07 05:37:13',NULL),
(340,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/division/edit-save/1','Update data Agro at Division','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>state_id</td><td>56</td><td></td></tr><tr><td>city_id</td><td>1</td><td></td></tr><tr><td>division_doc_code</td><td></td><td>G</td></tr></tbody></table>',1,'2019-02-07 05:37:24',NULL),
(341,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/edit-save/1','Update data Farm BC at Business Unit','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>business_unit_code</td><td></td><td>5651</td></tr><tr><td>business_unit_doc_code</td><td></td><td>A</td></tr></tbody></table>',1,'2019-02-07 05:40:24',NULL),
(342,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/edit-save/2','Update data Forrest Potter at Business Unit','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>business_unit_code</td><td></td><td>89454</td></tr><tr><td>business_unit_doc_code</td><td></td><td>E</td></tr></tbody></table>',1,'2019-02-07 05:40:43',NULL),
(343,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcverifier@gmail.com logout','',6,'2019-02-07 06:06:12',NULL),
(344,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcapprover@gmail.com login with IP Address 127.0.0.1','',10,'2019-02-07 06:06:19',NULL),
(345,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcapprover@gmail.com logout','',10,'2019-02-07 09:03:11',NULL),
(346,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-02-07 09:03:22',NULL),
(347,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-08 04:51:51',NULL),
(348,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-08 04:53:02',NULL),
(349,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/9','Update data State at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr></tbody></table>',1,'2019-02-08 05:08:44',NULL),
(350,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/9','Update data State at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-th-list</td></tr></tbody></table>',1,'2019-02-08 05:10:10',NULL),
(351,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/2','Update data Division at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-th-list</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>',1,'2019-02-08 05:10:39',NULL),
(352,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/7','Update data Business Unit at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-th-list</td></tr><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>',1,'2019-02-08 05:11:11',NULL),
(353,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/8','Update data PCA at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-th-list</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>',1,'2019-02-08 05:11:43',NULL),
(354,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/4','Update data Attachment at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-files-o</td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>',1,'2019-02-08 05:12:35',NULL),
(355,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/5','Update data Agreement at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-file-pdf-o</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>',1,'2019-02-08 05:13:10',NULL),
(356,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/11','Update data Agreement Sample Document at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-file-pdf-o</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>',1,'2019-02-08 05:13:48',NULL),
(357,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/delete/14','Delete data Agreement Status at Menu Management','',1,'2019-02-08 05:14:36',NULL),
(358,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/10','Update data PCA Mapping at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-link</td></tr><tr><td>sorting</td><td>9</td><td></td></tr></tbody></table>',1,'2019-02-08 05:16:04',NULL),
(359,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/6','Update data Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-send</td></tr><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>',1,'2019-02-08 05:20:34',NULL),
(360,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/12','Update data List of Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>icon</td><td>fa fa-glass</td><td>fa fa-list</td></tr><tr><td>sorting</td><td>11</td><td></td></tr></tbody></table>',1,'2019-02-08 05:21:11',NULL),
(361,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-11 05:08:19',NULL),
(362,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-11 06:02:53',NULL),
(363,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/add-save','Add New Data Renewal List at Menu Management','',1,'2019-02-11 06:51:34',NULL),
(364,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-02-11 06:52:45',NULL),
(365,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-11 06:53:01',NULL),
(366,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/16','Update data Renewal List at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>12</td><td></td></tr></tbody></table>',1,'2019-02-11 06:53:25',NULL),
(367,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/16','Update data Renewal List at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>renewal-lis</td><td>renewal-list</td></tr><tr><td>sorting</td><td>12</td><td></td></tr></tbody></table>',1,'2019-02-11 06:53:40',NULL),
(368,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/16','Update data Renewal List at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>renewal-list</td><td>admin/renewal-list</td></tr><tr><td>sorting</td><td>12</td><td></td></tr></tbody></table>',1,'2019-02-11 06:54:49',NULL),
(369,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-13 04:32:04',NULL),
(370,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-13 04:52:27',NULL),
(371,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-02-13 04:54:48',NULL),
(372,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/edit-save/2','Update data Imogene Rush at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$AfqsDuuINkcgRwgnV6f1R.JBrl4GPp3Oizpt4S8a0ORvYicsDZjDu</td><td></td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>employeeid</td><td>Obcaecati eos odio quos sapiente nobis consectetur non nobis soluta ut accusamus aliqua Est earum eiusmod natus duis</td><td>553132</td></tr><tr><td>division_id</td><td>1</td><td></td></tr><tr><td>state_id</td><td>36,56</td><td></td></tr><tr><td>pca_id</td><td>1,2</td><td></td></tr><tr><td>agreement_id</td><td>3</td><td></td></tr></tbody></table>',1,'2019-02-13 05:51:23',NULL),
(373,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcincharge@gmail.com logout','',9,'2019-02-13 06:05:31',NULL),
(374,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-02-13 06:05:37',NULL),
(375,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','admin@admin.com logout','',1,'2019-02-13 13:17:13',NULL),
(376,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-13 13:17:31',NULL),
(377,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-14 09:06:08',NULL),
(378,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-14 09:10:19',NULL),
(379,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-15 05:31:30',NULL),
(380,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-15 05:33:04',NULL),
(381,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-15 05:50:33',NULL),
(382,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-15 05:51:56',NULL),
(383,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier1@gmail.com login with IP Address 127.0.0.1','',7,'2019-02-15 05:52:11',NULL),
(384,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier1@gmail.com logout','',7,'2019-02-15 06:12:32',NULL),
(385,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-15 06:12:51',NULL),
(386,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-15 06:59:54',NULL),
(387,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier1@gmail.com login with IP Address 127.0.0.1','',7,'2019-02-15 07:00:06',NULL),
(388,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier1@gmail.com logout','',7,'2019-02-15 07:00:40',NULL),
(389,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-02-15 07:00:57',NULL),
(390,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-02-15 07:06:13',NULL),
(391,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-18 08:42:50',NULL),
(392,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-18 11:08:46',NULL),
(393,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-02-18 11:12:18',NULL),
(394,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-18 11:12:30',NULL),
(395,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-02-18 11:17:19',NULL),
(396,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier1@gmail.com login with IP Address 127.0.0.1','',7,'2019-02-18 11:17:37',NULL),
(397,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier1@gmail.com login with IP Address 127.0.0.1','',7,'2019-02-18 11:20:55',NULL),
(398,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier1@gmail.com logout','',7,'2019-02-18 11:21:02',NULL),
(399,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-18 11:21:11',NULL),
(400,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-18 11:23:39',NULL),
(401,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-18 11:24:00',NULL),
(402,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-02-18 11:24:37',NULL),
(403,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-18 11:24:50',NULL),
(404,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier1@gmail.com logout','',7,'2019-02-18 11:31:33',NULL),
(405,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-18 11:31:40',NULL),
(406,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver1@gmail.com login with IP Address 127.0.0.1','',8,'2019-02-18 11:31:55',NULL),
(407,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-02-18 11:32:22',NULL),
(408,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver1@gmail.com logout','',8,'2019-02-18 11:33:25',NULL),
(409,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-02-18 11:33:44',NULL),
(410,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-19 06:14:23',NULL),
(411,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-19 10:04:35',NULL),
(412,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/11','Update data Agreement Sample Document at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>',1,'2019-02-19 11:45:19',NULL),
(413,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/6','Update data Agreement Request at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>',1,'2019-02-19 11:45:38',NULL),
(414,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-22 05:51:02',NULL),
(415,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/menu_management/edit-save/11','Update data Agreement Format Document at Menu Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Agreement Sample Document</td><td>Agreement Format Document</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>',1,'2019-02-22 06:50:05',NULL),
(416,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','admin@admin.com logout','',1,'2019-02-22 07:06:57',NULL),
(417,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-22 07:07:32',NULL),
(418,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users','Try view the data :name at Users Management','',2,'2019-02-22 09:22:37',NULL),
(419,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-22 12:35:21',NULL),
(420,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/edit-save/10','Update data AGC Approver at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$gTOL6IG3mFVySoihxZzzD..m5JTwrby2XJNtuUENbyR2hxzDULs4G</td><td></td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>employeeid</td><td>1234568</td><td>11111111</td></tr><tr><td>division_id</td><td>1,2</td><td></td></tr><tr><td>state_id</td><td></td><td></td></tr><tr><td>pca_id</td><td></td><td></td></tr><tr><td>agreement_id</td><td></td><td></td></tr></tbody></table>',1,'2019-02-22 12:36:32',NULL),
(421,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/edit-save/9','Update data AGC Incharge at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$kO4GuXVziWR7p5Cbp4FLbOCi93MbljcKM.FrJlmQLHU8BKJDBWU.G</td><td></td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>employeeid</td><td>1234568</td><td>2222222</td></tr><tr><td>division_id</td><td>1</td><td></td></tr><tr><td>state_id</td><td></td><td></td></tr><tr><td>pca_id</td><td></td><td></td></tr><tr><td>agreement_id</td><td></td><td></td></tr></tbody></table>',1,'2019-02-22 12:36:53',NULL),
(422,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-02-22 12:37:19',NULL),
(423,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-02-22 12:37:26',NULL),
(424,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-25 05:06:39',NULL),
(425,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-25 05:07:13',NULL),
(426,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/users/edit-save/3','Update data verifier at Users Management','<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$Ht.P1/LcfTI2vEYvnFBlwu3UW7wS.o3q6Z5oP2uM1NXov5L//22GC</td><td></td></tr><tr><td>status</td><td></td><td></td></tr><tr><td>employeeid</td><td>1234568</td><td>1234568sd</td></tr><tr><td>division_id</td><td>1</td><td></td></tr><tr><td>state_id</td><td>36</td><td></td></tr><tr><td>pca_id</td><td>2</td><td></td></tr><tr><td>agreement_id</td><td>3</td><td></td></tr></tbody></table>',1,'2019-02-25 05:14:48',NULL),
(427,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','verifier@gmail.com login with IP Address 127.0.0.1','',3,'2019-02-25 05:15:10',NULL),
(428,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','verifier@gmail.com logout','',3,'2019-02-25 05:15:51',NULL),
(429,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','approver@gmail.com login with IP Address 127.0.0.1','',4,'2019-02-25 05:16:05',NULL),
(430,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','approver@gmail.com logout','',4,'2019-02-25 05:20:26',NULL),
(431,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcadmin@gmail.com login with IP Address 127.0.0.1','',5,'2019-02-25 05:20:51',NULL),
(432,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcadmin@gmail.com logout','',5,'2019-02-25 05:40:12',NULL),
(433,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcapprover@gmail.com login with IP Address 127.0.0.1','',10,'2019-02-25 05:40:26',NULL),
(434,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','agcapprover@gmail.com logout','',10,'2019-02-25 05:41:10',NULL),
(435,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','agcincharge@gmail.com login with IP Address 127.0.0.1','',9,'2019-02-25 05:41:30',NULL),
(436,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','requester1@gmail.com logout','',2,'2019-02-25 07:21:30',NULL),
(437,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','requester1@gmail.com login with IP Address 127.0.0.1','',2,'2019-02-25 07:22:00',NULL),
(438,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','admin@admin.com login with IP Address 127.0.0.1','',1,'2019-02-26 08:39:28',NULL),
(439,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data PUNJAB at State','',1,'2019-02-26 08:54:15',NULL),
(440,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data HARYANA at State','',1,'2019-02-26 08:54:31',NULL),
(441,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data WEST BENGAL at State','',1,'2019-02-26 08:54:41',NULL),
(442,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data MAHARASHTRA at State','',1,'2019-02-26 08:54:51',NULL),
(443,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data ANDHRA PRADESH at State','',1,'2019-02-26 08:54:59',NULL),
(444,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data KARNATAKA at State','',1,'2019-02-26 08:55:08',NULL),
(445,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data TAMILNADU at State','',1,'2019-02-26 08:55:17',NULL),
(446,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data PONDICHERRY at State','',1,'2019-02-26 08:55:24',NULL),
(447,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data TELANGANA at State','',1,'2019-02-26 08:55:36',NULL),
(448,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data KERALA at State','',1,'2019-02-26 08:55:43',NULL),
(449,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data GUJRAT at State','',1,'2019-02-26 08:55:51',NULL),
(450,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/state/add-save','Add New Data ODISHA at State','',1,'2019-02-26 08:56:00',NULL),
(451,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Head Office at Business Unit','',1,'2019-02-26 08:57:17',NULL),
(452,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPA Head Office at Business Unit','',1,'2019-02-26 08:57:27',NULL),
(453,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Southern at Business Unit','',1,'2019-02-26 08:57:38',NULL),
(454,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Eastern at Business Unit','',1,'2019-02-26 08:57:47',NULL),
(455,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Western at Business Unit','',1,'2019-02-26 08:57:57',NULL),
(456,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Northern at Business Unit','',1,'2019-02-26 08:58:06',NULL),
(457,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Northeast at Business Unit','',1,'2019-02-26 08:58:16',NULL),
(458,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Foods at Business Unit','',1,'2019-02-26 08:58:24',NULL),
(459,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Aqua Feed at Business Unit','',1,'2019-02-26 08:58:34',NULL),
(460,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPA Aqua Feed at Business Unit','',1,'2019-02-26 08:58:44',NULL),
(461,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPA Aqua Farm at Business Unit','',1,'2019-02-26 08:59:02',NULL),
(462,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Aqua Farm at Business Unit','',1,'2019-02-26 08:59:11',NULL),
(463,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPA Aqua Foods at Business Unit','',1,'2019-02-26 08:59:20',NULL),
(464,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/business_unit/add-save','Add New Data CPI Aqua Foods at Business Unit','',1,'2019-02-26 08:59:30',NULL),
(465,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/login','srinivasarao.kar@cp-india.com login with IP Address 127.0.0.1','',12,'2019-02-26 12:00:50',NULL),
(466,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36','http://localhost:8000/admin/logout','srinivasarao.kar@cp-india.com logout','',12,'2019-02-26 12:18:50',NULL);

/*Table structure for table `cms_menus` */

DROP TABLE IF EXISTS `cms_menus`;

CREATE TABLE `cms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_menus` */

insert  into `cms_menus`(`id`,`name`,`type`,`path`,`color`,`icon`,`parent_id`,`is_active`,`is_dashboard`,`id_cms_privileges`,`sorting`,`created_at`,`updated_at`) values 
(2,'Division','Route','AdminDivisionControllerGetIndex','normal','fa fa-th-list',0,1,0,1,2,'2018-11-22 09:24:00','2019-02-08 05:10:38'),
(4,'Attachment','Route','AdminAttachmentControllerGetIndex','normal','fa fa-files-o',0,1,0,1,5,'2018-11-22 09:51:23','2019-02-08 05:12:35'),
(5,'Agreement','Route','AdminAgreementControllerGetIndex','normal','fa fa-file-pdf-o',0,1,0,1,6,'2018-11-22 09:57:20','2019-02-08 05:13:10'),
(6,'Agreement Request','Route','AdminAgreementRequestControllerGetIndex','normal','fa fa-send',0,1,0,1,10,'2018-11-28 09:46:52','2019-02-19 11:45:37'),
(7,'Business Unit','Route','AdminBusinessUnitControllerGetIndex','normal','fa fa-th-list',0,1,0,1,3,'2018-12-06 08:42:50','2019-02-08 05:11:11'),
(8,'PCA','Route','AdminPcaControllerGetIndex','normal','fa fa-th-list',0,1,0,1,4,'2018-12-06 08:44:27','2019-02-08 05:11:42'),
(9,'State','Route','AdminStateControllerGetIndex','normal','fa fa-th-list',0,1,0,1,1,'2018-12-14 07:33:22','2019-02-08 05:10:10'),
(10,'PCA Mapping','Route','AdminPcaMappingControllerGetIndex','normal','fa fa-link',0,1,0,1,9,'2018-12-27 05:37:08','2019-02-08 05:16:03'),
(11,'Agreement Format Document','Route','AdminAgreementSampleDocumentControllerGetIndex','normal','fa fa-file-pdf-o',0,1,0,1,7,'2018-12-28 09:18:54','2019-02-22 06:50:04'),
(12,'List of Agreement Request','Controller & Method','MainController@listing','normal','fa fa-list',0,1,0,1,11,'2019-01-03 06:13:55','2019-02-08 05:21:11'),
(15,'Users Management','URL','/admin/users','normal','fa fa-users',0,1,0,1,8,'2019-01-22 06:32:20','2019-01-22 06:38:47'),
(16,'Renewal List','URL','admin/renewal-list','normal','fa fa-file-pdf-o',0,1,0,1,12,'2019-02-11 06:51:34','2019-02-11 06:54:48');

/*Table structure for table `cms_menus_privileges` */

DROP TABLE IF EXISTS `cms_menus_privileges`;

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_menus_privileges` */

insert  into `cms_menus_privileges`(`id`,`id_cms_menus`,`id_cms_privileges`) values 
(1,1,1),
(3,3,1),
(46,14,1),
(60,15,2),
(61,15,3),
(62,15,1),
(66,9,2),
(67,9,3),
(68,9,1),
(69,2,2),
(70,2,3),
(71,2,1),
(72,7,2),
(73,7,3),
(74,7,1),
(75,8,2),
(76,8,3),
(77,8,1),
(78,4,2),
(79,4,3),
(80,4,1),
(81,5,2),
(82,5,3),
(83,5,1),
(87,10,2),
(88,10,3),
(89,10,1),
(94,12,4),
(95,12,10),
(96,12,9),
(97,12,5),
(98,12,8),
(99,12,7),
(100,NULL,6),
(103,16,6),
(108,6,2),
(109,6,6),
(110,6,1),
(111,11,4),
(112,11,2),
(113,11,3),
(114,11,1);

/*Table structure for table `cms_moduls` */

DROP TABLE IF EXISTS `cms_moduls`;

CREATE TABLE `cms_moduls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_moduls` */

insert  into `cms_moduls`(`id`,`name`,`icon`,`path`,`table_name`,`controller`,`is_protected`,`is_active`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'Notifications','fa fa-cog','notifications','cms_notifications','NotificationsController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(2,'Privileges','fa fa-cog','privileges','cms_privileges','PrivilegesController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(3,'Privileges Roles','fa fa-cog','privileges_roles','cms_privileges_roles','PrivilegesRolesController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(4,'Users Management','fa fa-users','users','cms_users','AdminCmsUsersController',0,1,'2018-11-20 10:48:19',NULL,NULL),
(5,'Settings','fa fa-cog','settings','cms_settings','SettingsController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(6,'Module Generator','fa fa-database','module_generator','cms_moduls','ModulsController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(7,'Menu Management','fa fa-bars','menu_management','cms_menus','MenusController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(8,'Email Templates','fa fa-envelope-o','email_templates','cms_email_templates','EmailTemplatesController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(9,'Statistic Builder','fa fa-dashboard','statistic_builder','cms_statistics','StatisticBuilderController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(10,'API Generator','fa fa-cloud-download','api_generator','','ApiCustomController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(11,'Log User Access','fa fa-flag-o','logs','cms_logs','LogsController',1,1,'2018-11-20 10:48:19',NULL,NULL),
(12,'City','fa fa-glass','city','city','AdminCityController',0,0,'2018-11-22 07:27:10',NULL,NULL),
(13,'Division','fa fa-glass','division','division','AdminDivisionController',0,0,'2018-11-22 09:23:59',NULL,NULL),
(15,'Attachment','fa fa-glass','attachment','attachment','AdminAttachmentController',0,0,'2018-11-22 09:51:23',NULL,NULL),
(16,'Agreement','fa fa-glass','agreement','agreement','AdminAgreementController',0,0,'2018-11-22 09:57:20',NULL,NULL),
(17,'Agreement Request','fa fa-glass','agreement_request','agreement_request','AdminAgreementRequestController',0,0,'2018-11-28 09:46:52',NULL,NULL),
(18,'Business Unit','fa fa-glass','business_unit','business_unit','AdminBusinessUnitController',0,0,'2018-12-06 08:42:50',NULL,NULL),
(19,'PCA','fa fa-glass','pca','pca','AdminPcaController',0,0,'2018-12-06 08:44:27',NULL,NULL),
(20,'State','fa fa-glass','state','state','AdminStateController',0,0,'2018-12-14 07:33:22',NULL,NULL),
(21,'PCA Mapping','fa fa-glass','pca_mapping','pca_mapping','AdminPcaMappingController',0,0,'2018-12-27 05:37:07',NULL,NULL),
(22,'Agreement Sample Document','fa fa-glass','agreement_sample_document','agreement_sample_document','AdminAgreementSampleDocumentController',0,0,'2018-12-28 09:18:54',NULL,NULL),
(23,'Agreement Status','fa fa-glass','status_type','status_type','AdminStatusType1Controller',0,0,'2019-01-03 06:22:15',NULL,NULL);

/*Table structure for table `cms_notifications` */

DROP TABLE IF EXISTS `cms_notifications`;

CREATE TABLE `cms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_notifications` */

insert  into `cms_notifications`(`id`,`id_cms_users`,`content`,`url`,`is_read`,`created_at`,`updated_at`) values 
(1,2,'asdfadsf','/admin/listing',1,NULL,NULL),
(2,4,'raj132456','/admin/agreement_request/view/24',1,'2019-01-29 07:08:37','2019-01-29 07:08:37'),
(3,5,'raj132456','/admin/agreement_request/view/24',1,'2019-01-29 07:10:48','2019-01-29 07:10:48'),
(4,9,'raj132456','/admin/agreement_request/view/24',1,'2019-01-29 07:13:25','2019-01-29 07:13:25'),
(5,6,'raj132456','/admin/agreement_request/view/24',1,'2019-01-29 07:37:14','2019-01-29 07:37:14'),
(6,5,'raj132456','/admin/agreement_request/view/24',1,'2019-01-29 12:25:22','2019-01-29 12:25:22'),
(7,9,'raj132456','/admin/agreement_request/view/24',1,'2019-01-29 12:27:45','2019-01-29 12:27:45'),
(8,6,'raj132456','/admin/agreement_request/view/24',1,'2019-01-29 12:30:13','2019-01-29 12:30:13'),
(9,10,'raj132456','/admin/agreement_request/view/24',1,'2019-01-30 06:00:50','2019-01-30 06:00:50'),
(10,2,'raj132456','/admin/agreement_request/view/24',1,'2019-01-30 06:29:59','2019-01-30 06:29:59'),
(11,2,'raj132456','/admin/agreement_request/view/24',1,'2019-01-30 06:36:20','2019-01-30 06:36:20'),
(12,2,'raj132456','/admin/agreement_request/view/24',1,'2019-01-30 06:37:17','2019-01-30 06:37:17'),
(13,3,'dffdsf','/admin/agreement_request/view/25',1,'2019-01-31 10:00:44','2019-01-31 10:00:44'),
(14,4,'dffdsf','/admin/agreement_request/view/25',1,'2019-01-31 10:01:08','2019-01-31 10:01:08'),
(15,5,'dffdsf','/admin/agreement_request/view/25',1,'2019-01-31 10:03:13','2019-01-31 10:03:13'),
(16,9,'dffdsf','/admin/agreement_request/view/25',1,'2019-01-31 10:04:17','2019-01-31 10:04:17'),
(17,3,'dffdsf','/admin/agreement_request/view/26',1,'2019-02-04 06:32:18','2019-02-04 06:32:18'),
(18,3,'dffdsf','/admin/agreement_request/view/27',1,'2019-02-06 06:11:18','2019-02-06 06:11:18'),
(19,4,'dffdsf','/admin/agreement_request/view/27',1,'2019-02-06 09:07:20','2019-02-06 09:07:20'),
(20,5,'dffdsf','/admin/agreement_request/view/27',1,'2019-02-06 09:08:28','2019-02-06 09:08:28'),
(21,3,'dffdsf','/admin/agreement_request/view/28',1,'2019-02-06 09:22:10','2019-02-06 09:22:10'),
(22,4,'dffdsf','/admin/agreement_request/view/28',1,'2019-02-06 09:22:59','2019-02-06 09:22:59'),
(23,5,'dffdsf','/admin/agreement_request/view/28',1,'2019-02-06 09:23:35','2019-02-06 09:23:35'),
(24,3,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-06 09:33:23','2019-02-06 09:33:23'),
(25,4,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-06 09:33:55','2019-02-06 09:33:55'),
(26,5,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-06 09:35:04','2019-02-06 09:35:04'),
(27,9,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-06 09:48:58','2019-02-06 09:48:58'),
(28,6,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-06 09:51:00','2019-02-06 09:51:00'),
(29,10,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-07 06:05:38','2019-02-07 06:05:38'),
(30,2,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-07 06:06:54','2019-02-07 06:06:54'),
(31,9,'dffdsf','/admin/agreement_request/view/29',1,'2019-02-07 06:08:24','2019-02-07 06:08:24'),
(32,2,'-dffdsf-','/admin/agreement_request/view/29',0,'2019-02-11 10:06:07','2019-02-11 10:06:07'),
(33,2,'5 Agreements to be renewed','/admin/renewal-list',1,'2019-02-11 11:34:36','2019-02-11 11:34:36'),
(34,2,'5 Agreements to be renewed','/admin/renewal-list',1,'2019-02-11 11:36:17','2019-02-11 11:36:17'),
(35,2,'5 Agreements to be renewed','/admin/renewal-list',1,'2019-02-11 11:40:25','2019-02-11 11:40:25'),
(36,1,'5 Agreements to be renewed','/admin/renewal-list',1,'2019-02-13 04:32:15','2019-02-13 04:32:15'),
(37,2,'5 Agreements to be renewed','/admin/renewal-list',1,'2019-02-13 04:52:27','2019-02-13 04:52:27'),
(38,2,'5 Agreements to be renewed','/admin/renewal-list',1,'2019-02-13 04:52:42','2019-02-13 04:52:42'),
(39,9,'5 Agreements to be renewed','/admin/renewal-list',0,'2019-02-13 04:54:48','2019-02-13 04:54:48'),
(40,9,'5 Agreements to be renewed','/admin/renewal-list',0,'2019-02-13 04:54:55','2019-02-13 04:54:55'),
(41,9,'5 Agreements to be renewed','/admin/renewal-list',0,'2019-02-13 04:55:27','2019-02-13 04:55:27'),
(42,2,'5 Agreements to be renewed','/admin/renewal-list',0,'2019-02-13 05:52:16','2019-02-13 05:52:16'),
(43,5,'5 Agreements to be renewed','/admin/renewal-list',0,'2019-02-13 07:14:58','2019-02-13 07:14:58'),
(44,3,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 05:47:39','2019-02-15 05:47:39'),
(45,7,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 05:47:39','2019-02-15 05:47:39'),
(46,4,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 05:50:58','2019-02-15 05:50:58'),
(47,8,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',0,'2019-02-15 05:50:58','2019-02-15 05:50:58'),
(48,2,'100019-erqwerqwer-Agreement Rejected','/admin/agreement_request/view/31',1,'2019-02-15 05:52:30','2019-02-15 05:52:30'),
(49,3,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 05:52:53','2019-02-15 05:52:53'),
(50,7,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 05:52:53','2019-02-15 05:52:53'),
(51,2,'100019-erqwerqwer-Agreement Rejected','/admin/agreement_request/view/31',1,'2019-02-15 06:02:05','2019-02-15 06:02:05'),
(52,2,'100019-erqwerqwer-Agreement Rejected','/admin/agreement_request/view/31',1,'2019-02-15 06:05:43','2019-02-15 06:05:43'),
(53,2,'100019-erqwerqwer-Agreement Rejected','/admin/agreement_request/view/31',1,'2019-02-15 06:10:47','2019-02-15 06:10:47'),
(54,3,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 06:12:01','2019-02-15 06:12:01'),
(55,7,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 06:12:02','2019-02-15 06:12:02'),
(56,4,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',0,'2019-02-15 06:12:19','2019-02-15 06:12:19'),
(57,8,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',0,'2019-02-15 06:12:20','2019-02-15 06:12:20'),
(58,2,'100019-erqwerqwer-Agreement Rejected','/admin/agreement_request/view/31',1,'2019-02-15 06:13:12','2019-02-15 06:13:12'),
(59,3,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 06:58:58','2019-02-15 06:58:58'),
(60,7,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 06:58:58','2019-02-15 06:58:58'),
(61,4,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',1,'2019-02-15 06:59:24','2019-02-15 06:59:24'),
(62,8,'100019-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/31',0,'2019-02-15 06:59:24','2019-02-15 06:59:24'),
(63,2,'100019-erqwerqwer-Agreement Rejected','/admin/agreement_request/view/31',0,'2019-02-15 07:00:22','2019-02-15 07:00:22'),
(64,7,'100020-na-Waiting for Doc Verifier','/admin/agreement_request/view/32',1,'2019-02-18 11:16:44','2019-02-18 11:16:44'),
(65,3,'100020-na-Waiting for Doc Verifier','/admin/agreement_request/view/32',1,'2019-02-18 11:21:36','2019-02-18 11:21:36'),
(66,7,'100020-na-Waiting for Doc Verifier','/admin/agreement_request/view/32',1,'2019-02-18 11:24:14','2019-02-18 11:24:14'),
(67,3,'100020-na-Waiting for Doc Approver','/admin/agreement_request/view/32',1,'2019-02-18 11:25:08','2019-02-18 11:25:08'),
(68,4,'100020-na-Waiting for Doc Approver','/admin/agreement_request/view/32',1,'2019-02-18 11:31:06','2019-02-18 11:31:06'),
(69,8,'100020-na-Waiting for AGC Admin','/admin/agreement_request/view/32',1,'2019-02-18 11:32:46','2019-02-18 11:32:46'),
(70,5,'100020-na-Waiting for AGC Admin','/admin/agreement_request/view/32',1,'2019-02-18 11:33:06','2019-02-18 11:33:06'),
(71,9,'100020-na-Waiting for AGC Incharge','/admin/agreement_request/view/32',1,'2019-02-18 11:34:08','2019-02-18 11:34:08'),
(72,3,'100023-erqwerqwer-Waiting for Doc Verifier','/admin/agreement_request/view/35',1,'2019-02-25 05:14:07','2019-02-25 05:14:07'),
(73,4,'100023-erqwerqwer-Waiting for Doc Approver','/admin/agreement_request/view/35',1,'2019-02-25 05:15:37','2019-02-25 05:15:37'),
(74,5,'100023-erqwerqwer-Waiting for AGC Admin','/admin/agreement_request/view/35',1,'2019-02-25 05:16:24','2019-02-25 05:16:24'),
(75,9,'100023-erqwerqwer-Waiting for AGC Incharge','/admin/agreement_request/view/35',1,'2019-02-25 05:22:20','2019-02-25 05:22:20'),
(76,2,'100023-erqwerqwer-AGC Draft Approved','/admin/agreement_request/view/35',1,'2019-02-25 05:22:38','2019-02-25 05:22:38'),
(77,10,'100023-erqwerqwer-Doc Requestor Accepted','/admin/agreement_request/view/35',1,'2019-02-25 05:23:27','2019-02-25 05:23:27');

/*Table structure for table `cms_privileges` */

DROP TABLE IF EXISTS `cms_privileges`;

CREATE TABLE `cms_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_privileges` */

insert  into `cms_privileges`(`id`,`name`,`is_superadmin`,`theme_color`,`created_at`,`updated_at`) values 
(1,'Super Administrator',1,'skin-red','2018-11-20 10:48:19',NULL),
(2,'IT Admin',0,'skin-blue',NULL,NULL),
(3,'IT User',0,'skin-blue',NULL,NULL),
(4,'AGC Admin',0,'skin-blue',NULL,NULL),
(5,'AGC Verifier',0,'skin-blue',NULL,NULL),
(6,'Requestor',0,'skin-blue',NULL,NULL),
(7,'Doc Verifier',0,'skin-blue',NULL,NULL),
(8,'Doc Approver',0,'skin-blue',NULL,NULL),
(9,'AGC Incharge',0,'skin-blue',NULL,NULL),
(10,'AGC Approver',0,'skin-blue',NULL,NULL);

/*Table structure for table `cms_privileges_roles` */

DROP TABLE IF EXISTS `cms_privileges_roles`;

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_privileges_roles` */

insert  into `cms_privileges_roles`(`id`,`is_visible`,`is_create`,`is_read`,`is_edit`,`is_delete`,`id_cms_privileges`,`id_cms_moduls`,`created_at`,`updated_at`) values 
(1,1,0,0,0,0,1,1,'2018-11-20 10:48:19',NULL),
(2,1,1,1,1,1,1,2,'2018-11-20 10:48:19',NULL),
(3,0,1,1,1,1,1,3,'2018-11-20 10:48:19',NULL),
(4,1,1,1,1,1,1,4,'2018-11-20 10:48:19',NULL),
(5,1,1,1,1,1,1,5,'2018-11-20 10:48:19',NULL),
(6,1,1,1,1,1,1,6,'2018-11-20 10:48:19',NULL),
(7,1,1,1,1,1,1,7,'2018-11-20 10:48:19',NULL),
(8,1,1,1,1,1,1,8,'2018-11-20 10:48:19',NULL),
(9,1,1,1,1,1,1,9,'2018-11-20 10:48:19',NULL),
(10,1,1,1,1,1,1,10,'2018-11-20 10:48:19',NULL),
(11,1,0,1,0,1,1,11,'2018-11-20 10:48:19',NULL),
(12,1,1,1,1,1,1,12,NULL,NULL),
(13,1,1,1,1,1,1,13,NULL,NULL),
(14,1,1,1,1,1,1,14,NULL,NULL),
(15,1,1,1,1,1,1,15,NULL,NULL),
(16,1,1,1,1,1,1,16,NULL,NULL),
(29,1,1,1,1,1,1,17,NULL,NULL),
(31,1,1,1,1,1,1,18,NULL,NULL),
(32,1,1,1,1,1,1,19,NULL,NULL),
(33,1,1,1,1,1,1,20,NULL,NULL),
(34,1,1,1,1,1,1,21,NULL,NULL),
(37,1,1,1,1,1,1,22,NULL,NULL),
(38,1,1,1,1,1,1,23,NULL,NULL),
(42,1,1,1,1,1,10,17,NULL,NULL),
(43,0,0,0,1,0,10,4,NULL,NULL),
(44,1,1,1,1,1,9,17,NULL,NULL),
(45,0,0,0,1,0,9,4,NULL,NULL),
(46,0,0,0,1,0,8,4,NULL,NULL),
(47,0,0,0,1,0,7,4,NULL,NULL),
(48,1,1,1,1,1,6,17,NULL,NULL),
(49,0,0,0,1,0,6,4,NULL,NULL),
(50,0,0,0,1,0,5,4,NULL,NULL),
(53,1,1,1,1,1,2,16,NULL,NULL),
(54,1,1,1,1,1,2,15,NULL,NULL),
(55,1,1,1,1,1,2,12,NULL,NULL),
(56,1,1,1,1,1,2,13,NULL,NULL),
(57,1,1,1,1,1,2,4,NULL,NULL),
(58,1,1,1,1,1,3,16,NULL,NULL),
(59,1,1,1,1,1,3,15,NULL,NULL),
(60,1,1,1,1,1,3,12,NULL,NULL),
(61,1,1,1,1,1,3,13,NULL,NULL),
(62,1,1,1,1,1,3,4,NULL,NULL),
(63,1,1,1,1,1,4,22,NULL,NULL),
(64,0,0,0,1,0,4,4,NULL,NULL);

/*Table structure for table `cms_settings` */

DROP TABLE IF EXISTS `cms_settings`;

CREATE TABLE `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_settings` */

insert  into `cms_settings`(`id`,`name`,`content`,`content_input_type`,`dataenum`,`helper`,`created_at`,`updated_at`,`group_setting`,`label`) values 
(1,'login_background_color',NULL,'text',NULL,'Input hexacode','2018-11-20 10:48:19',NULL,'Login Register Style','Login Background Color'),
(2,'login_font_color',NULL,'text',NULL,'Input hexacode','2018-11-20 10:48:19',NULL,'Login Register Style','Login Font Color'),
(3,'login_background_image',NULL,'upload_image',NULL,NULL,'2018-11-20 10:48:19',NULL,'Login Register Style','Login Background Image'),
(4,'email_sender','support@crudbooster.com','text',NULL,NULL,'2018-11-20 10:48:19',NULL,'Email Setting','Email Sender'),
(5,'smtp_driver','mail','select','smtp,mail,sendmail',NULL,'2018-11-20 10:48:19',NULL,'Email Setting','Mail Driver'),
(6,'smtp_host','','text',NULL,NULL,'2018-11-20 10:48:19',NULL,'Email Setting','SMTP Host'),
(7,'smtp_port','25','text',NULL,'default 25','2018-11-20 10:48:19',NULL,'Email Setting','SMTP Port'),
(8,'smtp_username','','text',NULL,NULL,'2018-11-20 10:48:19',NULL,'Email Setting','SMTP Username'),
(9,'smtp_password','','text',NULL,NULL,'2018-11-20 10:48:19',NULL,'Email Setting','SMTP Password'),
(10,'appname','CPF India','text',NULL,NULL,'2018-11-20 10:48:19',NULL,'Application Setting','Application Name'),
(11,'default_paper_size','Legal','text',NULL,'Paper size, ex : A4, Legal, etc','2018-11-20 10:48:19',NULL,'Application Setting','Default Paper Print Size'),
(12,'logo','uploads/2019-02/c38aa2cd35914fda6a7812e7e644b8b7.png','upload_image',NULL,NULL,'2018-11-20 10:48:19',NULL,'Application Setting','Logo'),
(13,'favicon',NULL,'upload_image',NULL,NULL,'2018-11-20 10:48:19',NULL,'Application Setting','Favicon'),
(14,'api_debug_mode','true','select','true,false',NULL,'2018-11-20 10:48:19',NULL,'Application Setting','API Debug Mode'),
(15,'google_api_key',NULL,'text',NULL,NULL,'2018-11-20 10:48:19',NULL,'Application Setting','Google API Key'),
(16,'google_fcm_key',NULL,'text',NULL,NULL,'2018-11-20 10:48:19',NULL,'Application Setting','Google FCM Key');

/*Table structure for table `cms_statistic_components` */

DROP TABLE IF EXISTS `cms_statistic_components`;

CREATE TABLE `cms_statistic_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_statistic_components` */

/*Table structure for table `cms_statistics` */

DROP TABLE IF EXISTS `cms_statistics`;

CREATE TABLE `cms_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_statistics` */

/*Table structure for table `cms_users` */

DROP TABLE IF EXISTS `cms_users`;

CREATE TABLE `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employeeid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` text COLLATE utf8mb4_unicode_ci,
  `state_id` text COLLATE utf8mb4_unicode_ci,
  `pca_id` text COLLATE utf8mb4_unicode_ci,
  `agreement_id` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_users` */

insert  into `cms_users`(`id`,`name`,`photo`,`email`,`password`,`id_cms_privileges`,`created_at`,`updated_at`,`status`,`employeeid`,`address`,`mobile`,`division_id`,`state_id`,`pca_id`,`agreement_id`) values 
(1,'Super Admin',NULL,'admin@admin.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',1,'2018-11-20 10:48:19',NULL,'Active','000000','000000',NULL,NULL,NULL,NULL,NULL),
(5,'AGC Admin','uploads/1/2018-12/ac_avatar_ug.png','agcadmin@gmail.com','$2y$10$w0OcDqawgAC5HsimLXw2r.i0hrJPozuXyZrB3tdUWRC./pTM73eke',4,'2018-12-26 05:49:50','2018-12-26 05:52:17',NULL,'1234568456','address','5345345569','1',NULL,NULL,NULL),
(6,'AGC Verifier','uploads/1/2018-12/ac_avatar_ug.png','agcverifier@gmail.com','$2y$10$uVv.8s/02GMjKQVEhFtBG.TObN8dNya2Zn8/HKTsxm7FtOnGkAsk6',5,'2018-12-26 05:51:26',NULL,NULL,'1234568789','address','5345345569','1',NULL,NULL,NULL),
(9,'AGC Incharge','uploads/1/2019-01/ac_avatar_ug.png','agcincharge@gmail.com','$2y$10$kO4GuXVziWR7p5Cbp4FLbOCi93MbljcKM.FrJlmQLHU8BKJDBWU.G',9,'2019-01-07 09:02:33','2019-02-22 12:36:53',NULL,'2222222','test','5345345569','1',NULL,NULL,NULL),
(10,'AGC Approver','uploads/1/2019-01/ac_avatar_ug.png','agcapprover@gmail.com','$2y$10$gTOL6IG3mFVySoihxZzzD..m5JTwrby2XJNtuUENbyR2hxzDULs4G',10,'2019-01-07 09:03:43','2019-02-22 12:36:32',NULL,'11111111','test','5345345546','1,2',NULL,NULL,NULL),
(12,'SRINIVASA RAO K',NULL,'srinivasarao.kar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0000460',NULL,NULL,'2','5','119,123',NULL),
(13,'VIJAY KUMAR V',NULL,'vijayakumar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0000601',NULL,NULL,'2','5','119,123',NULL),
(14,'BALASUBRAMANIAM',NULL,'bala@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0000818',NULL,NULL,'2','7','121',NULL),
(15,'CHAKRADHAR',NULL,'maddili@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0001148',NULL,NULL,'2','5','145,146,147,148,149',NULL),
(16,'MUKKALA SRINIVASARAO',NULL,'srinivasa.muk@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0001255',NULL,NULL,'2','5,11,12','129,131,137,138,142',NULL),
(17,'DILIPKUMAR K',NULL,'dilipkumar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0001268',NULL,NULL,'2','7,8','127,134',NULL),
(18,'ESWARA RAO J',NULL,'eswararao@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005369',NULL,NULL,'2','5','119,123',NULL),
(19,'VISWESWARA RAO P',NULL,'visweswararao@cpindia.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005438',NULL,NULL,'2','5','119,123',NULL),
(20,'ARUN M',NULL,'arun.man@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005644',NULL,NULL,'1','7','9,11,77,78',NULL),
(21,'MOHAN.J',NULL,'mohan.joh@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005645',NULL,NULL,'1','7','4,6,95',NULL),
(22,'PRABHU.K',NULL,'prabhu.kal@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005652',NULL,NULL,'1','7','76,92,117',NULL),
(23,'NAGENDRA KUMAR',NULL,'nagendra@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005664',NULL,NULL,'1','6','17,20,21,83,109',NULL),
(24,'SRINIVAS B',NULL,'srinivasanaidu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005807',NULL,NULL,'1','7','1',NULL),
(25,'ANANDA BABU KOPPALLI',NULL,'anandababukoppalli@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005928',NULL,NULL,'1','5','10',NULL),
(26,'VENKATESAN GURUMURTHI',NULL,'venkatesan.gur@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0005969',NULL,NULL,'1','7','7',NULL),
(27,'RAJESH KUMAR',NULL,'rajeshkumar.san@cp-india.com>','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0006362',NULL,NULL,'1','6','15,116',NULL),
(28,'ASIF AKRAM K. K',NULL,'asif@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0006373',NULL,NULL,'1','6','63',NULL),
(29,'JOBY TOM VARGHESE',NULL,'joby@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0006378',NULL,NULL,'1','6,5','63,91',NULL),
(30,'JAVED SHAIKH',NULL,'javed@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0006781',NULL,NULL,'1','4','44,45,46,47,48,49,50,51,52,101',NULL),
(31,'NITIN ISHWAR SAWANT',NULL,'nitin@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0006782',NULL,NULL,'1','4','42',NULL),
(32,'DAMODARA REDDY BUDUPU',NULL,'damodarareddybudupu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007013',NULL,NULL,'1','9','26',NULL),
(33,'SUDHIR GULLAPALLI',NULL,'sudhirgullapalli@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007015',NULL,NULL,'1','5,9','23,27,29,33,34,35,37,38,104',NULL),
(34,'VAMSI SURAMPALLY',NULL,'vamsisurampally@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007016',NULL,NULL,'1','9','28,30,32,36,65,69,115',NULL),
(35,'SURESH',NULL,'suresh.log@cp-inida.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007280',NULL,NULL,'1','7,5','3,94',NULL),
(36,'ANANDA A',NULL,'ananda.aru@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007413',NULL,NULL,'1','6','63',NULL),
(37,'YOGANATH.D',NULL,'yoganath@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007504',NULL,NULL,'1','7,5','4,6,7,8,9,10,11,76,77,78,95,117,118',NULL),
(38,'RAJA K',NULL,'raja@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007565',NULL,NULL,'1','5','98',NULL),
(39,'KRANTI GOPAL KAMAVARAPU',NULL,'kranthigopal@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007641',NULL,NULL,'2','5','120,125',NULL),
(40,'SRINIVASU NAKKA',NULL,'srinivasu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007822',NULL,NULL,'2','5','122',NULL),
(41,'MUSSAVEER KHAN',NULL,'mussaveer@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007835',NULL,NULL,'2','5','120,125',NULL),
(42,'PAPANNA',NULL,'papanna@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0007948',NULL,NULL,'1','6','16,18,19,80,81',NULL),
(43,'RAJINDER KUMAR',NULL,'rajinder@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0008264',NULL,NULL,'1','1,2','53,54,55,57,89',NULL),
(44,'VIJAYAKUMAR D',NULL,'vijayakumar.nag@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0008348',NULL,NULL,'2','5','128,143,144,150',NULL),
(45,'REDDI BHARATH',NULL,'reddibharath@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0008363',NULL,NULL,'2','5','135,136',NULL),
(46,'ADDAGARLA KISHORE KUMAR',NULL,'kishorekumar.add@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0008797',NULL,NULL,'2','5','120,125',NULL),
(47,'NAPOLEAN M',NULL,'napolean@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0008959',NULL,NULL,'1','5','118',NULL),
(48,'PRASANNA KUMAR S C',NULL,'prasannakumar.cha@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0008965',NULL,NULL,'1','5','8',NULL),
(49,'SRINIVASA L R D',NULL,'srinivasa.lrd@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0009072',NULL,NULL,'2','5','122',NULL),
(50,'RANGARAO VELUGOTI',NULL,'velugotirangarao@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0009438',NULL,NULL,'2','5','130',NULL),
(51,'SRI DANTULURU RAKESH',NULL,'sridantulururakesh@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0009518',NULL,NULL,'2','5','120,125',NULL),
(52,'MOUNISH Y',NULL,'mounish@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0009677',NULL,NULL,'2','5','141',NULL),
(53,'BALA RAVINDRA P',NULL,'balaravindra@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0009729',NULL,NULL,'1','5','2',NULL),
(54,'NANDA KUMAR M V',NULL,'nandakumar.vij@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0010194',NULL,NULL,'1','5','91',NULL),
(55,'SATYAJEET MALLIK',NULL,'satyajeet@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0010653',NULL,NULL,'2','3','124',NULL),
(56,'VENKATESHWARULU G',NULL,'venkateswarlu.ran@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0010736',NULL,NULL,'2','5','133',NULL),
(57,'SANDHYA M',NULL,'sandhya@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0010740',NULL,NULL,'1','5,6,7','91,99,103,105',NULL),
(58,'SRAVANA KUMAR ACHARYULU KANDAVALLI',NULL,'sravanakumaracharyulu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0010855',NULL,NULL,'2','5','122',NULL),
(59,'UPENDRA M.K.',NULL,'upendra.mur@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0011139',NULL,NULL,'1','5','91',NULL),
(60,'MUNIRAMEGOWDA',NULL,'muniramegowda@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',6,NULL,NULL,NULL,'IN0011172',NULL,NULL,'1','6','16,17,18,19,20,21,80,81,83,109',NULL),
(61,'ILFIYAZ MOHAMMED',NULL,'mohammed@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000492',NULL,NULL,'2','5','120,125',NULL),
(62,'SREENIVASA RAO P',NULL,'sreenivasa@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000517',NULL,NULL,'2','5','119,123',NULL),
(63,'NANDA KUMAR K',NULL,'nandakumar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000810',NULL,NULL,'2','7,5,11,8,12','127,128,129,130,131,133,134,135,136,137,138,141,142,143,144,145,146,147,148,149,150',NULL),
(64,'NAVIS DIXON',NULL,'dixon@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000811',NULL,NULL,'2','7','121',NULL),
(65,'SHANKAR',NULL,'shankar,rat@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000814',NULL,NULL,'2','7','121',NULL),
(66,'SURESH',NULL,'suresh.vee@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005628',NULL,NULL,'1','5','10',NULL),
(67,'VAIDYANATHAN',NULL,'vaidyanathan@cp-india.com>','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005630',NULL,NULL,'1','7','4,6,9,11,76,77,78,92,95,117',NULL),
(68,'MOHAN KUMAR M',NULL,'mohankumar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005633',NULL,NULL,'1','6','116',NULL),
(69,'MANJUNATH.N',NULL,'manjunath@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005636',NULL,NULL,'1','6','16,17,18,19,20,21,80,81,83,109',NULL),
(70,'VISWANATHAN N',NULL,'viswanathan.nar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005637',NULL,NULL,'1','7','4,6,9,11,76,77,78,92,95,117',NULL),
(71,'VIJAYAKUMAR',NULL,'vijayakumar.chi@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005638',NULL,NULL,'1','7','1',NULL),
(72,'RAJENDRA KUMAR',NULL,'rajendra@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005661',NULL,NULL,'1','6','16,18,19,80,81',NULL),
(73,'BALAJI M',NULL,'balaji.kes@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005686',NULL,NULL,'1','5','8,118',NULL),
(74,'MOHAN',NULL,'mohan.ram@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005698',NULL,NULL,'1','7,5','3,94',NULL),
(75,'GOPAL M',NULL,'gopal@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005702',NULL,NULL,'1','5','2',NULL),
(76,'MOHIT AHUJA',NULL,'mohit@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005718',NULL,NULL,'1','2','55',NULL),
(77,'AMIT VERMA',NULL,'amitverma@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005719',NULL,NULL,'1','1,2','53,54',NULL),
(78,'GAGAN SHARMA',NULL,'gagansharma@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005720',NULL,NULL,'1','1','57,89',NULL),
(79,'AMIYA KANTA DHAL',NULL,'amiya@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005729',NULL,NULL,'2','3','124',NULL),
(80,'VAIBHAV WAGMARE',NULL,'vaibhav@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005730',NULL,NULL,'1','4','45,46,47,48,49,50,51,52,101',NULL),
(81,'RUPESH SONAWANE',NULL,'rupesh@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005753',NULL,NULL,'1','4','42',NULL),
(82,'V.NAGAVARDHANA RAO',NULL,'nagavardhanarao@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005780',NULL,NULL,'1','5,9','23,104',NULL),
(83,'FAYAZ SHEIK',NULL,'fayaz@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005782',NULL,NULL,'1','5','27',NULL),
(84,'VENKATARAVI KIRAN ADAPA',NULL,'ravikiran.ram@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005788',NULL,NULL,'1','9','28,30,32,36,65,69,115',NULL),
(85,'PRAKASH GOUD',NULL,'prakashgoud@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005789',NULL,NULL,'1','9','26',NULL),
(86,'VENKATA NAGA JITENDRA',NULL,'nagajitendra@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005799',NULL,NULL,'1','9,5','29,33,34,35,37,38',NULL),
(87,'SRINIVASU BUDIREDDI',NULL,'srinivas.sat@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005803',NULL,NULL,'1','9','28,30,32,36,65,69,115',NULL),
(88,'SHIJI THOMAS',NULL,'thomas@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0006326',NULL,NULL,'1','6,4','15,44',NULL),
(89,'DILLIBABU GALI',NULL,'dillibabu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0007337',NULL,NULL,'2','5','122',NULL),
(90,'MANIMARAN N',NULL,'manimaran@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0008673',NULL,NULL,'1','7','7',NULL),
(91,'RINKY SUZANNAH CHACKO',NULL,'rinkysuzannahchacko@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0010671',NULL,NULL,'1','6,5,7','63,91,98,99,103,105',NULL),
(92,'RATNAPRASAD',NULL,'ratnaprasad@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000424',NULL,NULL,'2','5,3','119,120,122,123,124,125',NULL),
(93,'JOSHI A',NULL,'joshi@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000803',NULL,NULL,'1','7','4,6,9,11,76,77,78,92,95,117',NULL),
(94,'RAMU',NULL,'ramu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0000812',NULL,NULL,'2','7,5,11,8,12','121,127,128,129,130,131,133,134,135,136,137,138,141,142,143,144,145,146,147,148,149,150',NULL),
(95,'BALASUBRAMANIAN.T',NULL,'balasubramanian@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005631',NULL,NULL,'1','7,6,9,5,4','4,6,9,11,15,16,17,18,19,20,21,28,29,30,32,33,34,35,36,37,38,44,45,46,47,48,49,50,51,52,65,69,76,77,78,80,81,83,92,95,101,109,115,117',NULL),
(96,'MANJUNATH.N',NULL,'manjunath@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005636',NULL,NULL,'1','6,9','16,18,19,28,30,32,36,65,69,80,81,115',NULL),
(97,'VISWANATHAN N',NULL,'viswanathan.nar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005637',NULL,NULL,'1','9,5','29,33,34,35,37,38',NULL),
(98,'K.B.PRABHU',NULL,'prabhu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005639',NULL,NULL,'1','5,4,1,2,9,6','2,23,42,53,54,104,116',NULL),
(99,'VIJAYA KUMAR M',NULL,'vijayakumar.ven@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005697',NULL,NULL,'1','7,5','7,8,10,118',NULL),
(100,'JIM JOHN',NULL,'jimjohn@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0005717',NULL,NULL,'1','6,5,7','63,91,98,99,103,105',NULL),
(101,'SHIJI THOMAS',NULL,'thomas@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0006326',NULL,NULL,'1','7,9,5','3,26,27,94',NULL),
(102,'THANARAT NOSU',NULL,'thanarat.ins@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',7,NULL,NULL,NULL,'IN0007510',NULL,NULL,'1','2,1','55,57,89',NULL),
(103,'THANIT T',NULL,'thanit@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005553',NULL,NULL,'1','7','1',NULL),
(104,'SHREEJITH R NAIR',NULL,'shreejithnair@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0010440',NULL,NULL,'1','5,6,7','99,103,105',NULL),
(105,'SEELA SIVA SURYA ATCHUTA RAO',NULL,'atchutarao@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0009517',NULL,NULL,'1','5','91',NULL),
(106,'THAANKACHAN CHEMPOTTY',NULL,'chempotty@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008836',NULL,NULL,'1','5','91',NULL),
(107,'MURALIDHARAN K',NULL,'muralidaran@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008948',NULL,NULL,'1','5','91',NULL),
(108,'RICARDO JOSEPH',NULL,'ricardo@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008347',NULL,NULL,'1','5','98',NULL),
(109,'EBIMON VARGHESE',NULL,'ebimon@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006423',NULL,NULL,'1','6,5','63,91',NULL),
(110,'MUDASIR NAZAR',NULL,'mudasir@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006403',NULL,NULL,'1','6','63',NULL),
(111,'RIJOY PRABHAKAR',NULL,'rijoy@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006381',NULL,NULL,'1','6','63',NULL),
(112,'DEIVASIGAMANI KANNAN',NULL,'deivasigamani@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005937',NULL,NULL,'1','7,5','7,8,10,118',NULL),
(113,'MURUGESAN',NULL,'murugeshan@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005903',NULL,NULL,'1','7','9,11,76,78,92',NULL),
(114,'GOPAL',NULL,'gopalakrishnan@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005907',NULL,NULL,'1','7','4,6,76,77,95,117',NULL),
(115,'NOPAKUN LUGKANANUKOON',NULL,'nopakun@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005515',NULL,NULL,'1','7,5','3,94',NULL),
(116,'CHARAN KUMAR REDDY ABBUI REDDI',NULL,'charankumarreddy@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007201',NULL,NULL,'1','9,5','29,33,34,35,37,38',NULL),
(117,'SRINIVAS GUNTAPALLI',NULL,'srinivasguntapalli@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006995',NULL,NULL,'1','5','27',NULL),
(118,'SIVAKUMAR',NULL,'sivakumar@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007140',NULL,NULL,'1','9','28,30,32,36,65,69,115',NULL),
(119,'KOBCHAI INTARANUT',NULL,'kobchai@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005570',NULL,NULL,'1','9','28,30,32,36,65,69,115',NULL),
(120,'MAVULURI RAVI',NULL,'ravimavuluri@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007008',NULL,NULL,'1','9','26',NULL),
(121,'BAKI ASHOK',NULL,'ashokbaki@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006971',NULL,NULL,'1','9','26',NULL),
(122,'NAGARAJ.G',NULL,'nagaraj.ven@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006474',NULL,NULL,'1','6','16,17,18,19,20,21,80,81,83,109',NULL),
(123,'VIJAYANAND GOWDA',NULL,'vijayanandgowda@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006430',NULL,NULL,'1','6','16,17,18,19,20,21,80,81,83,109',NULL),
(124,'SITTICHAI',NULL,'sitthichai@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005519',NULL,NULL,'1','6','15',NULL),
(125,'VARUTPONG PUMPO',NULL,'varutpong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005513',NULL,NULL,'1','6','15',NULL),
(126,'DR.HEMANT KORAT',NULL,'hemant@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006963',NULL,NULL,'1','4','45,46,47,48,49,50,51,52,101',NULL),
(127,'SOMKIT SUKJUL',NULL,'somkit@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005546',NULL,NULL,'1','4','44',NULL),
(128,'PANUPONG RODKAEW',NULL,'panupong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008141',NULL,NULL,'1','4','44',NULL),
(129,'PUSIT CHITTHONG',NULL,'pusit@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005503',NULL,NULL,'1','2,1','55,57,89',NULL),
(130,'JAKKRI UNTHONG',NULL,'jakkri@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005598',NULL,NULL,'1','5','2',NULL),
(131,'UTAI PANMA',NULL,'utaipanma@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005558',NULL,NULL,'1','5,9','23,104',NULL),
(132,'RONNACHAI KERDSIRI',NULL,'ronnachai@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005599',NULL,NULL,'1','6','116',NULL),
(133,'NARONG KONJAI',NULL,'narong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005542',NULL,NULL,'1','4','42',NULL),
(134,'THANARAT NOSU',NULL,'thanarat.ins@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007510',NULL,NULL,'1','1,2','53,54',NULL),
(135,'GIRAPONG SIRITAMMAPHAND',NULL,'girapong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004011',NULL,NULL,'2','5','122',NULL),
(136,'NIWAT ARDHAN',NULL,'niwat@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004036',NULL,NULL,'2','7','127',NULL),
(137,'WARULRODE SETTHARAKSA',NULL,'warulrode@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007904',NULL,NULL,'2','5','128',NULL),
(138,'PORNTEP SRIPOOL',NULL,'porntep@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004037',NULL,NULL,'2','5','129',NULL),
(139,'THANANDORN RAMPARN',NULL,'thanandorn@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007242',NULL,NULL,'2','5','130',NULL),
(140,'KITTIPONG PROMINKEAW',NULL,'kittipong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004035',NULL,NULL,'2','11,12,5','131,137,138,142',NULL),
(141,'SOMCHAI KONGKAEW',NULL,'somchai.kon@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004033',NULL,NULL,'2','5','133',NULL),
(142,'KUMTORN POPUNTOON',NULL,'kumtorn.pop@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008053',NULL,NULL,'2','8','134',NULL),
(143,'RAWIN PHUAKDONKHENG',NULL,'rawin.phu@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005261',NULL,NULL,'2','5','135',NULL),
(144,'SARAYUTT HEMTHONG',NULL,'satayutt@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007623',NULL,NULL,'2','5','136',NULL),
(145,'BOONLOM HANSONGKRAM',NULL,'boonlom@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004043',NULL,NULL,'2','5','141',NULL),
(146,'PHOL CHANSOOK',NULL,'phol@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004030',NULL,NULL,'2','5','143',NULL),
(147,'KUTHORN KHUMPOL',NULL,'kumthorn@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004029',NULL,NULL,'2','5','144,145,146,147,148,149,150',NULL),
(148,'KUSON INTHONG',NULL,'kuson@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004015',NULL,NULL,'2','7','121',NULL),
(149,'SURAWONG INYONG',NULL,'surawong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004010',NULL,NULL,'2','3','124',NULL),
(150,'A.V. ARUN SUBBIAH',NULL,'arun.subbiah@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0010057',NULL,NULL,'1','5,6,7','91,103,105',NULL),
(151,'RIJOY PRABHAKAR',NULL,'rijoy@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006381',NULL,NULL,'1','6,5','63,91,98',NULL),
(152,'PINYO SITTI',NULL,'pinyo@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005522',NULL,NULL,'1','7,5','7,8,10,118',NULL),
(153,'DR.BOOPATHI',NULL,'boopathi@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0006499',NULL,NULL,'1','7','4,6,9,11,76,77,78,92,95,117',NULL),
(154,'T.R.NARAYANAMURTHY',NULL,'narayanamurthy@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005987',NULL,NULL,'1','7,5','3,94',NULL),
(155,'DR.KANDASAMY NATARAJAN',NULL,'kandasamy@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007179',NULL,NULL,'1','9,5','29,33,34,35,37,38',NULL),
(156,'LAEMTHONG SRIBUTMAS',NULL,'laemthong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007522',NULL,NULL,'1','9,5','26,27',NULL),
(157,'KOBCHAI INTARANUT',NULL,'kobchai@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005570',NULL,NULL,'1','9','28,30,32,36,65,69,115',NULL),
(158,'KAITSAK PANALIKUL',NULL,'kaitisak@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005559',NULL,NULL,'1','9','28,30,32,36,65,69,115',NULL),
(159,'TAWANKONGSRI',NULL,'tawan@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005565',NULL,NULL,'1','9','26',NULL),
(160,'PUCHONG PESATCHA',NULL,'puchong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005571',NULL,NULL,'1','6','16,17,18,19,20,21,80,81,83,109',NULL),
(161,'PICHAT SUBIN',NULL,'pichet@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005581',NULL,NULL,'1','6','15',NULL),
(162,'SARANYUTH CHAIARVUTH',NULL,'saranyuth@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005551',NULL,NULL,'1','4','45,46,47,48,49,50,51,52,101',NULL),
(163,'RAJESH DANDAWATE',NULL,'rajesh.dan@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008131',NULL,NULL,'1','5,4,1,2,9,6','2,23,42,53,54,104,116',NULL),
(164,'SIRAPONG NA PONGSA',NULL,'sirapong@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008443',NULL,NULL,'2','3,5,12','124,129,130,137,138',NULL),
(165,'GANESH AREKERE',NULL,'ganesh@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0000403',NULL,NULL,'2','7,8,5','127,134,135,136',NULL),
(166,'CHAKGRIT VEERANAKIN',NULL,'chakgrit@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007653',NULL,NULL,'2','5','122',NULL),
(167,'ARPHAKORN PETTHONG',NULL,'arphakorn@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007896',NULL,NULL,'2','5','143',NULL),
(168,'AMNART LANGDET',NULL,'amnart.lan@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0008442',NULL,NULL,'2','7,5','121,128,133,141,144,145,146,147,148,149,150',NULL),
(169,'WICHIT TANESANURAK',NULL,'wichit@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0004002',NULL,NULL,'2','11','131,142',NULL),
(170,'KAITSAK PANALIKUL',NULL,'kaitisak@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005559',NULL,NULL,'1','9,5','29,33,34,35,37,38',NULL),
(171,'MADHAVA RAO K V',NULL,'madhavarao@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0005986',NULL,NULL,'1','9,5','26,27,28,29,30,32,33,34,35,36,37,38,65,69,115',NULL),
(172,'WICHIT KONGKHEAW',NULL,'wichit.kon@cp-india.com','$2y$10$K/NgnNFi7UJPvjlk0lZXy.sXhaQ6JSakrkjXCezotzV/4/HxrVAqi',8,NULL,NULL,NULL,'IN0007432',NULL,NULL,'2','7,5,3,11,8,12','121,122,124,127,128,129,130,131,133,134,135,136,137,138,141,142,143,144,145,146,147,148,149,150',NULL);

/*Table structure for table `division` */

DROP TABLE IF EXISTS `division`;

CREATE TABLE `division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `division_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `division_doc_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `division` */

insert  into `division`(`id`,`state_id`,`city_id`,`division_name`,`created_at`,`updated_at`,`division_doc_code`) values 
(1,56,1,'Agro','2018-11-22 09:32:03','2019-02-07 05:37:24','G'),
(2,56,1,'Aqua','2018-11-22 09:32:21','2019-02-07 05:37:13','Q');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2016_08_07_145904_add_table_cms_apicustom',1),
(2,'2016_08_07_150834_add_table_cms_dashboard',1),
(3,'2016_08_07_151210_add_table_cms_logs',1),
(4,'2016_08_07_151211_add_details_cms_logs',1),
(5,'2016_08_07_152014_add_table_cms_privileges',1),
(6,'2016_08_07_152214_add_table_cms_privileges_roles',1),
(7,'2016_08_07_152320_add_table_cms_settings',1),
(8,'2016_08_07_152421_add_table_cms_users',1),
(9,'2016_08_07_154624_add_table_cms_menus_privileges',1),
(10,'2016_08_07_154624_add_table_cms_moduls',1),
(11,'2016_08_17_225409_add_status_cms_users',1),
(12,'2016_08_20_125418_add_table_cms_notifications',1),
(13,'2016_09_04_033706_add_table_cms_email_queues',1),
(14,'2016_09_16_035347_add_group_setting',1),
(15,'2016_09_16_045425_add_label_setting',1),
(16,'2016_09_17_104728_create_nullable_cms_apicustom',1),
(17,'2016_10_01_141740_add_method_type_apicustom',1),
(18,'2016_10_01_141846_add_parameters_apicustom',1),
(19,'2016_10_01_141934_add_responses_apicustom',1),
(20,'2016_10_01_144826_add_table_apikey',1),
(21,'2016_11_14_141657_create_cms_menus',1),
(22,'2016_11_15_132350_create_cms_email_templates',1),
(23,'2016_11_15_190410_create_cms_statistics',1),
(24,'2016_11_17_102740_create_cms_statistic_components',1),
(25,'2017_06_06_164501_add_deleted_at_cms_moduls',1);

/*Table structure for table `other_attachment` */

DROP TABLE IF EXISTS `other_attachment`;

CREATE TABLE `other_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_id` int(11) DEFAULT NULL,
  `agreement_request_id` int(11) DEFAULT NULL,
  `attachment_name` varchar(1000) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `other_attachment` */

insert  into `other_attachment`(`id`,`agreement_id`,`agreement_request_id`,`attachment_name`,`filename`,`version`,`created_at`,`updated_at`,`status`) values 
(1,3,33,'dsfds','uploads/documents/1550571713qvyZXKNqF1B1G9.png','3','2019-02-19 10:21:53','2019-02-19 10:21:53',0);

/*Table structure for table `pca` */

DROP TABLE IF EXISTS `pca`;

CREATE TABLE `pca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pca_name` varchar(255) DEFAULT NULL,
  `division_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `business_unit_id` int(11) DEFAULT NULL,
  `agreement_id` text,
  `verify` int(11) DEFAULT NULL,
  `approval` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pca_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=latin1;

/*Data for the table `pca` */

insert  into `pca`(`id`,`pca_name`,`division_id`,`state_id`,`business_unit_id`,`agreement_id`,`verify`,`approval`,`created_at`,`updated_at`,`pca_code`) values 
(1,'Kotturpuram Office',1,7,1,NULL,NULL,NULL,NULL,NULL,523000100),
(2,'Feedmill Chittoor',1,5,3,NULL,NULL,NULL,NULL,NULL,523310100),
(3,'Breeder&Hat Vellore',1,7,3,NULL,NULL,NULL,NULL,NULL,523310200),
(4,'Integ Kanchipuram',1,7,3,NULL,NULL,NULL,NULL,NULL,523310300),
(5,'Integ Pondicherry',1,8,3,NULL,NULL,NULL,NULL,NULL,523310400),
(6,'Integ Vellore',1,7,3,NULL,NULL,NULL,NULL,NULL,523310500),
(7,'Integ Sholinghur',1,7,3,NULL,NULL,NULL,NULL,NULL,523310600),
(8,'Integ Chittoor',1,5,3,NULL,NULL,NULL,NULL,NULL,523310700),
(9,'Integ Salem',1,7,3,NULL,NULL,NULL,NULL,NULL,523310800),
(10,'Integ Palamaner',1,5,3,NULL,NULL,NULL,NULL,NULL,523310900),
(11,'Integ Erode',1,7,3,NULL,NULL,NULL,NULL,NULL,523311000),
(12,'Layer Chittoor',1,5,3,NULL,NULL,NULL,NULL,NULL,523311100),
(13,'Feedmill Bangalore',1,6,3,NULL,NULL,NULL,NULL,NULL,523311200),
(14,'Feedmill Mysore',1,6,3,NULL,NULL,NULL,NULL,NULL,523311300),
(15,'Breeder&Hat Bangalor',1,6,3,NULL,NULL,NULL,NULL,NULL,523311400),
(16,'Integ Bangalore',1,6,3,NULL,NULL,NULL,NULL,NULL,523311500),
(17,'Integ Mysore',1,6,3,NULL,NULL,NULL,NULL,NULL,523311600),
(18,'Integ Devanahalli',1,6,3,NULL,NULL,NULL,NULL,NULL,523311700),
(19,'Integ Malur',1,6,3,NULL,NULL,NULL,NULL,NULL,523311800),
(20,'Integ Tumkur',1,6,3,NULL,NULL,NULL,NULL,NULL,523311900),
(21,'Integ Hassan',1,6,3,NULL,NULL,NULL,NULL,NULL,523312000),
(22,'DEPOT - KERALA',1,6,3,NULL,NULL,NULL,NULL,NULL,523312100),
(23,'Feedmill Vijayawada',1,5,4,NULL,NULL,NULL,NULL,NULL,523312200),
(24,'Feedmill PudurMedhak',1,9,4,NULL,NULL,NULL,NULL,NULL,523312300),
(25,'Feedmill Parigi',1,9,4,NULL,NULL,NULL,NULL,NULL,523312400),
(26,'Breeder&Hat Hyderaba',1,9,4,NULL,NULL,NULL,NULL,NULL,523312500),
(27,'Hatchery Vijayawada',1,5,4,NULL,NULL,NULL,NULL,NULL,523312600),
(28,'Integ Hyderabad',1,9,4,NULL,NULL,NULL,NULL,NULL,523312700),
(29,'Integ Sattupalli',1,9,4,NULL,NULL,NULL,NULL,NULL,523312800),
(30,'Integ Gajwel',1,9,4,NULL,NULL,NULL,NULL,NULL,523312900),
(31,'WARANGAL DRYER',1,5,4,NULL,NULL,NULL,NULL,NULL,523313000),
(32,'Integ Shadnagar',1,9,4,NULL,NULL,NULL,NULL,NULL,523313100),
(33,'Integ Eluru',1,5,4,NULL,NULL,NULL,NULL,NULL,523313200),
(34,'Integ Vizag',1,5,4,NULL,NULL,NULL,NULL,NULL,523313300),
(35,'Integ Rajahmundry',1,5,4,NULL,NULL,NULL,NULL,NULL,523313400),
(36,'Integ Jadcherla',1,9,4,NULL,NULL,NULL,NULL,NULL,523313500),
(37,'Integ Tuni',1,5,4,NULL,NULL,NULL,NULL,NULL,523313600),
(38,'Integ Srikakulam',1,5,4,NULL,NULL,NULL,NULL,NULL,523313700),
(39,'Feedmill Pune',1,4,5,NULL,NULL,NULL,NULL,NULL,523313800),
(40,'Feedmill Nashik',1,4,5,NULL,NULL,NULL,NULL,NULL,523313900),
(41,'Feedmill Manchar',1,4,5,NULL,NULL,NULL,NULL,NULL,523314000),
(42,'Feedmill Newasa',1,4,5,NULL,NULL,NULL,NULL,NULL,523314100),
(43,'Feedmill Sogras',1,4,5,NULL,NULL,NULL,NULL,NULL,523314200),
(44,'Breeder&Hat SupaPune',1,4,5,NULL,NULL,NULL,NULL,NULL,523314300),
(45,'Hat Nashik',1,4,5,NULL,NULL,NULL,NULL,NULL,523314400),
(46,'Integ Pune',1,4,5,NULL,NULL,NULL,NULL,NULL,523314500),
(47,'Integ Nashik',1,4,5,NULL,NULL,NULL,NULL,NULL,523314600),
(48,'Integ Saswad',1,4,5,NULL,NULL,NULL,NULL,NULL,523314700),
(49,'Integ Sangamner',1,4,5,NULL,NULL,NULL,NULL,NULL,523314800),
(50,'Integ Narayangaon',1,4,5,NULL,NULL,NULL,NULL,NULL,523314900),
(51,'Integ Shikrapur',1,4,5,NULL,NULL,NULL,NULL,NULL,523315000),
(52,'Integ Ahmennagar',1,4,5,NULL,NULL,NULL,NULL,NULL,523315100),
(53,'Feedmill Punjab',1,1,6,NULL,NULL,NULL,NULL,NULL,523315200),
(54,'Feedmill Haryana',1,2,6,NULL,NULL,NULL,NULL,NULL,523315300),
(55,'Hat Ambala',1,2,6,NULL,NULL,NULL,NULL,NULL,523315400),
(56,'Integ Khanna',1,1,6,NULL,NULL,NULL,NULL,NULL,523315500),
(57,'Integ Karnal',1,1,6,NULL,NULL,NULL,NULL,NULL,523315600),
(58,'Feedmill Kolkata',1,3,7,NULL,NULL,NULL,NULL,NULL,523315700),
(59,'Hat Kolkata',1,3,7,NULL,NULL,NULL,NULL,NULL,523315800),
(60,'Integ Burdwan',1,3,7,NULL,NULL,NULL,NULL,NULL,523315900),
(61,'Integ Bankura',1,3,7,NULL,NULL,NULL,NULL,NULL,523316000),
(62,'Integ Birbhum',1,3,7,NULL,NULL,NULL,NULL,NULL,523316100),
(63,'5Stars Ck Bangalore',1,6,8,NULL,NULL,NULL,NULL,NULL,523316200),
(64,'SlaughterH Bangalore',1,6,8,NULL,NULL,NULL,NULL,NULL,523316300),
(65,'Integ Nalgonda',1,9,4,NULL,NULL,NULL,NULL,NULL,523316400),
(66,'Food Chennai',1,7,8,NULL,NULL,NULL,NULL,NULL,523316500),
(67,'FEEDMILL ERODE',1,7,3,NULL,NULL,NULL,NULL,NULL,523316600),
(68,'Feedmill Bidadi',1,6,3,NULL,NULL,NULL,NULL,NULL,523316700),
(69,'Integ  Jangaon',1,9,4,NULL,NULL,NULL,NULL,NULL,523316800),
(70,'FEEDMILL PANIPAT',1,2,6,NULL,NULL,NULL,NULL,NULL,523316900),
(71,'Integ Kolkata',1,3,7,NULL,NULL,NULL,NULL,NULL,523317000),
(72,'BangaloreOffice-Rent',1,6,3,NULL,NULL,NULL,NULL,NULL,523317100),
(73,'Food Kerala',1,10,8,NULL,NULL,NULL,NULL,NULL,523317200),
(74,'Integ Jalpaiguri',1,3,7,NULL,NULL,NULL,NULL,NULL,523317300),
(75,'Feedmill Murshidabad',1,3,7,NULL,NULL,NULL,NULL,NULL,523317400),
(76,'Integ Dindigul',1,7,3,NULL,NULL,NULL,NULL,NULL,523317500),
(77,'Integ Krishnagiri',1,7,3,NULL,NULL,NULL,NULL,NULL,523317600),
(78,'Integ Ulundurpet',1,7,3,NULL,NULL,NULL,NULL,NULL,523317700),
(79,'Integ V.Kota',1,5,3,NULL,NULL,NULL,NULL,NULL,523317800),
(80,'Integ Kolar',1,6,3,NULL,NULL,NULL,NULL,NULL,523317900),
(81,'Integ Shimoga',1,6,3,NULL,NULL,NULL,NULL,NULL,523318000),
(82,'Integ Hubli',1,6,3,NULL,NULL,NULL,NULL,NULL,523318100),
(83,'Integ Channa',1,6,3,NULL,NULL,NULL,NULL,NULL,523318200),
(84,'Layer R&D',1,6,3,NULL,NULL,NULL,NULL,NULL,523318300),
(85,'Integrate- Hansi',1,2,6,NULL,NULL,NULL,NULL,NULL,523318400),
(86,'Integ- Kurukshetra',1,2,6,NULL,NULL,NULL,NULL,NULL,523318500),
(87,'Integrate- Pathankot',1,1,6,NULL,NULL,NULL,NULL,NULL,523318600),
(88,'Integrate- Sangrur',1,1,6,NULL,NULL,NULL,NULL,NULL,523318700),
(89,'Integrate- Hosiarpur',1,1,6,NULL,NULL,NULL,NULL,NULL,523318800),
(90,'Integrate- Hissar',1,2,6,NULL,NULL,NULL,NULL,NULL,523318900),
(91,'Slaughtering Chittoor',1,5,8,NULL,NULL,NULL,NULL,NULL,523319000),
(92,'Integ Trichy',1,7,3,NULL,NULL,NULL,NULL,NULL,523319100),
(93,'Integ Coimbatore',1,7,3,NULL,NULL,NULL,NULL,NULL,523319200),
(94,'Hat Chittoor',1,5,3,NULL,NULL,NULL,NULL,NULL,523319300),
(95,'Integ Thirupattur',1,7,3,NULL,NULL,NULL,NULL,NULL,523319400),
(96,'5StarHyderabad',1,9,8,NULL,NULL,NULL,NULL,NULL,523319500),
(97,'5StarMaharashtra',1,4,8,NULL,NULL,NULL,NULL,NULL,523319600),
(98,'CPI Five Star Chicken-Chittoor',1,5,8,NULL,NULL,NULL,NULL,NULL,523319700),
(99,'FoodProcess-Ctr',1,5,8,NULL,NULL,NULL,NULL,NULL,523319800),
(100,'Rendering-Chittoor',1,5,8,NULL,NULL,NULL,NULL,NULL,523319900),
(101,'Integ Malegaon',1,4,5,NULL,NULL,NULL,NULL,NULL,523320000),
(102,'FarmFresh-Bangalore',1,6,8,NULL,NULL,NULL,NULL,NULL,523320100),
(103,'Packaged Food-Bangalore',1,6,8,NULL,NULL,NULL,NULL,NULL,523320200),
(104,'CPI Feedmill- Turkayamjal',1,9,4,NULL,NULL,NULL,NULL,NULL,523320300),
(105,'CPI Packaged Food-Chennai',1,7,8,NULL,NULL,NULL,NULL,NULL,523320400),
(106,'CPI Packaged Food-Kerala',1,10,8,NULL,NULL,NULL,NULL,NULL,523320500),
(107,'CPI Packaged Food-Hyderabad',1,9,8,NULL,NULL,NULL,NULL,NULL,523320600),
(108,'CPI Packaged Food-Maharashtra',1,4,8,NULL,NULL,NULL,NULL,NULL,523320700),
(109,'Integ Nanjangud',1,6,3,NULL,NULL,NULL,NULL,NULL,523320800),
(110,'ANIMAL HEALTH PRODUCTS',1,6,3,NULL,NULL,NULL,NULL,NULL,523320900),
(111,'Eggs-Chittoor',1,5,8,NULL,NULL,NULL,NULL,NULL,523321000),
(112,'Feedmill Jalpaiguri',1,3,7,NULL,NULL,NULL,NULL,NULL,523321100),
(113,'Integ Belgaum',1,6,3,NULL,NULL,NULL,NULL,NULL,523321200),
(114,'CPI R&D Farm',1,4,5,NULL,NULL,NULL,NULL,NULL,523321300),
(115,'CPI-Integration-Pengerla',1,9,4,NULL,NULL,NULL,NULL,NULL,523321400),
(116,'Feedmill Hiriyur',1,6,3,NULL,NULL,NULL,NULL,NULL,523321500),
(117,'Integ Tindivanam',1,7,3,NULL,NULL,NULL,NULL,NULL,523321600),
(118,'Integ MKM',1,5,3,NULL,NULL,NULL,NULL,NULL,523323000),
(119,'Aq Feed Vizag',2,5,9,NULL,NULL,NULL,NULL,NULL,523510100),
(120,'Aq Feed Rajahmundry',2,5,9,NULL,NULL,NULL,NULL,NULL,523510200),
(121,'Pbiotic PlntRedhills',2,7,9,NULL,NULL,NULL,NULL,NULL,523510300),
(122,'Aq Feed Bhimavaram',2,5,9,NULL,NULL,NULL,NULL,NULL,523510400),
(123,'Aq Plant Vizag',2,5,9,NULL,NULL,NULL,NULL,NULL,523510500),
(124,'Aq Plant Kharagpur',2,3,9,NULL,NULL,NULL,NULL,NULL,523510600),
(125,'Aq Plant Rajamundry',2,5,9,NULL,NULL,NULL,NULL,NULL,523510700),
(126,'AQ FEED SURAT',2,11,9,NULL,NULL,NULL,NULL,NULL,523510800),
(127,'HAT-PD FRENCH BEACH',2,7,9,NULL,NULL,NULL,NULL,NULL,523610100),
(128,'HAT-NELLORE 2',2,5,9,NULL,NULL,NULL,NULL,NULL,523610200),
(129,'CPI-HAT MUKKAM-I',2,5,9,NULL,NULL,NULL,NULL,NULL,523610300),
(130,'CPI-HAT MUKKAM-II',2,5,9,NULL,NULL,NULL,NULL,NULL,523610400),
(131,'HATCHERY - DIU',2,11,9,NULL,NULL,NULL,NULL,NULL,523610500),
(132,'HATCHERY-KAVALI',2,5,9,NULL,NULL,NULL,NULL,NULL,523610600),
(133,'HATCHERY - GUDUR',2,5,12,NULL,NULL,NULL,NULL,NULL,523610700),
(134,'HAT - PONDY',2,8,12,NULL,NULL,NULL,NULL,NULL,523610800),
(135,'HATCHERY - AMALAPURA',2,5,12,NULL,NULL,NULL,NULL,NULL,523610900),
(136,'HAT-GAYATRI HATCHERY',2,5,12,NULL,NULL,NULL,NULL,NULL,523611000),
(137,'HAT - ODISHA HATCHER',2,12,12,NULL,NULL,NULL,NULL,NULL,523611100),
(138,'HAT - SRIKAKULAM HAT',2,5,12,NULL,NULL,NULL,NULL,NULL,523611200),
(139,'AQUAPROCESSING-GUJAR',2,11,14,NULL,NULL,NULL,NULL,NULL,523710100),
(140,'AQUAPROCESS-BALASORE',2,12,14,NULL,NULL,NULL,NULL,NULL,523710200),
(141,'HATCHERY-ONGLE',2,5,12,NULL,NULL,NULL,NULL,NULL,523611300),
(142,'HATCHERY-GUJARAT',2,11,12,NULL,NULL,NULL,NULL,NULL,523611400),
(143,'FARM-VEGURU FISH FARM',2,5,12,NULL,NULL,NULL,NULL,NULL,523611500),
(144,'BKVI FARM',2,5,12,NULL,NULL,NULL,NULL,NULL,523611600),
(145,'KAKINADA FARM-CHOLLANGI',2,5,12,NULL,NULL,NULL,NULL,NULL,523611700),
(146,'KAKINADA FARM-2',2,5,12,NULL,NULL,NULL,NULL,NULL,523611800),
(147,'KAKINADA FARM-THALLAREVU',2,5,12,NULL,NULL,NULL,NULL,NULL,523611900),
(148,'KAKINADA FARM-KOMARAGIRI',2,5,12,NULL,NULL,NULL,NULL,NULL,523612000),
(149,'KAKINADA FARM-GOGANNAM',2,5,12,NULL,NULL,NULL,NULL,NULL,523612100),
(150,'FARM-TANGATUR-1 FARM',2,5,12,NULL,NULL,NULL,NULL,NULL,523612200);

/*Table structure for table `pca_mapping` */

DROP TABLE IF EXISTS `pca_mapping`;

CREATE TABLE `pca_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_id` int(11) DEFAULT NULL,
  `pca_id` int(11) DEFAULT NULL,
  `verify` int(11) DEFAULT NULL,
  `approval` int(11) DEFAULT NULL,
  `approver_user_id` text,
  `verifier_user_id` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pca_mapping` */

/*Table structure for table `request` */

DROP TABLE IF EXISTS `request`;

CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_request_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `remarks` text,
  `status` int(11) DEFAULT NULL,
  `opened` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT NULL,
  `attachment_cancled` text,
  `privilege_id` int(11) DEFAULT NULL,
  `repoted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `request` */

/*Table structure for table `request_ext` */

DROP TABLE IF EXISTS `request_ext`;

CREATE TABLE `request_ext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_request_id` int(11) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `remarks` text,
  `status` int(11) DEFAULT NULL,
  `opened` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT NULL,
  `attachment_cancled` text,
  `privilege_id` int(11) DEFAULT NULL,
  `repoted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `request_ext` */

/*Table structure for table `state` */

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `state_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `state` */

insert  into `state`(`id`,`state_name`,`created_at`,`updated_at`,`state_code`) values 
(1,'PUNJAB','2019-02-26 08:54:15','2019-02-26 14:24:15',3001),
(2,'HARYANA','2019-02-26 08:54:31','2019-02-26 14:24:31',3002),
(3,'WEST BENGAL','2019-02-26 08:54:41','2019-02-26 14:24:41',3003),
(4,'MAHARASHTRA','2019-02-26 08:54:51','2019-02-26 14:24:51',3004),
(5,'ANDHRA PRADESH','2019-02-26 08:54:59','2019-02-26 14:24:59',3005),
(6,'KARNATAKA','2019-02-26 08:55:08','2019-02-26 14:25:08',3006),
(7,'TAMILNADU','2019-02-26 08:55:17','2019-02-26 14:25:17',3007),
(8,'PONDICHERRY','2019-02-26 08:55:24','2019-02-26 14:25:24',3008),
(9,'TELANGANA','2019-02-26 08:55:35','2019-02-26 14:25:35',3009),
(10,'KERALA','2019-02-26 08:55:43','2019-02-26 14:25:43',3010),
(11,'GUJRAT','2019-02-26 08:55:51','2019-02-26 14:25:51',3011),
(12,'ODISHA','2019-02-26 08:56:00','2019-02-26 14:26:00',3012);

/*Table structure for table `status_type` */

DROP TABLE IF EXISTS `status_type`;

CREATE TABLE `status_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `status_type` */

insert  into `status_type`(`id`,`status_name`,`created_at`,`updated_at`) values 
(1,'Waiting for Doc Verifier','2019-01-03 06:24:05',NULL),
(2,'Doc Verifier  Approved','2019-01-03 06:26:19',NULL),
(3,'Waiting for Doc Approver','2019-01-03 06:27:05',NULL),
(4,'Doc Approver Approved','2019-01-03 06:27:29',NULL),
(5,'Waiting for AGC Admin','2019-01-03 06:27:50',NULL),
(6,'AGC Admin Approved','2019-01-03 06:27:50',NULL),
(7,'Waiting for AGC Incharge','2019-01-03 06:27:50',NULL),
(8,'AGC Incharge Approved','2019-01-03 06:27:50',NULL),
(9,'Waiting for AGC Verifier','2019-01-03 06:27:50',NULL),
(10,'AGC Verifier Approved','2019-01-03 06:27:50',NULL),
(11,'Waiting for AGC Approver','2019-01-03 06:27:50',NULL),
(12,'AGC Approver Approved','2019-01-03 06:27:50',NULL),
(13,'Waiting for AGC Admin','2019-01-03 06:27:50',NULL),
(14,'AGC Draft Approved','2019-01-03 06:27:50',NULL),
(15,'Waiting for Doc Requestor','2019-01-03 06:27:50',NULL),
(16,'Document Signed and Uploaded','2019-01-03 06:27:50',NULL),
(17,'Doc Requestor Accepted',NULL,NULL),
(18,'Doc Requestor Rejected',NULL,NULL),
(19,'AGC final Approved',NULL,NULL),
(20,'Agreement Rejected',NULL,NULL),
(21,'Reveted',NULL,NULL),
(22,'Waiting for Confirmation',NULL,NULL);

/*Table structure for table `trainings` */

DROP TABLE IF EXISTS `trainings`;

CREATE TABLE `trainings` (
  `Name` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_id` int(11) NOT NULL,
  `skillset_id` int(11) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `trainings` */

insert  into `trainings`(`Name`,`id`,`assessment_id`,`skillset_id`,`address`,`created_at`,`updated_at`) values 
('Sacha Cote',1,10,9,'Deserunt iure doloribus in mollit','2018-11-22 10:32:23','2018-11-22 16:02:23'),
('Asher Avery',2,10,9,'Doloremque recusandae Officia Nam quo explicabo Vero sit vero vel sit veniam quod fugit reprehenderit voluptate commodo placeat mollitia','2018-11-26 07:35:53','2018-11-26 13:05:53');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
