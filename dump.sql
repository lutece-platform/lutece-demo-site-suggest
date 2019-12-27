-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.0.20-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table lutece.core_admin_dashboard
CREATE TABLE IF NOT EXISTS `core_admin_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_dashboard: 8 rows
/*!40000 ALTER TABLE `core_admin_dashboard` DISABLE KEYS */;
INSERT INTO `core_admin_dashboard` (`dashboard_name`, `dashboard_column`, `dashboard_order`) VALUES
	('usersAdminDashboardComponent', 1, 1),
	('searchAdminDashboardComponent', 1, 2),
	('editorAdminDashboardComponent', 1, 3),
	('autoIncludesAdminDashboardComponent', 1, 4),
	('featuresAdminDashboardComponent', 1, 5),
	('xslExportAdminDashboardComponent', 1, 6),
	('myluteceAuthenticationFilterAdminDashboardComponent', 1, 3),
	('databaseAdminDashboardComponent', 1, 1);
/*!40000 ALTER TABLE `core_admin_dashboard` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_mailinglist
CREATE TABLE IF NOT EXISTS `core_admin_mailinglist` (
  `id_mailinglist` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workgroup` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_mailinglist: 1 rows
/*!40000 ALTER TABLE `core_admin_mailinglist` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist` (`id_mailinglist`, `name`, `description`, `workgroup`) VALUES
	(1, 'admin', 'admin', 'all');
/*!40000 ALTER TABLE `core_admin_mailinglist` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_mailinglist_filter
CREATE TABLE IF NOT EXISTS `core_admin_mailinglist_filter` (
  `id_mailinglist` int(11) NOT NULL DEFAULT '0',
  `workgroup` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_mailinglist`,`workgroup`,`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_mailinglist_filter: 1 rows
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` DISABLE KEYS */;
INSERT INTO `core_admin_mailinglist_filter` (`id_mailinglist`, `workgroup`, `role`) VALUES
	(1, 'all', 'super_admin');
/*!40000 ALTER TABLE `core_admin_mailinglist_filter` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_right
CREATE TABLE IF NOT EXISTS `core_admin_right` (
  `id_right` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level_right` smallint(6) DEFAULT NULL,
  `admin_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_updatable` int(11) NOT NULL DEFAULT '0',
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_feature_group` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `documentation_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_order` int(11) DEFAULT NULL,
  `is_external_feature` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_right`),
  KEY `index_right` (`level_right`,`admin_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_right: 33 rows
/*!40000 ALTER TABLE `core_admin_right` DISABLE KEYS */;
INSERT INTO `core_admin_right` (`id_right`, `name`, `level_right`, `admin_url`, `description`, `is_updatable`, `plugin_name`, `id_feature_group`, `icon_url`, `documentation_url`, `id_order`, `is_external_feature`) VALUES
	('CORE_ADMIN_SITE', 'portal.site.adminFeature.admin_site.name', 2, 'jsp/admin/site/AdminSite.jsp', 'portal.site.adminFeature.admin_site.description', 1, NULL, 'SITE', 'images/admin/skin/features/admin_site.png', 'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-site', 1, 0),
	('CORE_CACHE_MANAGEMENT', 'portal.system.adminFeature.cache_management.name', 0, 'jsp/admin/system/ManageCaches.jsp', 'portal.system.adminFeature.cache_management.description', 1, NULL, 'SYSTEM', 'images/admin/skin/features/manage_caches.png', NULL, 1, 0),
	('CORE_SEARCH_INDEXATION', 'portal.search.adminFeature.indexer.name', 0, 'jsp/admin/search/ManageSearchIndexation.jsp', 'portal.search.adminFeature.indexer.description', 0, NULL, 'SYSTEM', NULL, NULL, 2, 0),
	('CORE_SEARCH_MANAGEMENT', 'portal.search.adminFeature.search_management.name', 0, NULL, 'portal.search.adminFeature.search_management.description', 0, NULL, 'SYSTEM', NULL, NULL, 3, 0),
	('CORE_LOGS_VISUALISATION', 'portal.system.adminFeature.logs_visualisation.name', 0, 'jsp/admin/system/ManageFilesSystem.jsp', 'portal.system.adminFeature.logs_visualisation.description', 1, NULL, 'SYSTEM', 'images/admin/skin/features/view_logs.png', NULL, 4, 0),
	('CORE_PAGE_TEMPLATE_MANAGEMENT', 'portal.style.adminFeature.page_template_management.name', 0, 'jsp/admin/style/ManagePageTemplates.jsp', 'portal.style.adminFeature.page_template_management.description', 0, NULL, 'STYLE', 'images/admin/skin/features/manage_page_templates.png', NULL, 2, 0),
	('CORE_PLUGINS_MANAGEMENT', 'portal.system.adminFeature.plugins_management.name', 0, 'jsp/admin/system/ManagePlugins.jsp', 'portal.system.adminFeature.plugins_management.description', 1, NULL, 'SYSTEM', 'images/admin/skin/features/manage_plugins.png', NULL, 5, 0),
	('CORE_PROPERTIES_MANAGEMENT', 'portal.site.adminFeature.properties_management.name', 2, 'jsp/admin/ManageProperties.jsp', 'portal.site.adminFeature.properties_management.description', 0, NULL, 'SITE', NULL, 'jsp/admin/documentation/AdminDocumentation.jsp?doc=admin-properties', 2, 0),
	('CORE_STYLESHEET_MANAGEMENT', 'portal.style.adminFeature.stylesheet_management.name', 0, 'jsp/admin/style/ManageStyleSheets.jsp', 'portal.style.adminFeature.stylesheet_management.description', 1, NULL, 'STYLE', 'images/admin/skin/features/manage_stylesheets.png', NULL, 3, 0),
	('CORE_STYLES_MANAGEMENT', 'portal.style.adminFeature.styles_management.name', 0, 'jsp/admin/style/ManageStyles.jsp', 'portal.style.adminFeature.styles_management.description', 1, NULL, 'STYLE', 'images/admin/skin/features/manage_styles.png', NULL, 4, 0),
	('CORE_USERS_MANAGEMENT', 'portal.users.adminFeature.users_management.name', 2, 'jsp/admin/user/ManageUsers.jsp', 'portal.users.adminFeature.users_management.description', 1, '', 'MANAGERS', 'images/admin/skin/features/manage_users.png', NULL, 1, 0),
	('CORE_FEATURES_MANAGEMENT', 'portal.admin.adminFeature.features_management.name', 0, NULL, 'portal.admin.adminFeature.features_management.description', 0, NULL, 'SYSTEM', 'images/admin/skin/features/manage_features.png', NULL, 6, 0),
	('CORE_RBAC_MANAGEMENT', 'portal.rbac.adminFeature.rbac_management.name', 0, 'jsp/admin/rbac/ManageRoles.jsp', 'portal.rbac.adminFeature.rbac_management.description', 0, '', 'MANAGERS', 'images/admin/skin/features/manage_rbac.png', NULL, 2, 0),
	('CORE_DAEMONS_MANAGEMENT', 'portal.system.adminFeature.daemons_management.name', 0, 'jsp/admin/system/ManageDaemons.jsp', 'portal.system.adminFeature.daemons_management.description', 0, NULL, 'SYSTEM', NULL, NULL, 7, 0),
	('CORE_WORKGROUPS_MANAGEMENT', 'portal.workgroup.adminFeature.workgroups_management.name', 2, 'jsp/admin/workgroup/ManageWorkgroups.jsp', 'portal.workgroup.adminFeature.workgroups_management.description', 0, NULL, 'MANAGERS', 'images/admin/skin/features/manage_workgroups.png', NULL, 3, 0),
	('CORE_ROLES_MANAGEMENT', 'portal.role.adminFeature.roles_management.name', 2, 'jsp/admin/role/ManagePageRole.jsp', 'portal.role.adminFeature.roles_management.description', 0, NULL, 'USERS', 'images/admin/skin/features/manage_roles.png', NULL, 1, 0),
	('CORE_MAILINGLISTS_MANAGEMENT', 'portal.mailinglist.adminFeature.mailinglists_management.name', 2, 'jsp/admin/mailinglist/ManageMailingLists.jsp', 'portal.mailinglist.adminFeature.mailinglists_management.description', 0, NULL, 'MANAGERS', 'images/admin/skin/features/manage_mailinglists.png', NULL, 4, 0),
	('CORE_LEVEL_RIGHT_MANAGEMENT', 'portal.users.adminFeature.level_right_management.name', 2, NULL, 'portal.users.adminFeature.level_right_management.description', 0, NULL, 'MANAGERS', 'images/admin/skin/features/manage_rights_levels.png', NULL, 5, 0),
	('CORE_LINK_SERVICE_MANAGEMENT', 'portal.insert.adminFeature.linkService_management.name', 2, NULL, 'portal.insert.adminFeature.linkService_management.description', 0, NULL, NULL, NULL, NULL, 1, 0),
	('CORE_RIGHT_MANAGEMENT', 'portal.users.adminFeature.right_management.name', 0, 'jsp/admin/features/ManageRights.jsp', 'portal.users.adminFeature.right_management.description', 0, NULL, 'MANAGERS', 'images/admin/skin/features/manage_rights_levels.png', NULL, 5, 0),
	('CORE_ADMINDASHBOARD_MANAGEMENT', 'portal.admindashboard.adminFeature.right_management.name', 0, NULL, 'portal.admindashboard.adminFeature.right_management.description', 0, NULL, 'SYSTEM', 'images/admin/skin/features/manage_admindashboards.png', NULL, 8, 0),
	('CORE_DASHBOARD_MANAGEMENT', 'portal.dashboard.adminFeature.dashboard_management.name', 0, NULL, 'portal.dashboard.adminFeature.dashboard_management.description', 0, NULL, 'SYSTEM', 'images/admin/skin/features/manage_dashboards.png', NULL, 9, 0),
	('CORE_XSL_EXPORT_MANAGEMENT', 'portal.xsl.adminFeature.xsl_export_management.name', 2, NULL, 'portal.xsl.adminFeature.xsl_export_management.description', 1, NULL, 'SYSTEM', NULL, NULL, 10, 0),
	('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT', 'portal.templates.adminFeature.ManageAutoIncludes.name', 1, NULL, 'portal.templates.adminFeature.ManageAutoIncludes.description', 1, NULL, 'STYLE', 'images/admin/skin/features/manage_templates.png', NULL, 4, 0),
	('CORE_EDITORS_MANAGEMENT', 'portal.admindashboard.editorManagement.right.name', 2, NULL, 'portal.admindashboard.editorManagement.right.description', 1, NULL, 'SYSTEM', NULL, NULL, 10, 0),
	('MYLUTECE_MANAGEMENT', 'mylutece.adminFeature.mylutece_management.name', 2, 'jsp/admin/plugins/mylutece/attribute/ManageAttributes.jsp', 'mylutece.adminFeature.mylutece_management.description', 0, 'mylutece', 'USERS', NULL, NULL, NULL, 0),
	('MYLUTECE_MANAGE_AUTHENTICATION_FILTER', 'mylutece.adminFeature.mylutece_management_authentication_filter.name', 2, 'jsp/admin/plugins/mylutece/security/ManageAuthenticationFilter.jsp', 'mylutece.adminFeature.mylutece_management_authentication_filter.description', 0, 'mylutece', 'USERS', NULL, NULL, NULL, 0),
	('DATABASE_MANAGEMENT_USERS', 'module.mylutece.database.adminFeature.database_management_user.name', 3, 'jsp/admin/plugins/mylutece/modules/database/ManageUsers.jsp', 'module.mylutece.database.adminFeature.database_management_user.description', 0, 'mylutece-database', 'USERS', NULL, NULL, NULL, 0),
	('DATABASE_GROUPS_MANAGEMENT', 'module.mylutece.database.adminFeature.groups_management.name', 3, 'jsp/admin/plugins/mylutece/modules/database/ManageGroups.jsp', 'module.mylutece.database.adminFeature.groups_management.description', 0, 'mylutece-database', 'USERS', NULL, NULL, NULL, 0),
	('SEO_MANAGEMENT', 'seo.adminFeature.seo_management.name', 1, 'jsp/admin/plugins/seo/ManageSEO.jsp', 'seo.adminFeature.seo_management.name', 0, 'seo', NULL, NULL, NULL, 4, 0),
	('SUGGEST_MANAGEMENT', 'suggest.adminFeature.suggest_management.name', 2, 'jsp/admin/plugins/suggest/ManageSuggest.jsp', 'suggest.adminFeature.suggest_management.description', 0, 'suggest', 'APPLICATIONS', 'images/admin/skin/plugins/suggest/suggest.png', NULL, NULL, 0),
	('SYSTEMINFO_MANAGEMENT', 'systeminfo.adminFeature.systeminfo_management.name', 0, 'jsp/admin/plugins/systeminfo/ManageSystemInfo.jsp', 'systeminfo.adminFeature.systeminfo_management.description', 0, 'systeminfo', 'SYSTEM', NULL, NULL, NULL, 0),
	('THEME_MANAGEMENT', 'theme.adminFeature.theme_management.name', 0, 'jsp/admin/plugins/theme/ManageThemes.jsp', 'theme.adminFeature.theme_management.description', 1, 'theme', 'STYLE', 'images/admin/skin/features/manage_styles.png', NULL, NULL, 0);
/*!40000 ALTER TABLE `core_admin_right` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_role
CREATE TABLE IF NOT EXISTS `core_admin_role` (
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_role: 8 rows
/*!40000 ALTER TABLE `core_admin_role` DISABLE KEYS */;
INSERT INTO `core_admin_role` (`role_key`, `role_description`) VALUES
	('all_site_manager', 'Site Manager'),
	('super_admin', 'Super Administrateur'),
	('assign_roles', 'Assigner des roles aux utilisateurs'),
	('assign_groups', 'Assigner des groupes aux utilisateurs'),
	('mylutece_manager', 'Gérer les patramètres avancés Mylutece'),
	('mylutece_database_manager', 'Mylutece Database management'),
	('suggest_manager', 'Gestion des suggests'),
	('theme_manager', 'Theme management');
/*!40000 ALTER TABLE `core_admin_role` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_role_resource
CREATE TABLE IF NOT EXISTS `core_admin_role_resource` (
  `rbac_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resource_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resource_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`rbac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=912 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_role_resource: 16 rows
/*!40000 ALTER TABLE `core_admin_role_resource` DISABLE KEYS */;
INSERT INTO `core_admin_role_resource` (`rbac_id`, `role_key`, `resource_type`, `resource_id`, `permission`) VALUES
	(57, 'all_site_manager', 'PAGE', '*', 'VIEW'),
	(58, 'all_site_manager', 'PAGE', '*', 'MANAGE'),
	(77, 'super_admin', 'INSERT_SERVICE', '*', '*'),
	(101, 'all_site_manager', 'PORTLET_TYPE', '*', '*'),
	(111, 'all_site_manager', 'ADMIN_USER', '*', '*'),
	(137, 'all_site_manager', 'SEARCH_SERVICE', '*', '*'),
	(164, 'all_site_manager', 'XSL_EXPORT', '*', '*'),
	(205, 'assign_roles', 'ROLE_TYPE', '*', 'ASSIGN_ROLE'),
	(207, 'mylutece_manager', 'MYLUTECE', '*', '*'),
	(206, 'assign_groups', 'GROUP_TYPE', '*', 'ASSIGN_GROUP'),
	(350, 'mylutece_database_manager', 'DATABASE', '*', '*'),
	(908, 'suggest_manager', 'SUGGEST_DEFAULT_MESSAGE_TYPE', '*', '*'),
	(910, 'suggest_manager', 'SUGGEST_EXPORT_FORMAT_TYPE', '*', '*'),
	(911, 'suggest_manager', 'SUGGEST_CATEGORY_TYPE', '*', '*'),
	(909, 'suggest_manager', 'SUGGEST_SUGGEST_TYPE', '*', '*'),
	(155, 'theme_manager', 'THEME', '*', '*');
/*!40000 ALTER TABLE `core_admin_role_resource` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_user
CREATE TABLE IF NOT EXISTS `core_admin_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `access_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `status` smallint(6) NOT NULL DEFAULT '0',
  `password` mediumtext COLLATE utf8_unicode_ci,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fr',
  `level_user` smallint(6) NOT NULL DEFAULT '0',
  `reset_password` smallint(6) NOT NULL DEFAULT '0',
  `accessibility_mode` smallint(6) NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint(20) DEFAULT NULL,
  `nb_alerts_sent` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'all',
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_user: 1 rows
/*!40000 ALTER TABLE `core_admin_user` DISABLE KEYS */;
INSERT INTO `core_admin_user` (`id_user`, `access_code`, `last_name`, `first_name`, `email`, `status`, `password`, `locale`, `level_user`, `reset_password`, `accessibility_mode`, `password_max_valid_date`, `account_max_valid_date`, `nb_alerts_sent`, `last_login`, `workgroup_key`) VALUES
	(1, 'admin', 'Admin', 'admin', 'admin@lutece.fr', 0, 'PBKDF2WITHHMACSHA512:40000:84f82d20d11f15ca2faa84f1dc4581e2:a8c77da2179deab78051d78223025a8361fe0a60d5641cea61a230b6ed8a691eecc6843f4abf96708bd5677b366184ec31f58dc958a59acbc418be24acc9d4ced19638ab729f6de122c3d55ef9ddfb59d7c67f9a36ec1c3a6cc290b6e981056541b3093a509716902eefc95dfb8b98bed286f45fc2f94fcb49539f168b6e1c20', 'en', 0, 0, 0, '2020-01-01 00:00:00', 1609076171940, 0, '2019-12-27 14:36:11', 'all');
/*!40000 ALTER TABLE `core_admin_user` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_user_anonymize_field
CREATE TABLE IF NOT EXISTS `core_admin_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `anonymize` smallint(6) NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_user_anonymize_field: 4 rows
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `core_admin_user_anonymize_field` (`field_name`, `anonymize`) VALUES
	('access_code', 1),
	('last_name', 1),
	('first_name', 1),
	('email', 1);
/*!40000 ALTER TABLE `core_admin_user_anonymize_field` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_user_field
CREATE TABLE IF NOT EXISTS `core_admin_user_field` (
  `id_user_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_attribute` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user_field`),
  KEY `core_admin_user_field_idx_file` (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_user_field: 0 rows
/*!40000 ALTER TABLE `core_admin_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_field` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_user_preferences
CREATE TABLE IF NOT EXISTS `core_admin_user_preferences` (
  `id_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_admin_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_user_preferences: 0 rows
/*!40000 ALTER TABLE `core_admin_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_user_preferences` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_workgroup
CREATE TABLE IF NOT EXISTS `core_admin_workgroup` (
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `workgroup_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`workgroup_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_workgroup: 0 rows
/*!40000 ALTER TABLE `core_admin_workgroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup` ENABLE KEYS */;


-- Dumping structure for table lutece.core_admin_workgroup_user
CREATE TABLE IF NOT EXISTS `core_admin_workgroup_user` (
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`workgroup_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_admin_workgroup_user: 0 rows
/*!40000 ALTER TABLE `core_admin_workgroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_admin_workgroup_user` ENABLE KEYS */;


-- Dumping structure for table lutece.core_attribute
CREATE TABLE IF NOT EXISTS `core_attribute` (
  `id_attribute` int(11) NOT NULL AUTO_INCREMENT,
  `type_class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `help_message` mediumtext COLLATE utf8_unicode_ci,
  `is_mandatory` smallint(6) DEFAULT '0',
  `is_shown_in_search` smallint(6) DEFAULT '0',
  `is_shown_in_result_list` smallint(6) DEFAULT '0',
  `is_field_in_line` smallint(6) DEFAULT '0',
  `attribute_position` int(11) DEFAULT '0',
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymize` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_attribute: 0 rows
/*!40000 ALTER TABLE `core_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_attribute` ENABLE KEYS */;


-- Dumping structure for table lutece.core_attribute_field
CREATE TABLE IF NOT EXISTS `core_attribute_field` (
  `id_field` int(11) NOT NULL AUTO_INCREMENT,
  `id_attribute` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8_unicode_ci,
  `is_DEFAULT_value` smallint(6) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `is_multiple` smallint(6) DEFAULT '0',
  `field_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_attribute_field: 0 rows
/*!40000 ALTER TABLE `core_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_attribute_field` ENABLE KEYS */;


-- Dumping structure for table lutece.core_connections_log
CREATE TABLE IF NOT EXISTS `core_connections_log` (
  `access_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int(11) DEFAULT NULL,
  KEY `index_connections_log` (`ip_address`,`date_login`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_connections_log: 0 rows
/*!40000 ALTER TABLE `core_connections_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_connections_log` ENABLE KEYS */;


-- Dumping structure for table lutece.core_dashboard
CREATE TABLE IF NOT EXISTS `core_dashboard` (
  `dashboard_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `dashboard_column` int(11) NOT NULL,
  `dashboard_order` int(11) NOT NULL,
  PRIMARY KEY (`dashboard_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_dashboard: 4 rows
/*!40000 ALTER TABLE `core_dashboard` DISABLE KEYS */;
INSERT INTO `core_dashboard` (`dashboard_name`, `dashboard_column`, `dashboard_order`) VALUES
	('CORE_SYSTEM', 1, 2),
	('CORE_USERS', 1, 1),
	('CORE_USER', 4, 1),
	('CORE_PAGES', 2, 1);
/*!40000 ALTER TABLE `core_dashboard` ENABLE KEYS */;


-- Dumping structure for table lutece.core_datastore
CREATE TABLE IF NOT EXISTS `core_datastore` (
  `entity_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`entity_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_datastore: 144 rows
/*!40000 ALTER TABLE `core_datastore` DISABLE KEYS */;
INSERT INTO `core_datastore` (`entity_key`, `entity_value`) VALUES
	('core.advanced_parameters.password_duration', '120'),
	('core.advanced_parameters.default_user_level', '0'),
	('core.advanced_parameters.default_user_notification', '1'),
	('core.advanced_parameters.default_user_language', 'fr'),
	('core.advanced_parameters.default_user_status', '0'),
	('core.advanced_parameters.email_pattern', '^[\\w_.\\-!\\#\\$\\%\\&\'\\*\\+\\/\\=\\?\\^\\`\\}\\{\\|\\~]+@[\\w_.\\-]+\\.[\\w]+$'),
	('core.advanced_parameters.email_pattern_verify_by', ''),
	('core.advanced_parameters.force_change_password_reinit', 'false'),
	('core.advanced_parameters.password_minimum_length', '8'),
	('core.advanced_parameters.password_format_upper_lower_case', 'false'),
	('core.advanced_parameters.password_format_numero', 'false'),
	('core.advanced_parameters.password_format_special_characters', 'false'),
	('core.advanced_parameters.password_history_size', ''),
	('core.advanced_parameters.maximum_number_password_change', ''),
	('core.advanced_parameters.tsw_size_password_change', ''),
	('core.advanced_parameters.use_advanced_security_parameters', ''),
	('core.advanced_parameters.account_life_time', '12'),
	('core.advanced_parameters.time_before_alert_account', '30'),
	('core.advanced_parameters.nb_alert_account', '2'),
	('core.advanced_parameters.time_between_alerts_account', '10'),
	('core.advanced_parameters.access_failures_max', '3'),
	('core.advanced_parameters.access_failures_interval', '10'),
	('core.advanced_parameters.expired_alert_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.expired_alert_mail_subject', 'Votre compte a expiré'),
	('core.advanced_parameters.first_alert_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.first_alert_mail_subject', 'Votre compte va bientôt expirer'),
	('core.advanced_parameters.other_alert_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.other_alert_mail_subject', 'Votre compte va bientôt expirer'),
	('core.advanced_parameters.account_reactivated_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.account_reactivated_mail_subject', 'Votre compte a bien été réactivé'),
	('core.advanced_parameters.access_failures_captcha', '1'),
	('core.advanced_parameters.notify_user_password_expired', ''),
	('core.advanced_parameters.password_expired_mail_sender', 'lutece@nowhere.com'),
	('core.advanced_parameters.password_expired_mail_subject', 'Votre mot de passe a expiré'),
	('core.advanced_parameters.reset_token_validity', '60'),
	('core.advanced_parameters.lock_reset_token_to_session', 'false'),
	('core.backOffice.defaultEditor', 'tinymce'),
	('core.frontOffice.defaultEditor', 'markitupbbcode'),
	('core_banned_domain_names', 'yopmail.com'),
	('portal.site.site_property.name', 'Suggest Demo Site'),
	('portal.site.site_property.meta.author', 'Suggest team'),
	('portal.site.site_property.meta.copyright', 'Copyright &copyright; Lutece'),
	('portal.site.site_property.meta.description', 'Suggest Demo Site'),
	('portal.site.site_property.meta.keywords', 'suggest,demo,lutece,portal,forum,comment'),
	('portal.site.site_property.email', 'lutece-dev@paris.fr'),
	('portal.site.site_property.noreply_email', 'no-reply@paris.fr'),
	('portal.site.site_property.home_url', 'jsp/site/Portal.jsp'),
	('portal.site.site_property.admin_home_url', 'jsp/admin/AdminMenu.jsp'),
	('portal.site.site_property.popup_credits.textblock', '&lt;credits text&gt;'),
	('portal.site.site_property.popup_legal_info.copyright.textblock', '&lt;copyright text&gt;'),
	('portal.site.site_property.popup_legal_info.privacy.textblock', '&lt;privacy text&gt;'),
	('portal.site.site_property.logo_url', 'images/logo-header-icon.png'),
	('portal.site.site_property.menu.position', 'top'),
	('portal.site.site_property.locale.default', 'en'),
	('portal.site.site_property.avatar_default', 'images/admin/skin/unknown.png'),
	('portal.site.site_property.back_images', '\'images/admin/skin/bg_login1.jpg\' , \'images/admin/skin/bg_login2.jpg\' , \'images/admin/skin/bg_login3.jpg\' , \'images/admin/skin/bg_login4.jpg\''),
	('core.plugins.status.html.installed', 'truel'),
	('core.plugins.status.html.pool', 'portal'),
	('core.plugins.status.suggest.installed', 'true'),
	('core.plugins.status.suggest.pool', 'portal'),
	('core.plugins.status.seo.installed', 'true'),
	('core.plugins.status.seo.pool', 'portal'),
	('core.plugins.status.avatar.installed', 'true'),
	('core.plugins.status.systeminfo.installed', 'portal'),
	('core.plugins.status.theme.installed', 'true'),
	('core.plugins.status.theme.pool', 'portal'),
	('mylutece.security.public_url.mylutece.url.login.page', 'jsp/site/Portal.jsp?page=mylutece&action=login'),
	('mylutece.security.public_url.mylutece.url.doLogin', 'jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),
	('mylutece.security.public_url.mylutece.url.doLogout', 'jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),
	('mylutece.security.public_url.mylutece.url.createAccount.page', 'jsp/site/Portal.jsp?page=mylutece&action=createAccount'),
	('mylutece.security.public_url.mylutece.url.modifyAccount.page', 'jsp/site/Portal.jsp?page=mylutece&action=modifyAccount'),
	('mylutece.security.public_url.mylutece.url.lostPassword.page', 'jsp/site/Portal.jsp?page=mylutece&action=lostPassword'),
	('mylutece.security.public_url.mylutece.url.lostLogin.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),
	('mylutece.security.public_url.mylutece.url.doActionsAll', 'jsp/site/plugins/mylutece/Do*'),
	('mylutece-database_banned_domain_names', 'yopmail.com'),
	('mylutece.security.public_url.mylutece-database.url.login.page', 'jsp/site/Portal.jsp?page=mylutece&action=login'),
	('mylutece.security.public_url.mylutece-database.url.doLogin', 'jsp/site/plugins/mylutece/DoMyLuteceLogin.jsp'),
	('mylutece.security.public_url.mylutece-database.url.doLogout', 'jsp/site/plugins/mylutece/DoMyLuteceLogout.jsp'),
	('mylutece.security.public_url.mylutece-database.url.createAccount.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=createAccount'),
	('mylutece.security.public_url.mylutece-database.url.lostPassword.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=lostPassword'),
	('mylutece.security.public_url.mylutece-database.url.lostLogin.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=lostLogin'),
	('mylutece.security.public_url.mylutece-database.url.reinitPassword.page', 'jsp/site/Portal.jsp?page=mylutecedatabase&action=reinitPassword'),
	('mylutece.security.public_url.mylutece-database.url.doActionsAll', 'jsp/site/plugins/mylutece/modules/database/Do*'),
	('seo.rewrite.config.lastUpdate', 'Dernière mise à jour du fichier de configuration : 27 déc. 2019 à 15:06:04 Nombre d\'url : 7 Resultat : OK'),
	('seo.config.uptodate', 'true'),
	('seo.generator.option.addPath', 'false'),
	('seo.generator.option.addHtmlSuffix', 'true'),
	('seo.replaceUrl.enabled', 'true'),
	('seo.generator.daemon.enabled', 'true'),
	('seo.canonicalUrls.enabled', 'true'),
	('seo.sitmap.daemon.enabled', 'true'),
	('seo.sitemap.update.log', 'Dernière génération : 27 déc. 2019 à 15:05:58 Nombre d\'url : 4 Resultat : OK'),
	('core.cache.status.PortalMenuService.enabled', '1'),
	('core.cache.status.PortletCacheService.enabled', '0'),
	('core.cache.status.StaticFilesCachingFilter.timeToLiveSeconds', '604800'),
	('core.cache.status.MyPortalWidgetContentService.enabled', '1'),
	('core.cache.status.PageCachingFilter.enabled', '0'),
	('core.cache.status.MailAttachmentCacheService.timeToLiveSeconds', '7200'),
	('core.cache.status.MailAttachmentCacheService.overflowToDisk', 'true'),
	('core.cache.status.MailAttachmentCacheService.maxElementsInMemory', '10'),
	('core.cache.status.MailAttachmentCacheService.enabled', '1'),
	('core.cache.status.BaseUserPreferencesCacheService.enabled', '1'),
	('core.cache.status.MailAttachmentCacheService.diskPersistent', 'true'),
	('core.cache.status.StaticFilesCachingFilter.enabled', '1'),
	('core.cache.status.LinksIncludeCacheService.enabled', '1'),
	('core.cache.status.MyPortalWidgetService.enabled', '1'),
	('core.cache.status.LuteceUserCacheService.maxElementsInMemory', '1000'),
	('core.cache.status.LuteceUserCacheService.enabled', '1'),
	('core.cache.status.pathCacheService.enabled', '1'),
	('core.cache.status.BaseUserPreferencesCacheService.maxElementsInMemory', '1000'),
	('core.cache.status.SiteMapService.enabled', '1'),
	('core.cache.status.PageCacheService.enabled', '1'),
	('core.plugins.status.core_extensions.installed', 'true'),
	('core.plugins.status.lucene.installed', 'true'),
	('core.daemon.indexer.interval', '300'),
	('core.daemon.indexer.onStartUp', 'true'),
	('core.daemon.mailSender.interval', '86400'),
	('core.daemon.mailSender.onStartUp', 'true'),
	('core.daemon.anonymizationDaemon.interval', '86400'),
	('core.daemon.anonymizationDaemon.onStartUp', 'false'),
	('core.daemon.accountLifeTimeDaemon.interval', '86400'),
	('core.daemon.accountLifeTimeDaemon.onStartUp', 'true'),
	('core.daemon.threadLauncherDaemon.interval', '86400'),
	('core.daemon.threadLauncherDaemon.onStartUp', 'true'),
	('core.daemon.databaseAnonymizationDaemon.interval', '86400'),
	('core.daemon.databaseAnonymizationDaemon.onStartUp', 'true'),
	('core.daemon.databaseAccountLifeTimeDaemon.interval', '86400'),
	('core.daemon.databaseAccountLifeTimeDaemon.onStartUp', 'true'),
	('core.daemon.seoFriendlyUrlGenerator.interval', '3600'),
	('core.daemon.seoFriendlyUrlGenerator.onStartUp', 'true'),
	('core.daemon.seoSitemapGenerator.interval', '3600'),
	('core.daemon.seoSitemapGenerator.onStartUp', 'true'),
	('core.daemon.suggestPublication.interval', '60'),
	('core.daemon.suggestPublication.onStartUp', 'true'),
	('core.daemon.suggestSubscribersNotificationDaemon.interval', '300000'),
	('core.daemon.suggestSubscribersNotificationDaemon.onStartUp', 'true'),
	('core.templates.currentCommonsInclude', 'default'),
	('core.startup.time', '27 déc. 2019 à 12:05:49'),
	('core.cache.status.DatastoreCacheService.enabled', '0'),
	('core.cache.status.PageCachingFilter(CAUTION:NEVERUSEWITHUSERDYNAMICDATA).enabled', '0'),
	('core.cache.status.SEOFriendlyUrlCacheService.enabled', '0'),
	('core.cache.status.SuggestCategoryCacheService.enabled', '0'),
	('core.cache.status.SuggestSubmitTypeCacheService.enabled', '0'),
	('suggest.suggestSubscribersNotificationDaemon.lastRunDate', '1577444779688');
/*!40000 ALTER TABLE `core_datastore` ENABLE KEYS */;


-- Dumping structure for table lutece.core_feature_group
CREATE TABLE IF NOT EXISTS `core_feature_group` (
  `id_feature_group` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feature_group_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_group_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_group_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_feature_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_feature_group: 7 rows
/*!40000 ALTER TABLE `core_feature_group` DISABLE KEYS */;
INSERT INTO `core_feature_group` (`id_feature_group`, `feature_group_description`, `feature_group_label`, `feature_group_order`) VALUES
	('CONTENT', 'portal.features.group.content.description', 'portal.features.group.content.label', 1),
	('APPLICATIONS', 'portal.features.group.applications.description', 'portal.features.group.applications.label', 3),
	('SYSTEM', 'portal.features.group.system.description', 'portal.features.group.system.label', 7),
	('SITE', 'portal.features.group.site.description', 'portal.features.group.site.label', 2),
	('STYLE', 'portal.features.group.charter.description', 'portal.features.group.charter.label', 6),
	('USERS', 'portal.features.group.users.description', 'portal.features.group.users.label', 4),
	('MANAGERS', 'portal.features.group.managers.description', 'portal.features.group.managers.label', 5);
/*!40000 ALTER TABLE `core_feature_group` ENABLE KEYS */;


-- Dumping structure for table lutece.core_file
CREATE TABLE IF NOT EXISTS `core_file` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `id_physical_file` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_file`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_file: 4 rows
/*!40000 ALTER TABLE `core_file` DISABLE KEYS */;
INSERT INTO `core_file` (`id_file`, `title`, `id_physical_file`, `file_size`, `mime_type`, `date_creation`) VALUES
	(125, 'export_users_csv.xml', 125, 2523, 'application/xml', '2005-10-10 10:10:10'),
	(126, 'export_users_xml.xml', 126, 259, 'application/xml', '2005-10-10 10:10:10'),
	(127, 'export_users_csv.xml', 127, 1861, 'application/xml', NULL),
	(128, 'export_users_xml.xml', 128, 259, 'application/xml', NULL);
/*!40000 ALTER TABLE `core_file` ENABLE KEYS */;


-- Dumping structure for table lutece.core_id_generator
CREATE TABLE IF NOT EXISTS `core_id_generator` (
  `class_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `current_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`class_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_id_generator: 0 rows
/*!40000 ALTER TABLE `core_id_generator` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_id_generator` ENABLE KEYS */;


-- Dumping structure for table lutece.core_indexer_action
CREATE TABLE IF NOT EXISTS `core_indexer_action` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_document` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_task` int(11) NOT NULL DEFAULT '0',
  `indexer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_indexer_action: 5 rows
/*!40000 ALTER TABLE `core_indexer_action` DISABLE KEYS */;
INSERT INTO `core_indexer_action` (`id_action`, `id_document`, `id_task`, `indexer_name`, `id_portlet`) VALUES
	(10, '6', 2, 'SuggestIndexer', -1),
	(9, '7', 2, 'SuggestIndexer', -1),
	(8, '9', 2, 'SuggestIndexer', -1),
	(7, '9', 1, 'SuggestIndexer', -1),
	(11, '8', 2, 'SuggestIndexer', -1);
/*!40000 ALTER TABLE `core_indexer_action` ENABLE KEYS */;


-- Dumping structure for table lutece.core_level_right
CREATE TABLE IF NOT EXISTS `core_level_right` (
  `id_level` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_level_right: 4 rows
/*!40000 ALTER TABLE `core_level_right` DISABLE KEYS */;
INSERT INTO `core_level_right` (`id_level`, `name`) VALUES
	(0, 'Niveau 0 - Droits de l\'administrateur technique'),
	(1, 'Niveau 1 - Droits de l\'administrateur fonctionnel'),
	(2, 'Niveau 2 - Droits du webmestre'),
	(3, 'Niveau 3 - Droits de l\'assistant webmestre');
/*!40000 ALTER TABLE `core_level_right` ENABLE KEYS */;


-- Dumping structure for table lutece.core_mail_item
CREATE TABLE IF NOT EXISTS `core_mail_item` (
  `id_mail_queue` int(11) NOT NULL DEFAULT '0',
  `mail_item` mediumblob,
  PRIMARY KEY (`id_mail_queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_mail_item: 0 rows
/*!40000 ALTER TABLE `core_mail_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_item` ENABLE KEYS */;


-- Dumping structure for table lutece.core_mail_queue
CREATE TABLE IF NOT EXISTS `core_mail_queue` (
  `id_mail_queue` int(11) NOT NULL AUTO_INCREMENT,
  `is_locked` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_mail_queue`),
  KEY `is_locked_core_mail_queue` (`is_locked`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_mail_queue: 0 rows
/*!40000 ALTER TABLE `core_mail_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_mail_queue` ENABLE KEYS */;


-- Dumping structure for table lutece.core_mode
CREATE TABLE IF NOT EXISTS `core_mode` (
  `id_mode` int(11) NOT NULL DEFAULT '0',
  `description_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `output_xsl_method` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_version` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_media_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_encoding` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_indent` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_omit_xml_dec` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `output_xsl_standalone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_mode: 3 rows
/*!40000 ALTER TABLE `core_mode` DISABLE KEYS */;
INSERT INTO `core_mode` (`id_mode`, `description_mode`, `path`, `output_xsl_method`, `output_xsl_version`, `output_xsl_media_type`, `output_xsl_encoding`, `output_xsl_indent`, `output_xsl_omit_xml_dec`, `output_xsl_standalone`) VALUES
	(0, 'Normal', 'normal/', 'xml', '1.0', 'text/xml', 'UTF-8', 'yes', 'yes', 'yes'),
	(1, 'Administration', 'admin/', 'xml', '1.0', 'text/xml', 'UTF-8', 'yes', 'yes', 'yes'),
	(2, 'Wap', 'wml/', 'xml', '1.0', 'text/xml', 'UTF-8', 'yes', 'yes', 'yes');
/*!40000 ALTER TABLE `core_mode` ENABLE KEYS */;


-- Dumping structure for table lutece.core_page
CREATE TABLE IF NOT EXISTS `core_page` (
  `id_page` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8_unicode_ci,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) DEFAULT NULL,
  `page_order` int(11) DEFAULT '0',
  `id_template` int(11) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code_theme` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `node_status` smallint(6) NOT NULL DEFAULT '1',
  `image_content` mediumblob,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'NULL',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_authorization_node` int(11) DEFAULT NULL,
  `display_date_update` smallint(6) NOT NULL DEFAULT '0',
  `is_manual_date_update` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_page`),
  KEY `index_page` (`id_template`,`id_parent`),
  KEY `index_childpage` (`id_parent`,`page_order`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_page: 1 rows
/*!40000 ALTER TABLE `core_page` DISABLE KEYS */;
INSERT INTO `core_page` (`id_page`, `id_parent`, `name`, `description`, `date_update`, `status`, `page_order`, `id_template`, `date_creation`, `role`, `code_theme`, `node_status`, `image_content`, `mime_type`, `meta_keywords`, `meta_description`, `id_authorization_node`, `display_date_update`, `is_manual_date_update`) VALUES
	(1, 0, 'Home', 'Home Page', '2019-11-27 15:29:54', 1, 1, 1, '2003-09-09 00:38:01', 'none', 'default', 0, _binary '', 'application/octet-stream', NULL, NULL, 1, 0, 0);
/*!40000 ALTER TABLE `core_page` ENABLE KEYS */;


-- Dumping structure for table lutece.core_page_template
CREATE TABLE IF NOT EXISTS `core_page_template` (
  `id_template` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_page_template: 6 rows
/*!40000 ALTER TABLE `core_page_template` DISABLE KEYS */;
INSERT INTO `core_page_template` (`id_template`, `description`, `file_name`, `picture`) VALUES
	(1, 'Une colonne', 'skin/site/page_template1.html', 'page_template1.gif'),
	(2, 'Deux colonnes', 'skin/site/page_template2.html', 'page_template2.gif'),
	(3, 'Trois colonnes', 'skin/site/page_template3.html', 'page_template3.gif'),
	(4, '1 + 2 colonnes', 'skin/site/page_template4.html', 'page_template4.gif'),
	(5, 'Deux colonnes égales', 'skin/site/page_template5.html', 'page_template5.gif'),
	(6, 'Trois colonnes inégales', 'skin/site/page_template6.html', 'page_template6.gif');
/*!40000 ALTER TABLE `core_page_template` ENABLE KEYS */;


-- Dumping structure for table lutece.core_physical_file
CREATE TABLE IF NOT EXISTS `core_physical_file` (
  `id_physical_file` int(11) NOT NULL AUTO_INCREMENT,
  `file_value` mediumblob,
  PRIMARY KEY (`id_physical_file`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_physical_file: 4 rows
/*!40000 ALTER TABLE `core_physical_file` DISABLE KEYS */;
INSERT INTO `core_physical_file` (`id_physical_file`, `file_value`) VALUES
	(125, _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A093C78736C3A6F7574707574206D6574686F643D2274657874222F3E0D0A090D0A093C78736C3A74656D706C617465206D617463683D227573657273223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D227573657222202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D2275736572223E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226163636573735F636F646522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226C6173745F6E616D6522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2266697273745F6E616D6522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D22656D61696C22202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2273746174757322202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226C6F63616C6522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226C6576656C22202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226D7573745F6368616E67655F70617373776F726422202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226163636573736962696C6974795F6D6F646522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2270617373776F72645F6D61785F76616C69645F6461746522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226163636F756E745F6D61785F76616C69645F6461746522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D22646174655F6C6173745F6C6F67696E22202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22726F6C657322202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D2272696768747322202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22776F726B67726F75707322202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D226174747269627574657322202F3E0D0A09093C78736C3A746578743E262331303B3C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22726F6C6573223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22726F6C6522202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22726F6C65223E0D0A09093C78736C3A746578743E3B22726F6C653A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2263757272656E74282922202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22726967687473223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22726967687422202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D227269676874223E0D0A09093C78736C3A746578743E3B2272696768743A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2263757272656E74282922202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22776F726B67726F757073223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22776F726B67726F757022202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22776F726B67726F7570223E0D0A09093C78736C3A746578743E3B22776F726B67726F75703A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2263757272656E74282922202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D2261747472696275746573223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D2261747472696275746522202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22617474726962757465223E0D0A09093C78736C3A746578743E3B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226174747269627574652D696422202F3E0D0A09093C78736C3A746578743E3A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226174747269627574652D6669656C642D696422202F3E0D0A09093C78736C3A746578743E3A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226174747269627574652D76616C756522202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A3C2F78736C3A7374796C6573686565743E),
	(126, _binary 0x3C3F786D6C2076657273696F6E3D22312E3022203F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A093C78736C3A74656D706C617465206D617463683D222F207C20402A207C206E6F64652829223E0D0A09093C78736C3A636F70793E0D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22402A207C206E6F6465282922202F3E0D0A09093C2F78736C3A636F70793E0D0A093C2F78736C3A74656D706C6174653E0D0A3C2F78736C3A7374796C6573686565743E),
	(127, _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A093C78736C3A6F7574707574206D6574686F643D2274657874222F3E0D0A090D0A093C78736C3A74656D706C617465206D617463683D227573657273223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D227573657222202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D2275736572223E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226163636573735F636F646522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226C6173745F6E616D6522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2266697273745F6E616D6522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D22656D61696C22202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2273746174757322202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2270617373776F72645F6D61785F76616C69645F6461746522202F3E0D0A09093C78736C3A746578743E223B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226163636F756E745F6D61785F76616C69645F6461746522202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22726F6C657322202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D2267726F75707322202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D226174747269627574657322202F3E0D0A09093C78736C3A746578743E262331303B3C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22726F6C6573223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22726F6C6522202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22726F6C65223E0D0A09093C78736C3A746578743E3B22726F6C653A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2263757272656E74282922202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D2267726F757073223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D2267726F757022202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D2267726F7570223E0D0A09093C78736C3A746578743E3B2267726F75703A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D2263757272656E74282922202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D2261747472696275746573223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D2261747472696275746522202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22617474726962757465223E0D0A09093C78736C3A746578743E3B223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226174747269627574652D696422202F3E0D0A09093C78736C3A746578743E3A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226174747269627574652D6669656C642D696422202F3E0D0A09093C78736C3A746578743E3A3C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D226174747269627574652D76616C756522202F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A3C2F78736C3A7374796C6573686565743E),
	(128, _binary 0x3C3F786D6C2076657273696F6E3D22312E3022203F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A093C78736C3A74656D706C617465206D617463683D222F207C20402A207C206E6F64652829223E0D0A09093C78736C3A636F70793E0D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22402A207C206E6F6465282922202F3E0D0A09093C2F78736C3A636F70793E0D0A093C2F78736C3A74656D706C6174653E0D0A3C2F78736C3A7374796C6573686565743E);
/*!40000 ALTER TABLE `core_physical_file` ENABLE KEYS */;


-- Dumping structure for table lutece.core_portal_component
CREATE TABLE IF NOT EXISTS `core_portal_component` (
  `id_portal_component` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portal_component`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_portal_component: 9 rows
/*!40000 ALTER TABLE `core_portal_component` DISABLE KEYS */;
INSERT INTO `core_portal_component` (`id_portal_component`, `name`) VALUES
	(0, 'Rubrique'),
	(1, 'Article'),
	(2, 'Rubrique Liste Article'),
	(3, 'Menu Init'),
	(4, 'Menu Principal'),
	(5, 'Chemin Page'),
	(6, 'Plan du site'),
	(7, 'Arborescence'),
	(8, 'Plan du site admin');
/*!40000 ALTER TABLE `core_portal_component` ENABLE KEYS */;


-- Dumping structure for table lutece.core_portlet
CREATE TABLE IF NOT EXISTS `core_portlet` (
  `id_portlet` int(11) NOT NULL AUTO_INCREMENT,
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_page` int(11) DEFAULT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `portlet_order` int(11) DEFAULT NULL,
  `column_no` int(11) DEFAULT NULL,
  `id_style` int(11) DEFAULT NULL,
  `accept_alias` smallint(6) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT NULL,
  `display_portlet_title` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_display_flags` int(11) NOT NULL DEFAULT '15',
  PRIMARY KEY (`id_portlet`),
  KEY `index_portlet` (`id_page`,`id_portlet_type`,`id_style`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_portlet: 4 rows
/*!40000 ALTER TABLE `core_portlet` DISABLE KEYS */;
INSERT INTO `core_portlet` (`id_portlet`, `id_portlet_type`, `id_page`, `name`, `date_update`, `status`, `portlet_order`, `column_no`, `id_style`, `accept_alias`, `date_creation`, `display_portlet_title`, `role`, `device_display_flags`) VALUES
	(2, 'HTML_PORTLET', 1, 'Software overview', '2019-11-27 16:20:38', 0, 2, 1, 100, 0, '2012-09-18 08:35:45', 0, 'none', 273),
	(1, 'HTML_PORTLET', 1, 'Demo Home', '2019-11-28 10:43:35', 0, 1, 1, 100, 0, '2019-11-27 15:13:57', 1, 'none', 4369),
	(4, 'HTML_PORTLET', 1, 'Lutece', '2019-06-03 10:23:25', 0, 1, 4, 100, 0, '2019-05-31 11:55:16', 1, 'none', 4369),
	(5, 'HTML_PORTLET', 1, 'Autres informations', '2019-05-31 16:51:33', 0, 1, 5, 100, 0, '2019-05-31 15:01:47', 1, 'none', 4369);
/*!40000 ALTER TABLE `core_portlet` ENABLE KEYS */;


-- Dumping structure for table lutece.core_portlet_alias
CREATE TABLE IF NOT EXISTS `core_portlet_alias` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `id_alias` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_portlet`,`id_alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_portlet_alias: 0 rows
/*!40000 ALTER TABLE `core_portlet_alias` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_portlet_alias` ENABLE KEYS */;


-- Dumping structure for table lutece.core_portlet_type
CREATE TABLE IF NOT EXISTS `core_portlet_type` (
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_creation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_update` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plugin_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_docreate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_specific` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_specific_form` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_domodify` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_script` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_specific` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modify_specific_form` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_portlet_type: 4 rows
/*!40000 ALTER TABLE `core_portlet_type` DISABLE KEYS */;
INSERT INTO `core_portlet_type` (`id_portlet_type`, `name`, `url_creation`, `url_update`, `home_class`, `plugin_name`, `url_docreate`, `create_script`, `create_specific`, `create_specific_form`, `url_domodify`, `modify_script`, `modify_specific`, `modify_specific_form`) VALUES
	('ALIAS_PORTLET', 'portal.site.portletAlias.name', 'plugins/alias/CreatePortletAlias.jsp', 'plugins/alias/ModifyPortletAlias.jsp', 'fr.paris.lutece.portal.business.portlet.AliasPortletHome', 'alias', 'plugins/alias/DoCreatePortletAlias.jsp', '/admin/portlet/script_create_portlet.html', '/admin/portlet/alias/create_portlet_alias.html', '', 'plugins/alias/DoModifyPortletAlias.jsp', '/admin/portlet/script_modify_portlet.html', '/admin/portlet/alias/modify_portlet_alias.html', ''),
	('HTML_PORTLET', 'html.portlet.name', 'plugins/html/CreatePortletHtml.jsp', 'plugins/html/ModifyPortletHtml.jsp', 'fr.paris.lutece.plugins.html.business.portlet.HtmlPortletHome', 'html', 'plugins/html/DoCreatePortletHtml.jsp', '/admin/portlet/script_create_portlet.html', '/admin/plugins/html/portlet_html.html', '', 'plugins/html/DoModifyPortletHtml.jsp', '/admin/portlet/script_modify_portlet.html', '/admin/plugins/html/portlet_html.html', ''),
	('HTML_UNTRANSFORMED_PORTLET', 'html.portlet.untransformed.name', 'plugins/html/CreatePortletHtml.jsp', 'plugins/html/ModifyPortletHtml.jsp', 'fr.paris.lutece.plugins.html.business.portlet.UntransformedHtmlPortletHome', 'html', 'plugins/html/DoCreatePortletHtml.jsp', '/admin/portlet/script_create_portlet.html', '/admin/plugins/html/portlet_html.html', '', 'plugins/html/DoModifyPortletHtml.jsp', '/admin/portlet/script_modify_portlet.html', '/admin/plugins/html/portlet_html.html', ''),
	('MYLUTECE_PORTLET', 'mylutece.portlet.name', 'plugins/mylutece/CreatePortletMyLutece.jsp', 'plugins/mylutece/ModifyPortletMyLutece.jsp', 'fr.paris.lutece.plugins.mylutece.business.portlet.MyLutecePortletHome', 'mylutece', 'plugins/mylutece/DoCreatePortletMyLutece.jsp', '/admin/portlet/script_create_portlet.html', '', '', 'plugins/mylutece/DoModifyPortletMyLutece.jsp', '/admin/portlet/script_modify_portlet.html', '', '');
/*!40000 ALTER TABLE `core_portlet_type` ENABLE KEYS */;


-- Dumping structure for table lutece.core_role
CREATE TABLE IF NOT EXISTS `core_role` (
  `role` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `workgroup_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_role: 0 rows
/*!40000 ALTER TABLE `core_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_role` ENABLE KEYS */;


-- Dumping structure for table lutece.core_search_parameter
CREATE TABLE IF NOT EXISTS `core_search_parameter` (
  `parameter_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parameter_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_search_parameter: 6 rows
/*!40000 ALTER TABLE `core_search_parameter` DISABLE KEYS */;
INSERT INTO `core_search_parameter` (`parameter_key`, `parameter_value`) VALUES
	('type_filter', 'none'),
	('default_operator', 'OR'),
	('help_message', 'Message d aide pour la recherche'),
	('date_filter', '0'),
	('tag_filter', '0'),
	('taglist', NULL);
/*!40000 ALTER TABLE `core_search_parameter` ENABLE KEYS */;


-- Dumping structure for table lutece.core_style
CREATE TABLE IF NOT EXISTS `core_style` (
  `id_style` int(11) NOT NULL DEFAULT '0',
  `description_style` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_portlet_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_portal_component` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`),
  KEY `index_style` (`id_portlet_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_style: 10 rows
/*!40000 ALTER TABLE `core_style` DISABLE KEYS */;
INSERT INTO `core_style` (`id_style`, `description_style`, `id_portlet_type`, `id_portal_component`) VALUES
	(3, 'Menu Init', '', 3),
	(4, 'Main Menu', '', 4),
	(5, 'Page Path', '', 5),
	(6, 'Site Map', '', 6),
	(7, 'Treeview', '', 7),
	(8, 'Admin Site Map', NULL, 8),
	(100, 'Default', 'HTML_PORTLET', 0),
	(101, 'Background', 'HTML_PORTLET', 0),
	(200, 'Default', 'MYLUTECE_PORTLET', 0),
	(102, 'Content Section', 'HTML_PORTLET', 0);
/*!40000 ALTER TABLE `core_style` ENABLE KEYS */;


-- Dumping structure for table lutece.core_stylesheet
CREATE TABLE IF NOT EXISTS `core_stylesheet` (
  `id_stylesheet` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` mediumblob,
  PRIMARY KEY (`id_stylesheet`)
) ENGINE=MyISAM AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_stylesheet: 10 rows
/*!40000 ALTER TABLE `core_stylesheet` DISABLE KEYS */;
INSERT INTO `core_stylesheet` (`id_stylesheet`, `description`, `file_name`, `source`) VALUES
	(253, 'Tree menu', 'menu_tree.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A0D0A3C78736C3A706172616D206E616D653D22736974652D70617468222073656C6563743D22736974652D7061746822202F3E0D0A0D0A3C78736C3A74656D706C617465206D617463683D226D656E752D6C697374223E0D0A093C78736C3A7661726961626C65206E616D653D226D656E752D6C697374222073656C6563743D226D656E7522202F3E0D0A0D0A093C73637269707420747970653D22746578742F6A617661736372697074223E0D0A09092428646F63756D656E74292E72656164792866756E6374696F6E28297B0D0A090909242822237472656522292E7472656576696577287B0D0A09090909616E696D617465643A202266617374222C0D0A09090909636F6C6C61707365643A2066616C73652C0D0A09090909756E697175653A20747275652C0D0A09090909706572736973743A2022636F6F6B6965220D0A0909097D293B0D0A09090D0A09097D293B0D0A093C2F7363726970743E202020200D0A090D0A093C212D2D204D656E752054726565202D2D3E2020202020200D0A093C78736C3A696620746573743D226E6F7428737472696E67286D656E75293D272729223E0D0A09202020203C78736C3A746578742064697361626C652D6F75747075742D6573636170696E673D22796573223E0909202020200D0A2020202020202020202020203C64697620636C6173733D227472656534223E09090D0A0909093C68323E26233136303B3C2F68323E0D0A0909093C756C2069643D22747265652220636C6173733D227472656534223E0D0A202020202020202020202020202020203C78736C3A6170706C792D74656D706C617465732073656C6563743D226D656E7522202F3E20202020202020200D0A0909093C2F756C3E090D0A0909093C2F6469763E0D0A09092009203C6272202F3E0D0A09093C2F78736C3A746578743E200D0A093C2F78736C3A69663E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226D656E75223E0D0A202020203C78736C3A7661726961626C65206E616D653D22696E646578223E0D0A20202020093C78736C3A6E756D626572206C6576656C3D2273696E676C65222076616C75653D22706F736974696F6E282922202F3E0D0A202020203C2F78736C3A7661726961626C653E0D0A09093C6C693E0D0A202020203C212D2D3C78736C3A696620746573743D2224696E64657820266C743B2037223E2D2D3E20202020202020200D0A202020202020202020203C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F7022203E0D0A2020202020202020202020202020203C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A20202020202020202020203C2F613E092020200D0A09092020203C6272202F3E0D0A09092020203C78736C3A76616C75652D6F662073656C6563743D22706167652D6465736372697074696F6E22202F3E0D0A09092020203C212D2D3C78736C3A76616C75652D6F662073656C6563743D22706167652D6465736372697074696F6E22202F3E3C6272202F3E2D2D3E09092020200909090D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D227375626C6576656C2D6D656E752D6C69737422202F3E200D0A0909090D0A09093C2F6C693E20090D0A202020203C212D2D3C2F78736C3A69663E2D2D3E0D0A09090D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D227375626C6576656C2D6D656E752D6C69737422203E200D0A090D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D227375626C6576656C2D6D656E7522202F3E200920202020090D0A0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D227375626C6576656C2D6D656E75223E0D0A2020203C78736C3A7661726961626C65206E616D653D22696E6465785F736F75735F6D656E75223E0D0A2020202020202020203C78736C3A6E756D626572206C6576656C3D2273696E676C65222076616C75653D22706F736974696F6E282922202F3E0D0A2020203C2F78736C3A7661726961626C653E0D0A0909203C756C203E0D0A0909093C6C693E0D0A3C212D2D093C7370616E3E202D2D3E0D0A090909093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A09090909093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A090909093C2F613E0D0A0909093C2F6C693E0909090D0A09093C2F756C3E0D0A093C212D2D3C2F7370616E3E092D2D3E0D0A09090D0A2020200D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E0D0A),
	(215, 'Page path', 'page_path.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A0D0A202020203C78736C3A706172616D206E616D653D22736974652D70617468222073656C6563743D22736974652D7061746822202F3E0D0A202020203C78736C3A74656D706C617465206D617463683D2270616765223E0D0A20202020202020203C7020636C6173733D2262726561646372756D6273223E0D0A20202020202020203C78736C3A696620746573743D22706F736974696F6E2829213D6C61737428292D31223E0D0A2020202020202020202020203C7370616E20636C6173733D226D722D32223E0D0A2020202020202020202020203C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A202020202020202020202020202020203C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A2020202020202020202020203C2F613E0D0A2020202020202020202020203C2F7370616E3E0D0A20202020202020203C2F78736C3A69663E0D0A20202020202020203C2F703E0D0A20202020202020203C78736C3A696620746573743D22706F736974696F6E28293D6C61737428292D31223E0D0A2020202020202020202020203C683120636C6173733D226D622D33206272656164223E3C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E3C2F68313E0D0A20202020202020203C2F78736C3A69663E0D0A202020203C2F78736C3A74656D706C6174653E0D0A0D0A0D0A202020203C78736C3A74656D706C617465206D617463683D22706167655F6C696E6B223E0D0A20202020202020203C7020636C6173733D2262726561646372756D6273223E0D0A20202020202020203C78736C3A696620746573743D22706F736974696F6E2829213D6C61737428292D31223E0D0A2020202020202020202020203C7370616E20636C6173733D226D722D32223E0D0A2020202020202020202020203C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A202020202020202020202020202020203C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A2020202020202020202020203C2F613E0D0A2020202020202020202020203C2F7370616E3E0D0A20202020202020203C2F78736C3A69663E0D0A20202020202020203C2F703E0D0A20202020202020203C78736C3A696620746573743D22706F736974696F6E28293D6C61737428292D31223E0D0A2020202020202020202020203C683120636C6173733D226D622D33206272656164223E3C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E3C2F68313E0D0A20202020202020203C2F78736C3A69663E0D0A202020203C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C2F78736C3A7374796C6573686565743E),
	(213, 'Main Menu', 'menu_main.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E30220D0A09786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A0D0A093C78736C3A706172616D206E616D653D22736974652D70617468222073656C6563743D22736974652D7061746822202F3E0D0A0D0A093C78736C3A74656D706C617465206D617463683D226D656E752D6C697374223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D226D656E7522202F3E0D0A093C2F78736C3A74656D706C6174653E0D0A0D0A093C78736C3A74656D706C617465206D617463683D226D656E75223E0D0A09093C6C693E0D0A0909093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D2220636C6173733D2266697273742D6C6576656C22207461726765743D225F746F70223E0D0A09090909093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A0909093C2F613E0D0A09093C2F6C693E0D0A093C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E0D0A0D0A),
	(211, 'Menu Init', 'menu_init.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A0D0A3C78736C3A706172616D206E616D653D22736974652D70617468222073656C6563743D22736974652D7061746822202F3E0D0A0D0A3C78736C3A74656D706C617465206D617463683D226D656E752D6C697374223E0D0A3C6272202F3E3C6272202F3E0D0A093C6469762069643D226D656E752D696E6974223E0D0A09093C6469762069643D226D656E752D696E69742D636F6E74656E74223E0D0A2020202020202020202020203C756C2069643D226D656E752D7665727469223E0D0A202020202020202020202020202020203C78736C3A6170706C792D74656D706C617465732073656C6563743D226D656E7522202F3E0D0A2020202020202020202020203C2F756C3E0D0A20202020202020203C2F6469763E0D0A20202020203C2F6469763E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226D656E75223E0D0A202020203C78736C3A7661726961626C65206E616D653D22696E646578223E0D0A20202020093C78736C3A6E756D626572206C6576656C3D2273696E676C65222076616C75653D22706F736974696F6E282922202F3E0D0A202020203C2F78736C3A7661726961626C653E0D0A0D0A202020203C78736C3A696620746573743D2224696E646578202667743B2037223E0D0A20202020202020203C6C6920636C6173733D2266697273742D7665727469223E0D0A2020202020202020093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A2020202020202020202009093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A0920202020202020203C2F613E0D0A2020202009202020203C78736C3A6170706C792D74656D706C617465732073656C6563743D227375626C6576656C2D6D656E752D6C69737422202F3E0D0A20202020202020203C2F6C693E0D0A2020203C2F78736C3A69663E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D227375626C6576656C2D6D656E752D6C69737422203E0D0A093C756C3E0D0A20202020093C6C6920636C6173733D226C6173742D7665727469223E0D0A090920093C78736C3A6170706C792D74656D706C617465732073656C6563743D227375626C6576656C2D6D656E7522202F3E0D0A2009202020203C2F6C693E0D0A202020203C2F756C3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D227375626C6576656C2D6D656E75223E0D0A2020203C78736C3A7661726961626C65206E616D653D22696E6465785F736F75735F6D656E75223E0D0A2020202020202020203C78736C3A6E756D626572206C6576656C3D2273696E676C65222076616C75653D22706F736974696F6E282922202F3E0D0A2020203C2F78736C3A7661726961626C653E0D0A0D0A2020203C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A09093C7370616E3E3C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E3C2F7370616E3E0D0A2020203C2F613E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E0D0A),
	(217, 'Plan du site', 'site_map.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D2249534F2D383835392D31223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A0D0A3C78736C3A706172616D206E616D653D22736974652D70617468222073656C6563743D22736974652D7061746822202F3E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706167655B706167652D6C6576656C3D305D223E0D0A3C73656374696F6E20636C6173733D226674636F2D73656374696F6E2062672D6C69676874223E0D0A202020203C64697620636C6173733D22636F6E7461696E6572223E0D0A20202020202020203C64697620636C6173733D22726F77223E0D0A2020202020202020202020203C64697620636C6173733D22636F6C2D736D2D31322070792D35206A7573746966792D636F6E74656E742D63656E746572223E0D0A090909093C756C20636C6173733D226C6973742D67726F7570206C6973742D67726F75702D666C757368223E0D0A09090909093C6C6920636C6173733D226C6973742D67726F75702D6974656D223E0D0A0909090909093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A090909090909093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A0909090909093C2F613E0D0A0909090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22706167652D6465736372697074696F6E22202F3E0D0A0909090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22706167652D696D61676522202F3E0D0A0909090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D226368696C642D70616765732D6C69737422202F3E0D0A09090909093C2F6C693E0D0A090909093C2F756C3E0D0A0909093C2F6469763E0D0A09093C2F6469763E0D0A093C2F6469763E0D0A3C2F73656374696F6E3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706167655B706167652D6C6576656C3D315D22203E0D0A3C756C20636C6173733D226C6973742D67726F7570206C6973742D67726F75702D666C757368223E0D0A093C6C6920636C6173733D226C6973742D67726F75702D6974656D223E0D0A09093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A09093C2F613E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22706167652D6465736372697074696F6E22202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D226368696C642D70616765732D6C69737422202F3E0D0A093C2F6C693E0D0A3C2F756C3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706167655B706167652D6C6576656C3E315D22203E0D0A3C756C20636C6173733D226C6973742D67726F7570206C6973742D67726F75702D666C757368223E0D0A093C6C6920636C6173733D226C6973742D67726F75702D6974656D223E0D0A09093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207461726765743D225F746F70223E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A09093C2F613E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22706167652D6465736372697074696F6E22202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D226368696C642D70616765732D6C69737422202F3E0D0A093C2F6C693E0D0A3C2F756C3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706167652D6465736372697074696F6E223E0D0A093C7370616E3E3C78736C3A76616C75652D6F662073656C6563743D222E22202F3E3C2F7370616E3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226368696C642D70616765732D6C6973745B706167652D6C6576656C3D305D223E0D0A093C78736C3A696620746573743D22636F756E742870616765293E3022203E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D227061676522202F3E0D0A202020203C2F78736C3A69663E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226368696C642D70616765732D6C6973745B706167652D6C6576656C3D315D223E0D0A093C78736C3A696620746573743D22636F756E742870616765293E3022203E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D227061676522202F3E0D0A202020203C2F78736C3A69663E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226368696C642D70616765732D6C6973745B706167652D6C6576656C3E325D223E0D0A093C78736C3A696620746573743D22636F756E742870616765293E3022203E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D227061676522202F3E0D0A202020203C2F78736C3A69663E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706167652D696D616765223E0D0A093C64697620636C6173733D226C6576656C2D6F6E652D696D616765223E0D0A20202020093C64697620636C6173733D22706F6C61726F6964223E0D0A0909093C696D672020626F726465723D2230222077696474683D22383022206865696768743D22383022207372633D22696D616765732F6C6F63616C2F646174612F70616765732F7B2E7D2220616C743D2222202F3E0D0A2020202020202020203C2F6469763E0D0A093C2F646976203E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E),
	(279, 'Plan du Site module d\'Administration', 'admin_site_map_admin.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A3C78736C3A706172616D206E616D653D22736974652D70617468222073656C6563743D22736974652D7061746822202F3E0D0A3C78736C3A7661726961626C65206E616D653D2263757272656E742D706167652D6964222073656C6563743D2263757272656E742D706167652D696422202F3E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706167655B706167652D6C6576656C3D305D223E200D0A093C6469762069643D22747265652220636C6173733D226A73747265652D64656661756C74223E0D0A09093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207469746C653D227B706167652D6465736372697074696F6E7D22203E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A0909093C78736C3A696620746573743D226E6F7428737472696E6728706167652D726F6C65293D276E6F6E652729223E200D0A090909093C7374726F6E673E3C78736C3A746578742064697361626C652D6F75747075742D6573636170696E673D22796573223E2D20236931386E7B706F7274616C2E736974652E61646D696E5F706167652E74616241646D696E4D6170526F6C6552657365727665647D3C2F78736C3A746578743E0D0A090909093C78736C3A76616C75652D6F662073656C6563743D22706167652D726F6C6522202F3E3C2F7374726F6E673E0D0A0909093C2F78736C3A69663E2020202020202020202020200D0A09093C2F613E0D0A09093C756C3E0D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D226368696C642D70616765732D6C69737422202F3E0D0A09093C2F756C3E0D0A093C2F6469763E0D0A3C2F78736C3A74656D706C6174653E0D0A202020200D0A3C78736C3A74656D706C617465206D617463683D22706167655B706167652D6C6576656C3E305D22203E0D0A093C78736C3A7661726961626C65206E616D653D22696E646578222073656C6563743D22706167652D696422202F3E0D0A093C78736C3A7661726961626C65206E616D653D226465736372697074696F6E222073656C6563743D22706167652D6465736372697074696F6E22202F3E0D0A090D0A093C6C692069643D226E6F64652D7B24696E6465787D223E0D0A09093C6120687265663D227B24736974652D706174687D3F706167655F69643D7B706167652D69647D22207469746C653D227B246465736372697074696F6E7D223E0D0A09093C78736C3A76616C75652D6F662073656C6563743D22706167652D6E616D6522202F3E0D0A0909093C78736C3A696620746573743D226E6F7428737472696E6728706167652D726F6C65293D276E6F6E652729223E0D0A090909093C7374726F6E673E0D0A0909090920203C78736C3A746578742064697361626C652D6F75747075742D6573636170696E673D22796573223E236931386E7B706F7274616C2E736974652E61646D696E5F706167652E74616241646D696E4D6170526F6C6552657365727665647D3C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22706167652D726F6C6522202F3E0D0A090909093C2F7374726F6E673E0D0A0909093C2F78736C3A69663E0D0A09093C2F613E0D0A09093C78736C3A63686F6F73653E0D0A0909093C78736C3A7768656E20746573743D22636F756E74286368696C642D70616765732D6C6973742F2A293E30223E0D0A090909093C756C3E0D0A090909092020203C78736C3A6170706C792D74656D706C617465732073656C6563743D226368696C642D70616765732D6C69737422202F3E0D0A090909093C2F756C3E0D0A0909093C2F78736C3A7768656E3E0D0A09092020203C78736C3A6F74686572776973653E0D0A090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D226368696C642D70616765732D6C69737422202F3E0D0A09092020203C2F78736C3A6F74686572776973653E0D0A09093C2F78736C3A63686F6F73653E0D0A093C2F6C693E0D0A3C2F78736C3A74656D706C6174653E0D0A202020200D0A3C78736C3A74656D706C617465206D617463683D226368696C642D70616765732D6C697374223E0D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D227061676522202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A202020200D0A3C2F78736C3A7374796C6573686565743E0D0A),
	(10, 'HTML Portlet - Default', 'portlet_html_cohost.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A3C78736C3A6F7574707574206D6574686F643D2268746D6C2220696E64656E743D22796573222F3E0D0A3C78736C3A74656D706C617465206D617463683D22706F72746C6574223E0D0A3C78736C3A6170706C792D74656D706C617465732073656C6563743D2268746D6C2D706F72746C657422202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A090D0A3C78736C3A74656D706C617465206D617463683D2268746D6C2D706F72746C6574223E0D0A3C78736C3A6170706C792D74656D706C617465732073656C6563743D2268746D6C2D706F72746C65742D636F6E74656E7422202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A090D0A3C78736C3A74656D706C617465206D617463683D2268746D6C2D706F72746C65742D636F6E74656E74223E0D0A093C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D222E22202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A3C2F78736C3A7374796C6573686565743E),
	(285, 'HTML Portlet  - Background', 'portlet_html_background.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A0D0A3C78736C3A6F7574707574206D6574686F643D2268746D6C2220696E64656E743D22796573222F3E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706F72746C6574223E0D0A0D0A093C78736C3A7661726961626C65206E616D653D226465766963655F636C617373223E0D0A093C78736C3A63686F6F73653E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D736D616C6C2D646576696365293D273027223E68696464656E2D70686F6E653C2F78736C3A7768656E3E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D6E6F726D616C2D646576696365293D273027223E68696464656E2D7461626C65743C2F78736C3A7768656E3E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D6C617267652D646576696365293D273027223E68696464656E2D6465736B746F703C2F78736C3A7768656E3E0D0A09093C78736C3A6F74686572776973653E3C2F78736C3A6F74686572776973653E0D0A093C2F78736C3A63686F6F73653E0D0A093C2F78736C3A7661726961626C653E0D0A090D0A093C64697620636C6173733D22706F72746C6574207B246465766963655F636C6173737D223E0D0A09093C64697620636C6173733D2277656C6C223E0D0A09093C78736C3A63686F6F73653E0D0A0909093C78736C3A7768656E20746573743D226E6F7428737472696E6728646973706C61792D706F72746C65742D7469746C65293D27312729223E0D0A090909093C68323E0D0A09090909093C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D22706F72746C65742D6E616D6522202F3E0D0A090909093C2F68323E0D0A090909093C64697620636C6173733D22706F72746C65742D6261636B67726F756E642D636F6E74656E74202D6C75746563652D626F726465722D7261646975732D626F74746F6D223E0D0A09090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D2268746D6C2D706F72746C657422202F3E0D0A090909093C2F6469763E0D0A0909093C2F78736C3A7768656E3E0D0A0909093C78736C3A6F74686572776973653E0D0A090909093C64697620636C6173733D22706F72746C65742D6261636B67726F756E642D636F6E74656E74202D6C75746563652D626F726465722D726164697573223E0D0A09090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D2268746D6C2D706F72746C657422202F3E0D0A090909093C2F6469763E0D0A0909093C2F78736C3A6F74686572776973653E0D0A09093C2F78736C3A63686F6F73653E0D0A09093C2F6469763E0D0A202020203C2F6469763E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D2268746D6C2D706F72746C6574223E0D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D2268746D6C2D706F72746C65742D636F6E74656E7422202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D2268746D6C2D706F72746C65742D636F6E74656E74223E0D0A093C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D222E22202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E),
	(310, 'MyLutece Portlet  - Default', 'portlet_mylutece.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706F72746C6574223E0D0A0D0A093C78736C3A7661726961626C65206E616D653D226465766963655F636C617373223E0D0A093C78736C3A63686F6F73653E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D736D616C6C2D646576696365293D273027223E68696464656E2D70686F6E653C2F78736C3A7768656E3E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D6E6F726D616C2D646576696365293D273027223E68696464656E2D7461626C65743C2F78736C3A7768656E3E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D6C617267652D646576696365293D273027223E68696464656E2D6465736B746F703C2F78736C3A7768656E3E0D0A09093C78736C3A6F74686572776973653E3C2F78736C3A6F74686572776973653E0D0A093C2F78736C3A63686F6F73653E0D0A093C2F78736C3A7661726961626C653E0D0A0D0A093C64697620636C6173733D22706F72746C6574207B246465766963655F636C6173737D223E0D0A09093C64697620636C6173733D2277656C6C223E0D0A0909093C78736C3A63686F6F73653E0D0A0920202020202020203C78736C3A7768656E20746573743D226E6F7428737472696E6728646973706C61792D706F72746C65742D7469746C65293D27312729223E0D0A090909093C68333E3C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D22706F72746C65742D6E616D6522202F3E3C2F68333E0D0A090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D226D796C75746563652D706F72746C657422202F3E0D0A0920202020202020203C2F78736C3A7768656E3E0D0A0920202020202020203C78736C3A6F74686572776973653E0D0A090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D226D796C75746563652D706F72746C657422202F3E0D0A0920202020202020203C2F78736C3A6F74686572776973653E0D0A0909093C2F78736C3A63686F6F73653E0D0A0909093C64697620636C6173733D22636C656172666978223E26233136303B3C2F6469763E0D0A09093C2F6469763E0D0A093C2F6469763E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226D796C75746563652D706F72746C6574223E0D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D22757365722D6E6F742D7369676E656422202F3E0D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D226C75746563652D7573657222202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D22757365722D6E6F742D7369676E6564223E0D0A093C666F726D20636C6173733D22666F726D2220616374696F6E3D226A73702F736974652F706C7567696E732F6D796C75746563652F446F4D794C75746563654C6F67696E2E6A737022206D6574686F643D22706F7374223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D226C75746563652D757365722D61757468656E7469636174696F6E2D736572766963655B4064656C6567617465643D2774727565275D22202F3E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D226C75746563652D757365722D61757468656E7469636174696F6E2D736572766963655B406C6F67696E70617373776F72642D72657175697265643D2774727565275D22202F3E0D0A09093C78736C3A696620746573743D22636F756E74286C75746563652D757365722D61757468656E7469636174696F6E2D736572766963655B406C6F67696E70617373776F72642D72657175697265643D2774727565275D29202667743B3D2031223E0D0A0909093C6C6162656C20666F723D22757365726E616D65223E436F646520642761636326233233323B73203A3C2F6C6162656C3E0D0A0909093C696E707574206E616D653D22757365726E616D652220636C6173733D22696E7075742D6E6F726D616C222069643D22757365726E616D6522206175746F636F6D706C6574653D226F66662220746162696E6465783D22312220747970653D2274657874222F3E3C6272202F3E0D0A0909093C6C6162656C20666F723D2270617373776F7264223E4D6F74206465207061737365203A3C2F6C6162656C3E0D0A0909093C696E707574206E616D653D2270617373776F72642220636C6173733D22696E7075742D6E6F726D616C222069643D2270617373776F726422206175746F636F6D706C6574653D226F66662220746162696E6465783D22322220747970653D2270617373776F726422202F3E0D0A0909093C627574746F6E20636C6173733D2262746E2062746E2D736D616C6C2220746162696E6465783D22332220747970653D227375626D6974223E3C6920636C6173733D2269636F6E2D75736572223E26233136303B3C2F693E26233136303B436F6E6E6578696F6E3C2F627574746F6E3E0D0A09093C2F78736C3A69663E0D0A093C2F666F726D3E0D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D226C75746563652D757365722D6E65772D6163636F756E742D75726C22202F3E0D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D226C75746563652D757365722D6C6F73742D70617373776F72642D75726C22202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D226C75746563652D757365722D61757468656E7469636174696F6E2D736572766963655B406C6F67696E70617373776F72642D72657175697265643D2774727565275D223E0D0A093C6C6162656C20636C6173733D22726164696F2220666F723D22617574685F70726F766964657222203E0D0A09093C696E70757420747970653D22726164696F22206E616D653D22617574685F70726F7669646572222076616C75653D227B6E616D657D2220636865636B65643D22636865636B656422202F3E0D0A09093C78736C3A76616C75652D6F662073656C6563743D22646973706C61792D6E616D6522202F3E0D0A093C2F6C6162656C3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D226C75746563652D757365722D61757468656E7469636174696F6E2D736572766963655B4064656C6567617465643D2774727565275D223E0D0A093C6120687265663D227B75726C7D3F617574685F70726F76696465723D7B6E616D657D223E0D0A09093C696D67207372633D227B69636F6E2D75726C7D2220616C743D227B646973706C61792D6E616D657D22207469746C653D227B646973706C61792D6E616D657D222F3E0D0A093C2F613E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226C75746563652D75736572223E0D0A202020203C703E0D0A093C7374726F6E673E4269656E76656E756526233136303B0D0A09093C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D226C75746563652D757365722D6E616D652D676976656E22202F3E26233136303B0D0A09093C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D226C75746563652D757365722D6E616D652D66616D696C7922202F3E0D0A093C2F7374726F6E673E0D0A093C2F703E0D0A202020203C78736C3A6170706C792D74656D706C617465732073656C6563743D226C75746563652D757365722D6C6F676F75742D75726C22202F3E0D0A202020203C78736C3A6170706C792D74656D706C617465732073656C6563743D226C75746563652D757365722D766965772D6163636F756E742D75726C22202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226C75746563652D757365722D6C6F676F75742D75726C223E0D0A2020203C666F726D20636C6173733D22666F726D2D696E6C696E652070756C6C2D6C65667422206E616D653D226C6F676F75742220616374696F6E3D227B2E7D22206D6574686F643D22706F7374223E0D0A202020093C627574746F6E20747970653D227375626D69742220636C6173733D2262746E223E3C6920636C6173733D2269636F6E2D6F6666223E26233136303B3C2F693E26233136303B4426233233333B636F6E6E6578696F6E3C2F627574746F6E3E26233136303B0D0A2020203C2F666F726D3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226C75746563652D757365722D6E65772D6163636F756E742D75726C223E0D0A093C666F726D20636C6173733D22666F726D2D696E6C696E652070756C6C2D6C65667422206E616D653D226C6F676F75742220616374696F6E3D227B2E7D22206D6574686F643D22706F7374223E0D0A09093C627574746F6E20747970653D227375626D69742220636C6173733D2262746E223E3C6920636C6173733D2269636F6E2D706C7573223E26233136303B3C2F693E26233136303B437226233233333B657220756E20636F6D7074653C2F627574746F6E3E26233136303B0D0A202020203C2F666F726D3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A3C78736C3A74656D706C617465206D617463683D226C75746563652D757365722D6C6F73742D70617373776F72642D75726C223E0D0A093C666F726D20636C6173733D22666F726D2D696E6C696E652070756C6C2D6C65667422206E616D653D226C6F676F75742220616374696F6E3D227B2E7D22206D6574686F643D22706F7374223E0D0A09202020093C627574746F6E20747970653D227375626D69742220636C6173733D2262746E223E3C6920636C6173733D2269636F6E2D6C6F636B223E26233136303B3C2F693E26233136303B4D6F742064652070617373652070657264753C2F627574746F6E3E26233136303B0D0A2020203C2F666F726D3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D226C75746563652D757365722D766965772D6163636F756E742D75726C223E0D0A093C666F726D20636C6173733D22666F726D2D696E6C696E652070756C6C2D6C65667422206E616D653D226C6F676F75742220616374696F6E3D227B2E7D22206D6574686F643D22706F7374223E0D0A09202020093C627574746F6E20747970653D227375626D69742220636C6173733D2262746E223E3C6920636C6173733D2269636F6E2D65646974223E26233136303B3C2F693E26233136303B566F6972206D6F6E20636F6D7074653C2F627574746F6E3E26233136303B0D0A093C2F666F726D3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E0D0A0D0A),
	(311, 'HTML Portlet  - Section', 'portlet_html_cohost_section.xsl', _binary 0x3C3F786D6C2076657273696F6E3D22312E30223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A3C78736C3A6F7574707574206D6574686F643D2268746D6C2220696E64656E743D22796573222F3E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22706F72746C6574223E0D0A3C78736C3A7661726961626C65206E616D653D226465766963655F636C617373223E0D0A093C78736C3A63686F6F73653E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D736D616C6C2D646576696365293D273027223E68696464656E2D70686F6E653C2F78736C3A7768656E3E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D6E6F726D616C2D646576696365293D273027223E68696464656E2D7461626C65743C2F78736C3A7768656E3E0D0A09093C78736C3A7768656E20746573743D22737472696E6728646973706C61792D6F6E2D6C617267652D646576696365293D273027223E68696464656E2D6465736B746F703C2F78736C3A7768656E3E0D0A09093C78736C3A6F74686572776973653E3C2F78736C3A6F74686572776973653E0D0A093C2F78736C3A63686F6F73653E0D0A3C2F78736C3A7661726961626C653E0D0A0D0A3C73656374696F6E20636C6173733D226674636F2D73656374696F6E2062672D6C69676874207B246465766963655F636C6173737D223E0D0A093C64697620636C6173733D22636F6E7461696E6572223E0D0A09093C78736C3A63686F6F73653E0D0A0909093C78736C3A7768656E20746573743D226E6F7428737472696E6728646973706C61792D706F72746C65742D7469746C65293D27312729223E0D0A090909093C64697620636C6173733D22726F77206A7573746966792D636F6E74656E742D63656E746572206D622D352070622D33223E0D0A0909090920203C64697620636C6173733D22636F6C2D6D642D3720746578742D63656E7465722068656164696E672D73656374696F6E206674636F2D616E696D617465223E0D0A09090909093C683220636C6173733D226D622D34223E3C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D22706F72746C65742D6E616D6522202F3E3C2F68323E0D0A0909090920203C2F6469763E0D0A090909093C2F6469763E0D0A0909093C2F78736C3A7768656E3E0D0A09093C2F78736C3A63686F6F73653E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D2268746D6C2D706F72746C657422202F3E0D0A093C2F6469763E0D0A3C2F73656374696F6E3E0D0A3C2F78736C3A74656D706C6174653E0D0A090D0A3C78736C3A74656D706C617465206D617463683D2268746D6C2D706F72746C6574223E0D0A3C64697620636C6173733D22726F7720642D666C6578223E0D0A093C78736C3A6170706C792D74656D706C617465732073656C6563743D2268746D6C2D706F72746C65742D636F6E74656E7422202F3E0D0A3C2F6469763E0D0A3C2F78736C3A74656D706C6174653E0D0A090D0A3C78736C3A74656D706C617465206D617463683D2268746D6C2D706F72746C65742D636F6E74656E74223E0D0A093C78736C3A76616C75652D6F662064697361626C652D6F75747075742D6573636170696E673D22796573222073656C6563743D222E22202F3E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E0D0A0D0A0D0A0D0A0D0A);
/*!40000 ALTER TABLE `core_stylesheet` ENABLE KEYS */;


-- Dumping structure for table lutece.core_style_mode_stylesheet
CREATE TABLE IF NOT EXISTS `core_style_mode_stylesheet` (
  `id_style` int(11) NOT NULL DEFAULT '0',
  `id_mode` int(11) NOT NULL DEFAULT '0',
  `id_stylesheet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_style`,`id_mode`,`id_stylesheet`),
  KEY `index_style_mode_stylesheet` (`id_stylesheet`,`id_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_style_mode_stylesheet: 10 rows
/*!40000 ALTER TABLE `core_style_mode_stylesheet` DISABLE KEYS */;
INSERT INTO `core_style_mode_stylesheet` (`id_style`, `id_mode`, `id_stylesheet`) VALUES
	(3, 0, 211),
	(4, 0, 213),
	(5, 0, 215),
	(6, 0, 217),
	(7, 0, 253),
	(8, 1, 279),
	(100, 0, 10),
	(101, 0, 285),
	(102, 0, 311),
	(200, 0, 310);
/*!40000 ALTER TABLE `core_style_mode_stylesheet` ENABLE KEYS */;


-- Dumping structure for table lutece.core_template
CREATE TABLE IF NOT EXISTS `core_template` (
  `template_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `template_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`template_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_template: 13 rows
/*!40000 ALTER TABLE `core_template` DISABLE KEYS */;
INSERT INTO `core_template` (`template_name`, `template_value`) VALUES
	('core_first_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('core_expiration_mail', 'Bonjour ${first_name} ! Votre compte a expiré. Vous ne pourrez plus vous connecter avec, et les données vous concernant ont été anonymisées'),
	('core_other_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('core_account_reactivated_mail', 'Bonjour ${first_name} ! Votre compte utilisateur a bien été réactivé. Il est désormais valable jusqu\'au ${date_valid}.'),
	('core_password_expired', 'Bonjour ! Votre mot de passe a expiré. Lors de votre prochaine connexion, vous pourrez le changer.'),
	('mylutece_database_first_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('mylutece_database_expiration_mail', 'Bonjour ${first_name} ! Votre compte a expiré. Vous ne pourrez plus vous connecter avec, et les données vous concernant ont été anonymisées'),
	('mylutece_database_other_alert_mail', 'Bonjour ${first_name} ! Votre compte utilisateur arrive à expiration. Pour prolonger sa validité, veuillez <a href="${url}">cliquer ici</a>.</br>Si vous ne le faites pas avant le ${date_valid}, il sera désactivé.'),
	('mylutece_database_account_reactivated_mail', 'Bonjour ${first_name} ! Votre compte utilisateur a bien été réactivé. Il est désormais valable jusqu\'au ${date_valid}.'),
	('mylutece_database_unblock_user', '${site_link!}<br />Bonjour ! Votre IP a été bloquée. Pour la débloquer, vous pouvez suivre le lien suivant : <a href="${url}">debloquer</a>.'),
	('mylutece_database_password_expired', 'Bonjour ! Votre mot de passe a éxpiré. Lors de votre prochaine connection, vous pourrez le changer.'),
	('mylutece_database_mailLostPassword', '<html><head><title>#i18n{mylutece.email_reinit.object}</title></head><body><p>#i18n{mylutece.email_reinit.content.text}<br /></p><p>#i18n{mylutece.email_reinit.content.newPassword} : ${new_password}<br /></p></body></html><p>#i18n{mylutece.email_reinit.content.reinitPassword}<a href="${reinit_url}">#i18n{mylutece.email_reinit.content.labelLink}</a></p>'),
	('mylutece_database_mailPasswordEncryptionChanged', '<html><head><title>Votre mot de passe a été réinitialisé</title></head><body><p>Pour des raisons de sécurité, votre mot de passe a été réinitialisé.<br />----------------------------------------------------------</p><p>Votre nouveau mot de passe est : ${new_password}<br />----------------------------------------------------------</p></body></html>');
/*!40000 ALTER TABLE `core_template` ENABLE KEYS */;


-- Dumping structure for table lutece.core_text_editor
CREATE TABLE IF NOT EXISTS `core_text_editor` (
  `editor_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `editor_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `backOffice` smallint(6) NOT NULL,
  PRIMARY KEY (`editor_name`,`backOffice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_text_editor: 4 rows
/*!40000 ALTER TABLE `core_text_editor` DISABLE KEYS */;
INSERT INTO `core_text_editor` (`editor_name`, `editor_description`, `backOffice`) VALUES
	('tinymce', 'portal.admindashboard.editors.labelBackTinyMCE', 1),
	('', 'portal.admindashboard.editors.labelBackNoEditor', 1),
	('', 'portal.admindashboard.editors.labelFrontNoEditor', 0),
	('markitupbbcode', 'portal.admindashboard.editors.labelFrontMarkitupBBCode', 0);
/*!40000 ALTER TABLE `core_text_editor` ENABLE KEYS */;


-- Dumping structure for table lutece.core_user_password_history
CREATE TABLE IF NOT EXISTS `core_user_password_history` (
  `id_user` int(11) NOT NULL,
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_user_password_history: 0 rows
/*!40000 ALTER TABLE `core_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_password_history` ENABLE KEYS */;


-- Dumping structure for table lutece.core_user_preferences
CREATE TABLE IF NOT EXISTS `core_user_preferences` (
  `id_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `pref_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user`,`pref_key`),
  KEY `index_user_preferences` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_user_preferences: 0 rows
/*!40000 ALTER TABLE `core_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `core_user_preferences` ENABLE KEYS */;


-- Dumping structure for table lutece.core_user_right
CREATE TABLE IF NOT EXISTS `core_user_right` (
  `id_right` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_right`,`id_user`),
  KEY `index_user_right` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_user_right: 44 rows
/*!40000 ALTER TABLE `core_user_right` DISABLE KEYS */;
INSERT INTO `core_user_right` (`id_right`, `id_user`) VALUES
	('CORE_ADMIN_SITE', 1),
	('CORE_ADMIN_SITE', 2),
	('CORE_ADMINDASHBOARD_MANAGEMENT', 1),
	('CORE_CACHE_MANAGEMENT', 1),
	('CORE_DAEMONS_MANAGEMENT', 1),
	('CORE_DASHBOARD_MANAGEMENT', 1),
	('CORE_EDITORS_MANAGEMENT', 1),
	('CORE_FEATURES_MANAGEMENT', 1),
	('CORE_LEVEL_RIGHT_MANAGEMENT', 1),
	('CORE_LINK_SERVICE_MANAGEMENT', 1),
	('CORE_LINK_SERVICE_MANAGEMENT', 2),
	('CORE_LOGS_VISUALISATION', 1),
	('CORE_MAILINGLISTS_MANAGEMENT', 1),
	('CORE_MODES_MANAGEMENT', 1),
	('CORE_PAGE_TEMPLATE_MANAGEMENT', 1),
	('CORE_PAGE_TEMPLATE_MANAGEMENT', 2),
	('CORE_PLUGINS_MANAGEMENT', 1),
	('CORE_PROPERTIES_MANAGEMENT', 1),
	('CORE_PROPERTIES_MANAGEMENT', 2),
	('CORE_RBAC_MANAGEMENT', 1),
	('CORE_RIGHT_MANAGEMENT', 1),
	('CORE_ROLES_MANAGEMENT', 1),
	('CORE_ROLES_MANAGEMENT', 2),
	('CORE_SEARCH_INDEXATION', 1),
	('CORE_SEARCH_INDEXATION', 2),
	('CORE_SEARCH_MANAGEMENT', 1),
	('CORE_SEARCH_MANAGEMENT', 2),
	('CORE_STYLES_MANAGEMENT', 1),
	('CORE_STYLESHEET_MANAGEMENT', 1),
	('CORE_TEMPLATES_AUTO_INCLUDES_MANAGEMENT', 1),
	('CORE_USERS_MANAGEMENT', 1),
	('CORE_USERS_MANAGEMENT', 2),
	('CORE_WORKGROUPS_MANAGEMENT', 1),
	('CORE_WORKGROUPS_MANAGEMENT', 2),
	('CORE_XSL_EXPORT_MANAGEMENT', 1),
	('DATABASE_GROUPS_MANAGEMENT', 1),
	('DATABASE_MANAGEMENT_USERS', 1),
	('MYLUTECE_MANAGE_AUTHENTICATION_FILTER', 1),
	('MYLUTECE_MANAGEMENT', 1),
	('SEO_MANAGEMENT', 1),
	('SUGGEST_MANAGEMENT', 1),
	('SUGGEST_MANAGEMENT', 2),
	('SYSTEMINFO_MANAGEMENT', 1),
	('THEME_MANAGEMENT', 1);
/*!40000 ALTER TABLE `core_user_right` ENABLE KEYS */;


-- Dumping structure for table lutece.core_user_role
CREATE TABLE IF NOT EXISTS `core_user_role` (
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_key`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_user_role: 15 rows
/*!40000 ALTER TABLE `core_user_role` DISABLE KEYS */;
INSERT INTO `core_user_role` (`role_key`, `id_user`) VALUES
	('all_site_manager', 1),
	('all_site_manager', 2),
	('assign_groups', 1),
	('assign_groups', 2),
	('assign_groups', 3),
	('assign_roles', 1),
	('assign_roles', 2),
	('assign_roles', 3),
	('mylutece_database_manager', 1),
	('mylutece_manager', 1),
	('suggest_manager', 1),
	('suggest_manager', 2),
	('super_admin', 1),
	('super_admin', 2),
	('theme_manager', 1);
/*!40000 ALTER TABLE `core_user_role` ENABLE KEYS */;


-- Dumping structure for table lutece.core_xsl_export
CREATE TABLE IF NOT EXISTS `core_xsl_export` (
  `id_xsl_export` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_file` int(11) DEFAULT NULL,
  `plugin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_xsl_export`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.core_xsl_export: 4 rows
/*!40000 ALTER TABLE `core_xsl_export` DISABLE KEYS */;
INSERT INTO `core_xsl_export` (`id_xsl_export`, `title`, `description`, `extension`, `id_file`, `plugin`) VALUES
	(125, 'Coeur - Export CSV des administrateurs', 'Export des utilisateurs back office dans un fichier CSV', 'csv', 125, 'core'),
	(126, 'Coeur - Export XML des administrateurs', 'Export des utilisateurs back office dans un fichier XML', 'xml', 126, 'core'),
	(127, 'MyLutece Database - Export CSV des utilisateurs', 'Export des utilisateur MyLutece Database dans un fichier CSV', 'csv', 127, 'mylutece-database'),
	(128, 'MyLutece Database - Export XML des utilisateurs', 'Export des utilisateur MyLutece Database dans un fichier XML', 'xml', 128, 'mylutece-database');
/*!40000 ALTER TABLE `core_xsl_export` ENABLE KEYS */;


-- Dumping structure for table lutece.html_portlet
CREATE TABLE IF NOT EXISTS `html_portlet` (
  `id_portlet` int(11) NOT NULL DEFAULT '0',
  `html` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_portlet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.html_portlet: 2 rows
/*!40000 ALTER TABLE `html_portlet` DISABLE KEYS */;
INSERT INTO `html_portlet` (`id_portlet`, `html`) VALUES
	(2, '<section class="ftco-section  ftco-no-pt ftc-no-pb lutece-section">\n	<div class="container">\n		<div class="row">\n			<div class="col-lg-6 py-5">\n			      	<div class="d-flex justify-content-center flex-wrap">\n					<img src="images/coding.svg" class="img-fluid img-coding" alt="">\n	 			     	<div class="heading-section ftco-animate mt-5 fadeInUp ftco-animated">\n						<h2 class="mb-4">Software overview</h2>\n						<p>Lutece is FreeSoftware. Full OpenSource licensed under BSD.</p>\n					</div>\n				</div>\n			</div>\n			<div class="col-lg-6 py-5">\n				<div class="row">\n					<div class="col-md-6 ftco-animate fadeInUp ftco-animated">\n						<div class="media block-6 services border text-center">\n							<div class="icon d-flex align-items-center justify-content-center">\n								<span class="fas fa-mobile-alt" aria-hidden="true"></span>\n							</div>\n						  <div class="mt-3 media-body media-body-2">\n							<h3 class="heading">Responsive</h3>\n							<p>Full responsive design Back and Front</p>\n						  </div>\n						</div>\n					</div>\n					<div class="col-md-6 ftco-animate fadeInUp ftco-animated">\n						<div class="media block-6 services border text-center">\n						<div class="icon d-flex align-items-center justify-content-center">\n							<span class="fab fa-bootstrap" aria-hidden="true"></span>\n						</div>\n						  <div class="mt-3 media-body media-body-2">\n							<h3 class="heading">Bootstrap compliant</h3>\n							<p>with Bootstrap 3/4</p>\n						  </div>\n						</div>\n					</div>\n					<div class="col-md-6 ftco-animate fadeInUp ftco-animated">\n						<div class="media block-6 services border text-center">\n							<div class="icon d-flex align-items-center justify-content-center">\n								<span class="fas fa-exchange-alt" aria-hidden="true"></span>\n							</div>\n							<div class="mt-3 media-body media-body-2">\n								<h3 class="heading">API</h3>\n								<p>Very modular and flexible architecture based on plugins, APIs, IoC</p>\n							</div>\n						</div>\n					</div>\n					<div class="col-md-6 ftco-animate fadeInUp ftco-animated">\n						<div class="media block-6 services border text-center">\n							<div class="icon d-flex align-items-center justify-content-center">\n								<span class="fas fa-project-diagram" aria-hidden="true"></span>\n							</div>\n							<div class="mt-3 media-body media-body-2">\n								<h3 class="heading">Over 300 plugins</h3>\n								<p>for many needs: Content Management, Collaborative, Workflows...</p>\n							</div>\n						</div>\n					</div>\n					<div class="col-md-6 ftco-animate fadeInUp ftco-animated">\n						<div class="media block-6 services border text-center">\n							<div class="icon d-flex align-items-center justify-content-center">\n								<span class="fab fa-java" aria-hidden="true"></span>\n							</div>\n							<div class="mt-3 media-body media-body-2">\n								<h3 class="heading">Runs on Java Platform</h3>\n								<p>...and rely on powerful build tools such as Apache Maven</p>\n							</div>\n						</div>\n					</div>\n					<div class="col-md-6 ftco-animate fadeInUp ftco-animated">\n						<div class="media block-6 services border text-center">\n							<div class="icon d-flex align-items-center justify-content-center">\n								<span class="fab fa-osi" aria-hidden="true"></span>\n							</div>\n							<div class="mt-3 media-body media-body-2">\n								<h3 class="heading">Open Source</h3>\n								<p>Uses best of breed Java Open Source stacks : Lucene, Spring, Ehcache, Freemarker, ...</p>\n							</div>\n						</div>\n					</div>\n				</div>\n			</div>\n		</div>\n	</div>\n</section>'),
	(1, '<div class="hero-wrap js-fullheight"> \n <div class="overlay">\n  &nbsp;\n </div> \n <div class="container-fluid px-0"> \n  <div class="row d-md-flex no-gutters js-fullheight slider-text align-items-center justify-content-end">\n   <img class="one-third js-fullheight align-self-end order-md-last img-fluid" src="images/creative_process.svg" alt=""> \n   <div class="one-forth d-flex align-items-center ftco-animate js-fullheight"> \n    <div class="text mt-5">\n     <span class="subheading">Working for people<br></span> \n     <h1 class="mb-3">Democratic process around ideas</h1> \n     <p>This is the way great ideas are raised by some people to elected others.</p> \n     <p><a class="btn btn-primary px-4 py-3" title="Try our demo" href="jsp/site/Portal.jsp?page=suggest" target="_blank">Try our demo</a></p> \n    </div> \n   </div> \n  </div> \n </div> \n</div>');
/*!40000 ALTER TABLE `html_portlet` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_attribute
CREATE TABLE IF NOT EXISTS `mylutece_attribute` (
  `id_attribute` int(11) NOT NULL DEFAULT '0',
  `type_class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` mediumtext COLLATE utf8_unicode_ci,
  `help_message` mediumtext COLLATE utf8_unicode_ci,
  `is_mandatory` smallint(6) DEFAULT '0',
  `is_shown_in_search` smallint(6) DEFAULT '0',
  `attribute_position` int(11) DEFAULT '0',
  `plugin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymize` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_attribute`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_attribute: 0 rows
/*!40000 ALTER TABLE `mylutece_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_attribute_field
CREATE TABLE IF NOT EXISTS `mylutece_attribute_field` (
  `id_field` int(11) NOT NULL DEFAULT '0',
  `id_attribute` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_value` mediumtext COLLATE utf8_unicode_ci,
  `is_DEFAULT_value` smallint(6) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `is_multiple` smallint(6) DEFAULT '0',
  `field_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_attribute_field: 0 rows
/*!40000 ALTER TABLE `mylutece_attribute_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_attribute_field` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_connections_log
CREATE TABLE IF NOT EXISTS `mylutece_connections_log` (
  `ip_address` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `login_status` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_connections_log: 0 rows
/*!40000 ALTER TABLE `mylutece_connections_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_connections_log` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_group
CREATE TABLE IF NOT EXISTS `mylutece_database_group` (
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `group_description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_group: 0 rows
/*!40000 ALTER TABLE `mylutece_database_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_group_role
CREATE TABLE IF NOT EXISTS `mylutece_database_group_role` (
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_key`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_group_role: 0 rows
/*!40000 ALTER TABLE `mylutece_database_group_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_group_role` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_key
CREATE TABLE IF NOT EXISTS `mylutece_database_key` (
  `mylutece_database_user_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mylutece_database_user_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_key: 0 rows
/*!40000 ALTER TABLE `mylutece_database_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_key` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_user
CREATE TABLE IF NOT EXISTS `mylutece_database_user` (
  `mylutece_database_user_id` int(11) NOT NULL,
  `login` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `name_given` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_family` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `reset_password` smallint(6) NOT NULL DEFAULT '0',
  `password_max_valid_date` timestamp NULL DEFAULT NULL,
  `account_max_valid_date` bigint(20) DEFAULT NULL,
  `nb_alerts_sent` int(11) NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '1980-01-01 00:00:00',
  PRIMARY KEY (`mylutece_database_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_user: 2 rows
/*!40000 ALTER TABLE `mylutece_database_user` DISABLE KEYS */;
INSERT INTO `mylutece_database_user` (`mylutece_database_user_id`, `login`, `password`, `name_given`, `name_family`, `email`, `is_active`, `reset_password`, `password_max_valid_date`, `account_max_valid_date`, `nb_alerts_sent`, `last_login`) VALUES
	(1, 'User1', 'PBKDF2WITHHMACSHA512:40000:1f5023eaff00b1e626c64f0db0e0dc2b:ab35776895a12b5e2d3380800b5345afd4ca7b72c8b1d6f78c038f00a0ba5c4e5bdd6f82c0f22a08175d061fd716ff347dbc347998b08c54cefcc1b643e78dbfc3e86bce992045e3fb3df4d82f0e5e00eb1d3d64312b14cf006e2766b7415bdab4ec3c188cfd34fb8a95967641099c961710dc7dbaaeb6843d19c29b28ee945d', 'User1', 'User1', 'choupinet75@yopmail.com', 1, 0, NULL, 1606581573760, 0, '2019-12-04 17:39:33'),
	(2, 'User2', 'PBKDF2WITHHMACSHA512:40000:7504f063464c5bb7cf8f2c3b90e2b667:58ed41fe446e37c73c5100b8746328f6941f710211aef74260468bee6871f8716de536021f38e5d512a6ae9195c1bb67c0c036e5de94bb5a3c62f13314b577c8cc5f10babb5bf650d7feb626c5a69cdf958fee2f03d7a3077379b57ca3bd44b9ce22a75e3b8f831d637f0c43e7592aa9f4052a378ad4080a69b0f2ca0f14be03', 'Paul', 'Choupinet', 'laurent.hohl@gmail.com', 1, 0, NULL, 1606144319915, 0, '2019-11-29 16:11:59');
/*!40000 ALTER TABLE `mylutece_database_user` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_user_group
CREATE TABLE IF NOT EXISTS `mylutece_database_user_group` (
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT '0',
  `group_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`group_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_user_group: 0 rows
/*!40000 ALTER TABLE `mylutece_database_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_group` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_user_parameter
CREATE TABLE IF NOT EXISTS `mylutece_database_user_parameter` (
  `parameter_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `parameter_value` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parameter_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_user_parameter: 38 rows
/*!40000 ALTER TABLE `mylutece_database_user_parameter` DISABLE KEYS */;
INSERT INTO `mylutece_database_user_parameter` (`parameter_key`, `parameter_value`) VALUES
	('account_creation_validation_email', 'false'),
	('auto_login_after_validation_email', 'false'),
	('enable_jcaptcha', 'false'),
	('force_change_password_reinit', ''),
	('password_minimum_length', '8'),
	('password_format_upper_lower_case', 'false'),
	('password_format_numero', 'false'),
	('password_format_special_characters', 'false'),
	('password_duration', ''),
	('password_history_size', ''),
	('maximum_number_password_change', ''),
	('tsw_size_password_change', ''),
	('use_advanced_security_parameters', 'false'),
	('account_life_time', '360'),
	('time_before_alert_account', '30'),
	('nb_alert_account', '2'),
	('time_between_alerts_account', '10'),
	('access_failures_max', '3'),
	('access_failures_interval', '10'),
	('expired_alert_mail_sender', 'LUTECE'),
	('expired_alert_mail_subject', 'Votre compte a expiré'),
	('first_alert_mail_sender', 'LUTECE'),
	('first_alert_mail_subject', 'Votre compte va bientot expirer'),
	('other_alert_mail_sender', 'LUTECE'),
	('other_alert_mail_subject', 'Votre compte va bientot expirer'),
	('account_reactivated_mail_sender', 'LUTECE'),
	('account_reactivated_mail_subject', 'Votre compte a bien été réactivé'),
	('access_failures_captcha', '1'),
	('unblock_user_mail_sender', 'LUTECE'),
	('unblock_user_mail_subject', 'Votre IP a été bloquée'),
	('enable_unblock_ip', 'false'),
	('notify_user_password_expired', ''),
	('password_expired_mail_sender', 'LUTECE'),
	('password_expired_mail_subject', 'Votre mot de passe a expiré'),
	('mail_lost_password_sender', 'LUTECE'),
	('mail_lost_password_subject', 'Votre mot de passe a été réinitialisé'),
	('mail_password_encryption_changed_sender', 'LUTECE'),
	('mail_password_encryption_changed_subject', 'Votre mot de passe a été réinitialisé');
/*!40000 ALTER TABLE `mylutece_database_user_parameter` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_user_password_history
CREATE TABLE IF NOT EXISTS `mylutece_database_user_password_history` (
  `mylutece_database_user_id` int(11) NOT NULL,
  `password` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `date_password_change` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`mylutece_database_user_id`,`date_password_change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_user_password_history: 0 rows
/*!40000 ALTER TABLE `mylutece_database_user_password_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_password_history` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_database_user_role
CREATE TABLE IF NOT EXISTS `mylutece_database_user_role` (
  `mylutece_database_user_id` int(11) NOT NULL DEFAULT '0',
  `role_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`mylutece_database_user_id`,`role_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_database_user_role: 0 rows
/*!40000 ALTER TABLE `mylutece_database_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_database_user_role` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_user_anonymize_field
CREATE TABLE IF NOT EXISTS `mylutece_user_anonymize_field` (
  `field_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `anonymize` smallint(6) NOT NULL,
  PRIMARY KEY (`field_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_user_anonymize_field: 4 rows
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` DISABLE KEYS */;
INSERT INTO `mylutece_user_anonymize_field` (`field_name`, `anonymize`) VALUES
	('login', 1),
	('name_given', 1),
	('name_family', 1),
	('email', 1);
/*!40000 ALTER TABLE `mylutece_user_anonymize_field` ENABLE KEYS */;


-- Dumping structure for table lutece.mylutece_user_field
CREATE TABLE IF NOT EXISTS `mylutece_user_field` (
  `id_user_field` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) DEFAULT NULL,
  `id_attribute` int(11) DEFAULT NULL,
  `id_field` int(11) DEFAULT NULL,
  `user_field_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.mylutece_user_field: 0 rows
/*!40000 ALTER TABLE `mylutece_user_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `mylutece_user_field` ENABLE KEYS */;


-- Dumping structure for table lutece.seo_friendly_url
CREATE TABLE IF NOT EXISTS `seo_friendly_url` (
  `id_url` int(11) NOT NULL DEFAULT '0',
  `friendly_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `technical_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_modification` timestamp NOT NULL DEFAULT '2012-10-10 00:00:00',
  `is_canonical` int(11) NOT NULL DEFAULT '0',
  `is_sitemap` int(11) NOT NULL DEFAULT '0',
  `sitemap_lastmod` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sitemap_changefreq` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `sitemap_priority` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id_url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.seo_friendly_url: 4 rows
/*!40000 ALTER TABLE `seo_friendly_url` DISABLE KEYS */;
INSERT INTO `seo_friendly_url` (`id_url`, `friendly_url`, `technical_url`, `date_creation`, `date_modification`, `is_canonical`, `is_sitemap`, `sitemap_lastmod`, `sitemap_changefreq`, `sitemap_priority`) VALUES
	(1, '/sitemap.html', '/jsp/site/Portal.jsp?page=map', '2019-12-27 12:05:29', '2012-10-10 00:00:00', 1, 1, '2012-10-10', 'monthly', '0.8'),
	(2, '/contacts.html', '/jsp/site/Portal.jsp?page=contact', '2019-12-27 12:05:29', '2012-10-10 00:00:00', 1, 1, '2012-10-10', 'monthly', '0.8'),
	(3, '/credits.html', '/jsp/site/PopupCredits.jsp', '2019-12-27 12:05:29', '2012-10-10 00:00:00', 1, 1, '2012-10-10', 'monthly', '0.8'),
	(4, '/home.html', '/jsp/site/Portal.jsp?page_id=1', '2019-12-27 12:06:04', '2012-10-10 00:00:00', 1, 1, '2019-11-27', 'weekly', '0.7');
/*!40000 ALTER TABLE `seo_friendly_url` ENABLE KEYS */;


-- Dumping structure for table lutece.seo_properties
CREATE TABLE IF NOT EXISTS `seo_properties` (
  `property_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `property_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`property_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.seo_properties: 0 rows
/*!40000 ALTER TABLE `seo_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_properties` ENABLE KEYS */;


-- Dumping structure for table lutece.seo_rule
CREATE TABLE IF NOT EXISTS `seo_rule` (
  `id_rule` int(11) NOT NULL DEFAULT '0',
  `rule_from` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rule_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_rule`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.seo_rule: 3 rows
/*!40000 ALTER TABLE `seo_rule` DISABLE KEYS */;
INSERT INTO `seo_rule` (`id_rule`, `rule_from`, `rule_to`) VALUES
	(1, '/page/([0-9]+)', '/jsp/site/Portal.jsp?page_id=$1'),
	(2, '/app/([a-z]+)', '/jsp/site/Portal.jsp?page=$1'),
	(3, '/map', '/jsp/site/Portal.jsp?page=map');
/*!40000 ALTER TABLE `seo_rule` ENABLE KEYS */;


-- Dumping structure for table lutece.subscribe_subscription
CREATE TABLE IF NOT EXISTS `subscribe_subscription` (
  `id_subscription` int(11) NOT NULL DEFAULT '0',
  `id_user` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `subscription_provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscription_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id_subscribed_resource` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_subscription`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.subscribe_subscription: 0 rows
/*!40000 ALTER TABLE `subscribe_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscribe_subscription` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_action
CREATE TABLE IF NOT EXISTS `suggest_action` (
  `id_action` int(11) NOT NULL DEFAULT '0',
  `name_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_permission` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suggest_state` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_action: 11 rows
/*!40000 ALTER TABLE `suggest_action` DISABLE KEYS */;
INSERT INTO `suggest_action` (`id_action`, `name_key`, `description_key`, `action_url`, `icon_url`, `action_permission`, `suggest_state`) VALUES
	(1, 'suggest.action.modify.name', 'suggest.action.modify.description', 'jsp/admin/plugins/suggest/ModifySuggest.jsp', 'fa fa-pencil', 'MODIFY', 0),
	(2, 'suggest.action.modify.name', 'suggest.action.modify.description', 'jsp/admin/plugins/suggest/ModifySuggest.jsp', 'fa fa-pencil', 'MODIFY', 1),
	(3, 'suggest.action.manageSuggestSubmit.name', 'suggest.action.manageSuggestSubmit.description', 'jsp/admin/plugins/suggest/ManageSuggestSubmit.jsp', 'fa fa-inbox', 'MANAGE_SUGGEST_SUBMIT', 0),
	(4, 'suggest.action.manageSuggestSubmit.name', 'suggest.action.manageSuggestSubmit.description', 'jsp/admin/plugins/suggest/ManageSuggestSubmit.jsp', 'fa fa-inbox', 'MANAGE_SUGGEST_SUBMIT', 1),
	(5, 'suggest.action.disable.name', 'suggest.action.disable.description', 'jsp/admin/plugins/suggest/ConfirmDisableSuggest.jsp', 'fa fa-remove', 'CHANGE_STATE', 1),
	(6, 'suggest.action.enable.name', 'suggest.action.enable.description', 'jsp/admin/plugins/suggest/DoEnableSuggest.jsp', 'fa fa-check', 'CHANGE_STATE', 0),
	(7, 'suggest.action.copy.name', 'suggest.action.copy.description', 'jsp/admin/plugins/suggest/DoCopySuggest.jsp', 'fa fa-copy', 'COPY', 0),
	(8, 'suggest.action.copy.name', 'suggest.action.copy.description', 'jsp/admin/plugins/suggest/DoCopySuggest.jsp', 'fa fa-copy', 'COPY', 1),
	(9, 'suggest.action.delete.name', 'suggest.action.delete.description', 'jsp/admin/plugins/suggest/ConfirmRemoveSuggest.jsp', 'fa fa-trash', 'DELETE', 0),
	(10, 'suggest.action.updateAllSuggestSubmit.name', 'suggest.action.updateAllSuggestSubmit.description', 'jsp/admin/plugins/suggest/ConfirmUpdateAllSuggestSubmit.jsp', 'fa fa-cog', 'UPDATE_ALL_SUGGEST_SUBMIT', 1),
	(11, 'suggest.action.updateAllSuggestSubmit.name', 'suggest.action.updateAllSuggestSubmit.description', 'jsp/admin/plugins/suggest/ConfirmUpdateAllSuggestSubmit.jsp', 'fa fa-cog', 'UPDATE_ALL_SUGGEST_SUBMIT', 0);
/*!40000 ALTER TABLE `suggest_action` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_category
CREATE TABLE IF NOT EXISTS `suggest_category` (
  `id_category` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_category: 5 rows
/*!40000 ALTER TABLE `suggest_category` DISABLE KEYS */;
INSERT INTO `suggest_category` (`id_category`, `title`, `color`) VALUES
	(1, 'Theme 1', NULL),
	(2, 'Theme 2', NULL),
	(3, 'Energy', '#ffffbb'),
	(4, 'Transportation', '#ffbbff'),
	(5, 'Plastic use', '#bbffff');
/*!40000 ALTER TABLE `suggest_category` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_comment_submit
CREATE TABLE IF NOT EXISTS `suggest_comment_submit` (
  `id_comment_submit` int(11) NOT NULL DEFAULT '0',
  `id_suggest_submit` int(11) DEFAULT NULL,
  `id_parent_comment` int(11) DEFAULT '0',
  `date_comment` timestamp NULL DEFAULT NULL,
  `comment_value` mediumtext COLLATE utf8_unicode_ci,
  `active` smallint(6) DEFAULT '0',
  `lutece_user_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `official_answer` smallint(6) DEFAULT '0',
  `date_modify` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_comment_submit`),
  KEY `index_suggest_comment_submit` (`id_suggest_submit`),
  KEY `index_suggest_id_parent_comment` (`id_parent_comment`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_comment_submit: 0 rows
/*!40000 ALTER TABLE `suggest_comment_submit` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_comment_submit` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_default_message
CREATE TABLE IF NOT EXISTS `suggest_default_message` (
  `unavailability_message` mediumtext COLLATE utf8_unicode_ci,
  `libelle_validate_button` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `libelle_contribution` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_suggest_submit_in_top_score` int(11) DEFAULT NULL,
  `number_suggest_submit_in_top_comment` int(11) DEFAULT NULL,
  `number_suggest_submit_caracters_shown` int(11) DEFAULT NULL,
  `notification_new_comment_title` mediumtext COLLATE utf8_unicode_ci,
  `notification_new_comment_body` mediumtext COLLATE utf8_unicode_ci,
  `notification_new_suggest_submit_title` mediumtext COLLATE utf8_unicode_ci,
  `notification_new_suggest_submit_body` mediumtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_default_message: 1 rows
/*!40000 ALTER TABLE `suggest_default_message` DISABLE KEYS */;
INSERT INTO `suggest_default_message` (`unavailability_message`, `libelle_validate_button`, `libelle_contribution`, `number_suggest_submit_in_top_score`, `number_suggest_submit_in_top_comment`, `number_suggest_submit_caracters_shown`, `notification_new_comment_title`, `notification_new_comment_body`, `notification_new_suggest_submit_title`, `notification_new_suggest_submit_body`) VALUES
	('', '', '', 10, 10, 500, '#i18n{suggest.notifications.newComment.title}', '<html>\r\n	<head>\r\n		<link href="${base_url}css/bootstrap.min.css" rel="stylesheet"/>\r\n	</head>\r\n	<body>\r\n		<p>#i18n{suggest.notifications.newComment.hello}</p>\r\n		<br />\r\n		${comments?size} #i18n{suggest.notifications.newComment.newCommentsPosted} :\r\n		<br />\r\n		<#list comments as comment_submit>\r\n			<p>\r\n				<#if comment_submit.isOfficialAnswer()>\r\n					<span class="badge badge-warning">\r\n						<i class="icon-star icon-white"></i> \r\n						#i18n{suggest.manageCommentSubmit.officialAnswer}\r\n					</span>\r\n					&nbsp;\r\n				</#if>\r\n				<i class="icon-calendar"></i> ${comment_submit.dateComment?string("dd/MM/yyyy HH:mm:ss")}\r\n			</p>\r\n			<#if comment_submit.value?length &gt; 100>\r\n				${comment_submit.value?substring(0,100)}\r\n			<#else>\r\n				${comment_submit.value}\r\n			</#if>\r\n			<a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&id_suggest=${comment_submit.suggestSubmit.suggest.idSuggest}&id_suggest_submit=${comment_submit.suggestSubmit.idSuggestSubmit}&action=view_suggest_submit">\r\n				#i18n{suggest.suggestListSubmit.labelReadMore}\r\n			</a>\r\n			<br />\r\n			<br />\r\n		</#list>\r\n	</body>\r\n</html>', '#i18n{suggest.notifications.newSuggestSubmit.title}', '<html>\r\n	<head>\r\n		<link href="${base_url}css/bootstrap.min.css" rel="stylesheet"/>\r\n	</head>\r\n	<body>\r\n		<p>#i18n{suggest.notifications.newSuggestSubmit.hello}</p>\r\n		<br />\r\n		${suggestSubmits?size} #i18n{suggest.notifications.newSuggestSubmit.newSuggestSubmitPosted} :\r\n		<br />\r\n		<#list suggestSubmits as suggestSubmit>\r\n			<p>\r\n				${suggestSubmit.suggestSubmitTitle}\r\n			</p>\r\n			<a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&id_suggest=${suggestSubmit.suggest.idSuggest}&id_suggest_submit=${suggestSubmit.idSuggestSubmit}&action=view_suggest_submit">\r\n				#i18n{suggest.suggestListSubmit.labelReadMore}\r\n			</a>\r\n			<br />\r\n			<br />\r\n		</#list>\r\n	</body>\r\n</html>');
/*!40000 ALTER TABLE `suggest_default_message` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_entry
CREATE TABLE IF NOT EXISTS `suggest_entry` (
  `id_entry` int(11) NOT NULL DEFAULT '0',
  `id_suggest` int(11) NOT NULL DEFAULT '0',
  `id_type` int(11) NOT NULL DEFAULT '0',
  `title` mediumtext COLLATE utf8_unicode_ci,
  `help_message` mediumtext COLLATE utf8_unicode_ci,
  `entry_comment` mediumtext COLLATE utf8_unicode_ci,
  `mandatory` smallint(6) DEFAULT '0',
  `pos` int(11) DEFAULT NULL,
  `default_value` mediumtext COLLATE utf8_unicode_ci,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `max_size_enter` int(11) DEFAULT NULL,
  `show_in_suggest_submit_list` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id_entry`),
  KEY `index_suggest_entry_suggest` (`id_suggest`),
  KEY `index_suggest_entry_type` (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_entry: 4 rows
/*!40000 ALTER TABLE `suggest_entry` DISABLE KEYS */;
INSERT INTO `suggest_entry` (`id_entry`, `id_suggest`, `id_type`, `title`, `help_message`, `entry_comment`, `mandatory`, `pos`, `default_value`, `height`, `width`, `max_size_enter`, `show_in_suggest_submit_list`) VALUES
	(2, 1, 3, 'Description', '', '', 1, 2, '', 4, 80, 500, 1),
	(1, 1, 2, 'Title', '', '', 1, 1, '', -1, 80, -1, 1),
	(3, 2, 2, 'Title', '', '', 1, 3, '', -1, 100, -1, 1),
	(4, 2, 3, 'Description', '', '', 1, 4, '', 4, 100, 500, 1);
/*!40000 ALTER TABLE `suggest_entry` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_entry_attr_additional
CREATE TABLE IF NOT EXISTS `suggest_entry_attr_additional` (
  `id_entry` int(11) NOT NULL DEFAULT '0',
  `attr_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `attr_value` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_entry_attr_additional: 0 rows
/*!40000 ALTER TABLE `suggest_entry_attr_additional` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_entry_attr_additional` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_entry_type
CREATE TABLE IF NOT EXISTS `suggest_entry_type` (
  `id_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_entry_type: 6 rows
/*!40000 ALTER TABLE `suggest_entry_type` DISABLE KEYS */;
INSERT INTO `suggest_entry_type` (`id_type`, `title`, `class_name`) VALUES
	(1, 'URL', 'fr.paris.lutece.plugins.suggest.business.EntryTypeUrl'),
	(2, 'Short text', 'fr.paris.lutece.plugins.suggest.business.EntryTypeText'),
	(3, 'Long text', 'fr.paris.lutece.plugins.suggest.business.EntryTypeTextArea'),
	(4, 'Image', 'fr.paris.lutece.plugins.suggest.business.EntryTypeImage'),
	(5, 'Video', 'fr.paris.lutece.plugins.suggest.business.EntryTypeVideo'),
	(6, 'BBCode editor', 'fr.paris.lutece.plugins.suggest.business.EntryTypeEditorBbcode');
/*!40000 ALTER TABLE `suggest_entry_type` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_entry_verify_by
CREATE TABLE IF NOT EXISTS `suggest_entry_verify_by` (
  `id_entry` int(11) NOT NULL DEFAULT '0',
  `id_expression` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_entry`,`id_expression`),
  KEY `index_suggest_verify_by_entry` (`id_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_entry_verify_by: 0 rows
/*!40000 ALTER TABLE `suggest_entry_verify_by` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_entry_verify_by` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_export_format
CREATE TABLE IF NOT EXISTS `suggest_export_format` (
  `id_export` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xsl_file` mediumblob,
  PRIMARY KEY (`id_export`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_export_format: 3 rows
/*!40000 ALTER TABLE `suggest_export_format` DISABLE KEYS */;
INSERT INTO `suggest_export_format` (`id_export`, `title`, `description`, `extension`, `xsl_file`) VALUES
	(1, 'xml', 'Export contributions in XML format', 'xml', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D2249534F2D383835392D31223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A3C78736C3A6F7574707574206D6574686F643D22786D6C222076657273696F6E3D22312E302220656E636F64696E673D2249534F2D383835392D312220696E64656E743D22796573222063646174612D73656374696F6E2D656C656D656E74733D22646967672D7375626D69742D76616C756520646967672D7375626D69742D63617465676F7279222F3E0D0A3C78736C3A74656D706C617465206D617463683D222F223E0D0A203C78736C3A6170706C792D74656D706C617465732073656C6563743D2264696767222F3E200D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D2264696767223E0D0A090D0A093C646967673E0D0A09093C646967672D7469746C653E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7469746C65222F3E0D0A09093C2F646967672D7469746C653E0D0A09093C646967672D7375626D6974733E0D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22646967672D7375626D6974732F646967672D7375626D6974222F3E200D0A09093C2F646967672D7375626D6974733E0D0A09093C646967672D656E74726965733E0D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22646967672D656E74726965732F656E747279222F3E200D0A09093C2F646967672D656E74726965733E0D0A09090D0A093C2F646967673E090D0A3C2F78736C3A74656D706C6174653E0D0A0D0A3C78736C3A74656D706C617465206D617463683D22646967672D7375626D6974223E0D0A093C646967672D7375626D69743E0D0A09090D0A09093C646967672D7375626D69742D7469746C653E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D7469746C65222F3E0D0A09093C2F646967672D7375626D69742D7469746C653E0D0A09090D0A09090D0A09093C646967672D7375626D69742D646174652D726573706F6E73653E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D646174652D726573706F6E7365222F3E0D0A09093C2F646967672D7375626D69742D646174652D726573706F6E73653E0D0A09090D0A09093C646967672D7375626D69742D73636F72653E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D73636F7265222F3E0D0A093C2F646967672D7375626D69742D73636F72653E0D0A09090D0A09093C646967672D7375626D69742D6E756D6265722D766F74653E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D6E756D6265722D766F7465222F3E0D0A093C2F646967672D7375626D69742D6E756D6265722D766F74653E0D0A09090D0A09093C646967672D7375626D69742D6E756D6265722D636F6D6D656E743E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D6E756D6265722D636F6D6D656E74222F3E0D0A09093C2F646967672D7375626D69742D6E756D6265722D636F6D6D656E743E0D0A09090D0A09093C646967672D7375626D69742D63617465676F72793E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D63617465676F7279222F3E0D0A09093C2F646967672D7375626D69742D63617465676F72793E0D0A09093C646967672D7375626D69742D747970653E0D0A0909093C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D74797065222F3E0D0A09093C2F646967672D7375626D69742D747970653E0D0A09093C646967672D7375626D69742D726573706F6E7365733E0D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22646967672D7375626D69742D726573706F6E7365732F726573706F6E7365222F3E0D0A09093C2F646967672D7375626D69742D726573706F6E7365733E0D0A093C2F646967672D7375626D69743E0D0A3C2F78736C3A74656D706C6174653E0D0A0D0A0D0A093C78736C3A74656D706C617465206D617463683D22656E747279223E0D0A09093C656E7472793E0D0A0909093C7469746C653E0D0A090909093C78736C3A76616C75652D6F662073656C6563743D227469746C65222F3E0D0A0909093C2F7469746C653E0D0A0909093C69643E0D0A090909093C78736C3A76616C75652D6F662073656C6563743D226964222F3E0D0A0909093C2F69643E0D0A0909093C747970652D69643E0D0A090909093C78736C3A76616C75652D6F662073656C6563743D22747970652D6964222F3E0D0A0909093C2F747970652D69643E0D0A09093C2F656E7472793E0D0A093C2F78736C3A74656D706C6174653E0D0A0D0A093C78736C3A74656D706C617465206D617463683D22726573706F6E7365223E0D0A0920093C726573706F6E73653E0D0A092009093C726573706F6E73652D76616C75653E0D0A090909093C78736C3A76616C75652D6F662073656C6563743D22726573706F6E73652D76616C7565222F3E0D0A0909093C2F726573706F6E73652D76616C75653E0D0A0909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22656E747279222F3E0D0A09093C2F726573706F6E73653E0D0A093C2F78736C3A74656D706C6174653E0D0A0D0A3C2F78736C3A7374796C6573686565743E),
	(2, 'csv contributions', 'Export contributions in CSV format', 'csv', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A093C78736C3A6F7574707574206D6574686F643D2274657874222F3E0D0A093C78736C3A74656D706C617465206D617463683D222F64696767223E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22646967672D656E74726965732F656E747279222F3E0D0A09093C78736C3A746578743E3B22646174652070726F706F736974696F6E223B2273636F7265223B226E6F6D62726520646520766F7465223B226E6F6D62726520646520636F6D6D656E7461697265223B22547970652064652070726F706F736974696F6E223B2263617426233233333B676F726965223C2F78736C3A746578743E0D0A09093C78736C3A746578743E262331303B3C2F78736C3A746578743E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22646967672D7375626D6974732F646967672D7375626D6974222F3E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A093C78736C3A74656D706C617465206D617463683D22646967672D7375626D6974223E0D0A090909093C78736C3A6170706C792D74656D706C617465732073656C6563743D22646967672D7375626D69742D726573706F6E7365732F726573706F6E7365222F3E0D0A090909093C78736C3A746578743E3B223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D646174652D726573706F6E7365222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D73636F7265222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D6E756D6265722D766F7465222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D6E756D6265722D636F6D6D656E74222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D74797065222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D63617465676F7279222F3E3C78736C3A746578743E223C2F78736C3A746578743E203C78736C3A746578743E262331303B3C2F78736C3A746578743E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A090D0A093C78736C3A74656D706C617465206D617463683D22656E747279223E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D227469746C65222F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A696620746573743D22706F736974696F6E2829213D6C6173742829223E0D0A0909093C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09093C2F78736C3A69663E0D0A093C2F78736C3A74656D706C6174653E0D0A090D0A090D0A090D0A093C78736C3A74656D706C617465206D617463683D22726573706F6E7365223E0D0A09203C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A76616C75652D6F662073656C6563743D22726573706F6E73652D76616C7565222F3E0D0A09093C78736C3A746578743E223C2F78736C3A746578743E0D0A09093C78736C3A696620746573743D22706F736974696F6E2829213D6C6173742829223E0D0A0909093C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09093C2F78736C3A69663E0D0A093C2F78736C3A74656D706C6174653E0D0A3C2F78736C3A7374796C6573686565743E),
	(3, 'csv comments', 'Export comments in CSV format', 'csv', _binary 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D38223F3E0D0A3C78736C3A7374796C6573686565742076657273696F6E3D22312E302220786D6C6E733A78736C3D22687474703A2F2F7777772E77332E6F72672F313939392F58534C2F5472616E73666F726D223E0D0A093C78736C3A6F7574707574206D6574686F643D2274657874222F3E0D0A093C78736C3A74656D706C617465206D617463683D222F64696767223E0D0A09093C78736C3A746578743E22636F6D6D656E7461697265223B226461746520647520636F6D6D656E7461697265223B227479706520646520636F6D6D656E7461697265223B227469747265206465206C612070726F706F736974696F6E223B22646174652070726F706F736974696F6E223B2273636F7265223B226E6F6D62726520646520766F7465223B6E6F6D62726520646520636F6D6D656E7461697265223B22747970652064652070726F706F736974696F6E223B222263617426233233333B676F726965223C2F78736C3A746578743E0D0A09093C78736C3A746578743E262331303B3C2F78736C3A746578743E0D0A09093C78736C3A6170706C792D74656D706C617465732073656C6563743D22646967672D7375626D6974732F646967672D7375626D6974222F3E0D0A093C2F78736C3A74656D706C6174653E0D0A093C78736C3A74656D706C617465206D617463683D222F646967672F646967672D7375626D6974732F646967672D7375626D6974223E0D0A090D0A093C78736C3A666F722D656163682073656C6563743D22646967672D7375626D69742D636F6D6D656E74732F646967672D7375626D69742D636F6D6D656E74223E0D0A090D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D636F6D6D656E742D76616C7565222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D636F6D6D656E742D64617465222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E22636F6D6D656E74616972652064652070726F706F736974696F6E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909090D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F646967672D7375626D69742D7469746C65222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F646967672D7375626D69742D646174652D726573706F6E7365222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F646967672D7375626D69742D73636F7265222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F646967672D7375626D69742D6E756D6265722D766F7465222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F646967672D7375626D69742D6E756D6265722D636F6D6D656E74222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F646967672D7375626D69742D74797065222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F646967672D7375626D69742D63617465676F7279222F3E3C78736C3A746578743E223C2F78736C3A746578743E203C78736C3A746578743E262331303B3C2F78736C3A746578743E0D0A090909093C78736C3A666F722D656163682073656C6563743D22646967672D7375626D69742D636F6D6D656E74732F646967672D7375626D69742D636F6D6D656E74223E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D636F6D6D656E742D76616C7565222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D22646967672D7375626D69742D636F6D6D656E742D64617465222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E22636F6D6D656E746169726520646520636F6D6D656E7461697265223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F2E2E2F2E2E2F646967672D7375626D69742D7469746C65222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F2E2E2F2E2E2F646967672D7375626D69742D646174652D726573706F6E7365222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F2E2E2F2E2E2F646967672D7375626D69742D73636F7265222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F2E2E2F2E2E2F646967672D7375626D69742D6E756D6265722D766F7465222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F2E2E2F2E2E2F646967672D7375626D69742D6E756D6265722D636F6D6D656E74222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F2E2E2F2E2E2F646967672D7375626D69742D74797065222F3E3C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A746578743E3B3C2F78736C3A746578743E0D0A09090909093C78736C3A746578743E223C2F78736C3A746578743E3C78736C3A76616C75652D6F662073656C6563743D222E2E2F2E2E2F2E2E2F2E2E2F646967672D7375626D69742D63617465676F7279222F3E3C78736C3A746578743E223C2F78736C3A746578743E203C78736C3A746578743E262331303B3C2F78736C3A746578743E0D0A090909093C2F78736C3A666F722D65616368203E0D0A093C2F78736C3A666F722D656163683E0D0A093C2F78736C3A74656D706C6174653E0D0A3C2F78736C3A7374796C6573686565743E);
/*!40000 ALTER TABLE `suggest_export_format` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_image
CREATE TABLE IF NOT EXISTS `suggest_image` (
  `id_resource_image` int(11) NOT NULL,
  `image_content` mediumblob,
  `image_mime_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_resource_image`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_image: 2 rows
/*!40000 ALTER TABLE `suggest_image` DISABLE KEYS */;
INSERT INTO `suggest_image` (`id_resource_image`, `image_content`, `image_mime_type`) VALUES
	(1, _binary 0x89504E470D0A1A0A0000000D49484452000000300000003008060000005702F9870000000774494D4507DA09010F2027F10F4609000000097048597300001E7800001E7801CBAB031F0000000467414D410000B18F0BFC6105000008E74944415478DAD5DA2793555D1606E0DDCD0850240782580850A4C2A0883F80ACC9081CD9CC18E20FF8480A41E60F901486EC10643C518100EEEC670DAB6B733BD0CC0743CFAE3A75CE3D3BBD6BBD2BED53B7949F6C6FDEBCE9FCEC9C11D3EEDEBDDBE9EDEDEDAC5DBBF6FF4388E7CF9F07D86BD7AE05E04B972E8500AE2D5BB68C7C219E3D7BD69938716267C58A159DBD7BF7768E1C3912C2106AD4A8519D93274F8E6C213000FCBB77EF4200C0BF7EFDDAD15288646744360CB4A03970DBB66EDD1A425CB87061640A71FFFEFDB075EDCB972F7D42D0FADBB76FE3DDE1C387C327DC7F170E7BC1E2DEDDF78FA12656A72DD57C4AC55D7A7A7A4A65A28C1B37AECC9B37AF5CBE7C399E77EFDE5D66CC9851B66DDB5698D9EAD5AB634E367DE68F1F3F3ED6F0ACE573DECDC979EFDFBF8FFBF5EBD729B12C5AB448F86611FD30F60C25C082050B3050366DDA541E3E7C181B016F53EDD4A953FCA42C5DBA3400AE5BB72EEE7BF6EC2963C78E2D2F5EBC888BA01A8039B76AB34F1073F239C76AD3A64D8B7795F110A6EED5336C01EEDDBBD759B9726579FCF871A926429858ECD0A1438596537BB472E3C68D00377FFEFCF2E0C183D86CD9B26565F3E6CD01A8D5760AD2B61C3358ABCC061375DD7E83460D36A92EF8CF4F9F3E959D3B77963367CE94D9B36787666BE88CFE3973E68449D5301BAC4C9E3C39369934695230F2E8D1A398F7F2E5CBF2F1E3C75042021D33664C193D7A74DFBDDBB4B4F6F7BE7DFBCAE2C58BCBAD5BB7FE352C06449F59B36695B367CF961A856201B69EF49E3E7D3AE805B4B5678D1058983E7D7A9806765A30396FC284097DEFDD09D8FA44B60F1F3E841F1D3F7E1C96E19910676406B574081B66837CA105D23A1DB00924354810FD84B6466BFB7E1384C961AFBBE53A2EEBD45C1458AA20FDF0F68B4242D5CC9933CBC58B17632182AC59B3A61FC5B48B19FE9002B4D403E7391D99B9D1F2F2E5CBE3D93BEC58DF589735938D5C2BD91C08FC80021C3D7A34262C59B224EC97C672E1D619B10204E7A6A5363AB55AB4960B100ECF878C65462E264259C2B27D38BEF1399F90C6D7A0527ED8940E6A1F9955F6AD1AEE8846D9DA8CACC490D0241817BF5172B4CDF8EECBB813274E746A40E854E07161DD5595D759B870616478E38C8767D8359789D57C6222E07E0F0408007D9E656A9B57278B314AEE1C3754B3BEE210C0AC6E9F3E7D1ACA215C35B528632A0BC3ABB748ACAEA111CD0226269056FB35C6C766CA07C2B80374F5EAD598638CF5066BAD70840738054966AD57FDAB536DBF8FA521051079AAED8519300920B3FE699B33416A5DA6A6F914082BC0138800400CC644B2947B582F19A1F5EA1FB13673B61E36F4770B125E07B4C823D6EFDAB5AB6CDFBE3DA2C2C68D1BBF8BCF6A1451A46A3AB22327D6E71D07E56C9C52E814E7E7CE9D1BF30402EBE9536274D741ADD30BBD1CFDC08103F1CE5E42AE9265FFFEFD3106C6EF720227613EB447423466B5D9B6B47D14A39BC361AD0A1E775457A0C1528D26A1E1D49A3EEB63AADB8CF2B7FD3E7FFE1CE3AA02C28C9910BFCA664F0CDDB973A7D3C780CD85C34A5784519263A38DFBB4B861C386F2D75F7F45D84B6DD08EF1E64B36D8A0AD4A7BC478A1318B357721D25A59A5766764A15BF6D72FC708D1EA2FEC576544B8B5BE75BCEFA54DA69080C5770B74B72B57AE942953A60460A5F3F9F3E7CBD4A953633117136222590ADB58396E23F7364333CB1C4F98EC035ED6F51B78F30E1E3C18B980407249E28439B238E7453BFA38DEFAF5EBE339CD27A9E6A89CDBFB74C0D7AF5F8743A3D485C9AAE5882A4C80F3717466E49919B9531A33B39F35ADC5CC980B1331CE3CFDC65A9B137B6F5DBF992D417A6904FDB4C2816835EB906C34817EDA7FF5EA558CA369F42BB2988EF2995668155BC6332166A1DFDD3AD6F0DE9D29DAEF5B0E8A3B07C530CD630723B2336D57E5C618F3AAA9FF07601E0733796542CA46E3E9B8344253B4C7193DB72C59878698736A0A73B5960A8D62C6B3F962BC35CCCD7934CC71855058924D179C18F6BE35EDDE74AC74226CE4B396619186F3E04283B4AF3EF19B63B169F679FBF6EDD02686B0C86EB19CCFE6D568167E665F6B0A1CDE19A73E72B2B3860A583B76EC583080C98AEFBBA2AED7044EF82D1A056DE958598D7A9F6763C748429B9377315EBF67CE26529D3B772E36F53E8B42264608F354B8FA988568626DEB501413718701F855AB5651564F4D72FD2AD25E9B009561CE22376FDE0C30164850B443ABECD8980C91FAD933E6FCCE2804A024249CE6F9186082D036C03B76EC08FB36D73AE610302B5BCC388FD73D073F6FE6D73749AA4DED921BBB1765D89DBB082152885CFAA4F9AC56DB9AA9FBD918B6CD8ECDD3D83B7FE047F6CEF1EA29518BFFD8E787459C6601665FBD3FB26002E06C551B7D758E3104B07116730335A032ABB7026546D597F514C0E9CC29987D7EFADB2BB0A4A6E5ACC535293BE3342132BE1BA36F300168DDF9E2C993277D792585C96FACF208F0D99718FEEBAFDF401100D54C6820B3A0A1AC3493ADF602CA7BACBA1BAF584CD3C14286ED54140130815D0AFA61E9FCA3969F0B69BC8DF56D01962C741764DE019D6530C0724B0D9701348BBB5CCB3B82AA06EC8985BF053E1B0D63C309AD469C3E4DA5204A801AAF3B3582F581CFA3618D1CC160264026A1B5A543AB941A4603BC64F74BC0B78DC6D0EA7CDC1D6D980690002630DA578E8B3AE6666D93E697A7B5F413ECE4698C19FD7201920DA08049365A61D02E32715AC001A24D0C613083013630C3D6F3526A00FF4B6C7F386C00E4EBC14007779ACD1A08B83A25349C9187F0D90F343F6943F86F05DFB2416B34DC7E7249FF1016F5976F059DF79908B3F4269CFCC29C1468DEFD36F3198A0D42D06082CF78EF52AF6776E7A42212E0DEF9CD9CB08309C2FC4FC1B76CE4D78281CA88CCBAFA95C419FF3DE7012673CE1F11201B60EA96EEF341D6416C3DEB1E91486EC044E32B7FBE31092155386D139BDFFC224D8DD910249D193B7F1A7B5FA36DA1B3FDA297055F7E92CC4F87E55B6138E2FEBA40BBED57B42C1B980D53CA50CBF639F39FC63B6093A1D9BCE4871526E4023ECF051946FF34D6211B53C90A336DDE053C617EC51E3D7F7F89A11B2D3BF43BBC6B8E8B0EEB55A05FB2F7BF01438C61D358731E3A0000000049454E44AE426082, 'image/png'),
	(2, _binary 0x89504E470D0A1A0A0000000D4948445200000064000000590806000000C80681270000000774494D4507DA09010F1F1EF6D4E43D000000097048597300001E7800001E7801CBAB031F0000000467414D410000B18F0BFC610500002D034944415478DAED7D07801D55BDF7EFCCCCADBBD9DD94DD4D4F201512482080A1138A41210129AB204544047D3EE1133FC54F9F3C7DBEC2B3E17B7E4F1015FD78882614093518127A02A4106A2009A492B6EDEEDE3EE5BCFF293377EEDDBB1511F1F34076EFCECC9D7BE65F7FFF72CE65F8DB18F2B00FDCBDC8F53A222E2F3472D42EF03C736637CF1E376EDCD5D9A1DED3FAA01FEAC334DA0FDCB338CAF885CCCEB108CFC32BB6B558CC8E18AC08B076B8460C23238D5FA04B7F38D4CFF81B43AA0CDEBE64229CDC6CC7C9C231622703852F33E461B8DBE2E0060C6E82710E060E78260C1615AFE0191C8562CE782F9FFD3786E891DB73DF299C672E05CFA190DD3FC334DCE399E721CA0B104C603C022648CD99F89F8627FF71E6D2396210FD6582AE7D4FECF8FF90217CDF925AC74B1F53F4BAEA1DA3E6CC388F7C14BCD060F2DDB58CBB1693D436A4E4C327BCE18A77C263C4003A4FEC91FF49B5605CDF98348518174364EA8E1D4B121327B6E486323FF641136828E3C107578D769C7CFDB9E77EECCDFEAE6DDFBAA4DEAC71AE3079719A81A290F4C5060AE30D32418C3B4ABA85E833D683189CF312A1E87CE5DF6A0826999A940E8A561D78AC6E4AA2E182B787F26C1F2A863CBCECE913E0B21B3CB013484EA3449F0E0F851F2E3EEF941F89F3F9FD774DF7EC7423EC1C2C6BF81718B34F033251307B04BDD68F4B84F7840F88122D2364678A50E6274C643506C4103AC64967846231EEA168929B895BC4902BFF7A19F2C8FD8FCF32596294E3F0DBC8344CE3C2A63365AC396CCE58D78FE61FBDEBA5643477ABE118490336990FAE1E8F99D207A8A7A563CCA1F73881A961DC82760A436688C7A47B979F69D3E7E5ECE29486495F191243FEA27DC89225AF466BA2E95B5D9B5F4414888129FB6E188238CAA90A8CE3A2E6FA03FBA27F3C786C6BD27446CAA7E2862DD925896FB012F1A534FB8FADCC14EB452C2B19C4AA5EC8E0BB13F1C3E4369291F8F0A13EF37BC404EFDF78F8273F8945CD7DBF243FFB995CB71D0399184E0415E6C1E542A889D8E4649924460CE98E11673077383C2B43CCC89159120C50EE5748AE3027F44EFA47BF39A4033684E3E6EF71A20275899B30F59AD167706FE48F877ABB0F5C43787AC9E862A173248AE47011B9810877749147B6BEF8C2E8DD068F5D9273F2C814F2480EAB510CE0BEA9F2E44FEE11B109056572440AD2044370425EC395F44B826B54A45EAA57D2FCB87DCF4D9B28C6FAB0EC4C3097A9FB49601083C53A6B3F540CC9EE5E7AA2C5D20BB8976B2CA63B2FA29077A40093DCE8A6E78A62CB96F864DB4D124513B08B59A45269348D6A94522F892BA5D10C28222434128913652CFACBD2C4F64A342B23282BFBD51B23FA644278301EDC8A2B1C0CE1C3863ADE578610E61F9D47B6264E0153C1A8B9CEB5ED134D924A9377CE363DDB9444B32998529496F25A2858D87FA02EE6F20602540C6D6DDD48779106A48B48D69A2A3A16D22F85929143352401EDA20B8F6C99C984C3F7CA083A20491F10537CFBC6AA9C67FABC47CF61CD4CEFBEF7AADA71E7DDF68133A475E71DE3EBACECC59E57300A5EF7D799576870C96847BC56FA30574D5C1051A224A6D8206DAF30470C5DED05A433A4F8359E34511DEDDDC8654D6CDBBE1B53A78D4334662A059016C294714457BA0BC31A200336F0FE9D02AFB8A63746F5C7480E1E52345FF384BF721316EF6C1E0AFD86CC10DE7D4F53B67357D44434E119755F3158E10893E7688A5D334DEED59B4C103A054926577C0CE17E41743ACEA5C775F563B8DA590B6937D1912A90D29888D7405E6FB2388A851C325960DBB6FDA8ABAF414343BD7CAF6D3B38B07F17EA86D7297208CD10A8EA7D42F3253EF2D2AF1E1F250E8A39781403E17BEF1B4378FBD2CBED5C17512207CF881E9AEF4E5D6299911A91BF616C9F9C2D637A861ED9731691791E3065E3851356446312E148EC4FBF4977888E2240CB117A2A20EFE648E28BA819AE2CDAE8E63A1C389022A70DF2FB1C3B76B4925973E483C71326664C9B80088985CBF34AA209EECAA0EF4F35FAE12D2FFFA1DE40F320303E9D6FFFAFE16CD2173BDE134338BF35D2FD6E6D7D94398D5E847DC540611A735D38F9CE6348FA12420A23C84AD4A2ADB94C1D301D1C49C618453D352699544AF968B4A34D80D2144739687A2DC20533524057572B9AF80498461C4D4D3538784A0339FA6E74B675C093EEC6C0F01135983663026A1231384E076AEBBBE9FD79990454484A7F461513D6B72FE17A7AA54030F82D9F96555E5EF1B7B882E8E1F1B119D39A444706CF10BE7B593263B65F6CA2DD28EE291C1A47F45A90B49A04374DE9AB843D8F4833A36CBD8C4BE53F8DF62A266684F4BB8441AA0D4F3CA4918788334488D7D090C198A66EB4EFEFC0C871C3E9362E264D6C46D41C89036D9D92388269CDA3EB25033D4234C3A21EA64DE92032D8D2FC297A0EC491976C4EAFC88A97AEF1995119B5571B028A3332E5F4F2B24131A47BCFADCB8BDECEC3A29E39063278A278C0DC4FBE36AAF82593348A116AFEDA19CBF40564A0058E50B4EB4F96057F871FAAEC41E4BD2C757F97CC1C7D764D2282C9530F60F5EA7760241AD04080D82B924FA9EDC6D864923E8704430678742F871CBC9741B27E076AA319BA07391E33432762217AF674E02567DD0BFD4302C439300870163CB2F095645DE60DF29DB022287C34C2C9C47875E454E314BDD6108945CA99225E96D7B63E229450A220C520511310B3F4AA4A55B594832F8165F92011777B866488B668A8AF198BC6112F63C621065E7D2909273B59222ED7B3A0C241877C501CAE63A32BB51D89E82B38647A03DD224932226A13310914940657CCADD2DA94D97E5E15A0953D0BAB82E2AA9847F52C2E21CB0C1913A2146303CE07585C4A930DC7B2E19959580E572649FAE3B8F614D0893968071D9E4F6F58BDCAE8616F55D54D2077CE043820ED6423D0583B1685B1AD700B6FE1B50D45EC6D27C647EA912408C1698EF0A284BCF6A1B1A90D0B3F6A93898B4800A0B458C3EA12C54BCCE0A8987D1FDCAA2250A8F029923F4C31324C0771BDABAE39A4E3EDBB0FA3DF2F0F98219089B6082CAF480E3329F33D522A58250559F0B36F0DEEEDACA1B584C335B489977F1B10651D5904E2493A91C7B0616330D1B2108BED42D3E87D78E7ED2476EF26D426CD5A04B5B50E0E9A9AC59CD90D68AE6B2C094C20F15524B93F19D5D25F2DA0ECD35FF8052DFD01C20A73992F13E8916358B2E382413184198470DCF73F0BEF5A3999CC639E8A47FCE8BC5AF025AC58223902E3A33134D4B6A3B93E0B7B162128A31326A18CDADA5AC4A375A84D0EEB41ECFE9C6D3506F8D22F32C822D8ECFD3D6146F807787980C883C33A753BB8340ACBEFBB9347EC7688028EC823319D41ED6D0C34CAAD1C8ED004CF52815B1014B2AA0C71649D3AAA1289145F40169754CC2224D23074066BA096B99AED0FCDBFFC99184AA58E6AFE425B455D43F1BD86FF2C4CA7E245565A54248B4632E5C56AE624475CB27D205335482A9E67254F81DE749B4B091A7AAE5A3123A798A1531F3DEFA74E98B2A940F8155BCC50222BF14F026DE64B731FC4D7840E17917A1CD3C3753DBCB9753FEE5FFE0A76EF4D49420AB2FFFD37EFC6176F58A280A0C14B52AF6FC77D0E49CFE58560B3AE4ACAE4A630C7857A2FDB39E0FA88E5797C1B67C647CA68F23E5830463E0AA688B023553FC0972EC07790BE19E8BF66E11339EC78AB0D713E9BB3F1C8CAD7F1D08AD7B0F6E51DD8B4651F0596CA7CDEFCDDF3F0E5CF9D4C8CE9C24F6F7F4A1EFBD94D2D15F3F5D1818637AC14E896CE8B2B44A81091B111331BCEA3432F0D88211673EE7339FBA4256CBBF44F9E2242C583F4420ADD16E34AB4218FC848B554F7E2BE3A083B83BE531A557345FD0DC6AA067522135C8636E9F4BE03691C71C64DD8BBBFABECDAF1631A3079C2089C7BE661F23A9123136374531D9E7DF11DE40A364E3D613A696708D230AF54FA2D83BD3C080B44518C9143344C7E219DF8F68018E21809DBF4848D7695A2B152674BCF67AF02E499F65E9C950A3FE11B04CEAF9CC06552FD5E46153B5F8D9BE2F09AF5EF4866C46311CC9E39066B37EE904CB8F75757050EFE407B1A4FACDE2CDF23AE3DE19C9B317FDE64C99020E0655C66180C5DBB65617B167C9E26A4AC4C6623037D1C239D2A6CA4B7AD154939758341D82BE667B3FC6E3E6D5359F8362C544CFAD38C6ABEA0074FAA48D5C2058760C38AAFA363D3BFE15A324D628C23EDF09951283A38F898EFE08AEB7E1BBCA7B62686CB5BE643B1C02F7C1981A55211820FA94282171040BCCF1D956DBB6FC28018D23CFD335BB37664946C02D3077D07DEBFF48AD842C5179C6CA527909AE873E532FD154A677928C7A615D18CFE533D20437FCD05D5A695EACA9688A1AFE165790F8658D4C29C43C64A0D110E5C0C6196FCFBE7F30EF2649E0413C4105AB473DD7770F525C7AAEE9570B1D1EF64D1D549E5F14AA69A859CB101A79E15B3570E8821E287651ACF790A4E205CFAEC7FF83374687E9ECEE5AAE49E1178688EF2EC03D3FEA4E24E6C602EA3EC73F5CBC79EDA8451B3FF0F7EB3F4C58A795532B4648F7D3F22FC8774CF44D8BA6131746FF901EEBB5DD16EE69466D40F4B04B72ADDC5071C7EC61BF0632B25505C1796D5BB4C1928DA890133A44BE4E36069733F189B5E9A4EE0CC2B216D1578CB50A931FABA6AB9A74ACB248F7965EF5DF1D49B12296DDBD956063DFD3B2A6DF7D18FFADC5DEF76CADF93C89987D329428B76ED51DAE36B4A892CBEF6FAD1876FA60CC51AEEE9CF0AA768D45CB8536CE6BB6F4D0E8821DDD9E8AB9E17D1318215980D560DD3573042FDA99C7A7FA906CE4B7636308961E92DFBEDFB822A099C0AA1696DCFC8DF22A6F85F37DEABFFAECCBA7908EC221D6F25E71DDCB197745C437DA2440B6D8278B8094BB619A9B60616961E06CD2411008BB62082BF8677B9EDE1B0013164E79ED6E78B4ED4F3BC7282F436741AAA57C2F7E670991186593CA045E9FAF26E911271CA3F87EB5EA8F6CE2C7E74EB2AAC59B74D1EFFDECDCB71F36D4F107ADAAE1EAD221FC7423F4BC7140209FC171DDBB6B35D31A42EE17FA062B0E4A551BAA3F0991577E7F0CB70ACC4245D88B3A3B5170E88210BCFFAF2CACE9467735FF5AAB340CF8DF76FEC7B43403A5F147E00FF797D227B088389707A42116CE3EBEF62E5339B03067CF5BB7F90C19D4FC0AF5E732A4E3F717AF0FE72EDE281E9093F5B380C0D3A28688C1A515B7AFAE087F6133ED8D51D9441441D646942A84BFA51511F713FD91F438212AEC7638F31E62C8288498C7EAA68D51810D6960ACD69EBC8E00F8FBE42D1F1AB140B6C9784BBE6B2E3097A9E52C670D5AFAB1B9FCB4C98274BB75FFDEE7D5203664E6DC6EB4F7D433AE4B9B3C64989EEECCA61E92F3E83D38E9F19109FF392F4973E47D97E71BD18EB2816F9C96DABE81E1DD8F0C7AFC92B52744ECCF1AC336685E442CF4804C1416FB15F92F0A4EB46C8B095349D959ECFEBEE97940143F285C21A9AE8A26AD2DD2382EEE5826AA5CD4CAE8869C7FD5340003104C2B9EEDBF7D2432709E31F13BA8F361D08592A3AB0F74017CEB9EC173290B32C035713333D92BAEBAF5980AF5CBD00C72DFA31317A1B39E891413D3C98ABCC877BC1A1B6CE347E71E78BA455FBE569A161624CA6F7FAF4BBFE0BA7D1BF5331AEB93E241C3AB35B950486D602AE9ABC7DE0112C53F0AFEA7FC948C0903DFBF76E9C30763C2C96D147FCE0B23A0C1E68A4FD269913C18C51236AF0B94F1F2B51CCF2273649BB2F6CFD65171E2DAFDBBABD1537FD7485BCF6BAAB4EC171471D248FAFDBB8138B2EBF9562041BB7DFFC695C70D65CD410FA51C64D33F88082B096190A40FDCE0A5ED2BA9B7FF124BEF12F0FC858C31F42CB4E3F693AAEBDEAE4C0228C1F3D5C13BF643E4BE88DEB36D6528A88FBA6B04C18F46FC675B5847EBBB1C6FCEE5BAE8B8FBBE6E67E19128B35A2B3DB45A23E00223A173484D4860633A2EF369D29C843B328C8FAD76F2C92392F619B0543A64C56C5A5C79EDC84B32FBB3548F23DBAEA0D6C7EF61FD0DC380C9FF8EC6D1211DDF6838B509B8CC973E79F3D17E12504FEFBC65090E7FBC172C7AB64FCA6FFBB421E3AFDC41914B5CFC4A2330EC38C29CD8066AE986F38FD1EF0B54C307D06FB598A9287657E8F6F086D950CAFB01E2CC64C6F725FA4B34A2FE26BDA3B8BF9E6062B4E9165292908A07A152D94BCF319108A3DD4DC4B505044C76274A6F2B8F58E6703C208CDB8E0AA5F49629F4D36FB89E7B6501CD0895F2F791E679F3E5BBE16E38AEBEE0CE6F087DBAFC2E285B3837BFBD7C4A2FE5A10B7BCE0251C10FDBDFA81EBD138B21635C948E839A0FC816F6A7C781C2024CD4E1912F8016D45D0AB99D0C35A84B2068A1EA22E1E3BAFD0BEF457B1111756AD220621F347CEB8BC2D95F156167854F53E49F4E0A2F70EF12A1F5EE67E989C880F21C5F8E55D6B309DFCC9AB9BF6E09A4B8FC7AC19A3F1BFC9868B006CDB0BFF88FFF71F9748A688912F3818D35C27D31795E389E736431B81601A53278FF2C9AFFA3282D2AA6ECAA05793C60F27664483E9F2B257E118A2E49079C01C05A399C848F8A9A020DB1F86EDE1FBE9DA881FC7497C529850C8B735F442D4F2F521F9A2F9AE2D1ACDC237EEB518D433A3ABA4AD3C88CC697BBD9C4CCDE7AEBF4B066DE79C7918BEFFED73B1637787445FA71C3B15F5750929A93ED4143E67E4F01ABCF2F80D7076FE082BEFB916271C33459E9B43C8CA7FE8CEEEBCD4BE6F5EB750135F046215998040467C88EA4B3F74F5B23CAA96404068BFE1C93627EEB740F90641FB93007854BCBDD7508EAE132DB61662A7F4C690B2CEC58ECEFC3DB95CEDE786C58576322D1F221032CBD21D65DD16553BC47DE9740951A58233428ABF79DD99B8F49347C93515A24A278648F071DD7C77F783AA8EF39123274BB87CC33F2FC3832B5E0B724F47CD99884BCE3F4A491E6C62640CB9777E88B033E541CD3E94F00BEC79D8F6971CB5EA0BD6E703FF144EE79432B93D7ACBBC52E3B82A4CA16A2C266E6B90B09886F125FAF3BBD51852A621F523C7AC4F75BA5991D752EBE60C954AA9122DABC272CF5BF9893A153095AE1130F2ADE7BE2561AE1F63F844168E7ADF816E7CFBDF1F9441DE29C74EC3BCC327602931E717BF5D2DAF134CFBF1773E81A7FF70AD44537EBA4238621E6871904D0C09072F33280A5773993560BE69627EA45E1EFFF092EF0ECAB641E996294DE2BC48FCC8C165791262470AAF6AD4E33DFF895E01C13CB7D09B82946BC8C285E7EF7F71D5AF1DDE14272EE6747D43AE0DAB08124B98DC4FDEA9EB985EE5E44BAB41C4ECD6DAD118923275DEF70F820963E67E4BBE1601D9CF6EFA947C7D35F999A349236A6BE214270C4734A2606D5833FD2C312B4341A5A859059C28A19F32B92A2F9C85E5CE4FA5F8875C124C47FE1D211F6B40FD57C42B141BA5BB3C24688E1326D4A3715444367C571BB26943349B9B4E636ADF924BEB9B5BEEE8932162A433C66A9BC7175A3C2B031BEEAB720F13555925AB28D2E857F9822A872662160227A78B3CA79D3003672E38446A881822EABEE5A616CC98DA18E4CA8E3C6C7C69C52DF7429170255D2B9324D03DC815C42F2BB7FA87C26913C8A0B3E8B9B06D0BFBF7A59113CBE55C62AC15C513AB56A3B3BD1D53A74EC6D1F3A661D6E187C2756258BFF60DBCFDCE0134364DA1CFCEC87A7AF5211E2C4F7AD47D1CFDD13F433AD3DEF3A9A2B53066B9B2B6210A57A668E36495268A497BC9CB8A321ADD84426DFF2DB5355165E53C43E67564B2814CCFC3FF7D8D0C1487D727C96F4C2C11D7976AAE6C73D0DC2D05C43703FA58300B3FD7E4E3278670AB91D223BF49DC376F1E1CEEC8E385BC89DD3B3BB06F6F3B0E90FF6A6FCBA2A9A919ADADBB70C4BCC330A1C9C5E7AF3C530AA749E6C9105684B5C2324CCC3F7E9444A6CC73E85308981855CC9214A82831A38888971F5B8D5D3D1892F3B27F68EB8E7CA3A9864564C2CF778EAA19A95CB20CA3C204F88ED108824A3F46686EACD350DAAF1594DEB870C10C1DF596129781D3954A15E0CB908DF7ED7229380BCC98AF059E2167C4FCD6231D63BB5A0BC4DF3BB61771F71F9EC3536B5E431759D7E611319C7FEEB13862EE748C1C19437DBD28B84D92AC945BCCB09C8AC1C46BD9DAE4050B8E98C995B9E22E2AA43760BE4AA7904078E6A2DC9E7B4E4D8C397F659F0CB9F8E22F6E787AE52FB7B8A3A3874464A52B2A53C73EA1C33586A05D27E44495DBD10DD474E964C2FE22C09B3FEF201D60793A67E54F5AD50D2A1BE602C6B3500C10EC2B52AAA330FFEF907FF0DF2AA328B93789219FA14026E8955777E1D5370E60F7EE14F6EEDB839A6812A3C734E2EFAE3E0DC79F381D31CB9444B19053A68799E433C849BB71A2A598BB23974DA8A7B5544D8479A5343E58595B4258803DB9A4232F172C994681396C5F8FD269D51554F9ACF364D1330FB1444F911F8596F2CA25865402AFE07C49CC7FFE834FE9434660854A1AA0B4CA8F88C34703B31ED29AD027973B62FFEF90A397E2431FF6C2FADDD8B9338703AD29AC7C6603F6EDE9C0BC23C8779D793866CF9E8F1114EFC8B58A2820621455939E4B0C603592A58EEC30F1C8A76460A76D32ADB552CF8CD05458857FEA353F1E765B746F8FD57F8C5EAEE8972185FC707465DBE532000B7E9F96B8D42E9362A0ACAB35940473746AC5473CF40852AA4BD0B894A82BB9FA60CE3E482AC30DE58EB7D2118B91A339DAC538366FEFC0AAA75FC1C30FAEC6CBAF6C43C3F03A1C7FFC2C5C7AF1A938E2C8D118D1602219B12826109F5F903D54CA23455496820242018872198F623382B43227D74D66B746F93EEE1B54AF6C6AFD0DA53DAA2C207AB6080D7C8E0E5FDF2F4372365BD69136AF19552B54D2F6DD873619A16E0BA6DCA982736EE007FC58A48C79CCAF11943AC57DCD28436F2102FBB5A2B2AA5CE0C78499B3E9E730E40A265E797D0F1E58FE3C56AFD98C2D9BF712FC6CC0825366E38B9FFF18E61F3B85249B909EBF089815E99EF48F27940F20017249585A3B393A3A6C6CDBB697FC4906ADFB0E60C1494761D2A4119830BE410AA44C9B04DA59E9D7FA61080F7EC8D0C0841DCBEF5E36333E6EF1A63E1952B3BF6665E7E8F6366FB435523A289DDF519B7595F08C9264DDAFC4FD4C691018A03C51571D822A4B134E6496AE099B4057FA24B10E2421B15DAADBC11B9BDAB07CE59358F9F8ABD8B2E58024DAC73F3E0FFFF4AD16CC99351EC9B823531F4CFB3395D3125A1E17053938141CB6B565B069D30EB4B77BE4573A08B6C63067EE5834378D45327128993126D72E2AF4E68B63B8DB64C00AA287A0A35ACE6D712FC6595E44ED5F427FF77AE4FE9FAF38719E715A92A5A59A31B930D30D829B52620E41BECBCF63A972AC577276A21146479106AB2CD1FA55E81293B961A8E0D2D3AB7889113621998E540E2FAEDD898796BF84C7566D44A690C661D327E3B4D3E762E199B331697C02C3A22E81BF98161CAE22636D2A6CD121E5C4B16D7B1B56AE5A8777286E983C612CE61D3D0E53A634C806EFBABA3A88F8D350584CB633F1C0A8EA25D7A1CEF7704F40B54EFE32542A51AB23E9A1C008CDC7A859171DFBD9A3FAD410311CDBDAD49D754E4B88DD13B8A7CD965196C74460A2B46407F9235DCE14BB2A047568F508CAB7B00018053BB38541832BD654913D378419C962DD861DB877D9463CF5DC3A64D3190A1C27E0F3579C80B33E361F93275A88472250ABB1843EC4F47A179BDE4FF7312D64F38CCC501BFEB8E2156C7D6B2FF91960C18223F1F7D71E89B104C7455CC0A4B06982F96605A5DAB99AA459B124AFE7E87B5F14AE4BBDFEDFC2BAD847D81DF79D1219FE8927FA64083DD56B1D5D1C236A140CE4BACD94B1DEAA681A5E86137595F054139F87DBAA049C97DC3665B210D29414B1F1D57DB8EDF627F1E4739BB0876CF9A449CD5874D609B8E0BC1370E8F406D4460B3A136B0832D1472A89162BC25CD32588CB28C6C8E38EBB9EC0B3AB3721957270E1E253F0775F5E8CB1630D0C8B4588E55189AEC4164EB2AF8C9992213C88170637CA17940ECC90D13318AE9DAEE95743F245F7C5B694E54C1ECB2D838221C9D96075912F25A5081ABA15D56FA5519755C0D3B2F47549CCC4D2EB4C3181BD2400CF3DBB11CB1E5A8F175E7C0385828B85A71D479A3013A79F320D75094B2E9306CB2A00211A9945424F683045FDB922C3BB7B3B71FFF20D58BEFC35BCFDE62E4C1E371A179D7F12A1AC8371C8B426E9D04D2915C2B4E54938E2CA8C325B22288F1861171CC4627EDEACFF8A69B56B06DA446ED0DC5DC714CBDE1E2A096E2FE381FB6F7FF7C4A39C3149230D53BA808826AA5B32515CF7F7EAF6C9B2CC6A15068879DAACA0249982AD623E8E65848E1E79743D1E5FF71672DD391C3FEF509C75D6113875C1641C3CB69E9C1F14030C2E1F40A238574126C74DA235E5E2FE473710235FC0FA97DEC1E8A6669C71FAA168693912B366D4910B1719560B960CE804A12312D67A465E2F4D34603B26B6BEBD0FA39B9B108DB8A8A9613A11308412F66086473A6AC40B89719F170B28FBDE5AA35870566472B834998849C90A6C7D40763F82F6029455161CF9E84C324C958505C2C816A2D8BCB90BBFB9E3213CB1F64D22C47E3435D4E39CB3E6E1D38B8FC431474EA548B6A8361A13E90F21C9A259C08BC81E62D78BA2239320B3B60DB7FFEE593CF5CC4B14E2309C7CDC61F8D98F3F8DD34F9E43084BCC47ED2A274D89E552D42E566189257205D284A8445AB95C16A9CE22A12D32730586E4C164A223C52199ACF018F0720BB983451AFE4EA67D32C4F6862D6DEBB42F6D8C65E426C13285C243B8BBAC52C642750315A3885AB670EC2242719C04B6EDCAE0B74B57E0D1156FE2DD3D6D44001BB30E1985EFDF78293EF1F123D03C4A6C3623628242B086CF1511ADAC3198289094AF5BBB0377DFF3029E20DF220A5847CC99806F7EF59358B470269A47C649931DD9816F700D75BD984A9B1B6A729E11C5AE777358BF612BDED8BC0B471C3E1EC7CC9B82992319629658ABAF772AADAADD21875EB55DAA27F1FB678C82BF4D1159B4FA7E9F0CE1266F4BA58AF046C79464F9C4E7A808E61020241EE4AB441635826DEF66F0E8939BF1C023CFE1A58DDB51C81A64526AB1F86CD28696F9387C1AE1FD9A2CC44E42101B0230151F98C2C6BB620F2C0BFBDA6C3CBF7E3396DEFB221E7DEA750C6F4AE0A245F3F199733F86C95315DB2C9D6414F922E5E0C9240A6D323272739B4C8AE3CD7776E2CEDFBF84751B7761C284067CFDABE763D6D44622894887CB1D7C42F9A0C14517431F9E069885B9403F266B58C3B0BD9D5DD974C149D45AD142C5344B130F2A71F28528DBB868EF6AC07FDCF2387E75FB32C9AC39B326E2D2734EC6E9A71D8EF9F3C6A3A1C6D0493A576DE3211DAB2B2B6FA61D43679A61E59A2D5846BEE1A9A7B7A0BBB30B1F9973106EF9DE25E4E8E7A2A14EACDDEB2062C788F796F26F422BE53A782E35CB752248A51BF19F3F5F86C79F7C93E06E119F38770E6EB96A01A64F225FC1C5B682198D0AB92C37184102D5EF4AA92ED9FD694BB5EBAA0EA6D34F3C3F95F3B5917EC560E95DFFFDF6B187F3839A1BDA55675E0899FBDD1972634A114D93BDDFBFB78B82B756FCCB4FEE44724423169C341B172F3A1A93268E904BAF15DEF72368A86D3CB8DABF4434586CD99AC6EFEF5983FB1E5A83CD3BBA30B22186F33E760C2EBA703EE6CE1D8F98499AEA70B5DFBAC9155496211FDD9147649C63DBA4997B3A71CBAF1F22B0F0125C82C0177DEA645C71D9499838AA16A6A75603BB9629F3527EE659EC24C475A304ABC29081F885BEB69AAD765EEE6221978652DC6526CF1FC07E5989A5ED5DA9AF350D2F5F3C1D68899FA5E5AAFEB0E9ADED98366D0A563DF86F8844B2042D5D092BC5A27F21B72AFA8E48E28934BD94657ABDF9ED1CFEF3966578ECC997D1D69EC28C839AF1AF379C8D8B2F3C16A34672C94CF0B4128188ABFC84279281A45D06857664227385081E7DF40D326DCFE0C9D52F61C6CCC9F8EA759F44CB3973302C9E93C94E8E34010301E1453B90237B074A8B39FDE2979F73FB730C26EB29A65190C2D53F4378E6DED62EFB6BDC25D36066E8CD71959C93291403FE2E41C2675A64B3179C3497CE896D9DBA752382DAF5D993DF2A10970ED391917811D9A28D871EDE8C5F2F5981D7DF6A8593CF91733E9AE2868FE2E8A3C6A33691D6668DB481086FF801A011D54D145C42E8ED7B8AB8F9678F61E5E36BD1DD96C5C2538FC06F7FF5751C3B7F12E2D12EE9230C8A37E41EBE329E5219042394BA09040C7EC3C4C0628B6A1EA7948540D97D15F1990428AAB7CB51E1B45CE8E3105D469CDC2F438ADC7C2B9D31F7176DD694B078D0C0A04AA35092A49DBAC9BCA02A16D43A74A0A81A300B3405136FBC9DC27DF7AFC3238F6DC0B6DDAD38F2F083F0A5CF7C14E72C9A8B2953EA495A28F0F35A03868A8CB347B0B648A8CD622AD277D930BCF1CEBBF8AF5B9EC623CB57CBCD30AFFCEC59B8EC5347616C73821E52105F6CE7E137A9D9FA7EBE665792B124B1BDCA72DFFB3985AEAB68130A9291FE6A672EE33001622405C96F7A32B6F3BE3C202871F7EF7FFBCEF187E7278F6C4841AC6757314944254C982F39BC8450F4164EE1CD5C4484EDBAF578E081B5786CD5EBE8C8E671E2E9F330FFB8899839BE0131AEB44198138FCC8970D6A240C78839B225898B2509A2A83392FCCB7A7CFFA74BB1756737869B097CF6CA33F1D9CB8FC2C8112622229968E4D4324C9ED0DD2136FCD561031DFD6E50E6176BC2E581A08F4BEE065F72D85A33D44A3CB578871BE10DE05CB9AD49C16B7876400CB9E7F7CB9E993C61FFF1B30E2E20EA883485A3B6D2E3218694950F7B56CE441FB3A78C4E29354F4C321D4BED93A60B3E4CC60A6A4F14B9B297CC9583E1787B7327563DB111773FF22256AF7D054D236AF1F9CF9C83ABAE381C23EAEBE56E46A20AE70A9F253728100FEC9415BFDE3B337CBFC2032D0827AE433B054B8155D7B87A11B22E6BCB0AA458069A201315154D2585610DB597D48D3DFF6EF1CE01898CEB7914207AC74B072A93710A249ABAEF379C64EC5DA2B824B25FC4928A2CF252665E6E1FE8491586660A546E8C0FC353CFEEC30D37DE84B7DEDE8BBA61494C9B32013FFDF72FC966EB117545986446B923B2B551652EA5F632E9D34AED41FDCF6F20A37CE91DB406E84E9BA008CAA535606641AD5017A9768B882F62A19C58CFC9D1DEE1A23B236A3A59D86ED469B9483163C00C216CF84C5726825CDE452CAAB95DD6EEE067828DF2098707D7C97A557A54DD8672E7D224D97957CA8C4A03587EB88F542A875DBBF6E0A863A6E1A69BBF80A9A39368AA4B226250346F51B4430EC570D566FB5CF80B2124421545AECC601A4EEB663F7FCFE0B28D11B466EB7C96B21FE186BB50DD5F12DB0AAE0F1A0474578C6A2B32F54E7B168A8524D2790F9D14E61C48B9E8E8162830268365511897C09FA4C68AB3D71E5CF9E0BCB34F3D7B1D8081E9F28D37DE68CC983E67CBB187B71D3471444EEEDAE099B6DEC821D418378800A9DA6A2BFFFD0A3FF9954843A9BFD02D669749A7BA31AB7ACFBE76A50E16F1304FB52B783C6823E5C1FBF4F203C6A4B9F59724F89F213B39859164AA0693B3A31484021D291B5D19875E13082946483384E38EC93D89C59E8924904F19062FB86E6169D434EFA393B99696966089C1808DEBEFEE5AF2FBE913DA5A661F24E2D9828E6E8D01DF62300C717D24E7EF2EA1771A65654B237A02CEBE1822D73D6964C5432DB29EDC24C6556523AEA41B7E2E4B983FB9FDA05AF6ED9A9EAC5E8A0C7377D64036C7B08FA45FACB0CE65298A704469583040D47608FA5BA4112E7F9EFEB88F6EB8C62BC4375C7AE9C7CB77BEA91803861DCC70B7B6A5849B8CD3C7E57A20F83FE508F74232DDD0D0633E7ACFF7DE46B57301E8D515504813E7E9CDD222AAC14D741C8AC669A86F2771589CA4BC4ED6F0DBBB183ABAF264FFC9FC14C92C89B40DCC908176B7C2B45FA11BFD91C4E991DA98D19DCFE73BC21AD0DF1830432286B5219D23C9C81B8889E5DB5CEDDFCEDE83A3EC753D7BB0FD5FE5099FDAE103FD6B9E7FADEAD1F34A5DAA92E151A53D464132C0252091CD5952033A520EDA4803D2E43B8B2E31C01EA6D6901A027E13A233B126619A2F10525C9AC9E4B7144726BBAE5EBC78C85F2A39288674679D8D312B9AEB48651323932C681E18DC561C031D61DD0B9B24FF546F0DDFD5875FC3F777290AFED18FA29B200698E8ECE2E47841E687184096AA2876B6E0B532D3A3F63071DAAC78710BE9D41ACB643BF24EF19ECBCFBF64C77B92C86A731DCCC5BFFBDD6FDF9CD0E44D9F77480A114EF0C1131B1717F4F7F8F581B0CA3E8A575C532DFAF553D261827B2AEAD5BDB1EA1A577EB511138E53F4D752C0E519B64A80FA3BBE6950201378747DA118435796F07FB741D29F238D8FD0313AE78A96C088447932E7C6DCCD966176B88E774F2C967CA6CBCE6EBEB2A5E5C09F92F8D5C6A0BE1D8108F47067777EBACB633475B17CDA1D446FD2C0054904834A135C5D43F7DB59A52F83FCF601AE4C0FB3EB557B8E21964F3830DDB88C69E4577F9139CAD931B4777A64F721A1673AED41ACB213CFC0993041364C83D115DE01E2F7468AA29798A6B3DE74CC775B2EB86048DF45F86763482451D39DCD679021A98A25AC50C334425B66F49D822E6F01EA256127339F5CF75631D9651EECB8232A7A527BF4177C5939991DF258427630E60B0DE820F276A60B48658AC8141C324BA2F02582CFA26AD6B0080279DE568EE272D7F696C6CCF88E7163EADB172C5890FF7333E03D31C4718ACBC163FFD0DEC9D1108FC09429F11026EA534D78F905BC779D315C11D0A9604E3A78C3530B1DE47B54938248DFE78B043933E20B5D0C88BD035239177927476029A2B2C32CAE1DB7B9857B6C1D33126B4CD3FB2333CDFC45E79DB7F58326FE7B664877B1B82561445BDB3BB2A3268F8E12438AA536FC204D5172C8553BF97AF88F9E6CF1985F06530B6C1C21D2149DE5C9D976754749039413CEE43CE97C05F6176B5B99DCC0D3CB782EDB6B45AD170DC37DDBCD15EE7FEBADD7D77FE73BDF713E68620F640C3A8CB8E3774BEE6988A5CF3B691E501B69D75174C002A8A4A15AC0AFD8E3E8E614D5602CA35CC3CF8AAACD86B95F79E4EA9B781C3A2FDA7204FC14D8BFB5D326136410EC4C4AF829A25E477C438229B7B4D86F9A912CE7CE6A562CAEB11CEFE196CB2EDBF2411376A863D05F794468EAE574D13A2F9DF55053A753CB415957B75B1A8E5ABAC6759F96FCF22E95EB52052DA559AE4C29D4C8C83C6F5B48751968EF70902A44C80C2944E4F284CCFD08E4633047A44EF710231CCBC5BD96157DDACD669FBCB8E59383FAD294BFE431688698A6B9927B917FECECCEA1B13E22C9EA47C0D04E98EB5DE9A0B715E71441A9DD2B846427C8CCD4535CE3C9E0AB4D981F02FE993C4741E4C884DD3754EDC23044CDBBD8062FF728DD610DA9C40B9F6E6979E18326DAFB3906FFA560266F155BD6B5756631756C0296D85FAB628704537E1F885846ACA4BB404E36D3E5D27BC8F4645CB4661C998C73C4777DC8B822A9F5CB210EDADB237664B9CBDDE5B1384B350E6F5C47E8273DE8797E48C7A019D26559DBE305EF9DAEB47550C12D90D0E6F45776906D2778EA7ACAF6776722D89F6210BBB7768BE49B2B52CFB5B2A159B6CE71C13223E54608F39BE6665E743746C1D6B6B45CF257AD01FD8D21E5067F73D783F7D7181D8B8F9E53407D2D3120EF10EAF1D0410CE8264DE8CA09DB9F24F31453E687C96CAA43A62B4F368F085ED866BACE7D5D5D99E5575F7DF5D0BF16F3AF700CE97B0C4D965F934762F18B6F44C8D16691CB8B8CA7580C9994264A7D8F1F919F719BF4E159EE794B492DD65E72D105EB3EE807FE4B1F436208B3703777F83F17F21681A67AE5430CCF63C86C2697BE861935F70EABADD979EEC7CFD8F0413FE0876D0CB99C71E7EF7EBF9E406DAB65586BA296F9522412DBBA68D1991B3FE807FAB08FFF013FBC43AFDAA416840000000049454E44AE426082, 'image/png');
/*!40000 ALTER TABLE `suggest_image` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_reported_message
CREATE TABLE IF NOT EXISTS `suggest_reported_message` (
  `id_reported_message` int(11) NOT NULL DEFAULT '0',
  `id_suggest_submit` int(11) DEFAULT NULL,
  `date_reported` timestamp NULL DEFAULT NULL,
  `reported_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_reported_message`),
  KEY `index_suggest_reported_message` (`id_suggest_submit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_reported_message: 0 rows
/*!40000 ALTER TABLE `suggest_reported_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_reported_message` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_response
CREATE TABLE IF NOT EXISTS `suggest_response` (
  `id_response` int(11) NOT NULL DEFAULT '0',
  `id_suggest_submit` int(11) DEFAULT NULL,
  `response_value` mediumtext COLLATE utf8_unicode_ci,
  `id_entry` int(11) DEFAULT NULL,
  `id_resource_image` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_response`),
  KEY `index_suggest_response_entry` (`id_entry`),
  KEY `index_suggest_response_suggest` (`id_suggest_submit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_response: 16 rows
/*!40000 ALTER TABLE `suggest_response` DISABLE KEYS */;
INSERT INTO `suggest_response` (`id_response`, `id_suggest_submit`, `response_value`, `id_entry`, `id_resource_image`) VALUES
	(1, 3, 'Hire Happy Personalities', 1, NULL),
	(2, 3, 'A happy work environment attracts good people and in turn, promotes a culture of productivity and accountability – a stressful environment will most definitely destroy the company culture.', 2, NULL),
	(3, 4, 'Wellness Program', 1, NULL),
	(4, 4, 'A wellness program that allows people to set health goals, access tools (trackers and apps). It can reward them for completing healthy activities and improvement in health through an innovative app', 2, NULL),
	(5, 2, 'Avoid micromanagement', 1, NULL),
	(6, 2, 'If employees feel like they are constantly on their boss’s radar, they are not going to perform the way they normally would, and they will begin to resent their job.\r\nIt doesn’t help anyone if half the day is spent recording and reporting what tasks were checked off and which ones weren’t, so, give the team the trust and creative freedom that they deserve by setting clear expectations and fair boundaries.', 2, NULL),
	(7, 5, 'Manage Work/Life balance', 1, NULL),
	(8, 5, 'Make it known that work/life balance is a priority by offering work-from-home Fridays, unlimited vacation days, discounts on surrounding health and wellness programs, or childcare options. Offering incentives that improve a team member’s overall quality of life show that the company cares about the wellbeing.', 2, NULL),
	(9, 6, 'Sustainable roofs', 3, NULL),
	(10, 6, 'Rooftop gardens are even more effective because they bring the temperature down, provide shade, clean the air, and don’t just bounce sunlight back into the atmosphere, which could potentially disrupt precipitation patterns, and also retain heat in the wintertime, bringing heating bills down.', 4, NULL),
	(11, 7, 'Banning plastic', 3, NULL),
	(12, 7, 'The vast majority of this plastic isn’t recycled. It ends up in landfills, oceans, green spaces, and elsewhere, where it pollutes ecosystems, harms animals, and contaminates drinking water. For many governments around the world, this blanketing of the planet is a tipping point — the convenience of plastic no longer seems worth the environmental consequences.', 4, NULL),
	(13, 8, 'Bicycle highways', 3, NULL),
	(14, 8, 'The transportation sector is one of the largest sources of greenhouse gas emissions in the world, and cars and trucks make up a large part of that total. Cities feel the effects of vehicle emissions more acutely than the rest of the world — all the fumes lead to air pollution that significantly reduces quality of life.\r\nWhen it comes building serious bicycle highways, the Danes and the Dutch were the great pioneers. While the Danish supercykelstiers are concentrated in and around Copenhagen, the', 4, NULL),
	(15, 9, 'Commuting with an electric bike', 3, NULL),
	(16, 9, 'Research shows that e-bikes are 10 to 20 times more energy efficient than a car, and frankly, an e-bike is just plain fun to ride. Folding e-bikes like this one can give you a sweat-free, less stressful commute and get you out of your car, the fastest-growing contributor to greenhouse gases in our country', 4, NULL);
/*!40000 ALTER TABLE `suggest_response` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_rss_cf
CREATE TABLE IF NOT EXISTS `suggest_rss_cf` (
  `id_rss` int(11) NOT NULL DEFAULT '0',
  `id_suggest` int(11) NOT NULL DEFAULT '0',
  `is_submit_rss` smallint(6) NOT NULL DEFAULT '0',
  `id_suggest_submit` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_rss`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_rss_cf: 0 rows
/*!40000 ALTER TABLE `suggest_rss_cf` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_rss_cf` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest
CREATE TABLE IF NOT EXISTS `suggest_suggest` (
  `id_suggest` int(11) NOT NULL DEFAULT '0',
  `title` mediumtext COLLATE utf8_unicode_ci,
  `unavailability_message` mediumtext COLLATE utf8_unicode_ci,
  `workgroup` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_vote_type` int(11) NOT NULL DEFAULT '0',
  `number_vote_required` int(11) DEFAULT NULL,
  `number_day_required` int(11) DEFAULT NULL,
  `active_suggest_submit_authentification` smallint(6) DEFAULT '0',
  `active_vote_authentification` smallint(6) DEFAULT '0',
  `active_comment_authentification` smallint(6) DEFAULT '0',
  `disable_new_suggest_submit` smallint(6) DEFAULT '0',
  `authorized_comment` smallint(6) DEFAULT '0',
  `disable_new_comment` smallint(6) DEFAULT '0',
  `id_mailing_list_suggest_submit` int(11) DEFAULT NULL,
  `active_captcha` smallint(6) DEFAULT '0',
  `active` smallint(6) DEFAULT '0',
  `date_creation` timestamp NULL DEFAULT NULL,
  `libelle_validate_button` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active_suggest_proposition_state` smallint(6) DEFAULT '0',
  `libelle_contribution` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `number_suggest_submit_in_top_score` int(11) DEFAULT NULL,
  `number_suggest_submit_in_top_comment` int(11) DEFAULT NULL,
  `limit_number_vote` smallint(6) DEFAULT NULL,
  `number_suggest_submit_caracters_shown` int(11) DEFAULT NULL,
  `show_category_block` smallint(6) DEFAULT '0',
  `show_top_score_block` smallint(6) DEFAULT '0',
  `show_top_comment_block` smallint(6) DEFAULT '0',
  `active_suggest_submit_paginator` smallint(6) DEFAULT '0',
  `number_suggest_submit_per_page` int(11) DEFAULT NULL,
  `role` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_new_suggest_submit_mail` smallint(6) DEFAULT '0',
  `header` mediumtext COLLATE utf8_unicode_ci,
  `sort_field` int(11) DEFAULT '0',
  `sort_asc` smallint(6) DEFAULT '0',
  `code_theme` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_message` mediumtext COLLATE utf8_unicode_ci,
  `active_editor_bbcode` smallint(6) DEFAULT '0',
  `default_suggest` smallint(6) DEFAULT '0',
  `id_default_sort` int(11) DEFAULT NULL,
  `notification_new_comment_sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_new_comment_title` mediumtext COLLATE utf8_unicode_ci,
  `notification_new_comment_body` mediumtext COLLATE utf8_unicode_ci,
  `notification_new_suggest_submit_sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_new_suggest_submit_title` mediumtext COLLATE utf8_unicode_ci,
  `notification_new_suggest_submit_body` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_suggest`),
  KEY `index_suggest_suggest` (`id_vote_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest: 2 rows
/*!40000 ALTER TABLE `suggest_suggest` DISABLE KEYS */;
INSERT INTO `suggest_suggest` (`id_suggest`, `title`, `unavailability_message`, `workgroup`, `id_vote_type`, `number_vote_required`, `number_day_required`, `active_suggest_submit_authentification`, `active_vote_authentification`, `active_comment_authentification`, `disable_new_suggest_submit`, `authorized_comment`, `disable_new_comment`, `id_mailing_list_suggest_submit`, `active_captcha`, `active`, `date_creation`, `libelle_validate_button`, `active_suggest_proposition_state`, `libelle_contribution`, `number_suggest_submit_in_top_score`, `number_suggest_submit_in_top_comment`, `limit_number_vote`, `number_suggest_submit_caracters_shown`, `show_category_block`, `show_top_score_block`, `show_top_comment_block`, `active_suggest_submit_paginator`, `number_suggest_submit_per_page`, `role`, `enable_new_suggest_submit_mail`, `header`, `sort_field`, `sort_asc`, `code_theme`, `confirmation_message`, `active_editor_bbcode`, `default_suggest`, `id_default_sort`, `notification_new_comment_sender`, `notification_new_comment_title`, `notification_new_comment_body`, `notification_new_suggest_submit_sender`, `notification_new_suggest_submit_title`, `notification_new_suggest_submit_body`) VALUES
	(1, 'Hapiness at work', '<p>This consultation is not available</p>', 'all', 1, -1, -1, 0, 0, 0, 0, 0, 0, -1, 0, 1, '2019-12-26 16:25:29', 'Post', 0, 'Hapiness at work', 10, 10, 0, 500, 1, 1, 1, 1, 20, NULL, 0, '', 0, 0, 'blue', '', 0, 0, -1, '', '<p>New comments have been posted</p>', '<p>&nbsp;</p>\r\n<p>Hello</p>\r\n<p><br /> ${comments?size} New comments have been added : <br /> &lt;#list comments as comment_submit&gt;</p>\r\n<p>&lt;#if comment_submit.isOfficialAnswer()&gt; <span class="badge badge-warning"> Official response </span> &nbsp; ${comment_submit.dateComment?string("dd/MM/yyyy HH:mm:ss")}</p>\r\n<p>&lt;#if comment_submit.value?length &gt; 100&gt; ${comment_submit.value?substring(0,100)} &lt;#else&gt; ${comment_submit.value} <a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&amp;id_suggest=${comment_submit.suggestSubmit.suggest.idSuggest}&amp;id_suggest_submit=${comment_submit.suggestSubmit.idSuggestSubmit}&amp;action=view_suggest_submit"> Read More </a> </p>', '', '<p>New contributions have been created</p>', '<p>&nbsp;</p>\r\n<p>Hello</p>\r\n<p><br /> ${suggestSubmits?size} New contributions have been added : <br /> &lt;#list suggestSubmits as suggestSubmit&gt;</p>\r\n<p>${suggestSubmit.suggestSubmitTitle}</p>\r\n<p><a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&amp;id_suggest=${suggestSubmit.suggest.idSuggest}&amp;id_suggest_submit=${suggestSubmit.idSuggestSubmit}&amp;action=view_suggest_submit"> Read More </a> </p>'),
	(2, 'What can my city do about climate change?', '<p>The consultation is closed</p>', 'all', 1, -1, -1, 0, 0, 0, 0, 0, 0, -1, 0, 1, '2019-12-27 14:42:50', 'Send', 0, 'What can my city do about climate change?', 10, 10, 0, 500, 1, 1, 1, 1, 20, NULL, 0, '', 0, 0, 'blue', '', 0, 0, -1, '', '<p>New comments have been posted</p>', '<p>&nbsp;</p>\r\n<p>Hello</p>\r\n<p><br /> ${comments?size} New comments have been added : <br /> &lt;#list comments as comment_submit&gt;</p>\r\n<p>&lt;#if comment_submit.isOfficialAnswer()&gt; <span class="badge badge-warning"> Official response </span> &nbsp; ${comment_submit.dateComment?string("dd/MM/yyyy HH:mm:ss")}</p>\r\n<p>&lt;#if comment_submit.value?length &gt; 100&gt; ${comment_submit.value?substring(0,100)} &lt;#else&gt; ${comment_submit.value} <a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&amp;id_suggest=${comment_submit.suggestSubmit.suggest.idSuggest}&amp;id_suggest_submit=${comment_submit.suggestSubmit.idSuggestSubmit}&amp;action=view_suggest_submit"> Read More </a></p>', '', '<p>New contributions have been created</p>', '<p>&nbsp;</p>\r\n<p>Hello</p>\r\n<p><br /> ${suggestSubmits?size} New contributions have been added : <br /> &lt;#list suggestSubmits as suggestSubmit&gt;</p>\r\n<p>${suggestSubmit.suggestSubmitTitle}</p>\r\n<p><a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&amp;id_suggest=${suggestSubmit.suggest.idSuggest}&amp;id_suggest_submit=${suggestSubmit.idSuggestSubmit}&amp;action=view_suggest_submit"> Read More </a></p>');
/*!40000 ALTER TABLE `suggest_suggest` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest_attribute
CREATE TABLE IF NOT EXISTS `suggest_suggest_attribute` (
  `id_suggest` int(11) NOT NULL DEFAULT '0',
  `attribute_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_value` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_suggest`,`attribute_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest_attribute: 17 rows
/*!40000 ALTER TABLE `suggest_suggest_attribute` DISABLE KEYS */;
INSERT INTO `suggest_suggest_attribute` (`id_suggest`, `attribute_key`, `attribute_value`) VALUES
	(2, 'idImageResource', '-1'),
	(2, 'disableVote', 'false'),
	(2, 'notificationNewCommentBody', '<p>&nbsp;</p>\r\n<p>Hello</p>\r\n<p><br /> ${comments?size} New comments have been added : <br /> &lt;#list comments as comment_submit&gt;</p>\r\n<p>&lt;#if comment_submit.isOfficialAnswer()&gt; <span class="badge badge-warning"> Official response </span> &nbsp; ${comment_submit.dateComment?string("dd/MM/yyyy HH:mm:ss")}</p>\r\n<p>&lt;#if comment_submit.value?length &gt; 100&gt; ${comment_submit.value?substring(0,100)} &lt;#else&gt; ${comment_submit.value} <a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&amp;id_suggest=${comment_submit.suggestSubmit.suggest.idSuggest}&amp;id_suggest_submit=${comment_submit.suggestSubmit.idSuggestSubmit}&amp;action=view_suggest_submit"> Read More </a></p>'),
	(2, 'termsOfUse', ''),
	(2, 'enableMailNewReportedSubmit', 'false'),
	(2, 'numberCharCommentDisplayInSuggestSubmitList', '30'),
	(2, 'enableTermsOfUse', 'false'),
	(2, 'notificationNewCommentTitle', '<p>New comments have been posted</p>'),
	(2, 'notificationNewCommentSenderName', ''),
	(2, 'numberCommentDisplayInSuggestSubmitList', '3'),
	(2, 'enableMailNewCommentSubmit', 'false'),
	(2, 'description', '<p>&nbsp;Climate change is a global phenomenon that largely impacts urban life. At the same time, cities are a key contributor to climate change, as urban activities are major sources of greenhouse gas emissions.</p>'),
	(2, 'notificationNewSuggestSubmitTitle', '<p>New contributions have been created</p>'),
	(2, 'notificationNewSuggestSubmitBody', '<p>&nbsp;</p>\r\n<p>Hello</p>\r\n<p><br /> ${suggestSubmits?size} New contributions have been added : <br /> &lt;#list suggestSubmits as suggestSubmit&gt;</p>\r\n<p>${suggestSubmit.suggestSubmitTitle}</p>\r\n<p><a class="btn btn-small btn-primary" href="${base_url}/jsp/site/Portal.jsp?page=suggest&amp;id_suggest=${suggestSubmit.suggest.idSuggest}&amp;id_suggest_submit=${suggestSubmit.idSuggestSubmit}&amp;action=view_suggest_submit"> Read More </a></p>'),
	(2, 'displayCommentInSuggestSubmitList', 'false'),
	(2, 'notificationNewSuggestSubmitSenderName', ''),
	(2, 'enableReports', 'false');
/*!40000 ALTER TABLE `suggest_suggest_attribute` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest_category
CREATE TABLE IF NOT EXISTS `suggest_suggest_category` (
  `id_suggest` int(11) NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_suggest`,`id_category`),
  KEY `index_suggest_suggest_category_suggest` (`id_suggest`),
  KEY `index_suggest_suggest_category_category` (`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest_category: 3 rows
/*!40000 ALTER TABLE `suggest_suggest_category` DISABLE KEYS */;
INSERT INTO `suggest_suggest_category` (`id_suggest`, `id_category`) VALUES
	(2, 3),
	(2, 4),
	(2, 5);
/*!40000 ALTER TABLE `suggest_suggest_category` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest_submit
CREATE TABLE IF NOT EXISTS `suggest_suggest_submit` (
  `id_suggest_submit` int(11) NOT NULL DEFAULT '0',
  `id_suggest` int(11) NOT NULL DEFAULT '0',
  `id_state` int(11) NOT NULL DEFAULT '0',
  `user_login` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_response` timestamp NULL DEFAULT NULL,
  `vote_number` int(11) DEFAULT NULL,
  `score_number` int(11) DEFAULT NULL,
  `id_category` int(11) DEFAULT NULL,
  `suggest_submit_value` mediumtext COLLATE utf8_unicode_ci,
  `suggest_submit_title` mediumtext COLLATE utf8_unicode_ci,
  `comment_enable_number` int(11) DEFAULT NULL,
  `suggest_submit_value_show_in_the_list` mediumtext COLLATE utf8_unicode_ci,
  `reported` smallint(6) DEFAULT '0',
  `lutece_user_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suggest_submit_list_order` int(11) DEFAULT '0',
  `suggest_submit_type` int(11) DEFAULT '0',
  `number_view` int(11) DEFAULT '0',
  `disable_vote` smallint(6) DEFAULT '0',
  `is_pinned` smallint(6) DEFAULT '0',
  `disable_comment` smallint(6) DEFAULT '0',
  `id_image_resource` int(11) DEFAULT NULL,
  `comment_number` int(11) DEFAULT '0',
  PRIMARY KEY (`id_suggest_submit`),
  KEY `index_suggest_suggest_submit_suggest` (`id_suggest`),
  KEY `index_suggest_suggest_submit_category` (`id_category`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest_submit: 8 rows
/*!40000 ALTER TABLE `suggest_suggest_submit` DISABLE KEYS */;
INSERT INTO `suggest_suggest_submit` (`id_suggest_submit`, `id_suggest`, `id_state`, `user_login`, `date_response`, `vote_number`, `score_number`, `id_category`, `suggest_submit_value`, `suggest_submit_title`, `comment_enable_number`, `suggest_submit_value_show_in_the_list`, `reported`, `lutece_user_key`, `suggest_submit_list_order`, `suggest_submit_type`, `number_view`, `disable_vote`, `is_pinned`, `disable_comment`, `id_image_resource`, `comment_number`) VALUES
	(3, 1, 3, NULL, '2019-12-26 16:42:45', 0, 0, 1, '<p class="lead">\nHire Happy Personalities\n</p>	\nA happy work environment attracts good people and in turn, promotes a culture of productivity and accountability – a stressful environment will most definitely destroy the company culture.\n', 'Hire Happy Personalities', 0, '<p class="lead">\nHire Happy Personalities\n</p>	\nA happy work environment attracts good people and in turn, promotes a culture of productivity and accountability – a stressful environment will most definitely destroy the company culture.\n', 0, NULL, 2, NULL, 0, 0, 0, 0, NULL, 0),
	(4, 1, 3, NULL, '2019-12-26 16:44:24', 0, 0, 1, '<p class="lead">\nWellness Program\n</p>	\nA wellness program that allows people to set health goals, access tools (trackers and apps). It can reward them for completing healthy activities and improvement in health through an innovative app\n', 'Wellness Program', 0, '<p class="lead">\nWellness Program\n</p>	\nA wellness program that allows people to set health goals, access tools (trackers and apps). It can reward them for completing healthy activities and improvement in health through an innovative app\n', 0, NULL, 3, NULL, 0, 0, 0, 0, NULL, 0),
	(2, 1, 3, NULL, '2019-12-26 16:34:24', 2, 2, 1, '<p class="lead">\nAvoid micromanagement\n</p>	\nIf employees feel like they are constantly on their boss’s radar, they are not going to perform the way they normally would, and they will begin to resent their job.\r\nIt doesn’t help anyone if half the day is spent recording and reporting what tasks were checked off and which ones weren’t, so, give the team the trust and creative freedom that they deserve by setting clear expectations and fair boundaries.\n', 'Avoid micromanagement', 0, '<p class="lead">\nAvoid micromanagement\n</p>	\nIf employees feel like they are constantly on their boss’s radar, they are not going to perform the way they normally would, and they will begin to resent their job.\r\nIt doesn’t help anyone if half the day is spent recording and reporting what tasks were checked off and which ones weren’t, so, give the team the trust and creative freedom that they deserve by setting clear expectations and fair boundaries.\n', 0, NULL, 1, NULL, 0, 0, 0, 0, NULL, 0),
	(5, 1, 3, NULL, '2019-12-26 16:45:17', 1, 1, 1, '<p class="lead">\nManage Work/Life balance\n</p>	\nMake it known that work/life balance is a priority by offering work-from-home Fridays, unlimited vacation days, discounts on surrounding health and wellness programs, or childcare options. Offering incentives that improve a team member’s overall quality of life show that the company cares about the wellbeing.\n', 'Manage Work/Life balance', 0, '<p class="lead">\nManage Work/Life balance\n</p>	\nMake it known that work/life balance is a priority by offering work-from-home Fridays, unlimited vacation days, discounts on surrounding health and wellness programs, or childcare options. Offering incentives that improve a team member’s overall quality of life show that the company cares about the wellbeing.\n', 0, NULL, 4, NULL, 0, 0, 0, 0, NULL, 0),
	(6, 2, 3, NULL, '2019-12-27 15:07:22', 1, 1, 3, '<p class="lead">\nSustainable roofs\n</p>	\nRooftop gardens are even more effective because they bring the temperature down, provide shade, clean the air, and don’t just bounce sunlight back into the atmosphere, which could potentially disrupt precipitation patterns, and also retain heat in the wintertime, bringing heating bills down.\n', 'Sustainable roofs', 0, '<p class="lead">\nSustainable roofs\n</p>	\nRooftop gardens are even more effective because they bring the temperature down, provide shade, clean the air, and don’t just bounce sunlight back into the atmosphere, which could potentially disrupt precipitation patterns, and also retain heat in the wintertime, bringing heating bills down.\n', 0, NULL, 1, NULL, 0, 0, 0, 0, NULL, 0),
	(7, 2, 3, NULL, '2019-12-27 15:08:15', 1, 1, 5, '<p class="lead">\nBanning plastic\n</p>	\nThe vast majority of this plastic isn’t recycled. It ends up in landfills, oceans, green spaces, and elsewhere, where it pollutes ecosystems, harms animals, and contaminates drinking water. For many governments around the world, this blanketing of the planet is a tipping point — the convenience of plastic no longer seems worth the environmental consequences.\n', 'Banning plastic', 0, '<p class="lead">\nBanning plastic\n</p>	\nThe vast majority of this plastic isn’t recycled. It ends up in landfills, oceans, green spaces, and elsewhere, where it pollutes ecosystems, harms animals, and contaminates drinking water. For many governments around the world, this blanketing of the planet is a tipping point — the convenience of plastic no longer seems worth the environmental consequences.\n', 0, NULL, 2, NULL, 0, 0, 0, 0, NULL, 0),
	(8, 2, 3, NULL, '2019-12-27 15:11:30', 1, 1, 4, '<p class="lead">\nBicycle highways\n</p>	\nThe transportation sector is one of the largest sources of greenhouse gas emissions in the world, and cars and trucks make up a large part of that total. Cities feel the effects of vehicle emissions more acutely than the rest of the world — all the fumes lead to air pollution that significantly reduces quality of life.\r\nWhen it comes building serious bicycle highways, the Danes and the Dutch were the great pioneers. While the Danish supercykelstiers are concentrated in and around Copenhagen, the\n', 'Bicycle highways', 0, '<p class="lead">\nBicycle highways\n</p>	\nThe transportation sector is one of the largest sources of greenhouse gas emissions in the world, and cars and trucks make up a large part of that total. Cities feel the effects of vehicle emissions more acutely than the rest of the world — all the fumes lead to air pollution that significantly reduces quality of life.\r\nWhen it comes building serious bicycle highways, the Danes and the Dutch were the great pioneers. While the Danish supercykelstiers are concentrated in and around...\n', 0, NULL, 3, NULL, 0, 0, 0, 0, NULL, 0),
	(9, 2, 3, NULL, '2019-12-27 15:23:27', 0, 0, 4, '<p class="lead">\nCommuting with an electric bike\n</p>	\nResearch shows that e-bikes are 10 to 20 times more energy efficient than a car, and frankly, an e-bike is just plain fun to ride. Folding e-bikes like this one can give you a sweat-free, less stressful commute and get you out of your car, the fastest-growing contributor to greenhouse gases in our country\n', 'Commuting with an electric bike', 0, '<p class="lead">\nCommuting with an electric bike\n</p>	\nResearch shows that e-bikes are 10 to 20 times more energy efficient than a car, and frankly, an e-bike is just plain fun to ride. Folding e-bikes like this one can give you a sweat-free, less stressful commute and get you out of your car, the fastest-growing contributor to greenhouse gases in our country\n', 0, NULL, 4, NULL, 0, 0, 0, 0, NULL, 0);
/*!40000 ALTER TABLE `suggest_suggest_submit` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest_submit_state
CREATE TABLE IF NOT EXISTS `suggest_suggest_submit_state` (
  `id_state` smallint(6) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest_submit_state: 3 rows
/*!40000 ALTER TABLE `suggest_suggest_submit_state` DISABLE KEYS */;
INSERT INTO `suggest_suggest_submit_state` (`id_state`, `title`, `number`) VALUES
	(1, 'Disabled', 1),
	(2, 'Waiting', 2),
	(3, 'Published', 3);
/*!40000 ALTER TABLE `suggest_suggest_submit_state` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest_submit_type
CREATE TABLE IF NOT EXISTS `suggest_suggest_submit_type` (
  `id_type` int(11) NOT NULL DEFAULT '0',
  `name` mediumtext COLLATE utf8_unicode_ci,
  `color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_resource_image` int(11) DEFAULT NULL,
  `parameterizable` smallint(6) DEFAULT '0',
  `id_xsl` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest_submit_type: 3 rows
/*!40000 ALTER TABLE `suggest_suggest_submit_type` DISABLE KEYS */;
INSERT INTO `suggest_suggest_submit_type` (`id_type`, `name`, `color`, `id_resource_image`, `parameterizable`, `id_xsl`) VALUES
	(1, 'Announcement', '#CCFFFF', 1, 1, 0),
	(2, 'Post It', '#FFFF66', 2, 1, 0),
	(3, 'Default', '#FFFFFF', NULL, 1, 0);
/*!40000 ALTER TABLE `suggest_suggest_submit_type` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest_suggest_submit_type
CREATE TABLE IF NOT EXISTS `suggest_suggest_suggest_submit_type` (
  `id_suggest` int(11) NOT NULL DEFAULT '0',
  `id_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_suggest`,`id_type`),
  KEY `fk_suggest_suggest_submit_type` (`id_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest_suggest_submit_type: 0 rows
/*!40000 ALTER TABLE `suggest_suggest_suggest_submit_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_suggest_suggest_submit_type` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_suggest_user_info
CREATE TABLE IF NOT EXISTS `suggest_suggest_user_info` (
  `lutece_user_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `business_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `home_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lutece_user_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_suggest_user_info: 0 rows
/*!40000 ALTER TABLE `suggest_suggest_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_suggest_user_info` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_video
CREATE TABLE IF NOT EXISTS `suggest_video` (
  `id_suggest_submit` int(11) NOT NULL,
  `video_content` mediumblob,
  `video_mime_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `credits` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_suggest_submit`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_video: 0 rows
/*!40000 ALTER TABLE `suggest_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_video` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_vote
CREATE TABLE IF NOT EXISTS `suggest_vote` (
  `id_suggest_submit` int(11) NOT NULL DEFAULT '0',
  `lutece_user_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_vote: 0 rows
/*!40000 ALTER TABLE `suggest_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_vote` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_vote_button
CREATE TABLE IF NOT EXISTS `suggest_vote_button` (
  `id_vote_button` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vote_button_value` int(11) DEFAULT NULL,
  `icon_content` mediumblob,
  `icon_mime_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_vote_button`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_vote_button: 0 rows
/*!40000 ALTER TABLE `suggest_vote_button` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_vote_button` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_vote_type
CREATE TABLE IF NOT EXISTS `suggest_vote_type` (
  `id_vote_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_vote_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_vote_type: 2 rows
/*!40000 ALTER TABLE `suggest_vote_type` DISABLE KEYS */;
INSERT INTO `suggest_vote_type` (`id_vote_type`, `title`, `template_file_name`) VALUES
	(1, 'Vote', 'suggest_vote_type_score.html'),
	(2, 'Star rating', 'suggest_vote_type_star_rating.html');
/*!40000 ALTER TABLE `suggest_vote_type` ENABLE KEYS */;


-- Dumping structure for table lutece.suggest_vote_type_vote_button
CREATE TABLE IF NOT EXISTS `suggest_vote_type_vote_button` (
  `id_vote_type` int(11) NOT NULL DEFAULT '0',
  `id_vote_button` int(11) NOT NULL DEFAULT '0',
  `vote_button_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_vote_type`,`id_vote_button`),
  KEY `index_suggest_vote_type` (`id_vote_type`),
  KEY `index_suggest_vote_button` (`id_vote_button`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.suggest_vote_type_vote_button: 0 rows
/*!40000 ALTER TABLE `suggest_vote_type_vote_button` DISABLE KEYS */;
/*!40000 ALTER TABLE `suggest_vote_type_vote_button` ENABLE KEYS */;


-- Dumping structure for table lutece.theme_global
CREATE TABLE IF NOT EXISTS `theme_global` (
  `global_theme_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`global_theme_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.theme_global: 1 rows
/*!40000 ALTER TABLE `theme_global` DISABLE KEYS */;
INSERT INTO `theme_global` (`global_theme_code`) VALUES
	('blue');
/*!40000 ALTER TABLE `theme_global` ENABLE KEYS */;


-- Dumping structure for table lutece.theme_theme
CREATE TABLE IF NOT EXISTS `theme_theme` (
  `code_theme` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path_css` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theme_author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_author_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `theme_version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `theme_licence` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path_js` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`code_theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table lutece.theme_theme: 10 rows
/*!40000 ALTER TABLE `theme_theme` DISABLE KEYS */;
INSERT INTO `theme_theme` (`code_theme`, `theme_description`, `path_images`, `path_css`, `theme_author`, `theme_author_url`, `theme_version`, `theme_licence`, `path_js`) VALUES
	('amelia', 'Amelia', 'themes/amelia/img/', 'themes/amelia/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('blue', 'Thème Défaut', 'images/', 'css', 'Mairie de Paris', 'http://fr.lutece.paris.fr', '1.0', 'BSD', 'js/'),
	('slate', 'Slate', 'themes/slate/img/', 'themes/slate/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('superhero', 'Superhero', 'themes/superhero/img/', 'themes/superhero/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('flatly', 'Flatly', 'themes/flatly/img/', 'themes/flatly/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('darkly', 'Darkly', 'themes/darkly/img/', 'themes/darkly/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('cyborg', 'Cyborg', 'themes/cyborg/img/', 'themes/cyborg/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('readable', 'Readable', 'themes/readable/img/', 'themes/readable/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('cosmo', 'Cosmo', 'themes/cosmo/img/', 'themes/cosmo/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/'),
	('united', 'United', 'themes/united/img/', 'themes/united/css', 'Bootswatch', 'http://bootswatch.com/', '1.0', 'Apache 2.0', 'js/');
/*!40000 ALTER TABLE `theme_theme` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
